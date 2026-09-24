import sqlite3

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()

# Increase risk to 50% of balance per trade
cursor.execute("UPDATE settings SET value='0.50' WHERE key='risk_per_trade'")

# Increase leverage from 5x to 10x
cursor.execute("UPDATE settings SET value='10' WHERE key='max_futures_leverage'")

conn.commit()
print("Settings updated successfully!")
