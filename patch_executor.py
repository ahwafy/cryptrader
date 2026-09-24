import os

with open('Y:/cryptrader/ai_workers/executor.py', 'r', encoding='utf-8') as f:
    content = f.read()

func = """
def check_and_apply_blocklist(session, trade, pnl_amount):
    if pnl_amount >= 0:
        return
        
    try:
        max_loss_str = get_db_setting(session, 'auto_blocklist_max_loss_amount', '50')
        consec_losses_str = get_db_setting(session, 'auto_blocklist_consecutive_losses', '2')
        cooldown_hours_str = get_db_setting(session, 'auto_blocklist_hours', '24')
        
        max_loss = float(max_loss_str)
        consec_losses = int(consec_losses_str)
        cooldown_hours = float(cooldown_hours_str)
        
        if cooldown_hours <= 0:
            return
            
        reason = None
        
        if pnl_amount <= -max_loss:
            reason = f"Automatic Cooldown: Single trade loss (${abs(pnl_amount):.2f}) exceeded max threshold (${max_loss:.2f})"
        else:
            recent_trades = session.query(Trade).filter(
                Trade.asset == trade.asset,
                Trade.status == 'closed'
            ).order_by(Trade.id.desc()).limit(consec_losses).all()
            
            if len(recent_trades) == consec_losses:
                all_losses = all(t.pnl < 0 for t in recent_trades)
                if all_losses:
                    reason = f"Automatic Cooldown: Hit consecutive losses threshold ({consec_losses} trades in a row)"
        
        if reason:
            blocked_until = (datetime.now() + timedelta(hours=cooldown_hours)).strftime('%Y-%m-%d %H:%M:%S')
            existing = session.query(Blocklist).filter(Blocklist.asset == trade.asset).first()
            if existing:
                existing.blocked_until = blocked_until
                existing.reason = reason
                existing.updated_at = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            else:
                new_block = Blocklist(asset=trade.asset, blocked_until=blocked_until, reason=reason)
                session.add(new_block)
            session.commit()
            log_to_file(f"[BLOCKLIST] {trade.asset} has been blocked until {blocked_until}. Reason: {reason}")
    except Exception as e:
        log_to_file(f"Error checking blocklist for trade {trade.id}: {e}")

"""

if 'def check_and_apply_blocklist' not in content:
    content = content.replace("def sweep_futures_profit", func + "\ndef sweep_futures_profit")

content = content.replace("sweep_futures_profit(exchange, trade_type, pnl_amount, trade_mode)", "sweep_futures_profit(exchange, trade_type, pnl_amount, trade_mode)\n                    check_and_apply_blocklist(session, trade, pnl_amount)")
content = content.replace("sweep_futures_profit(exchange, trade_type, final_pnl, trade_mode)", "sweep_futures_profit(exchange, trade_type, final_pnl, trade_mode)\n                                    check_and_apply_blocklist(session, trade, final_pnl)")

with open('Y:/cryptrader/ai_workers/executor.py', 'w', encoding='utf-8') as f:
    f.write(content)

print("executor.py patched successfully.")
