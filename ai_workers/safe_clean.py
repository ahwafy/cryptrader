import sqlite3
import time

def safe_clean():
    print("Initiating Safe Database Clean...")
    try:
        # Wait up to 30 seconds for any active locks to clear, ensuring live trades are never crashed
        conn = sqlite3.connect('../database/database.sqlite', timeout=30.0)
        c = conn.cursor()
        
        print("Cleaning orphaned/unwanted signals...")
        # Only delete signals that are NOT explicitly tied to a recorded Trade
        c.execute("DELETE FROM signals WHERE id NOT IN (SELECT signal_id FROM trades WHERE signal_id IS NOT NULL)")
        print(f" -> Removed {c.rowcount} junk signals.")
        
        print("Cleaning raw news chatter...")
        c.execute("DELETE FROM news_items")
        print(f" -> Removed {c.rowcount} raw news items.")
        
        conn.commit()
        conn.close()
        print("Safe Clean Completed! Your database is optimized and live trades were unaffected.")
    except Exception as e:
        print(f"Error during safe clean: {e}")

if __name__ == "__main__":
    safe_clean()
    # Pause so user can read output if double-clicked in Windows
    time.sleep(5)
