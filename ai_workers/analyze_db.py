import sqlite3

def main():
    conn = sqlite3.connect('Y:/cryptrader/database/database.sqlite')
    cursor = conn.cursor()

    print("==================================================")
    print("   CRYPTRADER CORE DATABASE PERFORMANCE METRICS   ")
    print("==================================================")

    # 1. News Ingestor Metrics
    cursor.execute("SELECT COUNT(*) FROM news_items")
    total_news = cursor.fetchone()[0]
    cursor.execute("SELECT COUNT(*) FROM news_items WHERE status='processed'")
    processed_news = cursor.fetchone()[0]
    print(f"Total News Items Ingested: {total_news}")
    print(f"Total News Items Processed: {processed_news} ({processed_news/total_news*100:.1f}% efficiency)" if total_news > 0 else "No news items ingested yet.")

    # 2. Classifier Metrics
    cursor.execute("SELECT COUNT(*) FROM signals")
    total_signals = cursor.fetchone()[0]
    cursor.execute("SELECT COUNT(*) FROM signals WHERE status='processed'")
    processed_signals = cursor.fetchone()[0]
    cursor.execute("SELECT COUNT(*) FROM signals WHERE status='pending'")
    pending_signals = cursor.fetchone()[0]
    print(f"\nTotal Signals Classified: {total_signals}")
    print(f"  - Pending Verification: {pending_signals}")
    print(f"  - Successfully Processed/Ignored: {processed_signals}")

    # 3. Trade Execution Metrics
    cursor.execute("SELECT COUNT(*) FROM trades")
    total_trades = cursor.fetchone()[0]
    cursor.execute("SELECT COUNT(*) FROM trades WHERE status='open'")
    open_trades = cursor.fetchone()[0]
    cursor.execute("SELECT COUNT(*) FROM trades WHERE status='closed'")
    closed_trades = cursor.fetchone()[0]
    cursor.execute("SELECT SUM(pnl) FROM trades WHERE status='closed'")
    total_pnl = cursor.fetchone()[0] or 0.0
    
    # Calculate Win Rate of executed paper trades
    cursor.execute("SELECT COUNT(*) FROM trades WHERE status='closed' AND pnl > 0")
    winning_trades = cursor.fetchone()[0]
    win_rate = (winning_trades / closed_trades * 100) if closed_trades > 0 else 0.0

    print(f"\nPortfolio Trade Execution Statistics:")
    print(f"  - Total Trades Opened: {total_trades}")
    print(f"  - Active Open Positions: {open_trades}")
    print(f"  - Closed Positions: {closed_trades}")
    print(f"  - Realized Portfolio PnL: {total_pnl:+.4f} USDT")
    print(f"  - AI Paper Trading Win Rate: {win_rate:.1f}% ({winning_trades}/{closed_trades} Wins)")

    # 4. Source Contribution
    print(f"\nActive Signal Sources & Contribution:")
    cursor.execute("SELECT sources.name, COUNT(signals.id), sources.type, sources.status FROM signals JOIN sources ON signals.source_id=sources.id GROUP BY sources.name")
    for row in cursor.fetchall():
        print(f"  - [{row[2].upper()}] {row[0]} ({row[3]}): {row[1]} signals evaluation")

    print("==================================================")
    conn.close()

if __name__ == "__main__":
    main()
