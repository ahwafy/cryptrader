import sqlite3
conn = sqlite3.connect('database/database.sqlite')
query = '''
SELECT t.status, t.pnl
FROM trades t
JOIN signals sig ON t.signal_id = sig.id
JOIN sources src ON sig.source_id = src.id
WHERE src.type = 'telegram'
'''
rows = conn.execute(query).fetchall()
total = len(rows)
winners = sum(1 for r in rows if r[0] == 'closed' and r[1] is not None and r[1] > 0)
losers = sum(1 for r in rows if r[0] == 'closed' and r[1] is not None and r[1] < 0)
open_trades = sum(1 for r in rows if r[0] == 'open')
print(f"Total: {total}")
print(f"Winners: {winners}")
print(f"Losers: {losers}")
print(f"Open: {open_trades}")
