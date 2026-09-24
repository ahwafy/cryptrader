import sqlite3
db_path = 'Y:/cryptrader/database/database.sqlite'
conn = sqlite3.connect(db_path)
cur = conn.cursor()
cur.execute("UPDATE settings SET value='6' WHERE key='max_holding_hours'")
conn.commit()
print("Updated max_holding_hours to 6 in database.")
conn.close()
