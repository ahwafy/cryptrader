import sqlite3
conn = sqlite3.connect('database/database.sqlite')
print("AVAX:", conn.execute("SELECT id, pnl FROM trades WHERE asset='AVAX' AND status='closed' ORDER BY id DESC LIMIT 5").fetchall())
