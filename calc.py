import sqlite3

conn = sqlite3.connect('database/database.sqlite')
conn.row_factory = sqlite3.Row

rows = conn.execute("SELECT entry_price, exit_price, pnl, amount, leverage FROM trades WHERE status = 'closed' AND created_at >= date('now', '-7 days')").fetchall()

total_roi = 0.0
wins = 0
losses = 0

for r in rows:
    notional = r['entry_price'] * r['amount']
    # If notional is zero or extremely small, skip to avoid division by zero
    if notional < 1:
        continue
        
    roi = r['pnl'] / (notional / r['leverage'])
    total_roi += roi
    
    if r['pnl'] > 0:
        wins += 1
    elif r['pnl'] < 0:
        losses += 1

print(f"Total Trades: {len(rows)}")
print(f"Wins: {wins}")
print(f"Losses: {losses}")
print(f"Sum of ROIs: {total_roi*100:.2f}%")
print(f"Profit on $100 fixed size: ${(100 * total_roi):.2f}")
