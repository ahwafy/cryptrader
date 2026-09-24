import sqlite3

conn = sqlite3.connect(r'Y:\cryptrader\database\database.sqlite')
cursor = conn.cursor()

print("--- RECENT TRADES ---")
cursor.execute("SELECT id, asset, trade_type, entry_price, status, created_at FROM trades ORDER BY id DESC LIMIT 10")
rows = cursor.fetchall()
if not rows:
    print("NO TRADES EXECUTED YET.")
else:
    for r in rows:
        print(r)

print("\n--- RECENT TA ENGINE SIGNALS ---")
cursor.execute("SELECT id FROM sources WHERE name = 'TA Engine'")
ta_source = cursor.fetchone()
if ta_source:
    ta_id = ta_source[0]
    cursor.execute("SELECT id, asset, status, result, created_at FROM signals WHERE source_id = ? ORDER BY id DESC LIMIT 15", (ta_id,))
    sig_rows = cursor.fetchall()
    if not sig_rows:
        print("NO TA SIGNALS FOUND.")
    else:
        for r in sig_rows:
            print(r)
else:
    print("TA Engine source not found!")
