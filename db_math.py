import sqlite3

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()

open_pnl = cursor.execute("SELECT SUM(pnl) FROM trades WHERE status='open'").fetchone()[0]
closed_pnl = cursor.execute("SELECT SUM(pnl) FROM trades WHERE status='closed'").fetchone()[0]
balance = cursor.execute("SELECT value FROM settings WHERE key='paper_usdt_balance'").fetchone()[0]

print(f"Open PnL: {open_pnl}")
print(f"Closed PnL: {closed_pnl}")
print(f"Current paper balance: {balance}")
