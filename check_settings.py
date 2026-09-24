import sqlite3

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()
print(cursor.execute("SELECT key, value FROM settings WHERE key IN ('risk_per_trade', 'max_futures_leverage')").fetchall())
