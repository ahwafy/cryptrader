import sqlite3
import json

db_path = 'Y:/cryptrader/database/database.sqlite'
conn = sqlite3.connect(db_path)
conn.row_factory = sqlite3.Row
cur = conn.cursor()
cur.execute("SELECT id, symbol, created_at, closed_at, pnl, outcome FROM trades WHERE status='closed' AND closed_at > '2026-07-09' ORDER BY closed_at DESC")
rows = cur.fetchall()
print(json.dumps([dict(r) for r in rows], indent=2))
