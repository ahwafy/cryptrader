import os
import time
import discord
from sqlalchemy import create_engine, Column, Integer, String, Text, ForeignKey
from sqlalchemy.orm import sessionmaker, declarative_base
from dotenv import load_dotenv
import asyncio
from datetime import datetime, timezone
import re

load_dotenv("../.env")

# Re-use our proven keyword filter
SIGNAL_KEYWORDS = [
    r'\b(buy|sell|long|short|entry|target|tp|sl|stop loss|breakout|bullish|bearish)\b',
    r'\b\$\w+\b', 
    r'\b(pump|dump|moon|listing|delisting)\b'
]

def is_signal_worthy(text):
    if not text: return False
    text = text.lower()
    for pattern in SIGNAL_KEYWORDS:
        if re.search(pattern, text, re.IGNORECASE):
            return True
    return False

# --- CONFIGURATION ---
DISCORD_TOKEN = os.getenv('DISCORD_BOT_TOKEN')
# Comma-separated list of channel IDs to monitor (e.g. "123456789,987654321")
MONITORED_CHANNELS = os.getenv('DISCORD_CHANNEL_IDS', '')
ALLOWED_CHANNELS = [int(c.strip()) for c in MONITORED_CHANNELS.split(',') if c.strip().isdigit()]

# --- DATABASE SETUP ---
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
    with open("discord.log", "a", encoding='utf-8') as f:
        f.write(f"[{timestamp}] {message}\n")

# --- DISCORD CLIENT ---
intents = discord.Intents.default()
intents.message_content = True
client = discord.Client(intents=intents)

@client.event
async def on_ready():
    log_to_file(f'Discord Ingestor Logged in as {client.user}')
    # Ensure source exists in DB
    session = Session()
    try:
        source = session.query(Source).filter_by(name='Discord VIPs', type='discord').first()
        if not source:
            source = Source(name='Discord VIPs', type='discord', status='active')
            session.add(source)
            session.commit()
            log_to_file("Created 'Discord VIPs' source in database.")
    except Exception as e:
        log_to_file(f"DB init error: {e}")
    finally:
        session.close()
    
    # Start heartbeat
    client.loop.create_task(heartbeat_loop())

@client.event
async def on_message(message):
    # Ignore our own messages
    if message.author == client.user:
        return
        
    # Check if we should monitor this channel
    if ALLOWED_CHANNELS and message.channel.id not in ALLOWED_CHANNELS:
        return

    content = message.content
    if not is_signal_worthy(content):
        return

    log_to_file(f"New Discord Signal from #{message.channel.name} by {message.author.name}")
    
    session = Session()
    try:
        source = session.query(Source).filter_by(name='Discord VIPs', type='discord').first()
        if source and source.status == 'active':
            new_item = NewsItem(
                source_id=source.id,
                raw_text=content,
                status='pending',
                created_at=datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S')
            )
            session.add(new_item)
            session.commit()
    except Exception as e:
        log_to_file(f"DB Insertion Error: {e}")
        session.rollback()
    finally:
        session.close()

async def heartbeat_loop():
    await client.wait_until_ready()
    while not client.is_closed():
        session = Session()
        try:
            heartbeat_setting = session.query(Setting).filter(Setting.key == 'last_heartbeat_discord_ingestor').first()
            if not heartbeat_setting:
                heartbeat_setting = Setting(key='last_heartbeat_discord_ingestor', value='')
                session.add(heartbeat_setting)
            heartbeat_setting.value = datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S')
            session.commit()
        except Exception as e:
            log_to_file(f"Heartbeat Error: {e}")
        finally:
            session.close()
            await asyncio.sleep(60)

if __name__ == "__main__":
    if not DISCORD_TOKEN:
        log_to_file("ERROR: DISCORD_BOT_TOKEN not set in .env. Exiting.")
    else:
        log_to_file("Starting Discord Ingestor...")
        client.run(DISCORD_TOKEN)
