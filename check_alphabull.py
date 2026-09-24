import sqlite3

conn = sqlite3.connect('database/database.sqlite')
c = conn.cursor()

# Check source
sources = c.execute("SELECT * FROM sources WHERE name LIKE '%AlphaBull%'").fetchall()
print("AlphaBull Source in DB:", sources)

# Check signals
signals = c.execute("SELECT count(*) FROM signals s JOIN sources src ON s.source_id = src.id WHERE src.name LIKE '%AlphaBull%'").fetchone()[0]
print("AlphaBull Signals Count:", signals)

# Check trades
query = """
SELECT t.id, t.asset, t.status, t.pnl, s.id as signal_id, src.name 
FROM trades t
JOIN signals s ON t.signal_id = s.id
JOIN sources src ON s.source_id = src.id
WHERE src.name LIKE '%AlphaBull%'
"""
trades = c.execute(query).fetchall()
print(f"AlphaBull Trades Count: {len(trades)}")
for tr in trades:
    print(tr)
