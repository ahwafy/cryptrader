import sqlite3

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()

cursor.execute("SELECT id, lesson_text FROM ai_lessons")
lessons = cursor.fetchall()

print("--- AI Lessons ---")
for l in lessons:
    print(f"ID {l[0]}: {l[1]}")
