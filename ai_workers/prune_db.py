import sqlite3
import time
from datetime import datetime, timedelta

def prune_database():
    db_path = "../database/database.sqlite"
    
    try:
        # Added timeout=30.0 so it waits politely if the DB is temporarily locked by active trades
        conn = sqlite3.connect(db_path, timeout=30.0)
        cursor = conn.cursor()
        
        # Calculate thresholds
        seven_days_ago = (datetime.now() - timedelta(days=7)).strftime('%Y-%m-%d %H:%M:%S')
        thirty_days_ago = (datetime.now() - timedelta(days=30)).strftime('%Y-%m-%d %H:%M:%S')
        
        print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Pruning database...")
        
        # Delete old news
        cursor.execute("DELETE FROM news_items WHERE created_at < ?", (seven_days_ago,))
        news_deleted = cursor.rowcount
        print(f"Deleted {news_deleted} old news items (> 7 days).")
        
        # Delete old signals
        cursor.execute("DELETE FROM signals WHERE created_at < ?", (thirty_days_ago,))
        signals_deleted = cursor.rowcount
        print(f"Deleted {signals_deleted} old signals (> 30 days).")
        
        # Removed VACUUM command as it locks the database and risks crashing live bots
        # SQLite naturally reuses empty pages, so manual vacuuming is unnecessary in this pipeline.
        
        conn.commit()
        conn.close()
        print("Database pruning completed successfully.")
        
    except Exception as e:
        print(f"Error pruning database: {e}")

if __name__ == "__main__":
    prune_database()
