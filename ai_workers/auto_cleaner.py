import time
from prune_db import prune_database
import traceback
from datetime import datetime

def main():
    print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Automated Database Cleaner Started.")
    print("This engine will prune old signals (> 30 days) and news (> 7 days) from the database every 12 hours.")
    while True:
        try:
            # Run every 12 hours
            time.sleep(12 * 3600) 
            prune_database()
        except Exception as e:
            print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Error in auto_cleaner loop: {e}")
            traceback.print_exc()

if __name__ == '__main__':
    main()
