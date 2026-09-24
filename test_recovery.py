import re

trades = {}

with open('ai_workers/executor.log', 'r', encoding='utf-8') as f:
    for line in f:
        # Example: [2026-05-23 03:14:08] Monitoring [PAPER - SPOT LONG] ETH/USDT: Current 2066.16 | Entry 2077.93 | Peak 2066.16 | TP1 2100.0 | Orig SL 2050.0
        # Example: [2026-05-23 03:14:33] Trade #10 (XRP) reached max holding time
        
        # We can extract trade info from Monitoring lines
        match = re.search(r'Monitoring \[(\w+) - (\w+) (\w+)\] (\w+)/USDT:.*?Entry ([\d\.]+).*?TP1 ([\d\.]+|N/A).*?Orig SL ([\d\.]+)', line)
        if match:
            mode = match.group(1).lower()
            trade_type = match.group(2).lower()
            direction = match.group(3).upper()
            asset = match.group(4).upper()
            entry = float(match.group(5))
            tp = float(match.group(6)) if match.group(6) != 'N/A' else None
            sl = float(match.group(7))
            
            # Use asset+entry as a unique key for the trade
            key = f"{asset}_{entry}"
            if key not in trades:
                trades[key] = {
                    'asset': asset,
                    'mode': mode,
                    'trade_type': trade_type,
                    'direction': direction,
                    'entry': entry,
                    'tp': tp,
                    'sl': sl,
                    'status': 'open',
                    'outcome': None,
                    'closed_at': None
                }
                
        # Handle closures
        # Example: >>> CLOSING [PAPER] TRADE (Hard Stop Loss Hit: 75500.0): SELL BTC
        # Wait, the closing line doesn't have the entry price. We just match the asset and close the currently open one.
        close_match = re.search(r'>>> CLOSING \[(.*?)\] TRADE \((.*?)\): (BUY|SELL) (\w+)', line)
        if close_match:
            asset = close_match.group(4)
            reason = close_match.group(2)
            
            # Find the OPEN trade for this asset
            for k, t in trades.items():
                if t['asset'] == asset and t['status'] == 'open':
                    t['status'] = 'closed'
                    t['outcome'] = reason
                    break
        
        time_close_match = re.search(r'Auto-closing trade #\d+ \((.*?)\)', line)
        if time_close_match:
            asset = time_close_match.group(1)
            # Find OPEN trade
            for k, t in trades.items():
                if t['asset'] == asset and t['status'] == 'open':
                    t['status'] = 'closed'
                    t['outcome'] = 'Time-Based Exit'
                    break

open_count = sum(1 for t in trades.values() if t['status'] == 'open')
closed_count = sum(1 for t in trades.values() if t['status'] == 'closed')

print(f"Recovered Trades: {len(trades)} (Open: {open_count}, Closed: {closed_count})")
for k, t in trades.items():
    print(f" - {t['asset']} ({t['status']}): Entry {t['entry']}, Outcome {t['outcome']}")
