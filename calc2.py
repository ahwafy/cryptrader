import sqlite3

conn = sqlite3.connect('database/database.sqlite')
conn.row_factory = sqlite3.Row

rows = conn.execute("SELECT entry_price, exit_price, pnl, amount, leverage FROM trades WHERE status = 'closed' AND created_at >= date('now', '-7 days') ORDER BY closed_at ASC").fetchall()

balance = 100.0

for r in rows:
    notional = r['entry_price'] * r['amount']
    if notional < 1:
        continue
        
    roi = r['pnl'] / (notional / r['leverage'])
    # Compounding: apply ROI to the current balance
    balance = balance * (1 + roi)

print(f"Compounded Balance: ${balance:.2f}")
print(f"Compounded Profit: ${(balance - 100):.2f}")
