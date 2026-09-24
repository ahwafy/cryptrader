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
temp_test_db = os.path.join(os.path.dirname(__file__), "temp_test_db_50.sqlite")

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

import ccxt

# Global variable to capture CCXT method calls
ccxt_calls = []
mock_price = 60000.0

class MockCCXTExchange:
    def __init__(self, config=None):
        self.apiKey = config.get("apiKey") if config else "mock_key"
        self.secret = config.get("secret") if config else "mock_secret"
        self.options = config.get("options", {}) if config else {}
        self.markets = {"BTC/USDT": {}, "ETH/USDT": {}}
        self.sandbox = False

    def set_sandbox_mode(self, enabled):
        self.sandbox = enabled

    def load_markets(self):
        return self.markets

    def fetch_ticker(self, symbol):
        return {"last": mock_price}

    def fetch_balance(self):
        return {"free": {"USDT": 1000.0}, "USDT": {"free": 1000.0}}

    def fetch_ohlcv(self, symbol, timeframe, limit):
        return [[1, 100.0, 100.1, 99.9, 100.0] for _ in range(15)]

    def set_margin_mode(self, mode, symbol):
        ccxt_calls.append(("set_margin_mode", mode, symbol))

    def set_leverage(self, leverage, symbol):
        ccxt_calls.append(("set_leverage", leverage, symbol))

    def create_market_order(self, symbol, side, amount, params=None):
        ccxt_calls.append(("create_market_order", symbol, side, amount))
        return {"id": "order_123", "price": mock_price, "average": mock_price, "amount": amount}

    def create_order(self, symbol, type, side, amount, price=None, params=None):
        ccxt_calls.append(("create_order", symbol, type, side, amount, params))
        return {"id": f"trigger_{type}_{side}", "price": price}

    def fetch_positions(self, symbols=None):
        # By default return positive contract size to keep position open
        return [{"symbol": "BTC/USDT", "contracts": 0.001, "size": 0.001}]

    def fetch_my_trades(self, symbol, limit=5):
        return [{"price": 61000.0}]

    def cancel_all_orders(self, symbol):
        ccxt_calls.append(("cancel_all_orders", symbol))

# Override ccxt.binance with our Mock
ccxt.binance = MockCCXTExchange

from llm_provider import LLMProvider
mock_ai_decision = {"decision": "EXIT", "reasoning": "Lock in profit"}
def mock_query_local_decision(self, prompt):
    return mock_ai_decision
LLMProvider.query_local_decision = mock_query_local_decision

import executor
from executor import Session, Setting, Trade, Signal, Source

class TestPhase50(unittest.TestCase):
    def setUp(self):
        self.session = Session()
        ccxt_calls.clear()

    def tearDown(self):
        self.session.close()

    def test_futures_settings_exist(self):
        print("\n--- Testing Futures DB Settings ---")
        max_leverage = executor.get_db_setting(self.session, 'max_futures_leverage', None)
        status = executor.get_db_setting(self.session, 'futures_trading_status', None)
        print(f"max_futures_leverage: {max_leverage}")
        print(f"futures_trading_status: {status}")
        self.assertIsNotNone(max_leverage, "max_futures_leverage must exist in SQLite Settings.")
        self.assertIsNotNone(status, "futures_trading_status must exist in SQLite Settings.")

    def test_execute_trade_futures_long(self):
        print("\n--- Testing Futures Long Trade Placement & Native TP/SL ---")
        
        # Insert a dummy signal to satisfy DB foreign keys
        dummy_source = self.session.query(Source).first()
        if not dummy_source:
            dummy_source = Source(name="Test Source", type="telegram", status="active", historical_win_rate=0.8)
            self.session.add(dummy_source)
            self.session.commit()
            
        dummy_signal = Signal(source_id=dummy_source.id, raw_text="BTC BUY FUTURES", status="pending")
        self.session.add(dummy_signal)
        self.session.commit()

        details = {
            "type": "futures",
            "leverage": 10,
            "targets": [63000.0],
            "stop_loss": 58000.0
        }

        # Override max leverage to 5 in DB for test predictability
        max_lev_set = self.session.query(Setting).filter(Setting.key == 'max_futures_leverage').first()
        max_lev_set.value = '5'
        self.session.commit()

        # Run execute_trade
        success = executor.execute_trade("BTC", "BUY", dummy_signal.id, "paper", details)
        self.assertTrue(success)

        # Verify ccxt calls
        methods = [c[0] for c in ccxt_calls]
        print(f"Captured CCXT Method Calls: {methods}")
        
        # Should set isolated mode and set leverage to capped value (5x instead of requested 10x)
        self.assertIn("set_margin_mode", methods)
        self.assertIn("set_leverage", methods)
        self.assertIn("create_market_order", methods)
        self.assertIn("create_order", methods)

        # Verify that max leverage of 5x was applied
        lev_call = next(c for c in ccxt_calls if c[0] == "set_leverage")
        self.assertEqual(lev_call[1], 5) # Leveraged capped at 5x

        # Verify DB entry
        trade = self.session.query(Trade).filter(Trade.signal_id == dummy_signal.id).first()
        self.assertIsNotNone(trade)
        self.assertEqual(trade.trade_type, "futures")
        self.assertEqual(trade.leverage, 5)
        self.assertEqual(trade.status, "open")
        self.assertIn("TP Order:", trade.outcome)

        # Cleanup
        self.session.delete(trade)
        self.session.delete(dummy_signal)
        self.session.commit()

    def test_monitor_futures_native_exit(self):
        print("\n--- Testing Auto-Sync When Native TP/SL Hits on Exchange ---")
        
        dummy_source = self.session.query(Source).first()
        dummy_signal = Signal(source_id=dummy_source.id, raw_text="BTC LONG FUTURES", status="pending")
        self.session.add(dummy_signal)
        self.session.commit()

        # Place a mock open futures trade
        mock_trade = Trade(
            signal_id=dummy_signal.id,
            asset="BTC",
            symbol="BTC/USDT",
            amount=0.002,
            trade_type="futures",
            leverage=5,
            entry_price=60000.0,
            target_prices="[63000.0]",
            stop_loss=58000.0,
            status="open",
            created_at=datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            mode="paper"
        )
        self.session.add(mock_trade)
        self.session.commit()
        trade_id = mock_trade.id

        # Temporarily mock fetch_positions to return 0.0 contracts (closed natively on Binance)
        original_fetch_positions = MockCCXTExchange.fetch_positions
        def mock_closed_positions(self, symbols=None):
            return [{"symbol": "BTC/USDT", "contracts": 0.0, "size": 0.0}]
        MockCCXTExchange.fetch_positions = mock_closed_positions

        try:
            # Run open trades monitor
            executor.monitor_open_trades()

            # Re-fetch trade to verify it was marked as closed via Native TP/SL hit
            self.session.expire_all()
            updated_trade = self.session.query(Trade).filter(Trade.id == trade_id).first()
            print(f"Updated Trade Status: {updated_trade.status} | Outcome: {updated_trade.outcome}")
            self.assertEqual(updated_trade.status, 'closed')
            self.assertIn("Filled via Native TP/SL", updated_trade.outcome)
        finally:
            # Restore CCXT mock
            MockCCXTExchange.fetch_positions = original_fetch_positions
            
        # Cleanup
        self.session.delete(updated_trade)
        self.session.delete(dummy_signal)
        self.session.commit()

    def test_monitor_futures_time_based_exit(self):
        print("\n--- Testing Time-Based Exit for Futures (Cancels Outstanding triggers) ---")
        global mock_price, mock_ai_decision
        mock_price = 80000.0
        mock_ai_decision = {"decision": "EXIT", "reasoning": "Lock in profit"}
        
        dummy_source = self.session.query(Source).first()
        dummy_signal = Signal(source_id=dummy_source.id, raw_text="BTC LONG FUTURES", status="pending")
        self.session.add(dummy_signal)
        self.session.commit()

        # Set max_holding_hours to 1 hour
        max_hold_set = self.session.query(Setting).filter(Setting.key == 'max_holding_hours').first()
        max_hold_set.value = '1'
        self.session.commit()

        # Place a mock expired futures trade (created 2 hours ago)
        past_time = (datetime.now() - timedelta(hours=2)).strftime('%Y-%m-%d %H:%M:%S')
        mock_trade = Trade(
            signal_id=dummy_signal.id,
            asset="BTC",
            symbol="BTC/USDT",
            amount=0.002,
            trade_type="futures",
            leverage=5,
            entry_price=60000.0,
            target_prices="[63000.0]",
            stop_loss=58000.0,
            status="open",
            created_at=past_time,
            mode="paper"
        )
        self.session.add(mock_trade)
        self.session.commit()
        trade_id = mock_trade.id

        # Run open trades monitor
        executor.monitor_open_trades()

        # Re-fetch trade to verify it was marked as closed via Time-Based Exit
        self.session.expire_all()
        updated_trade = self.session.query(Trade).filter(Trade.id == trade_id).first()
        print(f"Updated Trade Status: {updated_trade.status} | Outcome: {updated_trade.outcome}")
        
        self.assertEqual(updated_trade.status, 'closed')
        self.assertIn("Time-Based Exit", updated_trade.outcome)

        # Verify outstanding native TP/SL triggers were cancelled on the exchange
        methods = [c[0] for c in ccxt_calls]
        print(f"Capturing CCXT calls during Time-Based Exit: {methods}")
        self.assertIn("cancel_all_orders", methods)

        # Cleanup
        self.session.delete(updated_trade)
        self.session.delete(dummy_signal)
        self.session.commit()


# Clean up temp database file when execution finishes
def cleanup_temp_db():
    try:
        temp_db = os.environ.get("EXECUTOR_DB_PATH")
        if temp_db and "temp_test_db_50.sqlite" in temp_db and os.path.exists(temp_db):
            print(f"Cleaning up isolated test database: {temp_db}")
            os.remove(temp_db)
    except Exception as e:
        print(f"Error during test cleanup: {e}")

import atexit
atexit.register(cleanup_temp_db)

if __name__ == '__main__':
    unittest.main()
