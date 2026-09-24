import sqlite3

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()

cursor.execute("SELECT value FROM settings WHERE key = 'global_market_sentiment'")
row = cursor.fetchone()
if row:
    print(f"global_market_sentiment: {row[0]}")
else:
    print("global_market_sentiment not found in settings table.")
