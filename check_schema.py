import sqlite3

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()
cursor.execute("SELECT sql FROM sqlite_master WHERE type='table' AND name='trades'")
print(cursor.fetchone()[0])
