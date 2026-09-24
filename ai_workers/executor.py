import os
import ccxt
from sqlalchemy import create_engine, Column, Integer, String, Float, Text, ForeignKey, Enum, DateTime
from sqlalchemy.orm import sessionmaker, relationship, joinedload, declarative_base
import time
from datetime import datetime, timezone, timedelta
from dotenv import load_dotenv
from llm_provider import LLMProvider

env_path = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), '.env')
load_dotenv(env_path, override=True)

def log_to_file(message):
    timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
    formatted_message = f"[{timestamp}] {message}"
    try:
        print(formatted_message, flush=True)
    except:
        pass
    with open("executor.log", "a", encoding='utf-8') as f:
        f.write(formatted_message + "\n")
        f.flush()

Base = declarative_base()

class Source(Base):
    __tablename__ = 'sources'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    type = Column(String)
    status = Column(String)
    historical_win_rate = Column(Float)
    signals = relationship("Signal", back_populates="source")

class Signal(Base):
    __tablename__ = 'signals'
    id = Column(Integer, primary_key=True)
    source_id = Column(Integer, ForeignKey('sources.id'))
    raw_text = Column(Text)
    parsed_sentiment = Column(Float)
    asset = Column(String)
    status = Column(String, default='pending')
    result = Column(String)
    initial_price = Column(Float)
    source = relationship("Source", back_populates="signals")

class NewsItem(Base):
    __tablename__ = 'news_items'
    id = Column(Integer, primary_key=True)
    source_id = Column(Integer, ForeignKey('sources.id'))
    raw_text = Column(Text)
    status = Column(String, default='pending')
    created_at = Column(DateTime, default=datetime.now)

class Trade(Base):
    __tablename__ = 'trades'
    id = Column(Integer, primary_key=True)
    signal_id = Column(Integer, ForeignKey('signals.id'))
    asset = Column(String)
    symbol = Column(String)
    amount = Column(Float)
    trade_type = Column(String, default='spot')
    leverage = Column(Integer, default=1)
    entry_price = Column(Float)
    target_prices = Column(Text) # JSON string of targets
    stop_loss = Column(Float)
    status = Column(String, default='open')
    outcome = Column(String)
    created_at = Column(String)
    closed_at = Column(String)
    exit_price = Column(Float)
    pnl = Column(Float)
    highest_price_seen = Column(Float)
    tsl_active = Column(Integer, default=0)
    tp1_hit = Column(Integer, default=0)
    mode = Column(String, default='paper')
    side = Column(String, default='LONG')

class Blocklist(Base):
    __tablename__ = 'blocklist'
    id = Column(Integer, primary_key=True)
    asset = Column(String)
    blocked_until = Column(String)
    reason = Column(String)
    created_at = Column(String, default=lambda: datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    updated_at = Column(String, default=lambda: datetime.now().strftime('%Y-%m-%d %H:%M:%S'))

class Setting(Base):
    __tablename__ = 'settings'
    id = Column(Integer, primary_key=True)
    key = Column(String, unique=True)
    value = Column(String)

def get_db_setting(session, key, default):
    try:
        setting = session.query(Setting).filter(Setting.key == key).first()
        return setting.value if setting else default
    except:
        return default

from sqlalchemy import event

# SQLAlchemy setup - Use absolute path for Laragon compatibility
db_path = os.getenv("EXECUTOR_DB_PATH", "../database/database.sqlite")
engine = create_engine(f"sqlite:///{db_path}", connect_args={'timeout': 60})

@event.listens_for(engine, 'connect')
def set_sqlite_pragma(dbapi_connection, connection_record):
    cursor = dbapi_connection.cursor()
    cursor.execute("PRAGMA journal_mode=WAL")
    cursor.execute("PRAGMA busy_timeout=60000")
    cursor.close()

# Self-healing migration for Phase 3, Phase 4 & Phase 5 columns
try:
    with engine.begin() as conn:
        conn.execute("ALTER TABLE trades ADD COLUMN tp1_hit INTEGER DEFAULT 0")
except Exception as e:
    pass

try:
    with engine.begin() as conn:
        conn.execute("ALTER TABLE trades ADD COLUMN mode TEXT DEFAULT 'paper'")
except Exception as e:
    pass

try:
    with engine.begin() as conn:
        conn.execute("ALTER TABLE trades ADD COLUMN peak_price FLOAT")
except Exception as e:
    pass

Session = sessionmaker(bind=engine)

def check_pending_signals():
    session = Session()
    try:
        # Query ONLY pending signals from active sources
        pending_signals = session.query(Signal).options(joinedload(Signal.source))\
            .join(Source)\
            .filter(Source.status == 'active')\
            .filter(Signal.status == 'pending').all()
        
        if pending_signals:
            print(f"Found {len(pending_signals)} new signals to process.")
        return pending_signals
    finally:
        session.close()

def calculate_atr_scaling_factor(exchange, symbol, current_price):
    try:
        ohlcv = exchange.fetch_ohlcv(symbol, timeframe='1h', limit=15)
        if len(ohlcv) < 14:
            return 1.0
        
        tr_values = []
        for i in range(1, len(ohlcv)):
            high = ohlcv[i][2]
            low = ohlcv[i][3]
            prev_close = ohlcv[i-1][4]
            tr = max(high - low, abs(high - prev_close), abs(low - prev_close))
            tr_values.append(tr)
        
        atr = sum(tr_values[-14:]) / 14.0
        atr_pct = atr / current_price
        
        # Volatility Sizing Rules (Institutional grade scaling)
        if atr_pct > 0.05:    # Extremely volatile (e.g. >5% hourly ATR) -> Reduce size by 50%
            log_to_file(f"[ATR SIZING] Volatility extremely high ({atr_pct*100:.2f}%). Scaling risk by 0.5x.")
            return 0.5
        elif atr_pct > 0.02:  # High volatility (2% to 5% hourly ATR) -> Reduce size by 25%
            log_to_file(f"[ATR SIZING] Volatility high ({atr_pct*100:.2f}%). Scaling risk by 0.75x.")
            return 0.75
        elif atr_pct < 0.005: # Extremely stagnant (e.g. <0.5% hourly ATR) -> Increase size by 25%
            log_to_file(f"[ATR SIZING] Volatility extremely low ({atr_pct*100:.2f}%). Scaling risk by 1.25x.")
            return 1.25
        
        log_to_file(f"[ATR SIZING] Volatility normal ({atr_pct*100:.2f}%). Sizing scale 1.0x.")
        return 1.0
    except Exception as e:
        log_to_file(f"Failed to calculate ATR scaling factor: {e}")
        return 1.0

def get_exchange_instance(mode, trade_type):
    """Unified factory to return the configured ccxt.binance instance."""
    config = {
        'enableRateLimit': True,
        'options': {
            'defaultType': 'future' if trade_type == 'futures' else 'margin' if trade_type == 'margin' else 'spot'
        }
    }
    
    if mode != 'paper':
        apiKey = os.getenv("BINANCE_API_KEY")
        secret = os.getenv("BINANCE_SECRET_KEY")
        
        if not apiKey or not secret or len(apiKey) < 10 or len(secret) < 10:
            return None
            
        config['apiKey'] = apiKey
        config['secret'] = secret

    exchange = ccxt.binance(config)
    # We NO LONGER use sandbox mode because Binance deprecated the Futures testnet.
    # Paper mode will use the public live API for tickers, and mock execution locally.
    return exchange

def calculate_smart_leverage(asset, win_rate, sentiment, max_allowed):
    session = Session()
    try:
        tier1_coins = get_db_setting(session, 'smart_leverage_tier1_coins', 'BTC, ETH').replace(' ', '').split(',')
        tier2_coins = get_db_setting(session, 'smart_leverage_tier2_coins', 'SOL, BNB, ADA, XRP, LINK, AVAX, DOT').replace(' ', '').split(',')
        
        tier1_base = int(get_db_setting(session, 'smart_leverage_tier1_base', '5'))
        tier2_base = int(get_db_setting(session, 'smart_leverage_tier2_base', '3'))
        tier3_base = int(get_db_setting(session, 'smart_leverage_tier3_base', '1'))
        
        wr_high = float(get_db_setting(session, 'smart_leverage_wr_high', '0.80'))
        wr_low = float(get_db_setting(session, 'smart_leverage_wr_low', '0.60'))
    finally:
        session.close()
        
    # Tier 1 (Ultra-Safe)
    if asset in tier1_coins:
        base = tier1_base
    # Tier 2 (High-Cap Bluechips)
    elif asset in tier2_coins:
        base = tier2_base
    # Tier 3 (Altcoins / Memecoins)
    else:
        base = tier3_base
        
    if win_rate >= wr_high:
        source_mult = 1.0
    elif win_rate >= wr_low:
        source_mult = 0.5
    else:
        source_mult = 0.0  # Forces 1x
        
    if sentiment >= 0.85:
        sent_mult = 1.0
    else:
        sent_mult = 0.5
        
    calc = base * source_mult * sent_mult
    final = max(1, int(round(calc)))
    final = min(final, max_allowed)
    
    reason = f"Base:{base}x, WR:{win_rate*100:.0f}%, Sent:{sentiment:.2f}"
    return final, reason

def get_asset_performance_tier(session, asset):
    """Dynamically rank an asset into Gold/Silver/Blocked tier based on historical trade performance."""
    try:
        from sqlalchemy import text
        rows = session.execute(text(
            "SELECT pnl FROM trades WHERE asset = :asset AND status = 'closed' AND pnl IS NOT NULL ORDER BY id DESC LIMIT 50"
        ), {"asset": asset}).fetchall()
        
        if len(rows) < 5:
            # Not enough data — default to Silver tier
            return 'silver', 1.0, 'New asset (< 5 trades)'
        
        pnls = [r[0] for r in rows]
        total_pnl = sum(pnls)
        wins = sum(1 for p in pnls if p > 0)
        win_rate = wins / len(pnls)
        
        if total_pnl > 0 and win_rate >= 0.55:
            return 'gold', 1.5, f'PnL=${total_pnl:.2f}, WR={win_rate*100:.0f}%'
        elif total_pnl > 0 or win_rate >= 0.50:
            return 'silver', 1.0, f'PnL=${total_pnl:.2f}, WR={win_rate*100:.0f}%'
        else:
            return 'blocked', 0.0, f'PnL=${total_pnl:.2f}, WR={win_rate*100:.0f}%'
    except Exception as e:
        log_to_file(f"[ASSET TIER] Error calculating tier for {asset}: {e}")
        return 'silver', 1.0, 'Error fallback'

def calculate_consensus_score(session, asset, direction, lookback_hours=2):
    """Check how many copy traders agree with a TA signal direction in the last N hours."""
    try:
        from sqlalchemy import text
        cutoff = (datetime.now() - timedelta(hours=lookback_hours)).strftime('%Y-%m-%d %H:%M:%S')
        
        # Find all copy trader signals for this asset in the last 2 hours
        rows = session.execute(text(
            "SELECT s.id, s.raw_text, s.source_id, src.name "
            "FROM signals s JOIN sources src ON s.source_id = src.id "
            "WHERE s.asset = :asset AND s.created_at >= :cutoff "
            "AND src.name != 'TA Engine' "
            "AND src.name LIKE 'Lead Trader:%'"
        ), {"asset": asset, "cutoff": cutoff}).fetchall()
        
        if not rows:
            return 0, [], 'No recent copy trader signals'
        
        # Count unique traders that agree with the direction
        agreeing_traders = []
        direction_keywords = ['LONG', 'BUY'] if direction in ['BUY', 'LONG'] else ['SHORT', 'SELL']
        
        seen_sources = set()
        for row in rows:
            sig_text = row[1].upper() if row[1] else ''
            source_name = row[3]
            source_id = row[2]
            
            if source_id in seen_sources:
                continue
            
            if any(kw in sig_text for kw in direction_keywords):
                agreeing_traders.append(source_name)
                seen_sources.add(source_id)
        
        count = len(agreeing_traders)
        reason = f"{count} trader(s) agree: {', '.join(agreeing_traders)}" if agreeing_traders else 'No traders agree'
        return count, agreeing_traders, reason
    except Exception as e:
        log_to_file(f"[CONSENSUS] Error calculating consensus for {asset}: {e}")
        return 0, [], 'Error'

def get_consensus_position_multiplier(consensus_count):
    """Return position size multiplier based on copy trader consensus."""
    if consensus_count >= 3:
        return 1.4, 'Very High (3+ traders agree)'  # 35% of balance
    elif consensus_count >= 1:
        return 1.0, 'High (1-2 traders agree)'       # 25% of balance
    else:
        return 0.6, 'Medium (TA only, no consensus)'  # 15% of balance

def execute_trade(asset, action, signal_id, mode, trade_details=None):
    # Clean asset name to handle symbols like AVAX/USDT or AVAXUSDT
    asset = asset.upper().strip()
    if "/" in asset:
        asset = asset.split("/")[0]
    if asset.endswith("USDT") and len(asset) > 4:
        asset = asset[:-4]
        
    log_to_file(f">>> EXECUTING {mode.upper()} TRADE: {action} {asset}")
    trade_details = trade_details or {}
    
    trade_type = trade_details.get('type', 'spot').lower()
    
    # Determine LONG vs SHORT early
    is_long = action.upper() in ["BUY", "LONG"]
    side = "buy" if is_long else "sell"
    opposite_side = "sell" if is_long else "buy"
    
    # SMART ROUTING: Force SHORT signals on Spot to Futures
    if not is_long and trade_type == 'spot':
        log_to_file("SMART ROUTING: Signal is SHORT but system is in Spot mode. Rerouting trade to FUTURES to allow short selling.")
        trade_type = 'futures'
        
    requested_leverage = int(trade_details.get('leverage', 1))
    
    exchange = get_exchange_instance(mode, trade_type)
    if not exchange:
        log_to_file(f"[WARNING] API keys are missing or invalid! Trade execution for {asset} ({mode}) aborted.")
        return False
    
    def get_usdt_balance():
        if mode == 'paper':
            return float(get_db_setting(session, 'paper_usdt_balance', 10000.0))
            
        try:
            balance = exchange.fetch_balance()
            return balance['free'].get('USDT', 0) or balance.get('USDT', {}).get('free', 0)
        except Exception as e:
            log_to_file(f"Failed to fetch balance: {e}")
            return 0

    try:
        # Prioritize USDT pair selection
        symbol = f"{asset}/USDT"
        try:
            exchange.load_markets()
            if symbol not in exchange.markets:
                # Fallback to BTC if USDT pair doesn't exist (primarily for spot)
                log_to_file(f"USDT pair not found for {asset}, checking for BTC pair...")
                symbol = f"{asset}/BTC"
        except:
            pass
        
        # MARKET REGIME FILTER (Safety Valve)
        if is_long:
            try:
                btc_ticker = exchange.fetch_ticker('BTC/USDT')
                btc_change = btc_ticker.get('percentage', 0.0)
                
                # If BTC is dumping hard (>5% down), block all new LONG trades
                if btc_change < -5.0:
                    log_to_file(f"🚨 MARKET REGIME FILTER ACTIVATED 🚨: Bitcoin is down {btc_change:.2f}% in the last 24h. Blocking all new LONG trades to protect capital.")
                    return False
            except Exception as e:
                log_to_file(f"Failed to fetch BTC regime data: {e}")
        
        session = Session()
        risk_percent = float(get_db_setting(session, 'risk_per_trade', 0.02))
        min_notional = float(get_db_setting(session, 'min_notional', 11.0))
        max_futures_leverage = int(get_db_setting(session, 'max_futures_leverage', '5'))
        
        signal_record = session.query(Signal).options(joinedload(Signal.source)).get(signal_id)
        if signal_record and signal_record.source:
            win_rate = signal_record.source.historical_win_rate or 0.5
        else:
            win_rate = 0.5
            
        sentiment = signal_record.parsed_sentiment if signal_record else 0.5
        session.close()
        
        # Configure Leverage & Isolated Margin for Futures
        leverage = 1
        if trade_type == 'futures':
            leverage, reason = calculate_smart_leverage(asset, win_rate, sentiment, max_futures_leverage)
            log_to_file(f"[SMART LEVERAGE] Calculated {leverage}x [{reason}]")
            log_to_file(f"[FUTURES CONFIG] Setting margin mode to ISOLATED and leverage to {leverage}x")
            try:
                try:
                    exchange.set_margin_mode('ISOLATED', symbol)
                except:
                    pass
                exchange.set_leverage(leverage, symbol)
            except Exception as conf_err:
                log_to_file(f"[FUTURES CONFIG WARNING] Could not set leverage/margin: {conf_err}")

        # Sizing Calculation
        usdt_balance = get_usdt_balance()
        
        # Protect Spot Funds: If futures balance is empty, skip trade instead of failing or transferring
        if trade_type == 'futures' and usdt_balance < min_notional:
            log_to_file(f"[{mode.upper()} MODE - FUTURES] Insufficient funds in Futures wallet (${usdt_balance:.2f} < min ${min_notional:.2f}). Skipping trade to protect Spot capital.")
            return False
        
        # Performance-Based Asset Allocation (Change 5)
        tier_session = Session()
        try:
            tier, tier_mult, tier_reason = get_asset_performance_tier(tier_session, asset)
        finally:
            tier_session.close()
        
        if tier == 'blocked':
            log_to_file(f"[ASSET TIER] {asset} is BLOCKED ({tier_reason}). Skipping trade entirely.")
            return False
        
        log_to_file(f"[ASSET TIER] {asset} is {tier.upper()} tier ({tier_reason}). Multiplier: {tier_mult}x")
            
        ticker = exchange.fetch_ticker(symbol)
        current_price = ticker['last']
        
        scale_factor = calculate_atr_scaling_factor(exchange, symbol, current_price)
        target_usdt = usdt_balance * risk_percent * scale_factor * tier_mult
        # ROI-TEST 2026-09-20: auditor warn-only -> -25% size instead of veto
        try:
            if isinstance(trade_details, dict) and trade_details.get("auditor_warn"):
                target_usdt = target_usdt * 0.75
                log_to_file(f"[AUDITOR WARNING] Reducing size 25% for flagged signal.")
        except Exception:
            pass
        
        if trade_type == 'futures':
            # Account for leveraged position size
            target_usdt = target_usdt * leverage
            
        target_usdt = max(min_notional, target_usdt)
        
        # Prevent API rejection by checking if we have the required margin to open this size
        margin_required = target_usdt / leverage if trade_type == 'futures' else target_usdt
        if margin_required > usdt_balance:
            log_to_file(f"[{mode.upper()} MODE - {trade_type.upper()}] Insufficient balance for trade constraints. Required margin: ${margin_required:.2f}, Available: ${usdt_balance:.2f}. Skipping trade.")
            return False
        
        # Convert target to amount
        if symbol.endswith("/BTC"):
            btc_ticker = exchange.fetch_ticker("BTC/USDT")
            amount = (target_usdt / btc_ticker['last']) / current_price
        else:
            amount = target_usdt / current_price
            
        log_to_file(f"[{mode.upper()} MODE - {trade_type.upper()}] Balance: ${usdt_balance:.2f} | Base Risk: {risk_percent*100}% | Scale: {scale_factor:.2f}x | Leverage: {leverage}x | Size: ${target_usdt:.2f}")
        log_to_file(f"Placing Market {side.upper()} order for {amount:.4f} {asset} on {symbol}")
        
        if mode == 'paper':
            import time
            order = {
                'id': f"paper_{int(time.time())}",
                'price': current_price,
                'average': current_price,
                'amount': amount,
                'status': 'closed'
            }
            log_to_file(f"Paper Order Mocked Successfully! ID: {order['id']}")
        else:
            order = exchange.create_market_order(symbol, side, amount)
            log_to_file(f"Order Successful! ID: {order['id']}")
        
        entry_price = order.get('price') or order.get('average') or current_price
        sl = trade_details.get('stop_loss')
        targets = trade_details.get('targets', [])
        tp = targets[0] if targets else None
        
        # Place Native Exchange-Side TP/SL conditional triggers for Futures (100% Offline Safety)
        tp_order_id = None
        sl_order_id = None
        if trade_type == 'futures' and (sl or tp) and mode != 'paper':
            order_amount = order.get('amount') or amount
            log_to_file(f"[FUTURES SAFETY] Attaching native exchange TP/SL orders with reduceOnly=True...")
            
            # Place native Stop Loss Stop Market Order
            if sl:
                try:
                    sl_params = {'stopPrice': sl, 'reduceOnly': True}
                    sl_order = exchange.create_order(symbol, 'stop_market', opposite_side, order_amount, params=sl_params)
                    sl_order_id = sl_order['id']
                    log_to_file(f"[FUTURES SAFETY] Native Stop Loss placed at {sl}. Order ID: {sl_order_id}")
                except Exception as sl_err:
                    log_to_file(f"[FUTURES SAFETY WARNING] Failed to place Native Stop Loss: {sl_err}")
            
            # Place native Take Profit Take Profit Market Order
            if tp:
                try:
                    tp_params = {'stopPrice': tp, 'reduceOnly': True}
                    tp_order = exchange.create_order(symbol, 'take_profit_market', opposite_side, order_amount, params=tp_params)
                    tp_order_id = tp_order['id']
                    log_to_file(f"[FUTURES SAFETY] Native Take Profit placed at {tp}. Order ID: {tp_order_id}")
                except Exception as tp_err:
                    log_to_file(f"[FUTURES SAFETY WARNING] Failed to place Native Take Profit: {tp_err}")

        # Record the trade in the DB
        session = Session()
        new_trade = Trade(
            signal_id=signal_id,
            asset=asset,
            symbol=symbol,
            amount=order.get('amount') or amount,
            trade_type=trade_type,
            leverage=leverage,
            entry_price=entry_price,
            target_prices=str(targets),
            stop_loss=sl,
            status='open',
            created_at=time.strftime('%Y-%m-%d %H:%M:%S'),
            tp1_hit=0,
            mode=mode,
            side="LONG" if is_long else "SHORT",
            outcome=f"TP Order: {tp_order_id} | SL Order: {sl_order_id}" if (tp_order_id or sl_order_id) else None
        )
        
        if trade_details.get('is_sar'):
            new_trade.outcome = f"[SAR] {new_trade.outcome}" if new_trade.outcome else "[SAR] Executed"
            
        session.add(new_trade)
        session.commit()
        session.close()
        return True
    except Exception as e:
        log_to_file(f"[{mode.upper()} MODE - {trade_type.upper()}] Trade Execution Failed: {e}")
        return False

def get_market_context():
    session = Session()
    try:
        recent_news = session.query(NewsItem).order_by(NewsItem.id.desc()).limit(10).all()
        context = "\n".join([f"- {n.raw_text[:200]}" for n in recent_news])
        return context
    finally:
        session.close()


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


def sweep_futures_profit(exchange, trade_type, pnl_amount, mode='live'):
    if mode == 'paper':
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
        log_to_file(f"[PROFIT SWEEP ERROR] Failed to transfer profit: {e}")

def monitor_open_trades():
    session = Session()
    provider = LLMProvider()
    try:
        open_trades = session.query(Trade).filter(Trade.status == 'open').all()
        if not open_trades:
            return

        max_holding_hours = 0
        try:
            max_holding_hours = int(get_db_setting(session, 'max_holding_hours', '24'))
        except Exception as e:
            log_to_file(f"Error parsing max_holding_hours setting: {e}")

        # Cache dynamic exchange clients as needed to prevent recreate overhead
        cached_exchanges = {}
        def get_cached_exchange(mode, trade_type):
            key = f"{mode}_{trade_type}"
            if key not in cached_exchanges:
                cached_exchanges[key] = get_exchange_instance(mode, trade_type)
            return cached_exchanges[key]

        for trade in open_trades:
            try:
                trade_mode = getattr(trade, 'mode', 'paper') or 'paper'
                trade_type = getattr(trade, 'trade_type', 'spot') or 'spot'
                
                exchange = get_cached_exchange(trade_mode, trade_type)
                if exchange is None:
                    log_to_file(f"[WARNING] Exchange client for {trade_mode} {trade_type} not initialized. Skipping trade #{trade.id}.")
                    continue

                symbol = trade.symbol if trade.symbol else f"{trade.asset}/USDT"
                ticker = exchange.fetch_ticker(symbol)
                current_price = ticker['last']
                
                # Parse targets
                try:
                    import ast
                    targets = ast.literal_eval(trade.target_prices) if trade.target_prices else []
                except:
                    targets = []
                
                stop_loss = trade.stop_loss
                
                # Fetch explicit trade direction from database instead of guessing mathematically
                is_long = getattr(trade, 'side', 'LONG') == 'LONG'

                # Peak Price Tracking for Trailing Stop Loss
                peak = trade.highest_price_seen
                if not peak:
                    trade.highest_price_seen = current_price
                else:
                    if is_long and current_price > peak:
                        trade.highest_price_seen = current_price
                    elif not is_long and current_price < peak:
                        trade.highest_price_seen = current_price
                session.commit()
                peak = trade.highest_price_seen

                log_to_file(f"Monitoring [{trade_mode.upper()} - {trade_type.upper()} {'LONG' if is_long else 'SHORT'}] {symbol}: Current {current_price} | Entry {trade.entry_price} | Peak {peak} | TP1 {targets[0] if targets else 'N/A'} | Orig SL {stop_loss}")

                # Check if Futures position has already been filled/closed by exchange-side native TP/SL
                if trade_type == 'futures' and trade_mode != 'paper':
                    try:
                        positions = exchange.fetch_positions([symbol])
                        position_size = 0.0
                        for p in positions:
                            if p['symbol'] == symbol:
                                position_size = abs(float(p.get('contracts', p.get('size', 0.0))))
                                break
                        
                        if position_size == 0.0:
                            # Position is closed natively on the exchange!
                            exit_price = current_price
                            try:
                                my_trades = exchange.fetch_my_trades(symbol, limit=2)
                                if my_trades:
                                    exit_price = my_trades[-1]['price']
                            except:
                                pass
                            
                            pnl_sign = 1 if is_long else -1
                            pnl_amount = (exit_price - trade.entry_price) * trade.amount * pnl_sign
                            
                            trade.status = 'closed'
                            trade.exit_price = exit_price
                            trade.pnl = pnl_amount
                            trade.outcome = f"Filled via Native TP/SL (${pnl_amount:.2f})"
                            trade.closed_at = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                            
                            sweep_futures_profit(exchange, trade_type, pnl_amount, trade_mode)
                            check_and_apply_blocklist(session, trade, pnl_amount)
                            
                            log_to_file(f"[{trade_mode.upper()} - FUTURES] Position closed natively on exchange. Syncing DB state. PnL: ${pnl_amount:.2f}")
                            session.add(trade)
                            session.commit()
                            continue
                    except Exception as pos_err:
                        log_to_file(f"Error checking futures position size: {pos_err}")

                # Strategy 1: Time-Based Exit Check
                if max_holding_hours > 0:
                    try:
                        trade_created = datetime.strptime(trade.created_at, '%Y-%m-%d %H:%M:%S')
                        age_hours = (datetime.now() - trade_created).total_seconds() / 3600.0
                        
                        # Dynamic holding time logic based on global sentiment
                        dynamic_max_hours = max_holding_hours
                        global_sentiment = get_db_setting(session, 'global_market_sentiment', 'Neutral')
                        
                        if is_long:
                            if 'Bearish' in global_sentiment:
                                dynamic_max_hours = min(6, max_holding_hours)
                            elif 'Strongly Bullish' in global_sentiment:
                                dynamic_max_hours = max(24, max_holding_hours)
                        else: # SHORT
                            if 'Bullish' in global_sentiment:
                                dynamic_max_hours = min(6, max_holding_hours)
                            elif 'Strongly Bearish' in global_sentiment:
                                dynamic_max_hours = max(24, max_holding_hours)
                                
                        if age_hours >= dynamic_max_hours:
                            # Smart Conditional Check:
                            pos_val = current_price * trade.amount
                            leverage = getattr(trade, 'leverage', 1) or 1
                            
                            if trade_type == 'futures':
                                fee_rate = 0.0010       # 0.10% total (entry + exit)
                                hourly_rate = 0.00005 * leverage  # 0.005% * leverage per hour
                            elif trade_type == 'margin':
                                fee_rate = 0.0020       # 0.20% total (entry + exit)
                                hourly_rate = 0.00002 * leverage  # 0.002% * leverage per hour
                            else: # spot
                                fee_rate = 0.0020       # 0.20% total (entry + exit)
                                hourly_rate = 0.0       # No carrying cost
                            
                            est_costs = (pos_val * fee_rate) + (pos_val * hourly_rate * age_hours)
                            
                            # Gross PnL Calculation
                            pnl_sign = 1 if is_long else -1
                            gross_pnl = (current_price - trade.entry_price) * trade.amount * pnl_sign
                            net_pnl = gross_pnl - est_costs
                            
                            log_to_file(f"Trade #{trade.id} ({trade.asset}) reached dynamic time limit ({age_hours:.1f}h/{dynamic_max_hours}h) - Gross PnL: ${gross_pnl:.4f} | Est Costs: ${est_costs:.4f} | Net PnL: ${net_pnl:.4f}")
                            
                            if net_pnl <= 0:
                                # FIX 2026-09-19: smart-conditional time exit.
                                # Never auto-exit at a net loss (must cover fees/funding).
                                # Hold for recovery and let SL/TSL/strategic engine decide.
                                log_to_file(f">>> [TIME LIMIT IGNORED] Trade #{trade.id} ({trade.asset}) net PnL ${net_pnl:.2f} <= 0 after costs ${est_costs:.2f}. Holding for recovery instead of locking in loss.")
                                ai_response = {"decision": "HOLD", "reasoning": "Net PnL does not cover fees. Holding for recovery."}
                                continue
                            else:
                                # If net_pnl > 0, query the local LLM model to decide
                                recent_news = session.query(NewsItem).order_by(NewsItem.id.desc()).limit(3).all()
                                news_context = "\n".join([f"- {n.raw_text[:200]}" for n in recent_news]) if recent_news else "No recent news context."
                                
                                ollama_prompt = f"""
                            You are an expert AI risk manager and trade auditor.
                            Analyze this open trade which has exceeded its maximum holding time of {max_holding_hours} hours ({age_hours:.1f} hours active) and is currently in profit.
                            
                            TRADE DETAILS:
                            - Asset: {trade.asset}
                            - Mode: {trade_mode}
                            - Trade Type: {trade_type}
                            - Leverage: {leverage}x
                            - Position: {"LONG" if is_long else "SHORT"}
                            - Entry Price: {trade.entry_price}
                            - Current Price: {current_price}
                            - Gross Profit: ${gross_pnl:.4f} USDT
                            - Estimated Carrying/Trading Costs: ${est_costs:.4f} USDT
                            - Net Profit: ${net_pnl:.4f} USDT
                            - Target Take Profit: {targets[0] if targets else 'N/A'}
                            - Stop Loss: {stop_loss}
                            
                            RECENT NEWS / CONTEXT:
                            {news_context}
                            
                            The trade has exceeded its maximum allowed holding duration. Since it is currently profitable, decide if we should EXIT now to lock in the net profit, or HOLD to wait for a better exit point if market conditions are highly favorable.
                            
                            Return ONLY a JSON response:
                            {{
                                "decision": "EXIT",
                                "reasoning": "Concise explanation why we should exit now to secure profit."
                            }}
                            OR
                            {{
                                "decision": "HOLD",
                                "reasoning": "Concise explanation why we should hold despite exceeding the time limit."
                            }}
                            """
                                log_to_file(f"[AI TIME-BASED DECISION] Querying Ollama on {provider.ollama_host} to evaluate time-based exit for Trade #{trade.id} ({trade.asset})...")
                                ai_response = provider.query_local_decision(ollama_prompt)
                            
                            if ai_response and ai_response.get("decision") == "EXIT":
                                decision_reason = f"AI Decided Time-Based Exit: {ai_response.get('reasoning', 'No reason provided')}"
                                log_to_file(f">>> [TIME-BASED EXIT APPROVED] {decision_reason} Auto-closing trade #{trade.id} ({trade.asset})...")
                            else:
                                reason_hold = ai_response.get('reasoning', 'AI decided to hold.') if ai_response else "Ollama query failed (default to hold)"
                                log_to_file(f"[TIME-BASED EXIT DELAYED] Keep position open despite time limit. Reasoning: {reason_hold}")
                                continue
                            
                            close_side = 'sell' if is_long else 'buy'
                            if trade_mode == 'paper':
                                order = {'price': current_price, 'average': current_price}
                            else:
                                order = exchange.create_market_order(symbol, close_side, trade.amount)
                            
                            # Futures cleanup: Cancel outstanding native TP/SL orders
                            if trade_type == 'futures':
                                try:
                                    exchange.cancel_all_orders(symbol)
                                except Exception as canc_err:
                                    log_to_file(f"Could not cancel remaining trigger orders: {canc_err}")

                            exit_price = order.get('price') or order.get('average') or current_price
                            pnl_sign = 1 if is_long else -1
                            pnl_amount = (exit_price - trade.entry_price) * trade.amount * pnl_sign
                            # FIX 2026-09-19: store NET pnl (gross minus actual est costs at exit)
                            _pos_val_exit = (exit_price or current_price) * trade.amount
                            if trade_type == 'futures':
                                _fee_r = 0.0010; _hr_r = 0.00005 * leverage
                            elif trade_type == 'margin':
                                _fee_r = 0.0020; _hr_r = 0.00002 * leverage
                            else:
                                _fee_r = 0.0020; _hr_r = 0.0
                            _exit_costs = (_pos_val_exit * _fee_r) + (_pos_val_exit * _hr_r * age_hours)
                            pnl_amount = pnl_amount - _exit_costs
                            
                            trade.status = 'closed'
                            trade.exit_price = exit_price
                            trade.pnl = pnl_amount
                            trade.outcome = f"Time-Based Exit ({max_holding_hours}h) (${pnl_amount:.2f} net)"
                            trade.closed_at = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                            
                            sweep_futures_profit(exchange, trade_type, pnl_amount, trade_mode)
                            check_and_apply_blocklist(session, trade, pnl_amount)
                            
                            log_to_file(f"[{trade_mode.upper()}] Trade Closed via Time-Based Exit! PnL: ${pnl_amount:.2f}")
                            session.add(trade)
                            session.commit()
                            continue
                    except Exception as te_err:
                        log_to_file(f"Error processing time-based exit for trade #{trade.id}: {te_err}")

                 # Strategy 3: Early Profit Exit Check (AI-Decided or Auto-Exit)
                early_exit_status = get_db_setting(session, 'early_profit_exit_status', 'inactive')
                early_exit_hours_str = get_db_setting(session, 'early_profit_exit_hours', '1')
                try:
                    early_exit_hours = float(early_exit_hours_str)
                except Exception as ex_h_err:
                    early_exit_hours = 1.0

                if early_exit_status in ['active', 'ai_decide']:
                    try:
                        trade_created = datetime.strptime(trade.created_at, '%Y-%m-%d %H:%M:%S')
                        age_hours = (datetime.now() - trade_created).total_seconds() / 3600.0
                        
                        if age_hours >= early_exit_hours:
                            pos_val = current_price * trade.amount
                            leverage = getattr(trade, 'leverage', 1) or 1
                            
                            if trade_type == 'futures':
                                fee_rate = 0.0010       # 0.10% total (entry + exit)
                                hourly_rate = 0.00005 * leverage  # 0.005% * leverage per hour
                            elif trade_type == 'margin':
                                fee_rate = 0.0020       # 0.20% total (entry + exit)
                                hourly_rate = 0.00002 * leverage  # 0.002% * leverage per hour
                            else: # spot
                                fee_rate = 0.0020       # 0.20% total (entry + exit)
                                hourly_rate = 0.0       # No carrying cost
                            
                            est_costs = (pos_val * fee_rate) + (pos_val * hourly_rate * age_hours)
                            
                            # Gross PnL Calculation
                            pnl_sign = 1 if is_long else -1
                            gross_pnl = (current_price - trade.entry_price) * trade.amount * pnl_sign
                            net_pnl = gross_pnl - est_costs
                            
                            log_to_file(f"Trade #{trade.id} ({trade.asset}) - Age: {age_hours:.1f}h | Gross PnL: ${gross_pnl:.4f} | Est Costs: ${est_costs:.4f} | Net PnL: ${net_pnl:.4f} | Strategy: {early_exit_status}")
                            
                            if net_pnl > 0:
                                trigger_early_exit = False
                                decision_reason = ""
                                
                                if early_exit_status == 'active':
                                    trigger_early_exit = True
                                    decision_reason = f"Auto-exit triggered: Net Profit of ${net_pnl:.4f} USDT exceeds fees & carrying costs of ${est_costs:.4f} USDT."
                                elif early_exit_status == 'ai_decide':
                                    # Fetch recent news context
                                    recent_news = session.query(NewsItem).order_by(NewsItem.id.desc()).limit(3).all()
                                    news_context = "\n".join([f"- {n.raw_text[:200]}" for n in recent_news]) if recent_news else "No recent news context."
                                    
                                    # Prepare prompt for Ollama
                                    ollama_prompt = f"""
                                    You are an expert AI risk manager and trade auditor.
                                    Analyze this open trade which has been active for {age_hours:.1f} hours and is currently in profit.
                                    
                                    TRADE DETAILS:
                                    - Asset: {trade.asset}
                                    - Mode: {trade_mode}
                                    - Trade Type: {trade_type}
                                    - Leverage: {leverage}x
                                    - Position: {"LONG" if is_long else "SHORT"}
                                    - Entry Price: {trade.entry_price}
                                    - Current Price: {current_price}
                                    - Gross Profit: ${gross_pnl:.4f} USDT
                                    - Estimated Carrying/Trading Costs: ${est_costs:.4f} USDT
                                    - Net Profit: ${net_pnl:.4f} USDT
                                    - Target Take Profit: {targets[0] if targets else 'N/A'}
                                    - Stop Loss: {stop_loss}
                                    
                                    RECENT NEWS / CONTEXT:
                                    {news_context}
                                    
                                    Based on the current profit and the news context, decide if we should EXIT the trade early to secure profits (e.g., if the pump has cooled down, sentiment is reversing, or high leverage carrying costs make waiting risky) or HOLD to wait for the assigned take profit target (TP).
                                    
                                    Return ONLY a JSON response:
                                    {{
                                        "decision": "EXIT",
                                        "reasoning": "Concise explanation why we should exit now."
                                    }}
                                    OR
                                    {{
                                        "decision": "HOLD",
                                        "reasoning": "Concise explanation why we should hold."
                                    }}
                                    """
                                    log_to_file(f"[AI DECISION] Querying Ollama on {provider.ollama_host} to evaluate early exit for Trade #{trade.id} ({trade.asset})...")
                                    ai_response = provider.query_local_decision(ollama_prompt)
                                    
                                    if ai_response and ai_response.get("decision") == "EXIT":
                                        trigger_early_exit = True
                                        decision_reason = f"AI Decided Exit: {ai_response.get('reasoning', 'No reason provided')}"
                                    else:
                                        reason_hold = ai_response.get('reasoning', 'AI decided to hold.') if ai_response else "Ollama query failed (default to hold)"
                                        log_to_file(f"[AI DECISION] Keep position open. Reasoning: {reason_hold}")
                                
                                if trigger_early_exit:
                                    log_to_file(f">>> [EARLY PROFIT EXIT] {decision_reason} Auto-closing trade #{trade.id} ({trade.asset})...")
                                    close_side = 'sell' if is_long else 'buy'
                                    if trade_mode == 'paper':
                                        order = {'price': current_price, 'average': current_price}
                                    else:
                                        order = exchange.create_market_order(symbol, close_side, trade.amount)
                                    
                                    if trade_type == 'futures':
                                        try:
                                            exchange.cancel_all_orders(symbol)
                                        except Exception as canc_err:
                                            log_to_file(f"Could not cancel remaining trigger orders: {canc_err}")
                                            
                                    exit_price = order.get('price') or order.get('average') or current_price
                                    final_pnl = (exit_price - trade.entry_price) * trade.amount * pnl_sign
                                    # FIX 2026-09-19: early-exit already gates on net>0, store net
                                    final_pnl = final_pnl - est_costs
                                    
                                    trade.status = 'closed'
                                    trade.exit_price = exit_price
                                    trade.pnl = final_pnl
                                    trade.outcome = f"Early Exit: {decision_reason[:50]} (${final_pnl:.2f} net)"
                                    trade.closed_at = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                                    
                                    sweep_futures_profit(exchange, trade_type, final_pnl, trade_mode)
                                    check_and_apply_blocklist(session, trade, final_pnl)
                                    
                                    log_to_file(f"[{trade_mode.upper()}] Trade Closed Early! Final PnL: ${final_pnl:.2f}")
                                    session.add(trade)
                                    session.commit()
                                    continue
                    except Exception as early_err:
                        log_to_file(f"Error checking early profit exit for trade #{trade.id}: {early_err}")

                # Check Software-Side Exits (Spot / Margin / Futures backup)
                should_close = False
                reason = ""
                
                # Trailing Stop Loss Logic calculation
                peak = trade.highest_price_seen or trade.entry_price
                peak_profit_pct = (peak - trade.entry_price) / trade.entry_price if is_long else (trade.entry_price - peak) / trade.entry_price
                
                dynamic_sl = stop_loss
                # FIX 2026-09-19: was 1.5% / 0.8% -> capped winners at ~0.7% (~$0.17 on $25,
                # fees $0.06 = 35% eaten + chop-outs). Widen to let winners cover costs.
                if peak_profit_pct >= 0.025:
                    # TSL Active: Trail by 1.2% from the peak
                    dynamic_sl = peak * (1 - 0.012) if is_long else peak * (1 + 0.012)

                if is_long:
                    if targets and current_price >= targets[0]:
                        should_close = True
                        reason = f"Target Hit: {targets[0]}"
                    elif dynamic_sl and current_price <= dynamic_sl:
                        should_close = True
                        if dynamic_sl == trade.entry_price:
                            reason = f"Trailing Stop (Break-even) Hit: {dynamic_sl}"
                        elif dynamic_sl > trade.entry_price:
                            reason = f"Trailing Stop (In-Profit) Hit: {dynamic_sl}"
                        else:
                            reason = f"Hard Stop Loss Hit: {dynamic_sl}"
                else: # SHORT Position
                    if targets and current_price <= targets[0]:
                        should_close = True
                        reason = f"Target Hit: {targets[0]}"
                    elif dynamic_sl and current_price >= dynamic_sl:
                        should_close = True
                        if dynamic_sl == trade.entry_price:
                            reason = f"Trailing Stop (Break-even) Hit: {dynamic_sl}"
                        elif dynamic_sl < trade.entry_price:
                            reason = f"Trailing Stop (In-Profit) Hit: {dynamic_sl}"
                        else:
                            reason = f"Hard Stop Loss Hit: {dynamic_sl}"

                if should_close:
                    log_to_file(f">>> CLOSING [{trade_mode.upper()}] TRADE ({reason}): {'SELL' if is_long else 'BUY'} {trade.asset}")
                    
                    close_side = 'sell' if is_long else 'buy'
                    if trade_mode == 'paper':
                        order = {'price': current_price, 'average': current_price}
                    else:
                        order = exchange.create_market_order(symbol, close_side, trade.amount)
                    
                    # Futures cleanup: Cancel outstanding native TP/SL orders
                    if trade_type == 'futures':
                        try:
                            exchange.cancel_all_orders(symbol)
                        except Exception as canc_err:
                            log_to_file(f"Could not cancel remaining trigger orders: {canc_err}")

                    exit_price = order.get('price') or order.get('average') or current_price
                    pnl_sign = 1 if is_long else -1
                    pnl_amount = (exit_price - trade.entry_price) * trade.amount * pnl_sign
                    # FIX 2026-09-19: store NET pnl for TP/SL/TSL closes too
                    try:
                        _tc = datetime.strptime(trade.created_at, '%Y-%m-%d %H:%M:%S')
                        _age_h = max((datetime.now() - _tc).total_seconds() / 3600.0, 0)
                    except Exception:
                        _age_h = 0
                    try:
                        _pv = (exit_price or current_price) * trade.amount
                        _lv = getattr(trade, 'leverage', 1) or 1
                        if trade_type == 'futures':
                            _fr, _hr = 0.0010, 0.00005 * _lv
                        elif trade_type == 'margin':
                            _fr, _hr = 0.0020, 0.00002 * _lv
                        else:
                            _fr, _hr = 0.0020, 0.0
                        pnl_amount = pnl_amount - ((_pv * _fr) + (_pv * _hr * _age_h))
                    except Exception:
                        pass
                    
                    trade.status = 'closed'
                    trade.exit_price = exit_price
                    trade.pnl = pnl_amount
                    trade.outcome = reason + f" (${pnl_amount:.2f} net)"
                    trade.closed_at = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                    
                    sweep_futures_profit(exchange, trade_type, pnl_amount, trade_mode)
                    check_and_apply_blocklist(session, trade, pnl_amount)
                    
                    log_to_file(f"[{trade_mode.upper()}] Trade Closed Successfully! PnL: ${pnl_amount:.2f}")
                    session.add(trade)
                    session.commit()
                    
                    # Stop-and-Reverse (SAR) Logic
                    # FIX 2026-09-19: disabled by default (was '1'). SAR chained
                    # ATOM LONG->SHORT->LONG for -$0.93 in 11h. Enable explicitly only.
                    if pnl_amount < 0 and "Hard Stop Loss Hit" in reason:
                        sar_enabled = get_db_setting(session, 'enable_sar_strategy', '0')
                        
                        global_sentiment = get_db_setting(session, 'global_market_sentiment', '')
                        volatility_passed = False
                        if "24h" in global_sentiment:
                            import re
                            match = re.search(r'24h\s*([+-]?\d+\.?\d*)%', global_sentiment)
                            if match:
                                change_24h = float(match.group(1))
                                if abs(change_24h) >= 5.0:
                                    volatility_passed = True
                                else:
                                    log_to_file(f"[SAR CANCELLED] Trade #{trade.id} hit Stop Loss, but market is flat (24h {change_24h}%). Volatility threshold (5%) not met.")
                            else:
                                volatility_passed = True
                        else:
                            volatility_passed = True
                            
                        if sar_enabled == '1' and volatility_passed:
                            log_to_file(f">>> [SAR TRIGGERED] Trade #{trade.id} ({trade.asset}) hit Stop Loss. Executing Stop-and-Reverse (SAR) strategy!")
                            try:
                                # Reverse the direction
                                new_action = "SELL" if is_long else "BUY"
                                
                                # Set strict risk parameters (2% SL, 6% TP)
                                sar_entry = current_price
                                if new_action == "BUY": # New LONG
                                    sar_sl = round(sar_entry * 0.98, 4)
                                    sar_tp = round(sar_entry * 1.06, 4)
                                else: # New SHORT
                                    sar_sl = round(sar_entry * 1.02, 4)
                                    sar_tp = round(sar_entry * 0.94, 4)
                                    
                                trade_details = {
                                    "action": new_action,
                                    "type": trade_type,
                                    "leverage": getattr(trade, 'leverage', 1),
                                    "stop_loss": sar_sl,
                                    "targets": [sar_tp],
                                    "amount": trade.amount, # Keep same size to prevent Martingale double-loss
                                    "is_sar": True
                                }
                                
                                log_to_file(f"[{trade_mode.upper()}] Executing SAR: {new_action} {trade.asset} | Entry: ~{sar_entry} | SL: {sar_sl} | TP: {sar_tp}")
                                execute_trade(trade.asset, new_action, trade.signal_id, mode=trade_mode, trade_details=trade_details)
                            except Exception as sar_err:
                                log_to_file(f"Failed to execute SAR for {trade.asset}: {sar_err}")
            except Exception as e:
                log_to_file(f"Error monitoring trade {trade.id}: {e}")
    finally:
        session.close()

def run_signals_loop():
    log_to_file("Trade Executor (Signals Engine) Started. Monitoring pending signals...")
    provider = LLMProvider()
    
    while True:
        session = Session()
        try:
            # Update Heartbeat
            heartbeat_setting = session.query(Setting).filter(Setting.key == 'last_heartbeat_executor').first()
            if heartbeat_setting:
                heartbeat_setting.value = datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S')
                session.commit()
            
            # Check System Status
            sys_status = get_db_setting(session, 'system_status', 'running')
            emerg_stop = get_db_setting(session, 'emergency_stop', '0')
            
            if sys_status == 'stopped' or emerg_stop == '1':
                log_to_file("System is STOPPED via Dashboard (Signals Engine). Waiting...")
                time.sleep(15)
                continue

            # Process Pending Signals
            signals = check_pending_signals()
            
            if signals:
                news = session.query(NewsItem).order_by(NewsItem.id.desc()).limit(3).all()
                recent_news = "\n".join([f"- {n.raw_text[:300]}..." for n in news]) if news else "No recent news."
                
                global_sentiment = get_db_setting(session, 'global_market_sentiment', 'Neutral (No data yet)')
                market_context = f"GLOBAL MARKET SENTIMENT: {global_sentiment}\nRECENT NEWS:\n{recent_news}"
                
                for signal in signals:
                    try:
                        if signal.source and signal.source.status != 'active':
                            log_to_file(f"Signal ID {signal.id} skipped: Source '{signal.source.name}' status is '{signal.source.status}'.")
                            signal.status = 'processed'
                            signal.result = f"Skipped (Source {signal.source.status})"
                            session.add(session.merge(signal))
                            session.commit()
                            continue
                            
                        log_to_file(f"Processing Signal ID {signal.id}: {signal.raw_text[:50]}...")
                        
                        source_type = signal.source.type if signal.source else 'unknown'
                        source_name = signal.source.name if signal.source else 'Unknown'
                        
                        # ============================================
                        # TA-FIRST ROUTING: Handle different source types
                        # ============================================
                        
                        # ROUTE A: Copy Trader Signals → Advisory Only (logged, not traded)
                        if source_type != 'ta_engine' and 'Lead Trader' in source_name:
                            log_to_file(f"[ADVISORY] Copy Trader signal from {source_name} logged as advisory data (not traded directly).")
                            signal.status = 'processed'
                            signal.result = f'Advisory: {source_name} signal logged for consensus tracking'
                            session.add(session.merge(signal))
                            session.commit()
                            continue
                        
                        # ROUTE B: TA Engine Signals → Parse directly (NO LLM call needed!)
                        if source_name == 'TA Engine':
                            log_to_file(f"[TA SIGNAL] Processing TA Engine signal directly (no LLM needed)")
                            
                            # Parse the TA signal text to extract trade parameters
                            import re
                            raw = signal.raw_text or ''
                            
                            # Extract direction
                            ta_direction = None
                            if 'LONG' in raw:
                                ta_direction = 'BUY'
                            elif 'SHORT' in raw:
                                ta_direction = 'SELL'
                            
                            # Extract asset
                            ta_asset = signal.asset or 'UNKNOWN'
                            
                            # Extract entry, SL, TP from the formatted TA signal text
                            entry_match = re.search(r'Entry:\s*([\d.]+)', raw)
                            sl_match = re.search(r'SL:\s*([\d.]+)', raw)
                            tp_match = re.search(r'TP:\s*([\d.]+)', raw)
                            
                            ta_entry = float(entry_match.group(1).rstrip('.')) if entry_match else 0
                            ta_sl = float(sl_match.group(1).rstrip('.')) if sl_match else 0
                            ta_tp = float(tp_match.group(1).rstrip('.')) if tp_match else 0
                            
                            if not ta_direction or not ta_entry or not ta_sl or not ta_tp:
                                log_to_file(f"[TA SIGNAL] Could not parse TA signal fields. Skipping.")
                                signal.status = 'processed'
                                signal.result = 'Parse Error'
                                session.add(session.merge(signal))
                                session.commit()
                                continue
                            
                            # Calculate consensus score (how many copy traders agree)
                            consensus_count, agreeing_traders, consensus_reason = calculate_consensus_score(session, ta_asset, ta_direction)
                            consensus_mult, consensus_label = get_consensus_position_multiplier(consensus_count)
                            
                            # Boost TA Engine natively to High Confidence for larger allocation
                            if consensus_mult < 1.0:
                                consensus_mult = 1.0
                                consensus_label = 'High (TA Engine Native Confidence)'
                                
                            log_to_file(f"[CONSENSUS] {ta_asset} {ta_direction}: {consensus_reason} → Confidence: {consensus_label} (mult={consensus_mult}x)")
                            
                            # Build the result dict (same format as LLM output)
                            result = {
                                "asset": ta_asset,
                                "sentiment": 0.85 if ta_direction == 'BUY' else 0.15,
                                "action": ta_direction,
                                "type": "futures",
                                "leverage": 3,
                                "targets": [ta_tp],
                                "stop_loss": ta_sl,
                                "reasoning": f"TA Engine signal. Consensus: {consensus_label}",
                                "consensus_multiplier": consensus_mult
                            }
                            
                            asset_name = ta_asset
                            signal.asset = asset_name
                            signal.parsed_sentiment = result.get("sentiment", 0.0)
                        
                        # ROUTE C: Other sources (news, etc.) → Use LLM as before
                        else:
                            source_performance = f"Win Rate: {signal.source.historical_win_rate * 100:.1f}%" if signal.source.historical_win_rate else "Win Rate: Unknown"
                            
                            # Fetch price to help AI set realistic SL/TP
                            current_price = 0.0
                            try:
                                check_ex = ccxt.binance({'enableRateLimit': True})
                                ticker = check_ex.fetch_ticker(f"{signal.raw_text.split()[0]}/USDT")
                                current_price = ticker['last']
                            except:
                                pass

                            # AI Analysis Prompt
                            agent_prompt = f"""
                            CRITICAL: You are an expert Portfolio Manager. 
                            TRADING SOURCE: {signal.source.name} ({source_performance})
                            MARKET CONTEXT: {market_context}
                            CURRENT PRICE (Approx): {current_price if current_price > 0 else 'Unknown'}
                            
                            Analyze this signal. Suggest BUY (for LONG/BUY trades) or SELL (for SHORT/SELL trades) only if:
                            1. The source is reliable OR the signal is high conviction.
                            2. The market context supports the move.
                            
                            SIGNAL: {signal.raw_text}
                            
                            IMPORTANT: 
                            - For BUY (Long) actions: stop_loss MUST be LOWER than current price, targets HIGHER.
                            - For SELL (Short) actions: stop_loss MUST be HIGHER than current price, targets LOWER.
                            - CRITICAL RULE: If the raw text DOES NOT contain an explicit Stop Loss, you MUST calculate one yourself! Default to exactly 3% away from the entry price (i.e. -3% for Longs, +3% for Shorts). Do not leave it blank.
                            - IMPORTANT: The 'action' key must ONLY be 'BUY' or 'SELL'.
                            - CRITICAL JSON RULE: The "targets" array and "stop_loss" MUST contain ONLY absolute, final floating-point numbers. Do NOT include mathematical expressions (like "0.16 - 0.03") inside the JSON arrays or values. You must compute the final number yourself.
                            
                            Return ONLY JSON:
                            {{
                                "asset": "TICKER",
                                "sentiment": 1.0, 
                                "action": "BUY/SELL",
                                "type": "spot/futures",
                                "leverage": 1,
                                "targets": [1.1, 1.2],
                                "stop_loss": 0.9,
                                "reasoning": "Explain decision."
                            }}
                            """
                            
                            # Small sleep to avoid AI rate limits when processing backlogs
                            time.sleep(3)
                            
                            result = provider._query_gemini(agent_prompt)
                            
                            if not result:
                                continue
                            
                            asset_name = result.get("asset", "N/A").upper().strip()
                            if "/" in asset_name:
                                asset_name = asset_name.split("/")[0]
                            if asset_name.endswith("USDT") and len(asset_name) > 4:
                                asset_name = asset_name[:-4]
                            
                            signal.asset = asset_name
                            signal.parsed_sentiment = result.get("sentiment", 0.0)
                            
                        if asset_name in ["USDT", "USD", "EUR"]:
                            log_to_file(f"Signal processing skipped: Invalid target asset {asset_name}.")
                            signal.status = 'processed'
                            signal.result = 'Skipped (Invalid Asset)'
                            session.add(session.merge(signal))
                            session.commit()
                            continue
                            
                        # Check Blocklist
                        blocked_record = session.query(Blocklist).filter(Blocklist.asset == asset_name).first()
                        if blocked_record:
                            is_blocked = False
                            if not blocked_record.blocked_until:
                                is_blocked = True
                            else:
                                try:
                                    blocked_until_dt = datetime.strptime(blocked_record.blocked_until, '%Y-%m-%d %H:%M:%S')
                                    if datetime.now() < blocked_until_dt:
                                        is_blocked = True
                                    else:
                                        # Block expired, remove it
                                        session.delete(blocked_record)
                                        session.commit()
                                except:
                                    is_blocked = True
                            
                            if is_blocked:
                                log_to_file(f"Signal processing skipped: Asset {asset_name} is currently BLOCKLISTED.")
                                signal.status = 'processed'
                                signal.result = f'Skipped (Asset Blocklisted)'
                                session.add(session.merge(signal))
                                session.commit()
                                continue
                                
                        action_upper = result.get("action", "HOLD").upper()
                        if action_upper in ["BUY", "SELL", "LONG", "SHORT"]:
                            is_long_signal = action_upper in ["BUY", "LONG"]
                            
                            # --- PHASE 2: PRE-EXECUTION FILTERS ---
                            reject_signal = False
                            reject_reason = ""
                            
                            # Filter 1: Market Trend Gate (ROI-TEST 2026-09-20: was ±7%, now ±12% to allow counter-trend scalps)
                            if "24h" in global_sentiment:
                                import re
                                match = re.search(r'24h\s*([+-]?\d+\.?\d*)%', global_sentiment)
                                if match:
                                    change_24h = float(match.group(1))
                                    if change_24h > 12.0 and not is_long_signal:
                                        reject_signal = True
                                        reject_reason = f"Trend Gate: Market is Bullish (+{change_24h}%). Blocked SHORT."
                                    elif change_24h < -12.0 and is_long_signal:
                                        reject_signal = True
                                        reject_reason = f"Trend Gate: Market is Bearish ({change_24h}%). Blocked LONG."
                            
                            # Filter 2: Auditor Gate (ROI-TEST 2026-09-20: warn-only, no longer hard veto)
                            if not reject_signal:
                                try:
                                    # Use standard database query logic (AiLesson is in auditor.py, but we can query it directly if we define it, or just use raw SQL)
                                    # To avoid circular imports, let's query via SQLAlchemy engine directly or define the model inline
                                    from sqlalchemy import text
                                    lessons = session.execute(text("SELECT lesson_text FROM ai_lessons ORDER BY id DESC LIMIT 5")).fetchall()
                                    if lessons:
                                        lessons_text = "\n".join([f"- {l[0]}" for l in lessons])
                                        audit_prompt = f"""
                                        CRITICAL TASK: Review this trading signal against our 5 hard rules.
                                        RULES:
                                        {lessons_text}
                                        
                                        SIGNAL:
                                        {signal.raw_text}
                                        
                                        Does this signal violate ANY of our hard rules? 
                                        Return ONLY JSON: {{"violation": true/false, "reason": "brief explanation"}}
                                        """
                                        audit_resp = provider._query_gemini(audit_prompt)
                                        if audit_resp and audit_resp.get("violation") is True:
                                            log_to_file(f"[AUDITOR WARNING] Signal {signal.id} flagged: {audit_resp.get('reason', '')} — proceeding with reduced size (warn-only).")
                                            try:
                                                result["auditor_warn"] = True
                                            except Exception:
                                                pass
                                except Exception as e:
                                    log_to_file(f"Failed Auditor Gate check: {e}")
                            
                            if reject_signal:
                                log_to_file(f"Signal ID {signal.id} REJECTED: {reject_reason}")
                                signal.status = 'processed'
                                signal.result = f"Rejected: {reject_reason}"
                                session.add(session.merge(signal))
                                session.commit()
                                continue
                            # --- END PRE-EXECUTION FILTERS ---
                            
                            symbol = f"{asset_name}/USDT"
                            
                            paper_trading_status = get_db_setting(session, 'paper_trading_status', 'active')
                            live_trading_status = get_db_setting(session, 'live_trading_status', 'inactive')
                            futures_trading_status = get_db_setting(session, 'futures_trading_status', 'active')
                            atr_target_compression = get_db_setting(session, 'atr_target_compression', '1')
                            
                            trade_type = result.get("type", "spot").lower()
                            leverage = int(result.get("leverage", 1))
                            
                            # Global toggle for futures protection (ROI-TEST 2026-09-20: spot-only paper test)
                            # Futures skipped regardless of DB toggle until n>=30 paper PF>1.3
                            if trade_type == 'futures':
                                log_to_file(f"[FUTURES WARNING] Futures signal skipped (spot-only ROI test).")
                                signal.status = 'processed'
                                signal.result = 'Futures Skipped (Disabled)'
                                session.add(session.merge(signal))
                                session.commit()
                                continue
                            
                            # Strategy 2: ATR-Based Take Profit Target Compression
                            if atr_target_compression == '1' and source_name != 'TA Engine':
                                try:
                                    temp_ex = ccxt.binance({'enableRateLimit': True})
                                    temp_ex.set_sandbox_mode(True)
                                    ohlcv = temp_ex.fetch_ohlcv(symbol, timeframe='1h', limit=15)
                                    if len(ohlcv) >= 14:
                                        tr_values = []
                                        for i in range(1, len(ohlcv)):
                                            high = ohlcv[i][2]
                                            low = ohlcv[i][3]
                                            prev_close = ohlcv[i-1][4]
                                            tr = max(high - low, abs(high - prev_close), abs(low - prev_close))
                                            tr_values.append(tr)
                                        atr = sum(tr_values[-14:]) / 14.0
                                        ticker_comp = temp_ex.fetch_ticker(symbol)
                                        curr_p = ticker_comp['last']
                                        atr_pct = atr / curr_p
                                        
                                        targets = result.get("targets", [])
                                        is_long = action_upper in ["BUY", "LONG"]
                                        
                                        # Validate and correct LLM hallucinations for SHORTs
                                        if not is_long:
                                            if targets and targets[0] > curr_p:
                                                log_to_file(f"[LLM FIX] Hallucinated LONG targets for a SHORT trade. Inverting targets relative to entry.")
                                                for i in range(len(targets)):
                                                    targets[i] = round(curr_p - abs(targets[i] - curr_p), 4)
                                            if result.get("stop_loss") and result.get("stop_loss") < curr_p:
                                                log_to_file(f"[LLM FIX] Hallucinated LONG stop_loss for a SHORT trade. Inverting SL relative to entry.")
                                                result["stop_loss"] = round(curr_p + abs(result["stop_loss"] - curr_p), 4)
                                                
                                        if targets:
                                            tp1 = targets[0]
                                            tp1_pct = abs(tp1 - curr_p) / curr_p
                                            max_tp1_pct = 6.0 * atr_pct
                                            if tp1_pct > max_tp1_pct:
                                                new_tp1 = curr_p * (1.0 + max_tp1_pct) if is_long else curr_p * (1.0 - max_tp1_pct)
                                                log_to_file(f"[ATR TARGET COMPRESSION] Compressed TP1 from {tp1} to {new_tp1:.4f} (capped at 6.0x ATR of {max_tp1_pct*100:.2f}%)")
                                                targets[0] = round(new_tp1, 4)
                                            
                                            if len(targets) > 1:
                                                tp2 = targets[1]
                                                tp2_pct = abs(tp2 - curr_p) / curr_p
                                                max_tp2_pct = 12.0 * atr_pct
                                                if tp2_pct > max_tp2_pct:
                                                    new_tp2 = curr_p * (1.0 + max_tp2_pct) if is_long else curr_p * (1.0 - max_tp2_pct)
                                                    log_to_file(f"[ATR TARGET COMPRESSION] Compressed TP2 from {tp2} to {new_tp2:.4f} (capped at 12.0x ATR of {max_tp2_pct*100:.2f}%)")
                                                    targets[1] = round(new_tp2, 4)
                                            
                                            result["targets"] = targets
                                        
                                        stop_loss = result.get("stop_loss")
                                        if stop_loss:
                                            sl = stop_loss
                                            sl_pct = abs(sl - curr_p) / curr_p
                                            min_sl_pct = 1.5 * atr_pct
                                            max_sl_pct = 4.0 * atr_pct
                                            
                                            if sl_pct < min_sl_pct:
                                                new_sl = curr_p * (1.0 - min_sl_pct) if is_long else curr_p * (1.0 + min_sl_pct)
                                                log_to_file(f"[ATR STOP LOSS] Expanded tight SL from {sl} to {new_sl:.4f} (enforced min 1.5x ATR of {min_sl_pct*100:.2f}%)")
                                                result["stop_loss"] = round(new_sl, 4)
                                            elif sl_pct > max_sl_pct:
                                                new_sl = curr_p * (1.0 - max_sl_pct) if is_long else curr_p * (1.0 + max_sl_pct)
                                                log_to_file(f"[ATR STOP LOSS] Flash Crash Safety: Capped wide SL from {sl} to {new_sl:.4f} (enforced max 4.0x ATR of {max_sl_pct*100:.2f}%)")
                                                result["stop_loss"] = round(new_sl, 4)
                                                
                                except Exception as atr_err:
                                    log_to_file(f"Failed to apply ATR Logic: {atr_err}")

                            placed_any = False
                            failed_any = False
                            
                            for mode, status in [('paper', paper_trading_status), ('live', live_trading_status)]:
                                if status == 'active':
                                    existing = session.query(Trade).filter(
                                        Trade.asset == asset_name,
                                        Trade.status == 'open',
                                        Trade.mode == mode
                                    ).first()
                                    
                                    if existing:
                                        # Check direction
                                        existing_side = getattr(existing, 'side', 'LONG')
                                        new_side = "LONG" if is_long else "SHORT"
                                        
                                        if existing_side == new_side:
                                            log_to_file(f"[DEDUPLICATION] Skipping {mode.upper()} Trade for {asset_name}: {existing_side} already open.")
                                        else:
                                            existing_signal = session.query(Signal).get(existing.signal_id) if getattr(existing, 'signal_id', None) else None
                                            is_sar_trade = existing.outcome and "[SAR]" in existing.outcome
                                            
                                            allow_override = False
                                            if is_sar_trade:
                                                allow_override = True
                                                log_to_file(f"[OPPOSITE SIGNAL] SAR trade found. Allowing Lead Trader to override it.")
                                            elif existing_signal and signal:
                                                if existing_signal.source_id == signal.source_id:
                                                    try:
                                                        trade_open_time = datetime.strptime(existing.created_at, '%Y-%m-%d %H:%M:%S')
                                                        hours_open = (datetime.now() - trade_open_time).total_seconds() / 3600.0
                                                        if hours_open < 2.0:
                                                            allow_override = False
                                                            log_to_file(f"[COOLDOWN ACTIVE] Skipping {mode.upper()} Opposite Signal for {asset_name}: Trade was opened {hours_open:.2f}h ago (under 2h cooldown).")
                                                        else:
                                                            allow_override = True
                                                            log_to_file(f"[OPPOSITE SIGNAL] Same Lead Trader reversed position after {hours_open:.2f}h. Allowing override.")
                                                    except Exception as e:
                                                        allow_override = True
                                                        log_to_file(f"[OPPOSITE SIGNAL] Same Lead Trader reversed position. Allowing override.")
                                                else:
                                                    log_to_file(f"[DEDUPLICATION] Skipping {mode.upper()} Opposite Signal for {asset_name}: Conflicting Lead Traders (Source Lock).")
                                            else:
                                                # Fallback
                                                allow_override = False
                                                
                                            if allow_override:
                                                log_to_file(f"[OPPOSITE SIGNAL] Received {new_side} signal for {asset_name} but have open {existing_side}. Auto-closing existing trade!")
                                                try:
                                                    exchange_instance = get_exchange_instance(mode, trade_type)
                                                    if exchange_instance:
                                                        if mode != 'paper':
                                                            close_action = 'sell' if existing_side == 'LONG' else 'buy'
                                                            exchange_instance.create_market_order(symbol, close_action, existing.amount)
                                                            if trade_type == 'futures':
                                                                exchange_instance.cancel_all_orders(symbol)
                                                        
                                                        ticker_close = exchange_instance.fetch_ticker(symbol)
                                                        c_price = ticker_close['last']
                                                        pnl_sign = 1 if existing_side == 'LONG' else -1
                                                        pnl_amt = (c_price - existing.entry_price) * existing.amount * pnl_sign
                                                        
                                                        existing.status = 'closed'
                                                        existing.exit_price = c_price
                                                        existing.pnl = pnl_amt
                                                        existing.outcome = f"Auto-Closed by Opposite Signal ({new_side})"
                                                        existing.closed_at = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                                                        session.commit()
                                                        log_to_file(f"Successfully closed conflicting trade #{existing.id}. Proceeding to open new {new_side} trade.")
                                                except Exception as err:
                                                    log_to_file(f"Failed to close conflicting trade: {err}")
                                                    continue
                                    else:
                                        # Validate SL/TP logic using current price
                                        try:
                                            check_ex = get_exchange_instance(mode, trade_type)
                                            if not check_ex:
                                                log_to_file(f"[{mode.upper()}] Skipping: Exchange not configured.")
                                                continue
                                                
                                            ticker = check_ex.fetch_ticker(symbol)
                                            entry_p = ticker['last']
                                            sl = result.get("stop_loss")
                                            targets = result.get("targets", [])
                                            tp = targets[0] if targets else None
                                            is_long = action_upper in ["BUY", "LONG"]
                                            
                                            invalid_sl = False
                                            invalid_tp = False
                                            if is_long:
                                                if sl and sl >= entry_p: invalid_sl = True
                                                if tp and tp <= entry_p: invalid_tp = True
                                            else:
                                                if sl and sl <= entry_p: invalid_sl = True
                                                if tp and tp >= entry_p: invalid_tp = True
                                                
                                            if invalid_sl:
                                                log_to_file(f"[{mode.upper()}] REJECTED: Invalid SL ({sl}) for {'LONG' if is_long else 'SHORT'} at {entry_p}")
                                            elif invalid_tp:
                                                log_to_file(f"[{mode.upper()}] REJECTED: Invalid TP ({tp}) for {'LONG' if is_long else 'SHORT'} at {entry_p}")
                                            else:
                                                # Change 2: Enforce minimum Risk/Reward Ratio (ROI-TEST 2026-09-20: 1.5 -> 1.2)
                                                rr_passed = True
                                                if sl and tp and entry_p:
                                                    risk_dist = abs(entry_p - sl)
                                                    reward_dist = abs(tp - entry_p)
                                                    if risk_dist > 0:
                                                        rr_ratio = reward_dist / risk_dist
                                                        if rr_ratio < 1.2:
                                                            rr_passed = False
                                                            log_to_file(f"[{mode.upper()}] REJECTED: R:R ratio {rr_ratio:.2f} < 1.2 for {asset_name} (Risk=${risk_dist:.4f}, Reward=${reward_dist:.4f})")
                                                        else:
                                                            log_to_file(f"[R:R CHECK] {asset_name} passed with R:R = {rr_ratio:.2f}")
                                                
                                                if rr_passed:
                                                    log_to_file(f"Executing {mode.upper()} Trade: {'LONG' if is_long else 'SHORT'} {asset_name} ({trade_type.upper()})")
                                                    success = execute_trade(asset_name, action_upper, signal.id, mode=mode, trade_details=result)
                                                    if success:
                                                        placed_any = True
                                                    else:
                                                        failed_any = True
                                        except Exception as val_err:
                                            log_to_file(f"[{mode.upper()}] Trade validation error: {val_err}")
                                            failed_any = True
                                            
                            if not placed_any and not failed_any:
                                signal.status = 'processed'
                                signal.result = 'Skipped or Rejected'
                            elif failed_any and not placed_any:
                                signal.status = 'failed'
                            else:
                                signal.status = 'processed'
                        else:
                            signal.status = 'processed'
                        
                        session.add(session.merge(signal))
                        session.commit()
                        
                    except Exception as e:
                        log_to_file(f"Error in signal loop: {e}")
                        session.rollback()
                        
        except Exception as e:
            log_to_file(f"Signals Loop Error: {e}")
        finally:
            wait_time = int(get_db_setting(session, 'poll_interval', 60)) if 'session' in locals() else 60
            if 'session' in locals(): session.close()
            time.sleep(wait_time)

def run_strategic_risk_engine(session):
    open_trades = session.query(Trade).filter(Trade.status == 'open').all()
    if not open_trades:
        return
        
    log_to_file("=== RUNNING 80-MINUTE STRATEGIC RISK ENGINE ===")
    provider = LLMProvider()
    
    recent_news = session.query(NewsItem).order_by(NewsItem.id.desc()).limit(5).all()
    news_context = "\n".join([f"- {n.raw_text[:200]}" for n in recent_news])
    
    for trade in open_trades:
        trade_mode = getattr(trade, 'mode', 'paper') or 'paper'
        trade_type = getattr(trade, 'trade_type', 'spot') or 'spot'
        exchange = get_exchange_instance(trade_mode, trade_type)
        if not exchange: continue
        
        symbol = trade.symbol if trade.symbol else f"{trade.asset}/USDT"
        try:
            ticker = exchange.fetch_ticker(symbol)
            current_price = ticker['last']
        except Exception as e:
            log_to_file(f"[STRATEGIC ENGINE] Could not fetch price for {symbol}: {e}")
            continue
            
        try:
            import ast
            targets = ast.literal_eval(trade.target_prices) if trade.target_prices else []
        except:
            targets = []
            
        is_long = True
        if targets:
            is_long = (targets[0] > trade.entry_price)
        elif trade.stop_loss:
            is_long = (trade.stop_loss < trade.entry_price)
            
        pnl_sign = 1 if is_long else -1
        gross_pnl = (current_price - trade.entry_price) * trade.amount * pnl_sign
        
        prompt = f"""
        You are the Elite Strategic Risk Engine. You are analyzing an open trade during your 80-minute portfolio review.
        
        TRADE: {'LONG' if is_long else 'SHORT'} {trade.asset}
        Entry: {trade.entry_price}
        Current: {current_price}
        Target: {targets[0] if targets else 'N/A'}
        Stop Loss: {trade.stop_loss}
        Current PnL: ${gross_pnl:.2f}
        
        RECENT MARKET NEWS:
        {news_context}
        
        Based on the macro market context and the current performance of this trade, should we execute an EMERGENCY EARLY EXIT to secure profits or prevent a catastrophic loss, or should we HOLD and let the normal TP/SL strategy play out?
        CRITICAL RULE: Do NOT execute an early exit unless the macro news indicates a severe, catastrophic crash. You must lean heavily towards HOLD to allow trades room to recover. Stop being overly paranoid about minor market dips.
        
        Return ONLY a JSON response:
        {{
            "decision": "EXIT" or "HOLD",
            "reasoning": "1 concise sentence why."
        }}
        """
        
        log_to_file(f"[STRATEGIC ENGINE] Querying Gemini Flash 2.5 for Trade #{trade.id} ({trade.asset})...")
        result = provider.query_strategic_gemini(prompt)
        
        if result and result.get("decision") == "EXIT":
            reason = result.get("reasoning", "Strategic AI Decision")
            log_to_file(f">>> [STRATEGIC AI AUTO-EXIT] {reason} Auto-closing trade #{trade.id} ({trade.asset})...")
            
            try:
                close_side = 'sell' if is_long else 'buy'
                if trade_mode == 'paper':
                    order = {'price': current_price, 'average': current_price}
                else:
                    order = exchange.create_market_order(symbol, close_side, trade.amount)
                
                if trade_type == 'futures':
                    try:
                        exchange.cancel_all_orders(symbol)
                    except:
                        pass
                        
                exit_price = order.get('price') or order.get('average') or current_price
                final_pnl = (exit_price - trade.entry_price) * trade.amount * pnl_sign
                
                trade.status = 'closed'
                trade.exit_price = exit_price
                trade.pnl = final_pnl
                trade.outcome = f"Strategic Auto-Exit: {reason[:50]}"
                trade.closed_at = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                
                sweep_futures_profit(exchange, trade_type, final_pnl, trade_mode)
                check_and_apply_blocklist(session, trade, final_pnl)
                
                log_to_file(f"[{trade_mode.upper()}] Trade Closed by Strategic Engine! Final PnL: ${final_pnl:.2f}")
                session.add(trade)
                session.commit()
            except Exception as e:
                log_to_file(f"[STRATEGIC ENGINE ERROR] Could not close trade: {e}")
        else:
            reason_str = result.get('reasoning', 'N/A') if result else 'N/A'
            log_to_file(f"[STRATEGIC ENGINE] Trade #{trade.id} ({trade.asset}) - Decision: HOLD. Reasoning: {reason_str}")

def run_monitor_loop():
    log_to_file("Trade Monitor (Exits Engine) Started. Tracking open positions...")
    last_strategic_run = time.time()
    while True:
        session = Session()
        try:
            # Update Heartbeat
            heartbeat_setting = session.query(Setting).filter(Setting.key == 'last_heartbeat_monitor').first()
            if not heartbeat_setting:
                try:
                    heartbeat_setting = Setting(key='last_heartbeat_monitor', value='')
                    session.add(heartbeat_setting)
                    session.commit()
                except Exception:
                    session.rollback()
                    heartbeat_setting = session.query(Setting).filter(Setting.key == 'last_heartbeat_executor').first()
            
            if heartbeat_setting:
                heartbeat_setting.value = datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S')
                session.commit()
            
            # Check System Status
            sys_status = get_db_setting(session, 'system_status', 'running')
            emerg_stop = get_db_setting(session, 'emergency_stop', '0')
            
            if sys_status == 'stopped' or emerg_stop == '1':
                log_to_file("System is STOPPED via Dashboard (Monitor Engine). Waiting...")
                time.sleep(15)
                continue

            # Monitor open trades
            monitor_open_trades()
            
            # Run Strategic Risk Engine every 80 minutes
            if time.time() - last_strategic_run >= 4800:
                last_strategic_run = time.time()
                try:
                    run_strategic_risk_engine(session)
                except Exception as se:
                    log_to_file(f"Strategic Engine Wrapper Error: {se}")

        except Exception as e:
            log_to_file(f"Monitor Loop Error: {e}")
        finally:
            session.close()
            time.sleep(15)

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Cryptrader Trade Executor & Monitor")
    parser.add_argument("--mode", type=str, choices=["signals", "monitor", "both"], default="both",
                        help="Execution mode (signals: process signals only, monitor: monitor trades only, both: run both in threads)")
    args = parser.parse_args()

    if args.mode == "signals":
        run_signals_loop()
    elif args.mode == "monitor":
        run_monitor_loop()
    else:
        # Run both concurrently in separate daemon threads
        import threading
        t_signals = threading.Thread(target=run_signals_loop, daemon=True)
        t_monitor = threading.Thread(target=run_monitor_loop, daemon=True)
        
        t_signals.start()
        t_monitor.start()
        
        log_to_file("Started Trade Executor & Monitor concurrently using threads.")
        
        try:
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            log_to_file("Stopping Trade Executor & Monitor...")
