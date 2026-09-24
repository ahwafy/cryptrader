import sqlite3
import time
from datetime import datetime

db_path = 'Y:/cryptrader/database/database.sqlite'
conn = sqlite3.connect(db_path, timeout=30)
c = conn.cursor()

print("=== SYSTEM PERFORMANCE REPORT ===")

# Signals Processed
c.execute("SELECT status, COUNT(*) FROM signals GROUP BY status")
print("\n--- SIGNALS ---")
for row in c.fetchall():
    print(f"{row[0]}: {row[1]}")

# Trades
c.execute("SELECT status, COUNT(*) FROM trades GROUP BY status")
print("\n--- TRADES ---")
for row in c.fetchall():
    print(f"{row[0]}: {row[1]}")

c.execute("SELECT outcome FROM trades WHERE status='closed' ORDER BY id DESC LIMIT 10")
print("\n--- RECENT CLOSED TRADES OUTCOMES ---")
for row in c.fetchall():
    print(f"{row[0]}")

# Ai Lessons
c.execute("SELECT COUNT(*) FROM ai_lessons")
print("\n--- AI LESSONS (AUDITOR) ---")
print(f"Total Lessons: {c.fetchone()[0]}")

# News
c.execute("SELECT status, COUNT(*) FROM news_items GROUP BY status")
print("\n--- NEWS ITEMS ---")
for row in c.fetchall():
    print(f"{row[0]}: {row[1]}")

conn.close()

print("\n--- GEMINI ERRORS ---")
try:
    with open('Y:/cryptrader/ai_workers/gemini_errors.log', 'r') as f:
        lines = f.readlines()
        print(f"Total Errors Recorded: {len(lines)}")
        for l in lines[-5:]:
            print(l.strip())
except Exception as e:
    print(f"No error log found or error reading: {e}")

