import sys
import os
import shutil
import unittest
from datetime import datetime, timedelta

# Ensure current directory is in path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

# Copy live database to local temp copy for isolated testing
y_db_path = os.path.join(os.path.dirname(__file__), "../database/database.sqlite")
temp_test_db = os.path.join(os.path.dirname(__file__), "temp_test_db_early.sqlite")

try:
    if os.path.exists(temp_test_db):
        os.remove(temp_test_db)
    shutil.copy2(y_db_path, temp_test_db)
except Exception as e:
    print(f"Warning: could not copy DB: {e}")
    temp_test_db = y_db_path

os.environ["EXECUTOR_DB_PATH"] = temp_test_db

import ccxt

ccxt_calls = []
mock_price = 60000.0

class MockCCXTExchange:
    def __init__(self, config=None):
        self.apiKey = "mock_key"
        self.secret = "mock_secret"
        self.options = {}
        self.markets = {"BTC/USDT": {}}
        self.sandbox = False

    def set_sandbox_mode(self, enabled):
        self.sandbox = enabled

    def load_markets(self):
        return self.markets

    def fetch_ticker(self, symbol):
        return {"last": mock_price}

    def fetch_balance(self):
        return {"free": {"USDT": 1000.0}}

    def fetch_ohlcv(self, symbol, timeframe, limit):
        return [[1, 100.0, 100.1, 99.9, 100.0] for _ in range(15)]

    def create_market_order(self, symbol, side, amount, params=None):
        ccxt_calls.append(("create_market_order", symbol, side, amount))
        return {"id": "order_early", "price": mock_price, "average": mock_price, "amount": amount}

    def cancel_all_orders(self, symbol):
        ccxt_calls.append(("cancel_all_orders", symbol))

ccxt.binance = MockCCXTExchange

import executor
from executor import Session, Setting, Trade, Signal, Source
from llm_provider import LLMProvider

# Mock query_local_decision
mock_ai_decision = {"decision": "HOLD", "reasoning": "Keep holding"}

def mock_query_local_decision(self, prompt):
    return mock_ai_decision

LLMProvider.query_local_decision = mock_query_local_decision

class TestEarlyProfitExit(unittest.TestCase):
    def setUp(self):
        self.session = Session()
        ccxt_calls.clear()
        
        # Ensure base settings exist
        self.set_db_setting('max_holding_hours', '24')
        self.set_db_setting('early_profit_exit_hours', '1')
        
        # Insert source and signal
        self.source = Source(name="Test Source", type="telegram", status="active", historical_win_rate=0.75)
        self.session.add(self.source)
        self.session.commit()
        
        self.signal = Signal(source_id=self.source.id, raw_text="BTC BUY", status="pending")
        self.session.add(self.signal)
        self.session.commit()

    def tearDown(self):
        # Delete created entities
        self.session.query(Trade).delete()
        self.session.query(Signal).delete()
        self.session.query(Source).delete()
        self.session.commit()
        self.session.close()

    def set_db_setting(self, key, value):
        setting = self.session.query(Setting).filter(Setting.key == key).first()
        if setting:
            setting.value = value
        else:
            setting = Setting(key=key, value=value)
            self.session.add(setting)
        self.session.commit()

    def create_open_trade(self, entry_price, amount, age_hours, trade_type='spot', leverage=1):
        past_time = (datetime.now() - timedelta(hours=age_hours)).strftime('%Y-%m-%d %H:%M:%S')
        trade = Trade(
            signal_id=self.signal.id,
            asset="BTC",
            symbol="BTC/USDT",
            amount=amount,
            trade_type=trade_type,
            leverage=leverage,
            entry_price=entry_price,
            target_prices="[100000.0]",  # high TP target
            stop_loss=1000.0,            # low SL target
            status="open",
            created_at=past_time,
            mode="paper"
        )
        self.session.add(trade)
        self.session.commit()
        return trade

    def test_early_exit_inactive(self):
        print("\n--- Testing Early Exit Inactive ---")
        self.set_db_setting('early_profit_exit_status', 'inactive')
        
        # Create a trade that is 2 hours old, in profit: Entry 50k, Current 60k
        global mock_price
        mock_price = 60000.0
        trade = self.create_open_trade(entry_price=50000.0, amount=0.01, age_hours=2)
        
        executor.monitor_open_trades()
        
        # Verify trade is still open
        self.session.expire_all()
        t = self.session.query(Trade).filter(Trade.id == trade.id).first()
        self.assertEqual(t.status, 'open')
        self.assertEqual(len(ccxt_calls), 0)

    def test_early_exit_active_profitable(self):
        print("\n--- Testing Early Exit Active (Profitable) ---")
        self.set_db_setting('early_profit_exit_status', 'active')
        
        global mock_price
        mock_price = 60000.0
        # Entry 50k, Current 60k. Gross profit is (60k - 50k)*0.01 = $100.
        # Fees/costs: Spot has 0.2% fee total = 0.002 * 60k * 0.01 = $1.20. Net profit is $98.80 > 0.
        trade = self.create_open_trade(entry_price=50000.0, amount=0.01, age_hours=2)
        
        executor.monitor_open_trades()
        
        self.session.expire_all()
        t = self.session.query(Trade).filter(Trade.id == trade.id).first()
        self.assertEqual(t.status, 'closed')
        self.assertIn("Early Exit", t.outcome)
        self.assertEqual(ccxt_calls[0][0], "create_market_order")

    def test_early_exit_active_unprofitable_due_to_fees(self):
        print("\n--- Testing Early Exit Active (Unprofitable due to fees) ---")
        self.set_db_setting('early_profit_exit_status', 'active')
        
        global mock_price
        mock_price = 50010.0
        # Entry 50000.0, Current 50010.0. Gross profit is (50010 - 50000)*0.01 = $0.10.
        # Spot fee total is 0.20% of position value = 0.0020 * 50010 * 0.01 = $1.0002.
        # Net profit = 0.10 - 1.0002 = -$0.9002 < 0. Should NOT exit.
        trade = self.create_open_trade(entry_price=50000.0, amount=0.01, age_hours=2)
        
        executor.monitor_open_trades()
        
        self.session.expire_all()
        t = self.session.query(Trade).filter(Trade.id == trade.id).first()
        self.assertEqual(t.status, 'open')
        self.assertEqual(len(ccxt_calls), 0)

    def test_early_exit_ai_decide_hold(self):
        print("\n--- Testing Early Exit AI Decide (Hold) ---")
        self.set_db_setting('early_profit_exit_status', 'ai_decide')
        
        global mock_price, mock_ai_decision
        mock_price = 60000.0
        mock_ai_decision = {"decision": "HOLD", "reasoning": "Strong momentum, keep holding"}
        
        trade = self.create_open_trade(entry_price=50000.0, amount=0.01, age_hours=2)
        
        executor.monitor_open_trades()
        
        self.session.expire_all()
        t = self.session.query(Trade).filter(Trade.id == trade.id).first()
        self.assertEqual(t.status, 'open')
        self.assertEqual(len(ccxt_calls), 0)

    def test_early_exit_ai_decide_exit(self):
        print("\n--- Testing Early Exit AI Decide (Exit) ---")
        self.set_db_setting('early_profit_exit_status', 'ai_decide')
        
        global mock_price, mock_ai_decision
        mock_price = 60000.0
        mock_ai_decision = {"decision": "EXIT", "reasoning": "Pump fading, exit now"}
        
        trade = self.create_open_trade(entry_price=50000.0, amount=0.01, age_hours=2)
        
        executor.monitor_open_trades()
        
        self.session.expire_all()
        t = self.session.query(Trade).filter(Trade.id == trade.id).first()
        self.assertEqual(t.status, 'closed')
        self.assertIn("AI Decided Exit", t.outcome)
        self.assertEqual(ccxt_calls[0][0], "create_market_order")

def cleanup_temp_db():
    try:
        temp_db = os.environ.get("EXECUTOR_DB_PATH")
        if temp_db and "temp_test_db_early.sqlite" in temp_db and os.path.exists(temp_db):
            os.remove(temp_db)
    except:
        pass

import atexit
atexit.register(cleanup_temp_db)

if __name__ == '__main__':
    unittest.main()
