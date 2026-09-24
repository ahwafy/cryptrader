import sqlite3

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()

# Delete the bad lesson that is blocking altcoins
cursor.execute("DELETE FROM ai_lessons WHERE lesson_text LIKE '%8.55%'")
conn.commit()

print("Deleted bad AI lessons. Total remaining:", cursor.execute("SELECT count(*) FROM ai_lessons").fetchone()[0])
