import sqlite3

conn = sqlite3.connect('database/database.sqlite')
c = conn.cursor()
min_id = c.execute("SELECT min(id) FROM trades").fetchone()[0]
max_id = c.execute("SELECT max(id) FROM trades").fetchone()[0]
count = c.execute("SELECT count(*) FROM trades").fetchone()[0]

print(f"Min Trade ID: {min_id}, Max Trade ID: {max_id}, Total Count: {count}")
