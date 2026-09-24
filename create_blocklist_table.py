import sqlite3

conn = sqlite3.connect('database/database.sqlite')
c = conn.cursor()

c.execute("""
CREATE TABLE IF NOT EXISTS blocklist (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    asset VARCHAR(255) NOT NULL,
    blocked_until DATETIME NULL,
    reason VARCHAR(255) NULL,
    created_at DATETIME NULL,
    updated_at DATETIME NULL
)
""")

conn.commit()
print("Successfully created 'blocklist' table in database/database.sqlite!")
