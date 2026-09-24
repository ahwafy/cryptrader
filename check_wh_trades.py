import sqlite3

conn = sqlite3.connect('database/database.sqlite')
c = conn.cursor()

query = """
SELECT t.id, t.asset, t.status, t.pnl, s.id as signal_id, src.name 
FROM trades t
JOIN signals s ON t.signal_id = s.id
JOIN sources src ON s.source_id = src.id
WHERE src.name LIKE '%WhalesHunter%'
"""

rows = c.execute(query).fetchall()
print(f"Total WhalesHunter Trades found: {len(rows)}")
for r in rows:
    print(r)
