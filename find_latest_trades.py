import sqlite3
import os

files = [
    r'Y:\cryptrader\database\database.sqlite',
    r'Y:\cryptrader\database\database_copy.sqlite',
    r'Y:\cryptrader\database\database_backup.sqlite',
    r'Y:\cryptrader\database\database_corrupted_1783603927.sqlite',
    r'Y:\cryptrader\dashboard\database\database.sqlite',
    r'Y:\cryptrader\ai_workers\temp_test_db.sqlite',
    r'Y:\cryptrader\ai_workers\temp_test_db_50.sqlite'
]

for f in files:
    if os.path.exists(f):
        try:
            conn = sqlite3.connect(f)
            c = conn.cursor()
            cnt = c.execute("SELECT count(*) FROM trades").fetchone()[0]
            max_date = c.execute("SELECT max(created_at) FROM trades").fetchone()[0]
            min_date = c.execute("SELECT min(created_at) FROM trades").fetchone()[0]
            max_id = c.execute("SELECT max(id) FROM trades").fetchone()[0]
            print(f"[{f}]\n  Count: {cnt}, Max ID: {max_id}, Min Date: {min_date}, Max Date: {max_date}")
        except Exception as e:
            print(f"[{f}]\n  Error: {e}")
