import re

file_path = 'Y:/cryptrader/ai_workers/executor.py'
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Update the function definition
old_def = '''def sweep_futures_profit(exchange, trade_type, pnl_amount):
    if trade_type != 'futures' or pnl_amount <= 0:
        return
    try:
        log_to_file(f"[PROFIT SWEEP] Attempting to transfer ${pnl_amount:.2f} profit from Futures to Spot wallet...")
        # ccxt binance transfer format: transfer(code, amount, fromAccount, toAccount)
        exchange.transfer('USDT', pnl_amount, 'future', 'spot')
        log_to_file(f"[PROFIT SWEEP] Successfully transferred ${pnl_amount:.2f} to Spot wallet!")
    except Exception as e:
        log_to_file(f"[PROFIT SWEEP ERROR] Failed to transfer profit: {e}")'''

new_def = '''def sweep_futures_profit(exchange, trade_type, pnl_amount, mode='live'):
    if mode == 'paper':
        from database import Session, Setting
        session = Session()
        setting = session.query(Setting).filter_by(key='paper_usdt_balance').first()
        if setting:
            current = float(setting.value)
            new_bal = current + pnl_amount
            setting.value = str(new_bal)
            session.commit()
            log_to_file(f"[PAPER MODE] Updated virtual balance by ${pnl_amount:+.2f}. New Balance: ${new_bal:.2f}")
        session.close()
        return

    if trade_type != 'futures' or pnl_amount <= 0:
        return
    try:
        log_to_file(f"[PROFIT SWEEP] Attempting to transfer ${pnl_amount:.2f} profit from Futures to Spot wallet...")
        # ccxt binance transfer format: transfer(code, amount, fromAccount, toAccount)
        exchange.transfer('USDT', pnl_amount, 'future', 'spot')
        log_to_file(f"[PROFIT SWEEP] Successfully transferred ${pnl_amount:.2f} to Spot wallet!")
    except Exception as e:
        log_to_file(f"[PROFIT SWEEP ERROR] Failed to transfer profit: {e}")'''

content = content.replace(old_def, new_def)

# 2. Update the calls
content = re.sub(r'sweep_futures_profit\(exchange, trade_type, pnl_amount\)', r'sweep_futures_profit(exchange, trade_type, pnl_amount, trade_mode)', content)
content = re.sub(r'sweep_futures_profit\(exchange, trade_type, final_pnl\)', r'sweep_futures_profit(exchange, trade_type, final_pnl, trade_mode)', content)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Patched executor.py successfully.")
