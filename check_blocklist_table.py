import sqlite3

conn = sqlite3.connect('database/database.sqlite')
c = conn.cursor()

tables = c.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='blocklist'").fetchall()
print("Blocklist table in database/database.sqlite:", tables)
