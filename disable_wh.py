import sqlite3
conn = sqlite3.connect('database/database.sqlite')
conn.execute("UPDATE sources SET status = 'inactive' WHERE name = 'Lead Trader: WhalesHunter'")
conn.commit()
print("WhalesHunter disabled.")
