import sqlite3

def reset_db():
    conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
    cursor = conn.cursor()
    
    print("Clearing tables...")
    cursor.execute("DELETE FROM trades")
    cursor.execute("DELETE FROM signals")
    cursor.execute("DELETE FROM ai_lessons")
    
    print("Resetting auto-increment counters...")
    cursor.execute("DELETE FROM sqlite_sequence WHERE name='trades'")
    cursor.execute("DELETE FROM sqlite_sequence WHERE name='signals'")
    cursor.execute("DELETE FROM sqlite_sequence WHERE name='ai_lessons'")
    
    print("Resetting paper balance to 100.0...")
    cursor.execute("UPDATE settings SET value='100.0' WHERE key='paper_usdt_balance'")
    
    conn.commit()
    conn.close()
    print("Database successfully wiped and reset for Phase 2!")

if __name__ == "__main__":
    reset_db()
