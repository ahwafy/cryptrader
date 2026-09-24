import sqlite3

db_path = 'Y:/cryptrader/database/database.sqlite'
conn = sqlite3.connect(db_path, timeout=30)
c = conn.cursor()

c.execute("SELECT status, COUNT(*) FROM news_items GROUP BY status")
print("=== NEWS ITEMS ===")
for row in c.fetchall():
    print(f"{row[0]}: {row[1]}")

c.execute("SELECT status, COUNT(*) FROM signals GROUP BY status")
print("\n=== SIGNALS ===")
for row in c.fetchall():
    print(f"{row[0]}: {row[1]}")

conn.close()
