import sqlite3

db_path = r'Y:\cryptrader\database\database.sqlite'
try:
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("DELETE FROM news_items WHERE raw_text LIKE '%BitMEX%' OR raw_text LIKE '%crash%' OR raw_text LIKE '%unprecedented%'")
    deleted = cursor.rowcount
    conn.commit()
    print(f"Deleted {deleted} fake test news items.")
except Exception as e:
    print(f"Error: {e}")
finally:
    conn.close()
