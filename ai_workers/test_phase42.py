import sys
import os
import shutil
import unittest
from datetime import datetime, timedelta
import ast

# Ensure current directory is in path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

# Copy live database to local temp copy for isolated testing (avoiding locks)
y_db_path = os.path.join(os.path.dirname(__file__), "../database/database.sqlite")
temp_test_db = os.path.join(os.path.dirname(__file__), "temp_test_db.sqlite")

print(f"Setting up isolated test database copy: {temp_test_db}")
try:
    if os.path.exists(temp_test_db):
        os.remove(temp_test_db)
    shutil.copy2(y_db_path, temp_test_db)
    print("Database copy created successfully!")
except Exception as e:
    print(f"Warning: could not copy DB: {e}. Using fallback path.")
    temp_test_db = y_db_path

# Set environment variable to route executor to the temp DB
os.environ["EXECUTOR_DB_PATH"] = temp_test_db

# Mock ccxt.binance BEFORE importing executor to prevent any real network requests
import ccxt
mock_price = 60000.0
class MockCCXTExchange:
    def __init__(self, config=None):
        self.apiKey = config.get("apiKey") if config else "mock_key"
        self.secret = config.get("secret") if config else "mock_secret"
    def set_sandbox_mode(self, enabled):
        pass
    def fetch_ticker(self, symbol):
        return {"last": mock_price}
    def create_market_sell_order(self, symbol, amount):
        return {"price": mock_price, "average": mock_price, "amount": amount}
    def create_market_order(self, symbol, side, amount, params=None):
        return {"price": mock_price, "average": mock_price, "amount": amount}

# Override ccxt.binance with our Mock
ccxt.binance = MockCCXTExchange

from llm_provider import LLMProvider
mock_ai_decision = {"decision": "EXIT", "reasoning": "Lock in profit"}
def mock_query_local_decision(self, prompt):
    return mock_ai_decision
LLMProvider.query_local_decision = mock_query_local_decision

import executor
from executor import Session, Setting, Trade, Signal, Source

class TestPhase42(unittest.TestCase):
    def setUp(self):
        self.session = Session()

    def tearDown(self):
        self.session.close()

    def test_database_settings(self):
        print("\n--- Testing Database Settings ---")
        # Ensure Phase 4.2 settings exist
        keys = ['paper_trading_status', 'live_trading_status', 'max_holding_hours', 'atr_target_compression']
        for k in keys:
            val = executor.get_db_setting(self.session, k, None)
            print(f"Setting: {k} = {val}")
            self.assertIsNotNone(val, f"Setting key '{k}' must exist in database.")

    def test_atr_scaling_mock(self):
        print("\n--- Testing ATR Sizing Factor Sizing Rules ---")
        # Mock exchange and ticker
        class MockExchange:
            def fetch_ohlcv(self, symbol, timeframe, limit):
                # Simulated high volatility candles (ATR ~ 6% price change)
                return [
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                    [1, 100, 106, 94, 100],
                ]

        mock_ex = MockExchange()
        factor = executor.calculate_atr_scaling_factor(mock_ex, "ETH/USDT", 100.0)
        print(f"High Volatility ATR scaling factor: {factor}x (Expected: 0.5)")
        self.assertEqual(factor, 0.5)

        # Low volatility candles (ATR ~ 0.2% price change)
        class MockLowVolExchange:
            def fetch_ohlcv(self, symbol, timeframe, limit):
                return [
                    [1, 100.0, 100.1, 99.9, 100.0] for _ in range(15)
                ]

        factor_low = executor.calculate_atr_scaling_factor(MockLowVolExchange(), "ETH/USDT", 100.0)
        print(f"Low Volatility ATR scaling factor: {factor_low}x (Expected: 1.25)")
        self.assertEqual(factor_low, 1.25)

    def test_time_based_exit(self):
        print("\n--- Testing Time-Based Exits ---")
        global mock_price, mock_ai_decision
        mock_price = 70000.0
        mock_ai_decision = {"decision": "EXIT", "reasoning": "Lock in profit"}
        
        # 1. Temporarily override database settings for test predictability
        max_hold_orig = executor.get_db_setting(self.session, 'max_holding_hours', '24')
        
        # Make sure max_holding_hours is set to 2
        set_max_hold = self.session.query(Setting).filter(Setting.key == 'max_holding_hours').first()
        if not set_max_hold:
            set_max_hold = Setting(key='max_holding_hours', value='2')
            self.session.add(set_max_hold)
        else:
            set_max_hold.value = '2'
        self.session.commit()

        # Find or create a dummy signal first to satisfy the foreign key constraint
        dummy_signal = self.session.query(Signal).first()
        if not dummy_signal:
            dummy_source = self.session.query(Source).first()
            if not dummy_source:
                dummy_source = Source(name="Test Source", type="telegram", status="active", historical_win_rate=0.8)
                self.session.add(dummy_source)
                self.session.commit()
            dummy_signal = Signal(source_id=dummy_source.id, raw_text="BTC BUY", status="pending")
            self.session.add(dummy_signal)
            self.session.commit()

        # Create a mock expired trade linked to the dummy signal
        past_time = (datetime.now() - timedelta(hours=3)).strftime('%Y-%m-%d %H:%M:%S')
        mock_trade = Trade(
            signal_id=dummy_signal.id,
            asset="BTC",
            symbol="BTC/USDT",
            amount=0.001,
            trade_type="spot",
            entry_price=60000.0,
            target_prices="[62000.0, 65000.0]",
            stop_loss=58000.0,
            status="open",
            created_at=past_time,
            mode="paper"
        )
        self.session.add(mock_trade)
        self.session.commit()
        trade_id = mock_trade.id
        print(f"Created expired mock trade #{trade_id} created at {past_time}")

        # Run trade monitoring loop
        print("Running monitor_open_trades() to trigger time-based exit...")
        executor.monitor_open_trades()

        # Re-fetch trade to verify it was closed via Time-Based Exit
        self.session.expire_all()
        updated_trade = self.session.query(Trade).filter(Trade.id == trade_id).first()
        print(f"Trade #{trade_id} status: {updated_trade.status} | Outcome: {updated_trade.outcome}")
        
        self.assertEqual(updated_trade.status, 'closed')
        self.assertIn("Time-Based Exit", updated_trade.outcome)

        # Cleanup
        self.session.delete(updated_trade)
        set_max_hold.value = max_hold_orig
        self.session.commit()

# Clean up temp database file when execution finishes
def cleanup_temp_db():
    try:
        temp_db = os.environ.get("EXECUTOR_DB_PATH")
        if temp_db and "temp_test_db.sqlite" in temp_db and os.path.exists(temp_db):
            print(f"Cleaning up isolated test database: {temp_db}")
            os.remove(temp_db)
    except Exception as e:
        print(f"Error during test cleanup: {e}")

import atexit
atexit.register(cleanup_temp_db)

if __name__ == '__main__':
    unittest.main()
