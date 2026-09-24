import os
import time
import requests
from datetime import datetime, timezone
from sqlalchemy import create_engine, Column, Integer, String, Text, ForeignKey
from sqlalchemy.orm import sessionmaker, declarative_base
from dotenv import load_dotenv
import asyncio

load_dotenv("../.env")

CMC_API_KEY = os.getenv('CMC_API_KEY')

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
    with open("cmc_monitor.log", "a", encoding='utf-8') as f:
        f.write(f"[{timestamp}] {message}\n")

def ensure_source():
    session = Session()
    try:
        source = session.query(Source).filter_by(name='CoinMarketCap API').first()
        if not source:
            session.add(Source(name='CoinMarketCap API', type='api', status='active'))
            session.commit()
    except Exception as e:
        log_to_file(f"DB Error: {e}")
    finally:
        session.close()

def poll_coinmarketcap():
    if not CMC_API_KEY:
        log_to_file("Warning: CMC_API_KEY not set in .env. Skipping CMC poll.")
        return

    url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'
    parameters = {
        'start': '1',
        'limit': '50',
        'convert': 'USD',
        'sort': 'percent_change_1h'
    }
    headers = {
        'Accepts': 'application/json',
        'X-CMC_PRO_API_KEY': CMC_API_KEY,
    }

    try:
        response = requests.get(url, headers=headers, params=parameters, timeout=15)
        if response.status_code == 200:
            data = response.json()
            session = Session()
            src = session.query(Source).filter_by(name='CoinMarketCap API').first()
            
            coins = data.get('data', [])
            if coins:
                changes_24h = [c.get('quote', {}).get('USD', {}).get('percent_change_24h', 0) for c in coins]
                changes_1h = [c.get('quote', {}).get('USD', {}).get('percent_change_1h', 0) for c in coins]
                
                avg_24h = sum(changes_24h) / len(changes_24h)
                avg_1h = sum(changes_1h) / len(changes_1h)
                
                if avg_24h > 2.0:
                    sentiment = "Strongly Bullish"
                elif avg_24h > 0.5:
                    sentiment = "Bullish"
                elif avg_24h < -2.0:
                    sentiment = "Strongly Bearish"
                elif avg_24h < -0.5:
                    sentiment = "Bearish"
                else:
                    sentiment = "Neutral"
                    
                sentiment_str = f"{sentiment} (Top {len(coins)} Avg: 24h {avg_24h:+.2f}%, 1h {avg_1h:+.2f}%)"
                
                # Update global market sentiment in settings
                setting = session.query(Setting).filter_by(key='global_market_sentiment').first()
                if not setting:
                    setting = Setting(key='global_market_sentiment', value=sentiment_str)
                    session.add(setting)
                else:
                    setting.value = sentiment_str
                    
                log_to_file(f"Updated Global Market Sentiment: {sentiment_str}")
            
            session.commit()
            session.close()
        else:
            log_to_file(f"CMC API Error: HTTP {response.status_code} - {response.text}")
    except Exception as e:
        log_to_file(f"CMC Request Error: {e}")

async def main_loop():
    ensure_source()
    log_to_file("CoinMarketCap API Monitor started. Polling every 15 minutes...")
    while True:
        poll_coinmarketcap()
        
        # Update Heartbeat
        session = Session()
        try:
            hb = session.query(Setting).filter_by(key='last_heartbeat_cmc').first()
            if not hb:
                hb = Setting(key='last_heartbeat_cmc', value='')
                session.add(hb)
            hb.value = datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S')
            session.commit()
        except: pass
        finally: session.close()
        
        # Max 5,000 requests per month = ~166 per day = ~6.9 per hour = 1 request every 9 minutes
        # We sleep for 9 minutes (540 seconds) to strictly enforce this budget.
        await asyncio.sleep(540)

if __name__ == "__main__":
    asyncio.run(main_loop())
