import sqlite3
db_path = 'Y:/cryptrader/database/database.sqlite'
conn = sqlite3.connect(db_path)
conn.row_factory = sqlite3.Row
cur = conn.cursor()
cur.execute("SELECT outcome, pnl, closed_at FROM trades WHERE status='closed' AND closed_at >= '2026-07-11 00:00:00' AND pnl > 0")
wins = cur.fetchall()
print("Winning Trades:")
for w in wins:
    print(dict(w))
