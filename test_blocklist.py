import sys
sys.path.append('ai_workers')
from executor import Session, Trade, check_and_apply_blocklist

s = Session()
t = s.query(Trade).get(124)
print(f"Testing trade {t.id} - {t.asset} - pnl {t.pnl}")
try:
    check_and_apply_blocklist(s, t, t.pnl)
    s.commit()
    print("Done")
except Exception as e:
    print("Error:", e)
