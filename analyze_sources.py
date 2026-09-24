import sqlite3

conn = sqlite3.connect('database/database.sqlite')
conn.row_factory = sqlite3.Row

# Join trades with signals and sources to group by source
query = """
SELECT src.name, t.pnl, t.entry_price, t.amount, t.leverage
FROM trades t
JOIN signals sig ON t.signal_id = sig.id
JOIN sources src ON sig.source_id = src.id
WHERE t.status = 'closed' AND t.created_at >= date('now', '-7 days')
"""
rows = conn.execute(query).fetchall()

source_stats = {}
for r in rows:
    name = r['name']
    if name not in source_stats:
        source_stats[name] = {'trades': 0, 'wins': 0, 'losses': 0, 'roi': 0.0}
    
    notional = r['entry_price'] * r['amount']
    if notional < 1:
        continue
        
    roi = r['pnl'] / (notional / r['leverage'])
    source_stats[name]['trades'] += 1
    source_stats[name]['roi'] += roi
    if r['pnl'] > 0:
        source_stats[name]['wins'] += 1
    elif r['pnl'] < 0:
        source_stats[name]['losses'] += 1

print(f"{'Source':<30} | {'Trades':<6} | {'WR%':<6} | {'Total ROI':<10}")
print("-" * 65)
for name, stats in sorted(source_stats.items(), key=lambda x: x[1]['roi'], reverse=True):
    wr = (stats['wins'] / stats['trades'] * 100) if stats['trades'] > 0 else 0
    print(f"{name:<30} | {stats['trades']:<6} | {wr:>5.1f}% | {stats['roi']*100:>8.2f}%")
