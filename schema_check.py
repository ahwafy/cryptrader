import sqlite3
conn = sqlite3.connect('database/database.sqlite')
print(conn.execute("SELECT sql FROM sqlite_master WHERE type='table' AND name='sources'").fetchone()[0])
