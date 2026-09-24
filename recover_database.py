import os
import sys
import shutil
import sqlite3
from datetime import datetime

def is_database_healthy(db_path):
    if not os.path.exists(db_path) or os.path.getsize(db_path) == 0:
        return False
    try:
        conn = sqlite3.connect(db_path, timeout=5.0)
        c = conn.cursor()
        res = c.execute("PRAGMA quick_check").fetchone()
        conn.close()
        return res and res[0] == "ok"
    except Exception:
        return False

def get_db_stats(db_path):
    try:
        conn = sqlite3.connect(db_path, timeout=5.0)
        c = conn.cursor()
        trades_count = c.execute("SELECT count(*) FROM trades").fetchone()[0]
        max_trade_date = c.execute("SELECT max(created_at) FROM trades").fetchone()[0] or "N/A"
        conn.close()
        return trades_count, max_trade_date
    except Exception:
        return 0, "N/A"

def recover_database():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    main_db = os.path.join(base_dir, "database", "database.sqlite")
    backup_dir = os.path.join(base_dir, "database", "backups")

    print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Starting Database Health Check & Recovery Tool...")

    # Check if main database is already healthy
    if is_database_healthy(main_db):
        trades_cnt, max_date = get_db_stats(main_db)
        print(f"SUCCESS: Main database is 100% HEALTHY! (Total Trades: {trades_cnt}, Latest Trade: {max_date})")
        return True

    print("WARNING: Main database is missing, locked, or corrupted. Searching for available backups...")

    if not os.path.exists(backup_dir):
        print("ERROR: Backup directory database/backups/ does not exist. Cannot perform recovery.")
        return False

    valid_backups = []
    for fname in os.listdir(backup_dir):
        if fname.endswith(".sqlite"):
            fpath = os.path.join(backup_dir, fname)
            if is_database_healthy(fpath):
                cnt, max_date = get_db_stats(fpath)
                mtime = os.path.getmtime(fpath)
                valid_backups.append({
                    "path": fpath,
                    "filename": fname,
                    "trades_count": cnt,
                    "max_date": max_date,
                    "mtime": mtime
                })

    if not valid_backups:
        print("ERROR: No valid backups found in database/backups/. Cannot recover.")
        return False

    # Sort backups by trade count (primary) and mtime (secondary) to pick the newest complete database
    valid_backups.sort(key=lambda x: (x["trades_count"], x["mtime"]), reverse=True)
    best_backup = valid_backups[0]

    print(f"Found best valid backup: {best_backup['filename']}")
    print(f"  - Total Trades: {best_backup['trades_count']}")
    print(f"  - Latest Trade Date: {best_backup['max_date']}")
    print(f"  - File Modified Time: {datetime.fromtimestamp(best_backup['mtime']).strftime('%Y-%m-%d %H:%M:%S')}")

    try:
        # Clean up stale WAL / SHM files if present
        wal_file = main_db + "-wal"
        shm_file = main_db + "-shm"
        if os.path.exists(wal_file):
            try: os.remove(wal_file)
            except Exception: pass
        if os.path.exists(shm_file):
            try: os.remove(shm_file)
            except Exception: pass

        shutil.copy2(best_backup["path"], main_db)
        print(f"SUCCESS: Successfully restored database from {best_backup['filename']}!")
        return True
    except Exception as e:
        print(f"ERROR: Failed to restore database file: {e}")
        return False

if __name__ == "__main__":
    recover_database()
