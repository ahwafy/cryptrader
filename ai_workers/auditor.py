import os
import time
from sqlalchemy import create_engine, Column, Integer, String, Float, Text, ForeignKey, DateTime
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

class Signal(Base):
    __tablename__ = 'signals'
    id = Column(Integer, primary_key=True)
    source_id = Column(Integer, ForeignKey('sources.id'))
    raw_text = Column(Text)
    parsed_sentiment = Column(Float)
    asset = Column(String)
    status = Column(String, default='pending')
    result = Column(String)

class NewsItem(Base):
    __tablename__ = 'news_items'
    id = Column(Integer, primary_key=True)
    raw_text = Column(Text)
    status = Column(String, default='pending')
    created_at = Column(DateTime)

class Trade(Base):
    __tablename__ = 'trades'
    id = Column(Integer, primary_key=True)
    signal_id = Column(Integer, ForeignKey('signals.id'))
    asset = Column(String)
    symbol = Column(String)
    amount = Column(Float)
    trade_type = Column(String, default='spot')
    leverage = Column(Integer, default=1)
    entry_price = Column(Float)
    target_prices = Column(Text)
    stop_loss = Column(Float)
    status = Column(String, default='open')
    outcome = Column(String)
    created_at = Column(String)
    closed_at = Column(String)
    exit_price = Column(Float)
    pnl = Column(Float)

class AiLesson(Base):
    __tablename__ = 'ai_lessons'
    id = Column(Integer, primary_key=True)
    trade_id = Column(Integer, nullable=True)
    lesson_text = Column(Text, nullable=False)
    created_at = Column(DateTime, default=datetime.utcnow)

engine = create_engine('sqlite:///../database/database.sqlite', connect_args={'timeout': 30})
Session = sessionmaker(bind=engine)

def log_to_file(message):
    timestamp = datetime.now().strftime("[%Y-%m-%d %H:%M:%S]")
    log_entry = f"{timestamp} {message}"
    print(log_entry)
    with open("auditor.log", "a", encoding="utf-8") as f:
        f.write(log_entry + "\n")

def audit_trade(trade, news_text, provider):
    pnl_val = trade.pnl if trade.pnl is not None else 0.0
    outcome_str = "PROFITABLE" if pnl_val > 0 else "LOSS-MAKING"
    
    prompt = f"""
    You are an expert Algorithmic Trading Auditor. 
    Review this closed trade executed by a junior AI agent and write a single, highly actionable, concise 1-sentence lesson.

    TRADE DETAILS:
    - Asset: {trade.asset}
    - Action: BUY
    - Entry Price: {trade.entry_price}
    - Exit Price: {trade.exit_price}
    - PnL: ${pnl_val:.2f} ({outcome_str})
    - Stop Loss: {trade.stop_loss}
    - Targets: {trade.target_prices}

    TRIGGERING NEWS / CONTEXT:
    "{news_text}"

    CRITICAL INSTRUCTIONS:
    1. If the trade was a LOSS: Write a single, concrete, strict rule telling the junior AI how to avoid this specific error (e.g. "Do not buy assets when the news mentions regulatory bans or SEC investigations").
    2. If the trade was a PROFIT: Write a single, concise reinforcement rule explaining why it worked (e.g. "Always capitalize on mainnet launch news or major partnership announcements as they have high momentum").
    3. Keep the lesson strictly to ONE sentence, highly specific, and actionable. Avoid generic advice like "manage risk" or "be careful".

    Return ONLY a JSON object:
    {{
        "lesson": "Your concise 1-sentence lesson here."
    }}
    """
    
    log_to_file(f"Requesting Gemini audit for Trade ID {trade.id} ({trade.asset})...")
    result = provider.query_auditor_gemini(prompt)
    if result and "lesson" in result:
        return result["lesson"]
    return None

def run_auditor():
    log_to_file("Trade Auditor Engine Started (v3.0 - Gemini Teacher System). Monitoring closed trades...")
    provider = LLMProvider()
    
    while True:
        session = Session()
        slept_150 = False
        try:
            # Update Heartbeat
            heartbeat_setting = session.query(Setting).filter(Setting.key == 'last_heartbeat_auditor').first()
            if not heartbeat_setting:
                heartbeat_setting = Setting(key='last_heartbeat_auditor', value='')
                session.add(heartbeat_setting)
            heartbeat_setting.value = datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S')
            session.commit()

            # Find closed trades that have not been audited
            closed_trades = session.query(Trade).filter(Trade.status == 'closed').all()
            unaudited_trades = []
            
            for t in closed_trades:
                lesson_exists = session.query(AiLesson).filter(AiLesson.trade_id == t.id).first() is not None
                if not lesson_exists:
                    unaudited_trades.append(t)

            if unaudited_trades:
                log_to_file(f"Found {len(unaudited_trades)} closed trades awaiting audit. Processing exactly one trade...")
                trade = unaudited_trades[0]
                
                # Find the triggering news item
                news_text = "No news context found."
                if trade.signal_id:
                    sig = session.query(Signal).filter(Signal.id == trade.signal_id).first()
                    if sig and sig.raw_text:
                        news_text = sig.raw_text

                lesson_text = audit_trade(trade, news_text, provider)
                
                if lesson_text:
                    log_to_file(f"Audit Complete! Lesson: {lesson_text}")
                    new_lesson = AiLesson(
                        trade_id=trade.id,
                        lesson_text=lesson_text,
                        created_at=datetime.now()
                    )
                    session.add(new_lesson)
                    session.commit()
                else:
                    log_to_file(f"Audit failed or skipped for Trade ID {trade.id}")
                
                slept_150 = True
            
            session.close()
        except Exception as e:
            log_to_file(f"Auditor Loop Error: {e}")
            session.rollback()
            session.close()
        
        if slept_150:
            log_to_file("Auditing completed. Sleeping for 80 minutes before next check/audit...")
            time.sleep(4800)
        else:
            # Check for new closed trades every 80 minutes when idle
            time.sleep(4800)

if __name__ == "__main__":
    run_auditor()
