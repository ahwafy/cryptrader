import sqlite3

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()
for row in cursor.execute("SELECT asset, amount, pnl, outcome FROM trades WHERE status='closed'").fetchall():
    print(row)
