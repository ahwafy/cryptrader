import sqlite3

db_path = 'Y:/cryptrader/database/database_copy.sqlite'
conn = sqlite3.connect(db_path)

query = "SELECT id, asset, trade_type, outcome, pnl, entry_price, stop_loss, target_prices, exit_price FROM trades WHERE pnl < 0 ORDER BY id DESC LIMIT 5"
cursor = conn.cursor()
cursor.execute(query)
rows = cursor.fetchall()
columns = [desc[0] for desc in cursor.description]

print("RECENT LOSSES:")
print(f"{' | '.join(columns)}")
print("-" * 100)
for row in rows:
    print(f"{' | '.join([str(x) for x in row])}")

conn.close()
