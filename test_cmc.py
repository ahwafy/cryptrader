import sys
sys.path.append('Y:/cryptrader/ai_workers')
from cmc_ingestor import poll_coinmarketcap, Session, Setting

print("Running poll_coinmarketcap()...")
poll_coinmarketcap()

session = Session()
setting = session.query(Setting).filter_by(key='global_market_sentiment').first()
if setting:
    print(f"Success! Sentiment written to DB: {setting.value}")
else:
    print("Failed to find setting in DB.")
session.close()
