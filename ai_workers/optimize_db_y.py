import sqlite3
import os

db_path = "../database/database.sqlite"

if not os.path.exists(db_path):
    print(f"Error: {db_path} not found.")
    exit(1)

try:
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    print("Forcing WAL mode on NEW drive...")
    cursor.execute("PRAGMA journal_mode=WAL;")
    mode = cursor.fetchone()[0]
    print(f"Journal mode is now: {mode}")
    
    print("Setting synchronous to NORMAL...")
    cursor.execute("PRAGMA synchronous=NORMAL;")
    
    conn.commit()
    conn.close()
    print("Database optimized successfully on Y: drive.")
except Exception as e:
    print(f"Error: {e}")
