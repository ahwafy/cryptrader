import sqlite3

conn = sqlite3.connect('database/database.sqlite')
c = conn.cursor()
rows = c.execute("SELECT id, name, type, status FROM sources").fetchall()
for r in rows:
    safe_name = r[1].encode('ascii', 'ignore').decode('ascii')
    print(f"ID: {r[0]}, Name: {safe_name}, Type: {r[2]}, Status: {r[3]}")
