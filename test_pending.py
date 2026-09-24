import sqlite3
conn = sqlite3.connect('database/database.sqlite')
print(conn.execute("SELECT count(*), status, result FROM signals WHERE status='pending' GROUP BY status, result").fetchall())
