import os
import time
import requests
from datetime import datetime, timezone
from sqlalchemy import create_engine, Column, Integer, String, Text, ForeignKey
from sqlalchemy.orm import sessionmaker, declarative_base
from dotenv import load_dotenv
import asyncio

load_dotenv("../.env")

COINGLASS_API_KEY = os.getenv('COINGLASS_API_KEY')
WHALE_ALERT_API_KEY = os.getenv('WHALE_ALERT_API_KEY')

Base = declarative_base()

class Setting(Base):
    __tablename__ = 'settings'
    id = Column(Integer, primary_key=True)
    key = Column(String, unique=True)
    value = Column(String)

class Source(Base):
    __tablename__ = 'sources'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    type = Column(String)
    status = Column(String)

class NewsItem(Base):
    __tablename__ = 'news_items'
    id = Column(Integer, primary_key=True)
    source_id = Column(Integer, ForeignKey('sources.id'))
    raw_text = Column(Text)
    status = Column(String, default='pending')
    created_at = Column(String)

db_path = "../database/database.sqlite"
engine = create_engine(f"sqlite:///{db_path}", connect_args={'timeout': 30})
Session = sessionmaker(bind=engine)

def log_to_file(message):
    timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
    print(f"[{timestamp}] {message}", flush=True)
    with open("onchain.log", "a", encoding='utf-8') as f:
        f.write(f"[{timestamp}] {message}\n")

def ensure_sources():
    session = Session()
    try:
        sources = [
            {'name': 'Whale Alert (On-Chain)', 'type': 'api'},
            {'name': 'Coinglass Liquidations', 'type': 'api'}
        ]
        for src in sources:
            if not session.query(Source).filter_by(name=src['name']).first():
                session.add(Source(name=src['name'], type=src['type'], status='active'))
        session.commit()
    except Exception as e:
        log_to_file(f"DB Error: {e}")
    finally:
        session.close()

def check_dexscreener():
    # Example: Check Solana trending tokens for massive volume spikes
    # DexScreener API is free and requires no key for basic pairs
    try:
        url = "https://api.dexscreener.com/latest/dex/search?q=SOL"
        res = requests.get(url, timeout=10)
        if res.status_code == 200:
            data = res.json()
            if 'pairs' in data and len(data['pairs']) > 0:
                top_pair = data['pairs'][0]
                volume_24h = float(top_pair.get('volume', {}).get('h24', 0))
                price_change = float(top_pair.get('priceChange', {}).get('h24', 0))
                
                # Lowered thresholds to detect more frequent breakouts
                if volume_24h > 1000000 and abs(price_change) > 10:
                    action = "pump" if price_change > 0 else "dump"
                    signal_text = f"ON-CHAIN ALERT: Massive volume on {top_pair['baseToken']['symbol']}. 24h Vol: ${volume_24h:,.0f}, Price Change: {price_change}%. Looks like a {action}!"
                    
                    session = Session()
                    src = session.query(Source).filter_by(name='Whale Alert (On-Chain)').first()
                    if src:
                        session.add(NewsItem(
                            source_id=src.id,
                            raw_text=signal_text,
                            status='pending',
                            created_at=datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S')
                        ))
                        session.commit()
                        log_to_file(f"Generated DexScreener Signal for {top_pair['baseToken']['symbol']}")
                    session.close()
                else:
                    log_to_file(f"Scanned DexScreener (Top pair: {top_pair['baseToken']['symbol']}). Vol: ${volume_24h:,.0f}, Change: {price_change}%. No actionable massive spikes >10% right now.")
            else:
                log_to_file("DexScreener scan returned no pairs.")
    except Exception as e:
        log_to_file(f"DexScreener API Error: {e}")

async def main_loop():
    ensure_sources()
    log_to_file("On-Chain Monitor started. Polling APIs every 5 minutes...")
    while True:
        check_dexscreener()
        # Coinglass and Whale Alert logic would go here when API keys are provided
        
        # Heartbeat update
        session = Session()
        try:
            hb = session.query(Setting).filter_by(key='last_heartbeat_onchain').first()
            if not hb:
                hb = Setting(key='last_heartbeat_onchain', value='')
                session.add(hb)
            hb.value = datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S')
            session.commit()
        except: pass
        finally: session.close()
        
        await asyncio.sleep(300)

if __name__ == "__main__":
    asyncio.run(main_loop())
