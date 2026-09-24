import sqlite3

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()

print("========== PHASE 2 SYSTEM REPORT ==========")

# Check current paper balance
cursor.execute("SELECT value FROM settings WHERE key='paper_usdt_balance'")
bal = cursor.fetchone()
current_bal = float(bal[0]) if bal else 100.0
print(f"Current Paper Balance: ${current_bal:.2f}")

# Check total closed trades and win rate
cursor.execute("SELECT COUNT(*), SUM(CASE WHEN pnl > 0 THEN 1 ELSE 0 END), SUM(pnl) FROM trades WHERE status='closed'")
closed_stats = cursor.fetchone()
if closed_stats and closed_stats[0] > 0:
    total_closed = closed_stats[0]
    wins = closed_stats[1]
    net_pnl = closed_stats[2]
    win_rate = (wins / total_closed) * 100
    print(f"\n--- Closed Trades Stats ---")
    print(f"Total Closed: {total_closed}")
    print(f"Wins: {wins} ({win_rate:.1f}%)")
    print(f"Losses: {total_closed - wins} ({100 - win_rate:.1f}%)")
    print(f"Net PnL: ${net_pnl:.2f}")
    
    # Calculate ROI based on $100 start
    roi = (net_pnl / 100.0) * 100
    print(f"ROI: {roi:.2f}%")
else:
    print("\n--- Closed Trades Stats ---")
    print("No closed trades found.")

# TSL Effectiveness
cursor.execute("SELECT COUNT(*) FROM trades WHERE outcome LIKE '%Trailing%' AND pnl > 0")
tsl_wins = cursor.fetchone()[0]
print(f"\n--- Trailing Stop-Loss Stats ---")
print(f"Trades saved by Trailing Stop-Loss: {tsl_wins}")

# Check open trades
cursor.execute("SELECT id, asset, trade_type, entry_price, amount, leverage, pnl, created_at FROM trades WHERE status='open'")
open_trades = cursor.fetchall()
print(f"\n--- Open Trades ({len(open_trades)}) ---")
for t in open_trades:
    print(t)

# Check blocklist
cursor.execute("SELECT asset, reason, blocked_until FROM blocklist")
blocked = cursor.fetchall()
if blocked:
    print(f"\n--- Blocklisted Assets ---")
    for b in blocked:
        print(b)
else:
    print("\n--- Blocklist is empty ---")

# Best and Worst Coins
cursor.execute("SELECT asset, SUM(pnl) as total_pnl, COUNT(*) FROM trades WHERE status='closed' GROUP BY asset ORDER BY total_pnl DESC LIMIT 3")
print(f"\n--- Top 3 Profitable Coins ---")
for c in cursor.fetchall():
    print(f"{c[0]}: ${c[1]:.2f} (from {c[2]} trades)")

cursor.execute("SELECT asset, SUM(pnl) as total_pnl, COUNT(*) FROM trades WHERE status='closed' GROUP BY asset ORDER BY total_pnl ASC LIMIT 3")
print(f"\n--- Bottom 3 Unprofitable Coins ---")
for c in cursor.fetchall():
    print(f"{c[0]}: ${c[1]:.2f} (from {c[2]} trades)")

print("\n========== END REPORT ==========")
