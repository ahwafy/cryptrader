import sqlite3
db_path = 'Y:/cryptrader/database/database.sqlite'
conn = sqlite3.connect(db_path)
cur = conn.cursor()
cur.execute("INSERT OR REPLACE INTO settings (key, value) VALUES ('paper_usdt_balance', '10000.0')")
conn.commit()
print("Updated paper_usdt_balance to 10000.0 in database.")
conn.close()
