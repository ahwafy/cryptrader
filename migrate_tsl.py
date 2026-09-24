import sqlite3
import traceback

def migrate():
    conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
    cursor = conn.cursor()
    
    try:
        cursor.execute("ALTER TABLE trades ADD COLUMN highest_price_seen FLOAT")
        print("Added highest_price_seen column.")
    except Exception as e:
        print(f"Column highest_price_seen might already exist: {e}")
        
    try:
        cursor.execute("ALTER TABLE trades ADD COLUMN tsl_active INTEGER DEFAULT 0")
        print("Added tsl_active column.")
    except Exception as e:
        print(f"Column tsl_active might already exist: {e}")
        
    conn.commit()
    conn.close()

if __name__ == "__main__":
    migrate()
