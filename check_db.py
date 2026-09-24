import sqlite3

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()

cursor.execute("SELECT outcome, COUNT(*) FROM trades WHERE status='closed' GROUP BY outcome")
for r in cursor.fetchall():
    print(r)
