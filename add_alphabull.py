import sqlite3

conn = sqlite3.connect('database/database.sqlite')
c = conn.cursor()

# Check if exists
existing = c.execute("SELECT * FROM sources WHERE name = 'Lead Trader: AlphaBull'").fetchone()
if not existing:
    c.execute("""
        INSERT INTO sources (id, name, type, status, historical_win_rate, catch_up_hours)
        VALUES (13, 'Lead Trader: AlphaBull', 'api', 'active', 0.85, 0)
    """)
    conn.commit()
    print("Successfully added 'Lead Trader: AlphaBull' to sources!")
else:
    print("'Lead Trader: AlphaBull' already exists.")
