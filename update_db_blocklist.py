import sqlite3
import os

db_path = os.path.join(os.path.dirname(__file__), 'database', 'database.sqlite')
print(f"Connecting to database at {db_path}...")

conn = sqlite3.connect(db_path)
cursor = conn.cursor()

try:
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS blocklist (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        asset TEXT NOT NULL,
        blocked_until TEXT,
        reason TEXT,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP,
        updated_at TEXT DEFAULT CURRENT_TIMESTAMP
    )
    """)
    conn.commit()
    print("Successfully created 'blocklist' table.")
except Exception as e:
    print(f"Error creating table: {e}")
finally:
    conn.close()
