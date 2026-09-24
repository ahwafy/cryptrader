import os
import time
from sqlalchemy import create_engine, Column, Integer, String, Text, ForeignKey, DateTime, Float
from sqlalchemy.orm import sessionmaker, declarative_base
from datetime import datetime, timezone
from dotenv import load_dotenv
from llm_provider import LLMProvider

env_path = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), '.env')
load_dotenv(env_path, override=True)

# --- DATABASE SETUP ---
Base = declarative_base()

class Setting(Base):
    __tablename__ = 'settings'
    id = Column(Integer, primary_key=True)
    key = Column(String, unique=True)
    value = Column(Text)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

class Source(Base):
    __tablename__ = 'sources'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    type = Column(String)
    status = Column(String)
    historical_win_rate = Column(Float)

class NewsItem(Base):
    __tablename__ = 'news_items'
    id = Column(Integer, primary_key=True)
    source_id = Column(Integer)
    raw_text = Column(Text)
    status = Column(String, default='pending')
    created_at = Column(DateTime)

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

class AiLesson(Base):
    __tablename__ = 'ai_lessons'
    id = Column(Integer, primary_key=True)
    trade_id = Column(Integer, nullable=True)
    lesson_text = Column(Text, nullable=False)
    created_at = Column(DateTime)

from sqlalchemy import event

engine = create_engine('sqlite:///../database/database.sqlite', connect_args={'timeout': 60})

@event.listens_for(engine, 'connect')
def set_sqlite_pragma(dbapi_connection, connection_record):
    cursor = dbapi_connection.cursor()
    cursor.execute("PRAGMA journal_mode=WAL")
    cursor.execute("PRAGMA busy_timeout=60000")
    cursor.close()

Session = sessionmaker(bind=engine)

def log_to_file(message):
    timestamp = datetime.now().strftime("[%Y-%m-%d %H:%M:%S]")
    log_entry = f"{timestamp} {message}"
    print(log_entry)
    with open("classifier.log", "a", encoding="utf-8") as f:
        f.write(log_entry + "\n")

def classify_news(text, lessons=[]):
    lessons_context = ""
    if lessons:
        lessons_context = "\nCRITICAL LESSONS LEARNED FROM SUPERVISOR (Avoid these past mistakes):\n"
        for i, lesson in enumerate(lessons):
            lessons_context += f"- {lesson.lesson_text}\n"

    prompt = f"""
    Analyze this text to determine if it is a specific, actionable cryptocurrency trading signal.
    If it is just general news, chatter, or unrelated text, return action as "IGNORE" and asset as "NONE".
    Return ONLY a strict JSON object.
    Format: {{"asset": "SYMBOL or NONE", "sentiment": 1-10, "action": "BUY/SELL/HOLD/IGNORE"}}
    
    Text: {text}
    {lessons_context}
    """
    
    provider = LLMProvider()
    # Call the local GPU Ollama instance
    return provider.query_local_news(prompt)

def run_classifier():
    log_to_file("Classifier Engine Started (v3.1 - SQLite Schema Aligned). Monitoring News Feed...")
    while True:
        session = Session()
        try:
            # Update Heartbeat
            heartbeat_setting = session.query(Setting).filter(Setting.key == 'last_heartbeat_classifier').first()
            if heartbeat_setting:
                heartbeat_setting.value = datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S')
                session.commit()

            # Query the newest lessons learned from Gemini
            lessons = session.query(AiLesson).order_by(AiLesson.id.desc()).limit(5).all()

            news_to_process = session.query(NewsItem).filter(NewsItem.status == 'pending').limit(5).all()
            
            for item in news_to_process:
                log_to_file(f"Classifying News ID {item.id} using {os.getenv('LLM_DRIVER', 'AI Provider').upper()}...")
                result = classify_news(item.raw_text, lessons)
                
                if result:
                    action = result.get('action', 'IGNORE').upper()
                    asset = str(result.get('asset', 'NONE')).upper()
                    
                    if action == 'IGNORE' or asset in ['NONE', 'UNKNOWN', '']:
                        log_to_file(f"Ignored: Not a valid signal -> News ID {item.id}")
                        item.status = 'processed'
                        session.commit()
                        continue

                    if action not in ['BUY', 'SELL', 'HOLD']:
                        action = 'HOLD'
                        
                    sentiment_val = float(result.get('sentiment', 5.0))
                    
                    new_signal = Signal(
                        source_id=item.source_id,
                        raw_text=item.raw_text,
                        parsed_sentiment=sentiment_val,
                        asset=asset,
                        # ROI-TEST 2026-09-20: allow BUY and SELL pending (was BUY-only; SELL was invisible to executor)
                        status='pending' if action in ('BUY', 'SELL') else 'processed',
                        created_at=datetime.now()
                    )
                    session.add(new_signal)
                    item.status = 'processed'
                    session.commit()
                    log_to_file(f"Success: Signal created for {result.get('asset')} -> {action}")
                else:
                    log_to_file(f"AI Provider returned empty or failed to parse for News ID {item.id}. Retrying...")
                
                time.sleep(6)
                
            session.close()
        except Exception as e:
            log_to_file(f"Loop Error: {e}")
            session.rollback()
            session.close()
        
        time.sleep(20)

if __name__ == "__main__":
    run_classifier()
