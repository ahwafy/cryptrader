import sqlite3

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()

print("========== SYSTEM REPORT ==========")
# Check current paper balance
cursor.execute("SELECT value FROM settings WHERE key='paper_usdt_balance'")
bal = cursor.fetchone()
if bal:
    print(f"Current Paper Balance: ${float(bal[0]):.2f}")
else:
    print("Current Paper Balance: Not found (Defaults to $10,000)")

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
    print(f"Net PnL: ${net_pnl:.2f}")
else:
    print("\n--- Closed Trades Stats ---")
    print("No closed trades found.")

# Check open trades
cursor.execute("SELECT id, asset, trade_type, entry_price, amount, leverage, created_at FROM trades WHERE status='open'")
open_trades = cursor.fetchall()
print(f"\n--- Open Trades ({len(open_trades)}) ---")
for t in open_trades:
    print(t)

# Check recent signals
print(f"\n--- Recent TA Signals (Last 10) ---")
cursor.execute("SELECT s.id, s.asset, s.status, s.result, s.created_at FROM signals s JOIN sources src ON s.source_id = src.id WHERE src.name='TA Engine' ORDER BY s.id DESC LIMIT 10")
for sig in cursor.fetchall():
    print(sig)

# Check recent errors or logs in executor
print("\n========== END REPORT ==========")
