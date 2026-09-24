import sqlite3
import time

conn = sqlite3.connect('Y:/cryptrader/database/database.sqlite')
c = conn.cursor()

# 1. Reset all signals so the AI can re-process them properly
c.execute("DELETE FROM trades")
c.execute("UPDATE signals SET status = 'pending', result = NULL")

# 2. Fix the corrupted settings that caused the Executor to skip trades!
c.execute("INSERT OR REPLACE INTO settings (key, value) VALUES ('paper_trading_status', 'active')")
c.execute("INSERT OR REPLACE INTO settings (key, value) VALUES ('live_trading_status', 'inactive')")
c.execute("INSERT OR REPLACE INTO settings (key, value) VALUES ('futures_trading_status', 'active')")

conn.commit()
conn.close()
print("Factory Reset and Settings Fix completed successfully!")
