import sqlite3
import os

paths = [
    r'Y:\cryptrader\database\database.sqlite',
    r'Y:\cryptrader\database\database_copy.sqlite',
    r'Y:\cryptrader\database\database_backup.sqlite',
    r'Y:\cryptrader\database\database_corrupted_1783603927.sqlite'
]

for p in paths:
    if os.path.exists(p):
        conn = sqlite3.connect(p)
        c = conn.cursor()
        res = c.execute("SELECT * FROM sources WHERE name LIKE '%AlphaBull%'").fetchall()
        print(f"{p}: {res}")
