import os
import feedparser
import time
from sqlalchemy import create_engine, Column, Integer, String, Text, ForeignKey, Float
from sqlalchemy.orm import sessionmaker, declarative_base
from dotenv import load_dotenv
from datetime import datetime, timezone

import re
load_dotenv("../.env")

# Keywords that suggest a trading opportunity or market moving event
SIGNAL_KEYWORDS = [
    r'\b(buy|sell|long|short|entry|target|tp|sl|stop loss|breakout|bullish|bearish)\b',
    r'\b\$\w+\b', # $BTC, $ETH etc
    r'\b(pump|dump|moon|listing|delisting)\b'
]

def is_signal_worthy(text):
    text = text.lower()
    # Check for tickers or trading keywords
    for pattern in SIGNAL_KEYWORDS:
        if re.search(pattern, text, re.IGNORECASE):
            return True
    return False

def log_to_file(message):
    timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
    formatted_message = f"[{timestamp}] {message}"
    try:
        print(formatted_message, flush=True)
    except:
        pass
    with open("ingestor.log", "a", encoding='utf-8') as f:
        f.write(formatted_message + "\n")
        f.flush()

Base = declarative_base()

class Source(Base):
    __tablename__ = 'sources'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    type = Column(String)
    status = Column(String)

class Setting(Base):
    __tablename__ = 'settings'
    id = Column(Integer, primary_key=True)
    key = Column(String, unique=True)
    value = Column(String)

class NewsItem(Base):
    __tablename__ = 'news_items'
    id = Column(Integer, primary_key=True)
    source_id = Column(Integer, ForeignKey('sources.id'))
    raw_text = Column(Text)
    status = Column(String, default='pending')
    created_at = Column(String) # For simple compatibility

# DB Setup
db_path = "../database/database.sqlite"
engine = create_engine(f"sqlite:///{db_path}", connect_args={'timeout': 30})
Session = sessionmaker(bind=engine)

RSS_FEEDS = [
    {"name": "CoinTelegraph", "url": "https://cointelegraph.com/rss"},
    {"name": "CoinDesk", "url": "https://www.coindesk.com/arc/outboundfeeds/rss/"}
]

def fetch_news():
    session = Session()
    print("Fetching latest crypto news...")
    
    for feed_info in RSS_FEEDS:
        try:
            # Ensure source exists in DB
            source = session.query(Source).filter(Source.name == feed_info["name"]).first()
            if not source:
                source = Source(name=feed_info["name"], type='rss', status='active')
                session.add(source)
                session.commit()
            
            feed = feedparser.parse(feed_info["url"])
            for entry in feed.entries[:5]: # Get last 5 news items per feed
                # Check if already exists in news_items
                exists = session.query(NewsItem).filter(NewsItem.raw_text.contains(entry.title if 'title' in entry else '---')).first()
                if not exists:
                    title = entry.title if 'title' in entry else 'No Title'
                    description = entry.description if 'description' in entry else ''
                    full_text = f"{title}. {description}"
                    
                    log_to_file(f"New news item: {title}")
                    new_item = NewsItem(
                        source_id=source.id,
                        raw_text=full_text,
                        status='pending',
                        created_at=datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S')
                    )
                    session.add(new_item)
            
            # Heartbeat
            heartbeat_setting = session.query(Setting).filter(Setting.key == 'last_heartbeat_ingestor').first()
            if heartbeat_setting:
                heartbeat_setting.value = datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S')
                session.commit()
            
            session.commit()
        except Exception as e:
            log_to_file(f"Error fetching from {feed_info['name']}: {e}")
            session.rollback()
    
    session.close()

if __name__ == "__main__":
    log_to_file("News Ingestion Engine Started (v2.0 - C Drive)...")
    while True:
        try:
            fetch_news()
        except Exception as e:
            log_to_file(f"Ingestion main loop error: {e}")
            
        log_to_file("Sleeping for 5 minutes...")
        time.sleep(300) # Poll every 5 minutes
