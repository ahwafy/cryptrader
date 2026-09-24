import sqlite3

db_path = r'Y:\cryptrader\database\database.sqlite'
try:
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    print("Migrating schema...")
    try:
        cursor.execute("ALTER TABLE trades ADD COLUMN side VARCHAR DEFAULT 'LONG'")
        print("-> Added 'side' column to trades table.")
    except sqlite3.OperationalError as e:
        if "duplicate column name" in str(e).lower():
            print("-> Column 'side' already exists.")
        else:
            raise e

    print("Cleaning fake test news...")
    cursor.execute("DELETE FROM news_items WHERE raw_text LIKE '%BitMEX%' OR raw_text LIKE '%crash%' OR raw_text LIKE '%unprecedented%'")
    deleted = cursor.rowcount
    print(f"-> Deleted {deleted} fake test news items.")
    
    conn.commit()
    print("Database cleanup and migration completed successfully!")
except Exception as e:
    print(f"Error: {e}")
finally:
    conn.close()
