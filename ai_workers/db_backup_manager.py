import os
import sys
import time
import sqlite3
from datetime import datetime, timedelta

def log_to_file(message):
    timestamp = datetime.now().strftime("[%Y-%m-%d %H:%M:%S]")
    formatted = f"{timestamp} {message}"
    print(formatted, flush=True)
    try:
        log_path = os.path.join(os.path.dirname(__file__), "backup_manager.log")
        with open(log_path, "a", encoding="utf-8") as f:
            f.write(formatted + "\n")
    except Exception:
        pass

def prune_old_backups(backup_dir, max_age_hours=48):
    try:
        now = datetime.now()
        cutoff = now - timedelta(hours=max_age_hours)
        for fname in os.listdir(backup_dir):
            if fname.startswith("db_") and fname.endswith(".sqlite"):
                fpath = os.path.join(backup_dir, fname)
                mtime = datetime.fromtimestamp(os.path.getmtime(fpath))
                if mtime < cutoff:
                    os.remove(fpath)
                    log_to_file(f"[BACKUP PRUNE] Removed backup older than {max_age_hours}h: {fname}")
    except Exception as e:
        log_to_file(f"[BACKUP PRUNE ERROR] {e}")

def take_live_backup():
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    src_db = os.path.join(base_dir, "database", "database.sqlite")
    backup_dir = os.path.join(base_dir, "database", "backups")
    os.makedirs(backup_dir, exist_ok=True)

    if not os.path.exists(src_db):
        log_to_file(f"[LIVE BACKUP SKIPPED] Main database file not found at: {src_db}")
        return False

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    dest_db = os.path.join(backup_dir, f"db_{timestamp}.sqlite")

    try:
        src_conn = sqlite3.connect(src_db, timeout=60.0)
        dest_conn = sqlite3.connect(dest_db)

        with dest_conn:
            src_conn.backup(dest_conn)

        dest_conn.close()
        src_conn.close()

        log_to_file(f"[LIVE BACKUP SUCCESS] Created non-blocking live backup: db_{timestamp}.sqlite")
        prune_old_backups(backup_dir, max_age_hours=48)
        return True
    except Exception as e:
        log_to_file(f"[LIVE BACKUP ERROR] Failed to create backup: {e}")
        return False

def main():
    log_to_file("Live Rolling Database Backup Service Started (Interval: 30 mins).")
    # Take initial backup immediately on startup
    take_live_backup()

    interval_seconds = 30 * 60  # 30 minutes
    while True:
        try:
            time.sleep(interval_seconds)
            take_live_backup()
        except KeyboardInterrupt:
            log_to_file("Backup service shutting down gracefully.")
            break
        except Exception as e:
            log_to_file(f"Backup service loop error: {e}")
            time.sleep(60)

if __name__ == "__main__":
    main()
