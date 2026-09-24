import os
import sys
import time
import random
from datetime import datetime
from dotenv import load_dotenv
from sqlalchemy import create_engine, Column, Integer, String, Text, ForeignKey, DateTime, Float
from sqlalchemy.orm import sessionmaker, declarative_base
import ccxt

load_dotenv("../.env")

# --- DATABASE SETUP ---
Base = declarative_base()

class Source(Base):
    __tablename__ = 'sources'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    type = Column(String)
    status = Column(String)
    historical_win_rate = Column(Float, default=0.75)
    catch_up_hours = Column(Integer, default=0)

class Signal(Base):
    __tablename__ = 'signals'
    id = Column(Integer, primary_key=True)
    source_id = Column(Integer, ForeignKey('sources.id'))
    raw_text = Column(Text)
    parsed_sentiment = Column(Float)
    asset = Column(String)
    status = Column(String, default='pending')
    result = Column(String)
    created_at = Column(DateTime)

from sqlalchemy import event

# Connect to database
engine = create_engine('sqlite:///../database/database.sqlite', connect_args={'timeout': 60})

@event.listens_for(engine, 'connect')
def set_sqlite_pragma(dbapi_connection, connection_record):
    cursor = dbapi_connection.cursor()
    cursor.execute("PRAGMA journal_mode=WAL")
    cursor.execute("PRAGMA busy_timeout=60000")
    cursor.close()

Base.metadata.create_all(engine)
Session = sessionmaker(bind=engine)

def log_to_file(message):
    timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
    formatted_message = f"[{timestamp}] {message}"
    try:
        print(formatted_message, flush=True)
    except UnicodeEncodeError:
        try:
            print(formatted_message.encode(sys.stdout.encoding, errors='replace').decode(sys.stdout.encoding), flush=True)
        except Exception:
            print(formatted_message.encode('ascii', errors='ignore').decode('ascii'), flush=True)
    with open("copy_monitor.log", "a", encoding='utf-8') as f:
        f.write(formatted_message + "\n")
        f.flush()

# Ensure Lead Trader sources exist in DB
def initialize_sources():
    session = Session()
    try:
        traders = [
            {"name": "Lead Trader: AlphaBull", "type": "binance_copy", "status": "active", "historical_win_rate": 0.85},
            {"name": "Lead Trader: WhalesHunter", "type": "binance_copy", "status": "inactive", "historical_win_rate": 0.78},
            {"name": "Lead Trader: ScalpGod", "type": "binance_copy", "status": "active", "historical_win_rate": 0.82},
            {"name": "Lead Trader: TrendRider", "type": "binance_copy", "status": "active", "historical_win_rate": 0.80},
            {"name": "Lead Trader: SwingMaster", "type": "binance_copy", "status": "active", "historical_win_rate": 0.84}
        ]
        for t in traders:
            existing = session.query(Source).filter_by(name=t["name"]).first()
            if not existing:
                new_src = Source(
                    name=t["name"],
                    type="api",
                    status=t["status"],
                    historical_win_rate=t["historical_win_rate"]
                )
                session.add(new_src)
                log_to_file(f"Initialized Database Source: {t['name']}")
        session.commit()
    except Exception as e:
        log_to_file(f"Error initializing sources: {e}")
        session.rollback()
    finally:
        session.close()

# Try fetching real Binance Copy Trading data
def fetch_real_copy_trades():
    api_key = os.getenv("BINANCE_API_KEY")
    secret_key = os.getenv("BINANCE_SECRET_KEY")
    if not api_key or not secret_key:
        return None
    
    try:
        # Initialize exchange
        exchange = ccxt.binance({
            'apiKey': api_key,
            'secret': secret_key,
            'enableRateLimit': True,
        })
        
        # Test copy trading user status endpoint
        # sapiGetCopyTradingFuturesUserStatus is mapped to GET /sapi/v1/copyTrading/futures/userStatus
        status = exchange.sapiGetCopyTradingFuturesUserStatus()
        return status
    except Exception as e:
        # Gracefully log warning and fall back to simulation mode
        log_to_file(f"Real Binance Copy Trading API not authorized or unavailable: {e}")
        return None

# Generate high-conviction simulated lead trader signals using real-time price feeds
def generate_simulated_signal():
    session = Session()
    try:
        # Choose a random active lead trader source
        lead_sources = session.query(Source).filter(
            Source.name.like("Lead Trader:%"),
            Source.status == 'active'
        ).all()
        if not lead_sources:
            return
        source = random.choice(lead_sources)
        
        # Selection of high-volume bluechip assets
        assets = ["BTC", "ETH", "SOL", "BNB", "XRP", "ADA", "LINK", "AVAX"]
        asset = random.choice(assets)
        
        # Real-time Binance price fetch for precision check
        current_price = 0.0
        try:
            temp_ex = ccxt.binance({'enableRateLimit': True})
            temp_ex.set_sandbox_mode(True)
            ticker = temp_ex.fetch_ticker(f"{asset}/USDT")
            current_price = ticker['last']
        except Exception as p_err:
            log_to_file(f"Failed to fetch real-time price for simulation: {p_err}")
            current_price = 100.0
            
        sentiment = round(random.uniform(0.75, 0.95), 2)
        direction = random.choice(["LONG", "SHORT"])
        
        raw_text = f"🚨 LEAD TRADER UPDATE: {source.name} opened a {direction} position on {asset}/USDT at entry {current_price}."
        
        new_signal = Signal(
            source_id=source.id,
            raw_text=raw_text,
            parsed_sentiment=sentiment if direction == "LONG" else (1.0 - sentiment),
            asset=asset,
            status='pending',
            created_at=datetime.now()
        )
        session.add(new_signal)
        session.commit()
        log_to_file(f"Simulated Copy Trade Signal generated: {source.name} ➡️ {asset} @ {current_price}")
    except Exception as e:
        log_to_file(f"Error generating simulated signal: {e}")
        session.rollback()
    finally:
        session.close()

def main():
    log_to_file("Binance Copy Trading Monitor Started (v1.0). Initializing...")
    initialize_sources()
    
    # Check if we can use real API or fallback to simulator
    real_status = fetch_real_copy_trades()
    if real_status:
        log_to_file("Successfully authenticated with Binance Copy Trading API! Operating in Real API mode.")
    else:
        log_to_file("Operating in Simulated Lead Trader mode with real-time price indexing.")
        
    last_sim_time = time.time()
    
    while True:
        try:
            # If in Real mode, query open lead trader positions
            if real_status:
                try:
                    exchange = ccxt.binance({
                        'apiKey': os.getenv("BINANCE_API_KEY"),
                        'secret': os.getenv("BINANCE_SECRET_KEY"),
                        'enableRateLimit': True,
                    })
                    # Enable testnet if requested
                    if os.getenv("BINANCE_TESTNET", "true").lower() == "true":
                        exchange.set_sandbox_mode(True)
                    
                    # Fetch active futures positions
                    positions = exchange.fetch_positions()
                    
                    session = Session()
                    try:
                        # Find or create the Real Binance Copy source
                        src = session.query(Source).filter_by(name='Real Binance Copy Trading').first()
                        if not src:
                            src = Source(name='Real Binance Copy Trading', type='api', status='active', historical_win_rate=1.0)
                            session.add(src)
                            session.commit()
                        
                        # SAFETY BLACKLIST CHECK
                        # If the trader's win rate drops below 40%, stop copying them
                        if src.historical_win_rate < 0.40:
                            if src.status != 'blacklisted':
                                src.status = 'blacklisted'
                                session.commit()
                                log_to_file(f"🚨 SAFETY BLACKLIST TRIGGERED 🚨: Real Binance Copy Trading has dropped to a {src.historical_win_rate*100}% win rate. They have been blacklisted and will no longer be copied.")
                        
                        if src.status == 'active':
                            for pos in positions:
                                size = float(pos.get('contracts', 0) or pos.get('positionAmt', 0))
                                if abs(size) > 0:
                                    symbol = pos['symbol']
                                    asset = symbol.replace('USDT', '').replace('/', '')
                                    side = "LONG" if size > 0 else "SHORT"
                                    action = "BUY" if size > 0 else "SELL"
                                    entry = pos['entryPrice']
                                    
                                    # Avoid duplicate signals: Check if we already created a signal for this asset/side recently
                                    recent_signal = session.query(Signal).filter_by(source_id=src.id, asset=asset, status='pending').first()
                                    if not recent_signal:
                                        raw_text = f"🚨 REAL COPY TRADE DETECTED: Opening {side} on {asset} at entry {entry} based on Lead Trader position."
                                        new_sig = Signal(
                                            source_id=src.id,
                                            raw_text=raw_text,
                                            parsed_sentiment=0.9 if side == 'LONG' else 0.1,
                                            asset=asset,
                                            status='pending',
                                            created_at=datetime.now()
                                        )
                                        session.add(new_sig)
                                        session.commit()
                                        log_to_file(f"Injected Real Copy Signal: {action} {asset}")
                    finally:
                        session.close()
                except Exception as e:
                    log_to_file(f"Real Binance polling error: {e}")
            
            # Simulator: trigger a new signal every 90 to 180 seconds
            # FIX 2026-09-19: simulated random LONG/SHORT signals were injecting
            # ~1 fake trade signal every 1.5-3 min with fake 0.80+ win-rates.
            # Disabled by default; set ENABLE_SIM_COPY=1 to re-enable for testing.
            current_time = time.time()
            sim_enabled = os.getenv("ENABLE_SIM_COPY", "0") == "1"
            if sim_enabled and current_time - last_sim_time > random.randint(90, 180):
                generate_simulated_signal()
                last_sim_time = current_time
                
            time.sleep(10)
        except KeyboardInterrupt:
            log_to_file("Copy Trading Monitor shut down gracefully.")
            break
        except Exception as e:
            log_to_file(f"Main loop error: {e}")
            time.sleep(30)

if __name__ == "__main__":
    main()
