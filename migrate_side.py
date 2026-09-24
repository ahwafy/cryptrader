import sqlite3

db_path = r'Y:\cryptrader\database\database.sqlite'
try:
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("ALTER TABLE trades ADD COLUMN side VARCHAR DEFAULT 'LONG'")
    conn.commit()
    print("Migration successful: added 'side' column to trades table.")
except sqlite3.OperationalError as e:
    if "duplicate column name" in str(e).lower():
        print("Column 'side' already exists.")
    else:
        print(f"Error: {e}")
finally:
    conn.close()
