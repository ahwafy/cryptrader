import sqlite3
import json

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()

cursor.execute("SELECT id, asset, pnl, amount, leverage FROM trades WHERE status='closed' ORDER BY id ASC")
trades = cursor.fetchall()

total_pnl = 0
for t in trades:
    total_pnl += t[2]
    print(t)

print(f"Calculated Total PnL: {total_pnl}")
