PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE ai_lessons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    trade_id INTEGER,
    lesson_text TEXT NOT NULL,
    created_at DATETIME
);
INSERT INTO "ai_lessons" VALUES(10,23,'Never configure your first take-profit target to be equal to the entry price when chasing short-term pump alerts, as transaction fees will guarantee a net-negative trade outcome.','2026-07-06 20:15:28.896562');
INSERT INTO "ai_lessons" VALUES(11,24,'Do not execute buy orders based solely on copy-trading alerts from individual ''Lead Traders'' without verifying that the asset has confirmed a bullish market structure breakout on the 15-minute chart.','2026-07-06 21:35:34.124839');
INSERT INTO "ai_lessons" VALUES(12,25,'Always execute quick momentum-scalp buys when CoinMarketCap alerts indicate an asset is pumping over 15% in under an hour on high 24-hour volume to capture immediate, high-liquidity upward continuation.','2026-07-07 00:15:38.814929');
INSERT INTO "ai_lessons" VALUES(13,26,'Prioritize buying high-momentum assets that exhibit sudden 1-hour gains exceeding 40% backed by substantial 24-hour trading volume above $30 million, as this intense buying pressure reliably drives price action straight through multiple profit targets.','2026-07-07 13:42:37.724039');
INSERT INTO "ai_lessons" VALUES(14,27,'Capitalize on sudden 1-hour price surges exceeding 10% backed by substantial 24-hour volume over $15 million by executing momentum buy orders with immediate, tight profit targets to capture rapid breakout gains before exhaustion.','2026-07-07 16:46:20.211073');
INSERT INTO "ai_lessons" VALUES(15,28,'Do not execute copy-trades if the current market price has slipped by more than 0.5% from the lead trader''s original entry price.','2026-07-07 18:07:46.498833');
INSERT INTO "ai_lessons" VALUES(16,29,'Capitalize on high-momentum breakouts by executing long positions immediately when a high-volume alert signals a sudden 1-hour price surge exceeding 6%.','2026-07-07 19:28:14.822587');
INSERT INTO "ai_lessons" VALUES(17,31,'Always execute short-term scalp buys when a CoinMarketCap alert signals a one-hour price surge exceeding 10% backed by multi-million dollar 24-hour trading volume to capture immediate, high-probability momentum.','2026-07-07 23:28:58.868143');
INSERT INTO "ai_lessons" VALUES(18,32,'Always capitalize on sudden hourly price surges exceeding 10% that are backed by multi-million dollar trading volume by executing momentum buys and exiting immediately at the first conservative target.','2026-07-08 00:49:12.079018');
INSERT INTO "ai_lessons" VALUES(19,30,'Never execute a copy-trade order if the current market price has slipped more than 0.5% past the lead trader''s original entry price.','2026-07-08 04:49:17.376120');
INSERT INTO "ai_lessons" VALUES(20,33,'Never execute a copy-trade buy order if the market price has already risen above the lead trader''s specified entry price, as chasing entries invalidates the original trade''s risk-to-reward parameters.','2026-07-08 06:09:21.945141');
INSERT INTO "ai_lessons" VALUES(21,34,'Do not execute long positions based on ''Lead Trader'' API alerts when the current price has fallen below the signaled entry price, as buying a downward-trending asset below the trigger level indicates a bearish invalidation of the copy-trade setup.','2026-07-08 07:29:28.207235');
INSERT INTO "ai_lessons" VALUES(22,36,'Do not execute momentum buy orders on sudden hourly price spikes (>8%) when the asset''s 24-hour trading volume is below $5,000,000, as these low-liquidity pumps lack the market depth to sustain the move and result in immediate reversals.','2026-07-08 08:49:34.235729');
INSERT INTO "ai_lessons" VALUES(23,35,'Do not execute long entries based on speculative news forecasting milestone targets (e.g., ''climbs toward $2K'') or citing lagging institutional buying reports, as these heavily publicized events typically function as ''sell the news'' liquidity traps.','2026-07-08 13:06:58.228986');
INSERT INTO "ai_lessons" VALUES(24,37,'Do not execute long positions triggered solely by automated market alerts reporting rapid short-term price spikes, such as an 8% gain in one hour, without verifying a sustained technical breakout or waiting for a pullback to key support.','2026-07-08 14:27:03.006919');
INSERT INTO "ai_lessons" VALUES(25,38,'Do not execute long positions based on macroeconomic fiat depreciation or regional corporate adoption headlines unless accompanied by a verified short-term volume breakout and positive immediate price momentum.','2026-07-08 15:47:08.760420');
INSERT INTO "ai_lessons" VALUES(26,39,'Do not execute buy orders triggered by automated ''heavily pumping'' alerts if the stop-loss is set wider than 5% from the entry price, as chasing short-term momentum with an oversized risk window guarantees an unprofitable risk-to-reward ratio.','2026-07-09 01:09:55.249755');
INSERT INTO "ai_lessons" VALUES(27,40,'Always execute immediate momentum buys on low-priced assets when a verified alert triggers a rapid 1-hour pump of over 6% accompanied by 24-hour volume exceeding $1 million, as this setup provides sufficient short-term liquidity and buying pressure for quick scalp profits.','2026-07-09 06:29:59.677716');
CREATE TABLE "cache" ("key" varchar not null, "value" text not null, "expiration" integer not null, primary key ("key"));
CREATE TABLE "cache_locks" ("key" varchar not null, "owner" varchar not null, "expiration" integer not null, primary key ("key"));
CREATE TABLE "failed_jobs" ("id" integer primary key autoincrement not null, "uuid" varchar not null, "connection" text not null, "queue" text not null, "payload" text not null, "exception" text not null, "failed_at" datetime not null default CURRENT_TIMESTAMP);
CREATE TABLE "job_batches" ("id" varchar not null, "name" varchar not null, "total_jobs" integer not null, "pending_jobs" integer not null, "failed_jobs" integer not null, "failed_job_ids" text not null, "options" text, "cancelled_at" integer, "created_at" integer not null, "finished_at" integer, primary key ("id"));
CREATE TABLE "jobs" ("id" integer primary key autoincrement not null, "queue" varchar not null, "payload" text not null, "attempts" integer not null, "reserved_at" integer, "available_at" integer not null, "created_at" integer not null);
CREATE TABLE "migrations" ("id" integer primary key autoincrement not null, "migration" varchar not null, "batch" integer not null);
INSERT INTO "migrations" VALUES(1,'0001_01_01_000000_create_users_table',1);
INSERT INTO "migrations" VALUES(2,'0001_01_01_000001_create_cache_table',1);
INSERT INTO "migrations" VALUES(3,'0001_01_01_000002_create_jobs_table',1);
INSERT INTO "migrations" VALUES(4,'2026_05_12_192920_create_sources_table',1);
INSERT INTO "migrations" VALUES(5,'2026_05_12_192921_create_signals_table',1);
INSERT INTO "migrations" VALUES(6,'2026_05_12_192922_create_trades_table',1);
INSERT INTO "migrations" VALUES(7,'2026_05_14_110817_add_result_to_signals_table',1);
INSERT INTO "migrations" VALUES(8,'2026_05_14_123251_add_catch_up_hours_to_sources_table',1);
INSERT INTO "migrations" VALUES(9,'2026_05_14_130343_add_detailed_fields_to_trades_table',1);
INSERT INTO "migrations" VALUES(10,'2026_05_14_130606_add_amount_to_trades_table',1);
INSERT INTO "migrations" VALUES(11,'2026_05_14_130748_add_closed_at_to_trades_table',1);
INSERT INTO "migrations" VALUES(12,'2026_05_14_134245_add_symbol_to_trades_table',1);
INSERT INTO "migrations" VALUES(13,'2026_05_14_134717_create_settings_table',1);
INSERT INTO "migrations" VALUES(14,'2026_05_14_173018_add_pnl_and_exit_price_to_trades_table',1);
INSERT INTO "migrations" VALUES(15,'2026_05_14_175049_create_news_items_table',1);
INSERT INTO "migrations" VALUES(16,'2026_05_19_103000_seed_early_exit_settings',1);
INSERT INTO "migrations" VALUES(17,'2026_05_19_110000_seed_futures_settings',1);
INSERT INTO "migrations" VALUES(18,'2026_05_21_144550_create_personal_access_tokens_table',1);
INSERT INTO "migrations" VALUES(19,'2026_06_03_123708_create_ai_lessons_table',2);
INSERT INTO "migrations" VALUES(20,'2026_06_03_123915_add_missing_columns_to_trades_table',3);
CREATE TABLE "news_items" ("id" integer primary key autoincrement not null, "source_id" integer not null, "raw_text" text not null, "status" varchar not null default 'pending', "created_at" datetime, "updated_at" datetime, foreign key("source_id") references "sources"("id") on delete cascade);
INSERT INTO "news_items" VALUES(1,20,NULL,'pending',NULL,NULL);
INSERT INTO "news_items" VALUES(2,16,NULL,'pending',NULL,NULL);
INSERT INTO "news_items" VALUES(3,2,NULL,'pending',NULL,NULL);
INSERT INTO "news_items" VALUES(4,12,NULL,'pending',NULL,NULL);
INSERT INTO "news_items" VALUES(5,600,NULL,'pending',NULL,NULL);
INSERT INTO "news_items" VALUES(6,3114,NULL,'pending',NULL,NULL);
INSERT INTO "news_items" VALUES(7,50,NULL,'pending',NULL,NULL);
INSERT INTO "news_items" VALUES(8,27,NULL,'pending',NULL,NULL);
CREATE TABLE "password_reset_tokens" ("email" varchar not null, "token" varchar not null, "created_at" datetime, primary key ("email"));
CREATE TABLE "personal_access_tokens" ("id" integer primary key autoincrement not null, "tokenable_type" varchar not null, "tokenable_id" integer not null, "name" text not null, "token" varchar not null, "abilities" text, "last_used_at" datetime, "expires_at" datetime, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "sessions" ("id" varchar not null, "user_id" integer, "ip_address" varchar, "user_agent" text, "payload" text not null, "last_activity" integer not null, primary key ("id"));
CREATE TABLE "settings" ("id" integer primary key autoincrement not null, "key" varchar not null, "value" text, "description" varchar, "created_at" datetime, "updated_at" datetime);
INSERT INTO "settings" VALUES(1,'early_profit_exit_status','inactive','Early profit exit mode (inactive, active, ai_decide)','2026-05-28 09:05:06','2026-05-28 09:05:06');
INSERT INTO "settings" VALUES(2,'early_profit_exit_hours','1','Minimum holding time (in hours) before early profit checks trigger','2026-05-28 09:05:06','2026-05-28 09:05:06');
INSERT INTO "settings" VALUES(4,'max_futures_leverage','5',NULL,NULL,NULL);
INSERT INTO "settings" VALUES(5,'paper_trading_status','active','Master toggle for Paper/Testnet Trading',NULL,NULL);
INSERT INTO "settings" VALUES(6,'live_trading_status','inactive','Master toggle for Live Real-Money Trading',NULL,NULL);
INSERT INTO "settings" VALUES(7,'futures_trading_status','active','Master toggle for Futures Trading (Live & Paper)',NULL,NULL);
INSERT INTO "settings" VALUES(8,'risk_per_trade','0.10','Risk percentage of capital per trade',NULL,NULL);
INSERT INTO "settings" VALUES(9,'min_notional','11.0','Minimum trade notional value',NULL,NULL);
INSERT INTO "settings" VALUES(10,'poll_interval','60','Seconds to wait before processing LLM',NULL,NULL);
INSERT INTO "settings" VALUES(11,'system_status','running','Master switch to pause execution',NULL,NULL);
INSERT INTO "settings" VALUES(12,'emergency_stop','0','Emergency panic button',NULL,NULL);
INSERT INTO "settings" VALUES(13,'last_heartbeat_onchain','2026-07-09 10:57:05',NULL,NULL,NULL);
INSERT INTO "settings" VALUES(14,'last_heartbeat_cmc','2026-07-09 10:59:03',NULL,NULL,NULL);
INSERT INTO "settings" VALUES(15,'last_heartbeat_monitor','2026-07-09 10:59:43',NULL,NULL,NULL);
INSERT INTO "settings" VALUES(16,'last_heartbeat_auditor','2026-07-09 09:49:02',NULL,NULL,NULL);
CREATE TABLE "signals" ("id" integer primary key autoincrement not null, "source_id" integer not null, "raw_text" text not null, "parsed_sentiment" float, "asset" varchar, "status" varchar not null default 'pending', "timestamp" datetime not null default CURRENT_TIMESTAMP, "created_at" datetime, "updated_at" datetime, "result" varchar, "initial_price" numeric, foreign key("source_id") references "sources"("id") on delete cascade);
INSERT INTO "signals" VALUES(829,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 80.91.',0.8,'SOL','failed','2026-07-06 11:52:11','2026-07-06 14:52:11.140653',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(830,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 80.89.',1.0,'SOL','failed','2026-07-06 11:54:26','2026-07-06 14:54:26.207230',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(831,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 80.93.',0.8,'SOL','failed','2026-07-06 11:56:19','2026-07-06 14:56:19.941108',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(832,10,'CMC ALERT: ANSEM is heavily pumping! 1-hour change: 7.96926318%. 24h Volume: $57,673,885.',1.0,'ANSEM','failed','2026-07-06 11:56:36','2026-07-06 14:56:36.640626',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(833,10,'CMC ALERT: UFD is heavily pumping! 1-hour change: 7.06822177%. 24h Volume: $3,024,034.',1.0,'UFD','failed','2026-07-06 11:57:21','2026-07-06 14:57:21.787277',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(834,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 80.64.',1.0,'SOL','failed','2026-07-06 11:58:44','2026-07-06 14:58:44.119642',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(835,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1755.38.',1.0,'ETH','failed','2026-07-06 12:00:48','2026-07-06 15:00:48.348472',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(836,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62130.15.',-1.0,'BTC','failed','2026-07-06 12:02:43','2026-07-06 15:02:43.579621',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(837,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1272.',1.0,'XRP','failed','2026-07-06 12:04:37','2026-07-06 15:04:37.932407',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(838,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1815.',1.0,'ADA','failed','2026-07-06 12:06:42','2026-07-06 15:06:42.234059',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(839,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.748.',-1.0,'AVAX','failed','2026-07-06 12:08:35','2026-07-06 15:08:35.985764',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(840,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 574.58.',0.8,'BNB','failed','2026-07-06 12:10:40','2026-07-06 15:10:40.232021',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(841,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1819.',1.0,'ADA','failed','2026-07-06 12:12:55','2026-07-06 15:12:55.408637',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(842,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.875.',1.0,'LINK','failed','2026-07-06 12:14:40','2026-07-06 15:14:40.018121',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(843,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1749.34.',0.7,'ETH','failed','2026-07-06 12:16:35','2026-07-06 15:16:35.605364',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(844,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 576.14.',1.0,'BNB','failed','2026-07-06 12:18:49','2026-07-06 15:18:49.952054',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(845,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1750.26.',0.8,'ETH','failed','2026-07-06 12:20:35','2026-07-06 15:20:35.195698',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(846,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.876.',1.0,'LINK','failed','2026-07-06 12:22:40','2026-07-06 15:22:40.007308',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(847,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.773.',1.0,'AVAX','failed','2026-07-06 12:24:44','2026-07-06 15:24:44.162827',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(848,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.874.',1.0,'LINK','failed','2026-07-06 12:26:49','2026-07-06 15:26:49.257273',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(849,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 575.66.',0.6,'BNB','failed','2026-07-06 12:28:54','2026-07-06 15:28:54.901960',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(850,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1816.',0.6,'ADA','failed','2026-07-06 12:30:50','2026-07-06 15:30:50.108403',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(851,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 575.53.',0.7,'BNB','failed','2026-07-06 12:32:34','2026-07-06 15:32:34.365225',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(852,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.778.',1.0,'AVAX','failed','2026-07-06 12:34:19','2026-07-06 15:34:19.681365',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(853,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62108.0.',1.0,'BTC','failed','2026-07-06 12:36:54','2026-07-06 15:36:54.285413',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(854,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62026.68.',1.0,'BTC','failed','2026-07-06 12:38:47','2026-07-06 15:38:47.960177',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(855,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 80.37.',1.0,'SOL','failed','2026-07-06 12:40:31','2026-07-06 15:40:31.723590',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(856,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1252.',1.0,'XRP','failed','2026-07-06 12:42:16','2026-07-06 15:42:16.889216',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(857,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 79.9.',-1.0,'SOL','failed','2026-07-06 12:44:41','2026-07-06 15:44:41.010188',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(858,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 572.36.',-1.0,'BNB','failed','2026-07-06 12:46:16','2026-07-06 15:46:16.116161',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(859,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.746.',-1.0,'AVAX','failed','2026-07-06 12:48:21','2026-07-06 15:48:21.227140',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(860,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.115.',-1.0,'XRP','failed','2026-07-06 12:50:26','2026-07-06 15:50:26.460501',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(861,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.74.',-1.0,'AVAX','failed','2026-07-06 12:52:40','2026-07-06 15:52:40.178854',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(862,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 61875.91.',1.0,'BTC','failed','2026-07-06 12:54:33','2026-07-06 15:54:33.140919',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(863,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1184.',1.0,'XRP','failed','2026-07-06 12:57:18','2026-07-06 15:57:18.948321',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(864,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 61751.6.',-1.0,'BTC','failed','2026-07-06 12:59:14','2026-07-06 15:59:14.275972',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(865,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.736.',-0.2,'AVAX','failed','2026-07-06 13:01:27','2026-07-06 16:01:27.260980',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(866,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 79.32.',-1.0,'SOL','failed','2026-07-06 13:03:41','2026-07-06 16:03:41.461594',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(867,4,'🚨 NEW CRYPTO TRADE ALERT 📉🔥

🔹 TRADE: XAUT SHORT
🔹 Pair: XAUT/USDT
🔹 Risk: HIGH
🔹 Leverage: 6x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 8.7%

🕰️ Validity: till 08 Jul 2026, 05:14 PM

🔸 Entry: $4133.7

🎯 Take Profit (TP) 1: $4103.6
🎯 Take Profit (TP) 2: $4073.5

🛑 Stop Loss (SL): $4163.8

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',1.0,'XAUT','processed','2026-07-06 13:05:25','2026-07-06 16:05:25.247789',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(868,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.719.',-1.0,'AVAX','failed','2026-07-06 13:05:26','2026-07-06 16:05:26.043959',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(869,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1131.',-1.0,'XRP','failed','2026-07-06 13:07:31','2026-07-06 16:07:31.657251',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(870,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1736.91.',1.0,'ETH','failed','2026-07-06 13:09:16','2026-07-06 16:09:16.398727',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(871,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 571.65.',-1.0,'BNB','failed','2026-07-06 13:11:40','2026-07-06 16:11:40.620669',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(872,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.749.',-1.0,'AVAX','failed','2026-07-06 13:13:45','2026-07-06 16:13:45.362542',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(873,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1736.16.',1.0,'ETH','failed','2026-07-06 13:15:30','2026-07-06 16:15:30.142653',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(874,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.731.',-0.6,'AVAX','failed','2026-07-06 13:17:15','2026-07-06 16:17:15.320564',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(875,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1784.',-1.0,'ADA','failed','2026-07-06 13:18:50','2026-07-06 16:18:50.577278',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(876,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 61528.25.',-1.0,'BTC','failed','2026-07-06 13:21:05','2026-07-06 16:21:05.357195',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(877,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 61593.25.',1.0,'BTC','failed','2026-07-06 13:23:19','2026-07-06 16:23:19.194637',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(878,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 570.85.',0.8,'BNB','failed','2026-07-06 13:25:23','2026-07-06 16:25:23.899877',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(879,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 79.42.',1.0,'SOL','failed','2026-07-06 13:27:18','2026-07-06 16:27:18.556385',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(880,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.179.',-1.0,'ADA','failed','2026-07-06 13:29:33','2026-07-06 16:29:33.749375',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(881,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.791.',1.0,'LINK','failed','2026-07-06 13:31:58','2026-07-06 16:31:58.180366',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(882,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 79.64.',-1.0,'SOL','failed','2026-07-06 13:33:53','2026-07-06 16:33:53.039129',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(883,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1792.',-1.0,'ADA','failed','2026-07-06 13:36:06','2026-07-06 16:36:06.512106',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(884,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.752.',0.7,'AVAX','failed','2026-07-06 13:38:20','2026-07-06 16:38:20.039357',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(885,10,'CMC ALERT: TCC is heavily pumping! 1-hour change: 6.73726256%. 24h Volume: $72,170,341.',1.0,'TCC','failed','2026-07-06 13:39:05','2026-07-06 16:39:05.944279',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(886,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.114.',-1.0,'XRP','failed','2026-07-06 13:40:13','2026-07-06 16:40:13.424017',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(887,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1793.',-1.0,'ADA','failed','2026-07-06 13:42:07','2026-07-06 16:42:07.589364',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(888,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1794.',-1.0,'ADA','failed','2026-07-06 13:44:11','2026-07-06 16:44:11.851251',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(889,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.834.',0.7,'LINK','failed','2026-07-06 13:46:47','2026-07-06 16:46:47.031411',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(890,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 61819.94.',-1.0,'BTC','failed','2026-07-06 13:48:31','2026-07-06 16:48:31.901720',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(891,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.844.',1.0,'LINK','failed','2026-07-06 13:50:56','2026-07-06 16:50:56.459589',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(892,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1750.24.',0.8,'ETH','failed','2026-07-06 13:53:09','2026-07-06 16:53:09.961786',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(893,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1804.',1.0,'ADA','failed','2026-07-06 13:55:43','2026-07-06 16:55:43.674690',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(894,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.849.',1.0,'LINK','failed','2026-07-06 13:58:08','2026-07-06 16:58:08.358233',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(895,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1744.33.',-1.0,'ETH','failed','2026-07-06 14:00:12','2026-07-06 17:00:12.958068',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(896,4,'🚨 NEW CRYPTO TRADE ALERT 📉🔥

🔹 TRADE: PIPPIN SHORT
🔹 Pair: PIPPIN/USDT
🔹 Risk: HIGH
🔹 Leverage: 2x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 8.6%

🕰️ Validity: till 08 Jul 2026, 06:34 PM

🔸 Entry: $0.01861

🎯 Take Profit (TP) 1: $0.01821
🎯 Take Profit (TP) 2: $0.01781

🛑 Stop Loss (SL): $0.01901

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',1.0,'PIPPIN','processed','2026-07-06 14:02:20','2026-07-06 17:02:20.097390',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(897,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 61838.44.',1.0,'BTC','failed','2026-07-06 14:02:36','2026-07-06 17:02:36.843855',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(898,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 61853.99.',1.0,'BTC','failed','2026-07-06 14:05:01','2026-07-06 17:05:01.254269',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(899,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.787.',1.0,'AVAX','failed','2026-07-06 14:07:16','2026-07-06 17:07:16.419000',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(900,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 80.19.',1.0,'SOL','failed','2026-07-06 14:09:31','2026-07-06 17:09:31.949450',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(901,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 80.23.',-1.0,'SOL','failed','2026-07-06 14:11:26','2026-07-06 17:11:26.631570',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(902,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1804.',1.0,'ADA','failed','2026-07-06 14:13:10','2026-07-06 17:13:10.635032',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(903,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1184.',-1.0,'XRP','failed','2026-07-06 14:14:54','2026-07-06 17:14:54.514380',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(904,10,'CMC ALERT: HFT is heavily pumping! 1-hour change: 9.03312676%. 24h Volume: $5,223,078.',0.8,'HFT','processed','2026-07-06 14:15:01','2026-07-06 17:15:01.353536',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(905,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1748.13.',-1.0,'ETH','failed','2026-07-06 14:16:49','2026-07-06 17:16:49.056613',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(906,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1153.',-1.0,'XRP','failed','2026-07-06 14:18:53','2026-07-06 17:18:53.276136',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(907,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.846.',0.7,'LINK','failed','2026-07-06 14:20:58','2026-07-06 17:20:58.017637',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(908,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.846.',1.0,'LINK','failed','2026-07-06 14:23:42','2026-07-06 17:23:42.690875',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(909,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 577.79.',1.0,'BNB','failed','2026-07-06 14:25:47','2026-07-06 17:25:47.374049',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(910,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 80.47.',0.3,'SOL','failed','2026-07-06 14:28:02','2026-07-06 17:28:02.530643',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(911,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.88.',-1.0,'LINK','failed','2026-07-06 14:30:28','2026-07-06 17:30:28.306736',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(912,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1818.',-1.0,'ADA','failed','2026-07-06 14:32:22','2026-07-06 17:32:22.874833',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(913,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.877.',0.8,'LINK','failed','2026-07-06 14:34:47','2026-07-06 17:34:47.123432',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(914,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62099.08.',1.0,'BTC','failed','2026-07-06 14:37:01','2026-07-06 17:37:01.084397',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(915,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.873.',1.0,'LINK','failed','2026-07-06 14:39:05','2026-07-06 17:39:05.786605',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(916,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 80.39.',1.0,'SOL','failed','2026-07-06 14:41:00','2026-07-06 17:41:00.898534',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(917,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 80.37.',0.8,'SOL','failed','2026-07-06 14:42:45','2026-07-06 17:42:45.780763',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(918,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.827.',1.0,'AVAX','failed','2026-07-06 14:44:30','2026-07-06 17:44:30.987840',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(919,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 80.24.',1.0,'SOL','failed','2026-07-06 14:46:34','2026-07-06 17:46:34.751018',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(920,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 576.38.',1.0,'BNB','failed','2026-07-06 14:48:49','2026-07-06 17:48:49.869441',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(921,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 80.26.',1.0,'SOL','failed','2026-07-06 14:51:14','2026-07-06 17:51:14.086053',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(922,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.858.',1.0,'LINK','failed','2026-07-06 14:53:28','2026-07-06 17:53:28.689421',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(923,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1817.',1.0,'ADA','failed','2026-07-06 14:55:13','2026-07-06 17:55:13.388319',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(924,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.803.',-1.0,'AVAX','failed','2026-07-06 14:57:07','2026-07-06 17:57:07.053056',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(925,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1750.12.',-1.0,'ETH','failed','2026-07-06 14:59:10','2026-07-06 17:59:10.747499',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(926,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1819.',-1.0,'ADA','failed','2026-07-06 15:00:45','2026-07-06 18:00:45.194804',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(927,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62162.0.',-1.0,'BTC','failed','2026-07-06 15:02:39','2026-07-06 18:02:39.839840',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(928,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1253.',-1.0,'XRP','failed','2026-07-06 15:04:23','2026-07-06 18:04:23.999413',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(929,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1759.11.',1.0,'ETH','failed','2026-07-06 15:06:28','2026-07-06 18:06:28.691360',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(930,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.831.',0.8,'AVAX','failed','2026-07-06 15:08:53','2026-07-06 18:08:53.953043',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(931,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62443.99.',0.7,'BTC','failed','2026-07-06 15:10:29','2026-07-06 18:10:29.123367',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(932,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1279.',1.0,'XRP','failed','2026-07-06 15:12:23','2026-07-06 18:12:23.348488',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(933,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 580.52.',-0.7,'BNB','failed','2026-07-06 15:14:18','2026-07-06 18:14:18.606046',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(934,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.848.',1.0,'AVAX','failed','2026-07-06 15:16:12','2026-07-06 18:16:12.457143',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(935,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.848.',-1.0,'AVAX','failed','2026-07-06 15:18:06','2026-07-06 18:18:06.971112',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(936,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1286.',1.0,'XRP','failed','2026-07-06 15:20:02','2026-07-06 18:20:02.097698',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(937,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.182.',1.0,'ADA','failed','2026-07-06 15:22:06','2026-07-06 18:22:06.647597',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(938,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62394.38.',-1.0,'BTC','failed','2026-07-06 15:24:31','2026-07-06 18:24:31.368571',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(939,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.899.',1.0,'LINK','failed','2026-07-06 15:26:06','2026-07-06 18:26:06.199501',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(940,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 579.76.',1.0,'BNB','failed','2026-07-06 15:28:21','2026-07-06 18:28:21.859979',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(941,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 80.75.',0.8,'SOL','failed','2026-07-06 15:30:36','2026-07-06 18:30:36.682648',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(942,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62394.31.',0.8,'BTC','failed','2026-07-06 15:32:31','2026-07-06 18:32:31.003065',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(943,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1281.',1.0,'XRP','failed','2026-07-06 15:34:34','2026-07-06 18:34:34.755630',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(944,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.832.',-1.0,'AVAX','failed','2026-07-06 15:36:29','2026-07-06 18:36:29.406708',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(945,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62346.0.',0.8,'BTC','processed','2026-07-06 15:38:44','2026-07-06 18:38:44.461897',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(946,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62371.14.',0.6,'BTC','failed','2026-07-06 15:41:00','2026-07-06 18:41:00.163061',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(947,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.935.',-0.7,'LINK','failed','2026-07-06 15:43:04','2026-07-06 18:43:04.911621',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(948,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 81.23.',-1.0,'SOL','failed','2026-07-06 15:44:59','2026-07-06 18:44:59.761899',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(949,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.883.',0.8,'AVAX','failed','2026-07-06 15:46:44','2026-07-06 18:46:44.018887',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(950,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.867.',0.3,'AVAX','failed','2026-07-06 15:48:58','2026-07-06 18:48:58.178218',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(951,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1781.42.',-1.0,'ETH','failed','2026-07-06 15:51:02','2026-07-06 18:51:02.905938',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(952,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1856.',-0.5,'ADA','failed','2026-07-06 15:53:07','2026-07-06 18:53:07.489101',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(953,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.44.',1.0,'SOL','failed','2026-07-06 15:55:11','2026-07-06 18:55:11.024443',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(954,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63432.01.',-1.0,'BTC','failed','2026-07-06 15:56:54','2026-07-06 18:56:54.786505',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(955,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 584.48.',1.0,'BNB','failed','2026-07-06 15:58:58','2026-07-06 18:58:58.570606',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(956,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1851.',-1.0,'ADA','failed','2026-07-06 16:00:53','2026-07-06 19:00:53.254531',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(957,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1853.',0.7,'ADA','failed','2026-07-06 16:02:57','2026-07-06 19:02:57.839083',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(958,10,'CMC ALERT: BFT is heavily pumping! 1-hour change: 12.26756198%. 24h Volume: $3,854,667.',0.8,'BFT','failed','2026-07-06 16:03:13','2026-07-06 19:03:13.647382',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(959,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1851.',-1.0,'ADA','failed','2026-07-06 16:05:32','2026-07-06 19:05:32.266692',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(960,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 81.88.',1.0,'SOL','failed','2026-07-06 16:08:06','2026-07-06 19:08:06.720897',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(961,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63647.52.',-1.0,'BTC','failed','2026-07-06 16:10:10','2026-07-06 19:10:10.497590',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(962,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1483.',-1.0,'XRP','failed','2026-07-06 16:12:15','2026-07-06 19:12:15.269949',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(963,10,'CMC ALERT: CAP is heavily pumping! 1-hour change: 9.88069174%. 24h Volume: $75,442,907.',1.0,'CAP','failed','2026-07-06 16:13:13','2026-07-06 19:13:13.970391',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(964,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63834.52.',0.8,'BTC','failed','2026-07-06 16:14:20','2026-07-06 19:14:20.008213',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(965,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1858.',-1.0,'ADA','failed','2026-07-06 16:16:05','2026-07-06 19:16:05.283558',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(966,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63660.0.',1.0,'BTC','failed','2026-07-06 16:18:09','2026-07-06 19:18:09.423658',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(967,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.965.',1.0,'AVAX','failed','2026-07-06 16:20:33','2026-07-06 19:20:33.661613',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(968,10,'CMC ALERT: 黑马 is heavily pumping! 1-hour change: 14.6824404%. 24h Volume: $3,107,148.',0.8,'黑马','failed','2026-07-06 16:21:26','2026-07-06 19:21:26.024777',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(969,10,'CMC ALERT: 老子 is heavily pumping! 1-hour change: 11.05356763%. 24h Volume: $6,720,320.',1.0,'XMR','failed','2026-07-06 16:21:54','2026-07-06 19:21:54.135169',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(970,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 8.048.',1.0,'LINK','failed','2026-07-06 16:22:37','2026-07-06 19:22:37.955006',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(971,10,'CMC ALERT: 67 is heavily pumping! 1-hour change: 10.12047992%. 24h Volume: $1,287,939.',0.8,'67','failed','2026-07-06 16:23:24','2026-07-06 19:23:24.855448',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(972,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1465.',-0.6,'XRP','failed','2026-07-06 16:24:33','2026-07-06 19:24:33.123444',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(973,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1845.',1.0,'ADA','failed','2026-07-06 16:26:07','2026-07-06 19:26:07.410853',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(974,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 81.82.',1.0,'SOL','failed','2026-07-06 16:28:22','2026-07-06 19:28:22.236764',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(975,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63402.84.',1.0,'BTC','failed','2026-07-06 16:30:15','2026-07-06 19:30:15.665276',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(976,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 583.84.',1.0,'BNB','failed','2026-07-06 16:31:50','2026-07-06 19:31:50.840885',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(977,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1845.',1.0,'ADA','failed','2026-07-06 16:33:43','2026-07-06 19:33:43.864195',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(978,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1495.',1.0,'XRP','failed','2026-07-06 16:35:27','2026-07-06 19:35:27.312725',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(979,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 82.15.',1.0,'SOL','failed','2026-07-06 16:37:42','2026-07-06 19:37:42.042214',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(980,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1793.85.',1.0,'ETH','failed','2026-07-06 16:39:37','2026-07-06 19:39:37.216694',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(981,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 8.058.',1.0,'LINK','failed','2026-07-06 16:41:41','2026-07-06 19:41:41.515151',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(982,4,'🚨 NEW CRYPTO TRADE ALERT 📈🔥

🔹 TRADE: XMR LONG
🔹 Pair: XMR/USDT
🔹 Risk: HIGH
🔹 Leverage: 3x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 9.5%

🕰️ Validity: till 08 Jul 2026, 10:11 PM

🔸 Entry: $322.12

🎯 Take Profit (TP) 1: $327.23
🎯 Take Profit (TP) 2: $332.34

🛑 Stop Loss (SL): $317.01

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',0.5,'XMR','failed','2026-07-06 16:41:57','2026-07-06 19:41:57.825999',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(983,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1793.48.',-1.0,'ETH','failed','2026-07-06 16:43:46','2026-07-06 19:43:46.788860',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(984,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1846.',-1.0,'ADA','failed','2026-07-06 16:45:40','2026-07-06 19:45:40.414934',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(985,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1848.',-1.0,'ADA','failed','2026-07-06 16:47:55','2026-07-06 19:47:55.938537',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(986,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 8.058.',-1.0,'LINK','failed','2026-07-06 16:50:00','2026-07-06 19:50:00.392019',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(987,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 82.02.',1.0,'SOL','failed','2026-07-06 16:51:55','2026-07-06 19:51:55.560834',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(988,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1845.',1.0,'ADA','processed','2026-07-06 16:54:08','2026-07-06 19:54:08.746329',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(989,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63690.6.',0.7,'BTC','failed','2026-07-06 16:56:32','2026-07-06 19:56:32.916607',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(990,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.951.',-1.0,'AVAX','failed','2026-07-06 16:58:17','2026-07-06 19:58:17.009347',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(991,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1533.',-1.0,'XRP','failed','2026-07-06 17:00:40','2026-07-06 20:00:40.923194',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(992,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 584.68.',-1.0,'BNB','failed','2026-07-06 17:02:45','2026-07-06 20:02:45.474956',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(993,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1568.',1.0,'XRP','failed','2026-07-06 17:04:18','2026-07-06 20:04:18.685413',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(994,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 8.034.',-1.0,'LINK','failed','2026-07-06 17:06:11','2026-07-06 20:06:11.963668',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(995,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 8.046.',1.0,'LINK','failed','2026-07-06 17:08:26','2026-07-06 20:08:26.931951',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(996,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.948.',1.0,'AVAX','failed','2026-07-06 17:10:41','2026-07-06 20:10:41.247137',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(997,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.926.',-1.0,'AVAX','failed','2026-07-06 17:12:46','2026-07-06 20:12:46.456853',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(998,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63864.76.',1.0,'BTC','failed','2026-07-06 17:14:50','2026-07-06 20:14:50.626557',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(999,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 8.043.',-0.2,'LINK','failed','2026-07-06 17:16:35','2026-07-06 20:16:35.681430',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1000,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 81.98.',-1.0,'SOL','failed','2026-07-06 17:18:19','2026-07-06 20:18:19.821241',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1001,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1794.97.',1.0,'ETH','failed','2026-07-06 17:20:54','2026-07-06 20:20:54.516536',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1002,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 8.026.',-1.0,'LINK','failed','2026-07-06 17:22:38','2026-07-06 20:22:38.831610',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1003,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 8.026.',1.0,'LINK','failed','2026-07-06 17:24:33','2026-07-06 20:24:33.958717',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1004,10,'CMC ALERT: PYR is heavily pumping! 1-hour change: 18.99075524%. 24h Volume: $7,283,025.',0.8,'PYR','processed','2026-07-06 17:24:39','2026-07-06 20:24:39.591686',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1005,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 585.62.',0.85,'BNB','failed','2026-07-06 17:26:38','2026-07-06 20:26:38.627104',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1006,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1846.',-1.0,'ADA','processed','2026-07-06 17:29:12','2026-07-06 20:29:12.215007',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1007,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 584.95.',1.0,'BNB','failed','2026-07-06 17:30:56','2026-07-06 20:30:56.898599',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1008,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1563.',-1.0,'XRP','failed','2026-07-06 17:33:02','2026-07-06 20:33:02.125199',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1009,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63800.0.',-1.0,'BTC','failed','2026-07-06 17:35:06','2026-07-06 20:35:06.239731',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1010,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1790.06.',-1.0,'ETH','failed','2026-07-06 17:36:51','2026-07-06 20:36:51.282166',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1011,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.66.',0.9,'SOL','failed','2026-07-06 17:38:46','2026-07-06 20:38:46.314141',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1012,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 584.03.',1.0,'BNB','failed','2026-07-06 17:41:01','2026-07-06 20:41:01.957320',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1013,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 583.42.',-1.0,'BNB','failed','2026-07-06 17:42:46','2026-07-06 20:42:46.342346',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1014,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 81.59.',-1.0,'SOL','failed','2026-07-06 17:44:30','2026-07-06 20:44:30.180593',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1015,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 583.48.',-1.0,'BNB','failed','2026-07-06 17:46:04','2026-07-06 20:46:04.913441',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1016,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 583.48.',1.0,'BNB','failed','2026-07-06 17:47:58','2026-07-06 20:47:58.141791',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1017,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63680.01.',-1.0,'BTC','failed','2026-07-06 17:50:02','2026-07-06 20:50:02.647419',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1018,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 81.81.',0.8,'SOL','failed','2026-07-06 17:52:07','2026-07-06 20:52:07.452016',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1019,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 81.65.',0.7,'SOL','failed','2026-07-06 17:54:22','2026-07-06 20:54:22.080456',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1020,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.915.',0.8,'AVAX','failed','2026-07-06 17:56:07','2026-07-06 20:56:07.344895',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1021,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1787.79.',0.8,'ETH','failed','2026-07-06 17:57:41','2026-07-06 20:57:41.677939',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1022,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.66.',1.0,'SOL','failed','2026-07-06 17:59:36','2026-07-06 20:59:36.264589',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1023,10,'CMC ALERT: COLLECT is heavily pumping! 1-hour change: 7.39303642%. 24h Volume: $2,572,673.',0.7,'COLLECT','failed','2026-07-06 18:01:42','2026-07-06 21:01:42.028338',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1024,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 583.07.',1.0,'BNB','failed','2026-07-06 18:02:00','2026-07-06 21:02:00.400808',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1025,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1477.',-1.0,'XRP','failed','2026-07-06 18:04:03','2026-07-06 21:04:03.369415',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1026,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1835.',-1.0,'ADA','failed','2026-07-06 18:06:08','2026-07-06 21:06:08.050478',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1027,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1789.68.',1.0,'ETH','failed','2026-07-06 18:07:52','2026-07-06 21:07:52.762640',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1028,10,'CMC ALERT: ES is heavily pumping! 1-hour change: 7.18079955%. 24h Volume: $8,613,256.',0.8,'ES','failed','2026-07-06 18:09:54','2026-07-06 21:09:54.252318',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1029,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.53.',1.0,'SOL','failed','2026-07-06 18:09:56','2026-07-06 21:09:56.714719',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1030,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 583.86.',1.0,'BNB','failed','2026-07-06 18:12:09','2026-07-06 21:12:09.959376',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1031,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.922.',1.0,'AVAX','failed','2026-07-06 18:14:15','2026-07-06 21:14:15.047109',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1032,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 81.44.',-1.0,'SOL','failed','2026-07-06 18:15:49','2026-07-06 21:15:49.646181',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1033,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.924.',-1.0,'AVAX','failed','2026-07-06 18:17:33','2026-07-06 21:17:33.925910',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1034,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 81.33.',-1.0,'SOL','failed','2026-07-06 18:19:28','2026-07-06 21:19:28.724138',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1035,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.52.',1.0,'SOL','failed','2026-07-06 18:21:23','2026-07-06 21:21:23.493770',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1036,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 81.6.',-1.0,'SOL','failed','2026-07-06 18:23:37','2026-07-06 21:23:37.147345',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1037,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 8.01.',1.0,'LINK','failed','2026-07-06 18:25:51','2026-07-06 21:25:51.345098',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1038,10,'CMC ALERT: MAT is heavily pumping! 1-hour change: 41.07863276%. 24h Volume: $1,004,858.',1.0,'MAT','failed','2026-07-06 18:28:01','2026-07-06 21:28:01.935778',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1039,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1794.22.',-1.0,'ETH','failed','2026-07-06 18:28:15','2026-07-06 21:28:15.754298',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1040,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63739.14.',-1.0,'BTC','failed','2026-07-06 18:30:09','2026-07-06 21:30:09.684376',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1041,4,'🚨 NEW CRYPTO TRADE ALERT 📈🔥

🔹 TRADE: SOL LONG
🔹 Pair: SOL/USDT
🔹 Risk: HIGH
🔹 Leverage: 3x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 11.2%

🕰️ Validity: till 08 Jul 2026, 11:58 PM

🔸 Entry: $81.53

🎯 Take Profit (TP) 1: $83.05
🎯 Take Profit (TP) 2: $84.57

🛑 Stop Loss (SL): $80.01

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',1.0,'SOL','failed','2026-07-06 18:30:42','2026-07-06 21:30:42.872256',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1042,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1448.',-1.0,'XRP','failed','2026-07-06 18:32:04','2026-07-06 21:32:04.292979',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1043,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63752.0.',0.7,'BTC','failed','2026-07-06 18:33:58','2026-07-06 21:33:58.527072',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1044,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 584.23.',-1.0,'BNB','failed','2026-07-06 18:35:53','2026-07-06 21:35:53.604145',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1045,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63808.0.',1.0,'BTC','failed','2026-07-06 18:37:48','2026-07-06 21:37:48.201419',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1046,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 8.024.',1.0,'LINK','failed','2026-07-06 18:39:52','2026-07-06 21:39:52.750959',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1047,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.183.',0.7,'ADA','failed','2026-07-06 18:42:37','2026-07-06 21:42:37.795904',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1048,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1467.',0.3,'XRP','failed','2026-07-06 18:44:32','2026-07-06 21:44:32.944341',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1049,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 8.023.',1.0,'LINK','failed','2026-07-06 18:46:18','2026-07-06 21:46:18.148072',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1050,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 8.007.',1.0,'LINK','failed','2026-07-06 18:48:52','2026-07-06 21:48:52.327839',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1051,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1794.0.',-1.0,'ETH','failed','2026-07-06 18:50:38','2026-07-06 21:50:38.016309',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1052,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 584.93.',0.8,'BNB','failed','2026-07-06 18:52:43','2026-07-06 21:52:43.684737',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1053,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1794.62.',-1.0,'ETH','failed','2026-07-06 18:54:37','2026-07-06 21:54:37.569604',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1054,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1793.32.',1.0,'ETH','failed','2026-07-06 18:56:52','2026-07-06 21:56:52.673381',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1055,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1792.58.',1.0,'ETH','failed','2026-07-06 18:59:27','2026-07-06 21:59:27.314661',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1056,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1479.',1.0,'XRP','failed','2026-07-06 19:01:31','2026-07-06 22:01:31.902565',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1057,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 81.96.',-1.0,'SOL','failed','2026-07-06 19:04:07','2026-07-06 22:04:07.092938',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1058,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1467.',1.0,'XRP','failed','2026-07-06 19:06:13','2026-07-06 22:06:13.829018',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1059,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 584.42.',-0.7,'BNB','failed','2026-07-06 19:07:48','2026-07-06 22:07:48.289053',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1060,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.966.',-1.0,'AVAX','failed','2026-07-06 19:09:43','2026-07-06 22:09:43.354159',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1061,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1835.',1.0,'ADA','failed','2026-07-06 19:12:17','2026-07-06 22:12:17.750176',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1062,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.97.',1.0,'AVAX','failed','2026-07-06 19:14:11','2026-07-06 22:14:11.821327',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1063,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 584.92.',1.0,'BNB','failed','2026-07-06 19:15:56','2026-07-06 22:15:56.114498',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1064,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1455.',-1.0,'XRP','failed','2026-07-06 19:17:50','2026-07-06 22:17:50.646722',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1065,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1796.02.',1.0,'ETH','failed','2026-07-06 19:19:58','2026-07-06 22:19:58.017423',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1066,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 584.74.',1.0,'BNB','failed','2026-07-06 19:22:13','2026-07-06 22:22:13.491766',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1067,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 8.025.',-1.0,'LINK','failed','2026-07-06 19:24:18','2026-07-06 22:24:18.127588',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1068,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1497.',-1.0,'XRP','failed','2026-07-06 19:26:22','2026-07-06 22:26:22.058560',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1069,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63845.3.',1.0,'BTC','failed','2026-07-06 19:28:15','2026-07-06 22:28:16.002823',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1070,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1845.',1.0,'ADA','failed','2026-07-06 19:30:10','2026-07-06 22:30:10.467812',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1071,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63790.67.',0.8,'BTC','failed','2026-07-06 19:31:54','2026-07-06 22:31:54.438395',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1072,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63800.67.',0.3,'BTC','failed','2026-07-06 19:33:38','2026-07-06 22:33:38.457349',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1073,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 82.03.',-1.0,'SOL','failed','2026-07-06 19:35:53','2026-07-06 22:35:53.217209',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1074,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1509.',-1.0,'XRP','failed','2026-07-06 19:37:47','2026-07-06 22:37:47.740314',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1075,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1794.54.',-0.6,'ETH','failed','2026-07-06 19:40:11','2026-07-06 22:40:11.909934',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1076,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 585.42.',-0.7,'BNB','failed','2026-07-06 19:42:17','2026-07-06 22:42:17.382117',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1077,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1497.',-1.0,'XRP','failed','2026-07-06 19:44:43','2026-07-06 22:44:43.243775',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1078,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.98.',-1.0,'AVAX','failed','2026-07-06 19:46:57','2026-07-06 22:46:57.992121',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1079,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 82.06.',1.0,'SOL','failed','2026-07-06 19:48:31','2026-07-06 22:48:31.563208',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1080,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.98.',-1.0,'AVAX','failed','2026-07-06 19:50:24','2026-07-06 22:50:24.936160',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1081,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 81.98.',-1.0,'SOL','failed','2026-07-06 19:52:28','2026-07-06 22:52:28.702650',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1082,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1843.',-1.0,'ADA','failed','2026-07-06 19:54:11','2026-07-06 22:54:11.997256',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1083,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1476.',-1.0,'XRP','failed','2026-07-06 19:56:45','2026-07-06 22:56:45.705933',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1084,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1794.82.',0.8,'ETH','failed','2026-07-06 19:58:59','2026-07-06 22:58:59.649510',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1085,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 82.01.',-1.0,'SOL','failed','2026-07-06 20:00:43','2026-07-06 23:00:43.085947',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1086,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63623.03.',1.0,'BTC','failed','2026-07-06 20:02:26','2026-07-06 23:02:26.655109',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1087,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1834.',-1.0,'ADA','failed','2026-07-06 20:04:32','2026-07-06 23:04:32.031756',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1088,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.927.',0.8,'AVAX','failed','2026-07-06 20:06:56','2026-07-06 23:06:56.356266',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1089,10,'CMC ALERT: KAIO is heavily pumping! 1-hour change: 6.80858812%. 24h Volume: $2,216,904.',0.7,'KAIO','failed','2026-07-06 20:08:15','2026-07-06 23:08:15.424714',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1090,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.99.',1.0,'LINK','failed','2026-07-06 20:08:31','2026-07-06 23:08:31.017683',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1091,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.916.',1.0,'AVAX','failed','2026-07-06 20:10:45','2026-07-06 23:10:45.564801',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1092,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.98.',-1.0,'LINK','failed','2026-07-06 20:12:59','2026-07-06 23:12:59.862830',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1093,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1428.',1.0,'XRP','failed','2026-07-06 20:15:05','2026-07-06 23:15:05.636859',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1094,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1789.06.',-1.0,'ETH','failed','2026-07-06 20:16:49','2026-07-06 23:16:49.818808',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1095,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63611.12.',-1.0,'BTC','failed','2026-07-06 20:19:04','2026-07-06 23:19:04.032512',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1096,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 583.74.',-1.0,'BNB','failed','2026-07-06 20:21:18','2026-07-06 23:21:18.438888',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1097,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63662.01.',1.0,'BTC','failed','2026-07-06 20:23:03','2026-07-06 23:23:03.218192',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1098,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63667.5.',0.8,'BTC','failed','2026-07-06 20:25:06','2026-07-06 23:25:06.445478',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1099,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.915.',1.0,'AVAX','failed','2026-07-06 20:27:11','2026-07-06 23:27:11.283993',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1100,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1834.',0.7,'ADA','failed','2026-07-06 20:29:05','2026-07-06 23:29:05.899175',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1101,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63770.9.',0.8,'BTC','failed','2026-07-06 20:30:49','2026-07-06 23:30:49.333638',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1102,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 82.15.',-1.0,'SOL','failed','2026-07-06 20:33:02','2026-07-06 23:33:02.776002',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1103,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 8.016.',0.8,'LINK','failed','2026-07-06 20:35:36','2026-07-06 23:35:36.816176',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1104,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.924.',-1.0,'AVAX','failed','2026-07-06 20:37:40','2026-07-06 23:37:40.396636',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1105,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.146.',1.0,'XRP','failed','2026-07-06 20:40:14','2026-07-06 23:40:14.725901',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1106,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 585.97.',0.7,'BNB','failed','2026-07-06 20:41:49','2026-07-06 23:41:49.652623',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1107,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63819.38.',1.0,'BTC','failed','2026-07-06 20:43:34','2026-07-06 23:43:34.949154',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1108,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 585.26.',-1.0,'BNB','failed','2026-07-06 20:46:09','2026-07-06 23:46:09.743011',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1109,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.908.',-1.0,'AVAX','failed','2026-07-06 20:47:55','2026-07-06 23:47:55.437236',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1110,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1443.',1.0,'XRP','failed','2026-07-06 20:49:31','2026-07-06 23:49:31.827211',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1111,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.912.',-1.0,'AVAX','failed','2026-07-06 20:51:45','2026-07-06 23:51:45.557169',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1112,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1796.18.',-1.0,'ETH','failed','2026-07-06 20:54:00','2026-07-06 23:54:00.857380',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1113,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 586.02.',-0.6,'BNB','failed','2026-07-06 20:56:44','2026-07-06 23:56:44.629991',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1114,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 82.15.',1.0,'SOL','failed','2026-07-06 20:59:08','2026-07-06 23:59:08.165260',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1115,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1794.34.',1.0,'ETH','failed','2026-07-06 21:01:22','2026-07-07 00:01:22.027067',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1116,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 82.07.',1.0,'SOL','failed','2026-07-06 21:03:15','2026-07-07 00:03:15.691726',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1117,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.922.',0.8,'AVAX','failed','2026-07-06 21:05:19','2026-07-07 00:05:19.186758',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1118,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 82.23.',1.0,'SOL','failed','2026-07-06 21:07:43','2026-07-07 00:07:43.339613',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1119,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 591.29.',0.8,'BNB','failed','2026-07-06 21:10:16','2026-07-07 00:10:16.496025',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1120,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1597.',-1.0,'XRP','failed','2026-07-06 21:12:49','2026-07-07 00:12:49.919771',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1121,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 8.109.',1.0,'LINK','failed','2026-07-06 21:14:33','2026-07-07 00:14:33.379661',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1122,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.158.',1.0,'XRP','failed','2026-07-06 21:16:27','2026-07-07 00:16:27.092220',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1123,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 8.106.',-1.0,'LINK','failed','2026-07-06 21:18:20','2026-07-07 00:18:20.898104',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1124,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1849.',0.7,'ADA','failed','2026-07-06 21:20:24','2026-07-07 00:20:24.806702',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1125,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.185.',-1.0,'ADA','failed','2026-07-06 21:22:19','2026-07-07 00:22:19.395677',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1126,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1564.',0.75,'XRP','failed','2026-07-06 21:24:16','2026-07-07 00:24:16.783798',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1127,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 64227.58.',-1.0,'BTC','failed','2026-07-06 21:26:41','2026-07-07 00:26:41.927470',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1128,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1531.',0.8,'XRP','failed','2026-07-06 21:28:27','2026-07-07 00:28:27.261562',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1129,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1852.',-1.0,'ADA','failed','2026-07-06 21:30:42','2026-07-07 00:30:42.014072',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1130,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 64262.01.',1.0,'BTC','failed','2026-07-06 21:32:47','2026-07-07 00:32:47.337695',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1131,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1521.',0.8,'XRP','failed','2026-07-06 21:34:32','2026-07-07 00:34:32.769507',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1132,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 82.55.',1.0,'SOL','failed','2026-07-06 21:36:28','2026-07-07 00:36:28.086139',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1133,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.984.',1.0,'AVAX','failed','2026-07-06 21:38:32','2026-07-07 00:38:32.716746',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1134,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 8.059.',-1.0,'LINK','failed','2026-07-06 21:40:47','2026-07-07 00:40:47.570909',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1135,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 8.059.',-1.0,'LINK','failed','2026-07-06 21:42:21','2026-07-07 00:42:21.882621',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1136,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 8.059.',-1.0,'LINK','failed','2026-07-06 21:44:36','2026-07-07 00:44:36.685089',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1137,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1813.83.',1.0,'ETH','failed','2026-07-06 21:46:32','2026-07-07 00:46:32.042575',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1138,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 82.53.',1.0,'SOL','failed','2026-07-06 21:48:26','2026-07-07 00:48:26.869068',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1139,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1814.11.',0.8,'ETH','failed','2026-07-06 21:50:32','2026-07-07 00:50:32.165852',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1140,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 82.85.',-1.0,'SOL','failed','2026-07-06 21:52:57','2026-07-07 00:52:57.566686',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1141,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 64446.52.',1.0,'BTC','failed','2026-07-06 21:55:21','2026-07-07 00:55:21.844990',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1142,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 7.009.',1.0,'AVAX','failed','2026-07-06 21:57:46','2026-07-07 00:57:46.535771',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1143,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 64462.52.',1.0,'BTC','failed','2026-07-06 22:00:00','2026-07-07 01:00:00.072568',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1144,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 8.095.',1.0,'LINK','failed','2026-07-06 22:02:25','2026-07-07 01:02:25.645983',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1145,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1527.',0.8,'XRP','failed','2026-07-06 22:04:49','2026-07-07 01:04:49.716527',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1146,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1812.23.',-1.0,'ETH','failed','2026-07-06 22:07:14','2026-07-07 01:07:14.818020',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1147,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 8.084.',0.8,'LINK','failed','2026-07-06 22:09:18','2026-07-07 01:09:18.194274',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1148,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 82.64.',0.8,'SOL','failed','2026-07-06 22:11:23','2026-07-07 01:11:23.488605',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1149,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1852.',-1.0,'ADA','failed','2026-07-06 22:13:47','2026-07-07 01:13:47.695488',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1150,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1813.53.',0.8,'ETH','failed','2026-07-06 22:15:31','2026-07-07 01:15:31.131771',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1151,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1853.',1.0,'ADA','failed','2026-07-06 22:18:16','2026-07-07 01:18:16.377377',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1152,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 588.48.',1.0,'BNB','failed','2026-07-06 22:20:10','2026-07-07 01:20:10.420083',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1153,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 64362.0.',-1.0,'BTC','failed','2026-07-06 22:22:15','2026-07-07 01:22:15.608451',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1154,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 588.67.',-1.0,'BNB','failed','2026-07-06 22:24:18','2026-07-07 01:24:18.624789',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1155,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 64284.01.',0.8,'BTC','failed','2026-07-06 22:26:03','2026-07-07 01:26:03.219146',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1156,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1508.',1.0,'XRP','failed','2026-07-06 22:28:18','2026-07-07 01:28:18.997138',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1157,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 82.39.',0.7,'SOL','failed','2026-07-06 22:30:34','2026-07-07 01:30:34.089460',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1158,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.185.',-1.0,'ADA','failed','2026-07-06 22:32:39','2026-07-07 01:32:39.477724',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1159,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 64189.33.',-1.0,'BTC','failed','2026-07-06 22:34:54','2026-07-07 01:34:54.252050',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1160,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 8.079.',0.8,'LINK','failed','2026-07-06 22:36:48','2026-07-07 01:36:48.559386',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1161,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 82.49.',-1.0,'SOL','failed','2026-07-06 22:39:23','2026-07-07 01:39:23.600702',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1162,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 64225.98.',1.0,'BTC','failed','2026-07-06 22:41:16','2026-07-07 01:41:16.709598',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1163,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1851.',-1.0,'ADA','failed','2026-07-06 22:43:31','2026-07-07 01:43:31.800052',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1164,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1807.14.',0.8,'ETH','failed','2026-07-06 22:45:46','2026-07-07 01:45:46.517707',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1165,10,'CMC ALERT: ALON is heavily pumping! 1-hour change: 32.10827924%. 24h Volume: $1,219,120.',0.8,'ALON','failed','2026-07-06 22:45:52','2026-07-07 01:45:52.239577',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1166,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 587.95.',1.0,'BNB','failed','2026-07-06 22:48:01','2026-07-07 01:48:01.809549',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1167,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1847.',-0.7,'ADA','failed','2026-07-06 22:50:05','2026-07-07 01:50:05.953439',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1168,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 82.43.',-1.0,'SOL','failed','2026-07-06 22:52:21','2026-07-07 01:52:21.610812',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1169,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.996.',0.7,'AVAX','failed','2026-07-06 22:54:15','2026-07-07 01:54:15.062528',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1170,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 8.066.',1.0,'LINK','failed','2026-07-06 22:56:00','2026-07-07 01:56:00.166129',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1171,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 82.3.',1.0,'SOL','failed','2026-07-06 22:57:35','2026-07-07 01:57:35.386327',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1172,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 587.96.',1.0,'BNB','failed','2026-07-06 22:59:49','2026-07-07 01:59:49.733708',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1173,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1478.',1.0,'XRP','failed','2026-07-06 23:01:43','2026-07-07 02:01:43.913989',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1174,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 82.39.',-0.6,'SOL','failed','2026-07-06 23:04:08','2026-07-07 02:04:08.745338',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1175,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 64324.47.',0.8,'BTC','failed','2026-07-06 23:06:13','2026-07-07 02:06:13.907064',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1176,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1809.54.',1.0,'ETH','failed','2026-07-06 23:08:58','2026-07-07 02:08:58.596213',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1177,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 588.29.',1.0,'BNB','failed','2026-07-06 23:10:53','2026-07-07 02:10:53.833123',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1178,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 8.057.',-1.0,'LINK','failed','2026-07-06 23:12:48','2026-07-07 02:12:48.281912',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1179,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 7.003.',1.0,'AVAX','failed','2026-07-06 23:14:52','2026-07-07 02:14:52.776121',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1180,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 64264.01.',1.0,'BTC','failed','2026-07-06 23:16:27','2026-07-07 02:16:27.878704',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1181,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.992.',1.0,'AVAX','failed','2026-07-06 23:18:33','2026-07-07 02:18:33.015083',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1182,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 587.23.',1.0,'BNB','failed','2026-07-06 23:20:57','2026-07-07 02:20:57.691954',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1183,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 82.01.',1.0,'SOL','failed','2026-07-06 23:23:02','2026-07-07 02:23:02.310506',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1184,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 82.01.',1.0,'SOL','failed','2026-07-06 23:25:26','2026-07-07 02:25:26.952846',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1185,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 64110.0.',-1.0,'BTC','failed','2026-07-06 23:27:51','2026-07-07 02:27:51.728127',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1186,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 82.16.',1.0,'SOL','failed','2026-07-06 23:30:05','2026-07-07 02:30:05.952355',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1187,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 64145.52.',-1.0,'BTC','failed','2026-07-06 23:32:11','2026-07-07 02:32:11.055196',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1188,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1847.',0.6,'ADA','failed','2026-07-06 23:33:56','2026-07-07 02:33:56.177358',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1189,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1473.',0.8,'XRP','failed','2026-07-06 23:36:11','2026-07-07 02:36:11.390577',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1190,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 587.5.',-1.0,'BNB','failed','2026-07-06 23:37:57','2026-07-07 02:37:57.067784',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1191,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 64090.01.',1.0,'BTC','failed','2026-07-06 23:40:01','2026-07-07 02:40:01.083283',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1192,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1459.',1.0,'XRP','failed','2026-07-06 23:41:54','2026-07-07 02:41:54.716681',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1193,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 8.028.',1.0,'LINK','failed','2026-07-06 23:44:18','2026-07-07 02:44:18.935529',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1194,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1455.',-1.0,'XRP','failed','2026-07-06 23:46:34','2026-07-07 02:46:34.126512',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1195,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.938.',1.0,'AVAX','failed','2026-07-06 23:48:18','2026-07-07 02:48:18.369403',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1196,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 8.02.',-1.0,'LINK','failed','2026-07-06 23:50:12','2026-07-07 02:50:12.214160',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1197,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 8.02.',0.8,'LINK','failed','2026-07-06 23:52:37','2026-07-07 02:52:37.412760',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1198,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 64110.08.',-1.0,'BTC','failed','2026-07-06 23:55:11','2026-07-07 02:55:11.100388',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1199,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 586.0.',-1.0,'BNB','failed','2026-07-06 23:57:15','2026-07-07 02:57:15.727956',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1200,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.926.',-1.0,'AVAX','failed','2026-07-06 23:59:19','2026-07-07 02:59:19.960654',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1201,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1843.',1.0,'ADA','failed','2026-07-07 00:01:25','2026-07-07 03:01:25.258338',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1202,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 8.026.',1.0,'LINK','failed','2026-07-07 00:03:49','2026-07-07 03:03:49.889687',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1203,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1463.',0.8,'XRP','failed','2026-07-07 00:05:44','2026-07-07 03:05:44.972583',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1204,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1459.',-1.0,'XRP','failed','2026-07-07 00:07:39','2026-07-07 03:07:39.687561',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1205,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1446.',0.7,'XRP','failed','2026-07-07 00:09:14','2026-07-07 03:09:14.298584',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1206,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1839.',1.0,'ADA','failed','2026-07-07 00:11:39','2026-07-07 03:11:39.546881',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1207,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1462.',-1.0,'XRP','failed','2026-07-07 00:13:33','2026-07-07 03:13:33.745991',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1208,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 8.021.',1.0,'LINK','failed','2026-07-07 00:15:38','2026-07-07 03:15:38.876832',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1209,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 82.02.',1.0,'SOL','failed','2026-07-07 00:17:44','2026-07-07 03:17:44.620286',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1210,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 82.04.',-1.0,'SOL','failed','2026-07-07 00:19:58','2026-07-07 03:19:58.725821',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1211,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.931.',-1.0,'AVAX','failed','2026-07-07 00:21:53','2026-07-07 03:21:53.907093',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1212,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1488.',-1.0,'XRP','failed','2026-07-07 00:23:49','2026-07-07 03:23:49.540595',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1213,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 587.45.',0.8,'BNB','failed','2026-07-07 00:26:04','2026-07-07 03:26:04.203838',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1214,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1848.',-1.0,'ADA','failed','2026-07-07 00:27:49','2026-07-07 03:27:49.342969',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1215,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.15.',-1.0,'XRP','failed','2026-07-07 00:29:44','2026-07-07 03:29:44.182783',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1216,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1492.',-1.0,'XRP','failed','2026-07-07 00:32:08','2026-07-07 03:32:08.078442',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1217,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 64223.42.',-1.0,'BTC','failed','2026-07-07 00:34:23','2026-07-07 03:34:23.136052',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1218,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 82.44.',-1.0,'SOL','failed','2026-07-07 00:36:27','2026-07-07 03:36:27.425117',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1219,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1800.45.',-1.0,'ETH','failed','2026-07-07 00:38:41','2026-07-07 03:38:41.319332',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1220,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1799.58.',-1.0,'ETH','failed','2026-07-07 00:40:35','2026-07-07 03:40:35.217871',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1221,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1843.',-1.0,'ADA','failed','2026-07-07 00:42:39','2026-07-07 03:42:39.901931',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1222,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 64081.98.',1.0,'BTC','failed','2026-07-07 00:45:14','2026-07-07 03:45:14.330775',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1223,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.9.',-1.0,'AVAX','failed','2026-07-07 00:47:30','2026-07-07 03:47:30.015897',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1224,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 8.033.',1.0,'LINK','failed','2026-07-07 00:49:35','2026-07-07 03:49:35.213176',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1225,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1844.',0.8,'ADA','failed','2026-07-07 00:51:49','2026-07-07 03:51:49.442945',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1226,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1845.',-1.0,'ADA','failed','2026-07-07 00:53:53','2026-07-07 03:53:53.182733',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1227,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.903.',-1.0,'AVAX','failed','2026-07-07 00:56:18','2026-07-07 03:56:18.697893',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1228,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 586.85.',1.0,'BNB','failed','2026-07-07 00:58:23','2026-07-07 03:58:23.925425',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1229,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 64171.99.',1.0,'BTC','failed','2026-07-07 01:00:29','2026-07-07 04:00:29.179015',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1230,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1798.55.',-1.0,'ETH','failed','2026-07-07 01:02:14','2026-07-07 04:02:14.433130',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1231,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1793.53.',1.0,'ETH','failed','2026-07-07 01:04:19','2026-07-07 04:04:19.523775',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1232,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63962.23.',-0.3,'BTC','failed','2026-07-07 01:06:14','2026-07-07 04:06:14.651855',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1233,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.999.',1.0,'LINK','failed','2026-07-07 01:08:19','2026-07-07 04:08:19.298383',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1234,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1841.',-1.0,'ADA','failed','2026-07-07 01:10:04','2026-07-07 04:10:04.044236',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1235,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.888.',1.0,'AVAX','failed','2026-07-07 01:12:09','2026-07-07 04:12:09.323987',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1236,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1445.',-1.0,'XRP','failed','2026-07-07 01:14:05','2026-07-07 04:14:05.033394',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1237,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 82.21.',1.0,'SOL','failed','2026-07-07 01:16:30','2026-07-07 04:16:30.266568',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1238,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1797.21.',1.0,'ETH','failed','2026-07-07 01:18:35','2026-07-07 04:18:35.458304',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1239,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 584.13.',-1.0,'BNB','failed','2026-07-07 01:20:09','2026-07-07 04:20:09.416346',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1240,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 82.19.',1.0,'SOL','failed','2026-07-07 01:22:25','2026-07-07 04:22:25.123011',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1241,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 64018.0.',1.0,'BTC','failed','2026-07-07 01:24:19','2026-07-07 04:24:19.470036',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1242,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1844.',1.0,'ADA','failed','2026-07-07 01:26:54','2026-07-07 04:26:54.208291',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1243,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1793.17.',0.4,'ETH','failed','2026-07-07 01:29:27','2026-07-07 04:29:27.686013',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1244,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1833.',1.0,'ADA','failed','2026-07-07 01:31:32','2026-07-07 04:31:32.280928',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1245,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 8.015.',-0.7,'LINK','failed','2026-07-07 01:33:07','2026-07-07 04:33:07.397648',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1246,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 8.015.',1.0,'LINK','failed','2026-07-07 01:35:33','2026-07-07 04:35:33.014534',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1247,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.887.',1.0,'AVAX','failed','2026-07-07 01:37:47','2026-07-07 04:37:47.669889',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1248,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 82.17.',-1.0,'SOL','failed','2026-07-07 01:39:31','2026-07-07 04:39:31.361742',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1249,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1792.87.',0.8,'ETH','failed','2026-07-07 01:41:35','2026-07-07 04:41:35.464665',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1250,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1832.',1.0,'ADA','failed','2026-07-07 01:43:20','2026-07-07 04:43:20.040521',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1251,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.85.',-1.0,'AVAX','failed','2026-07-07 01:45:14','2026-07-07 04:45:14.090524',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1252,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 583.64.',-0.7,'BNB','failed','2026-07-07 01:46:49','2026-07-07 04:46:49.185374',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1253,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1796.97.',1.0,'ETH','failed','2026-07-07 01:48:54','2026-07-07 04:48:54.397793',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1254,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63979.26.',-1.0,'BTC','failed','2026-07-07 01:51:29','2026-07-07 04:51:29.545872',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1255,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 8.015.',-1.0,'LINK','failed','2026-07-07 01:53:14','2026-07-07 04:53:14.607872',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1256,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 82.03.',-1.0,'SOL','failed','2026-07-07 01:54:58','2026-07-07 04:54:58.624190',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1257,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 583.13.',1.0,'BNB','failed','2026-07-07 01:57:23','2026-07-07 04:57:23.298170',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1258,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.842.',-1.0,'AVAX','failed','2026-07-07 01:59:26','2026-07-07 04:59:26.933790',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1259,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 81.98.',0.85,'SOL','failed','2026-07-07 02:01:32','2026-07-07 05:01:32.044147',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1260,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 582.93.',-1.0,'BNB','failed','2026-07-07 02:03:27','2026-07-07 05:03:27.157901',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1261,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 583.48.',-1.0,'BNB','failed','2026-07-07 02:05:22','2026-07-07 05:05:22.321728',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1262,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.984.',0.4,'LINK','failed','2026-07-07 02:07:37','2026-07-07 05:07:37.583180',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1263,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1790.86.',1.0,'ETH','failed','2026-07-07 02:09:51','2026-07-07 05:09:51.555527',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1264,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1836.',1.0,'ADA','failed','2026-07-07 02:11:46','2026-07-07 05:11:46.651212',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1265,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1837.',-1.0,'ADA','failed','2026-07-07 02:14:01','2026-07-07 05:14:01.948741',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1266,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63816.01.',-1.0,'BTC','failed','2026-07-07 02:15:47','2026-07-07 05:15:47.645418',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1267,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63780.53.',-1.0,'BTC','failed','2026-07-07 02:17:52','2026-07-07 05:17:52.417409',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1268,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63796.68.',0.7,'BTC','failed','2026-07-07 02:19:37','2026-07-07 05:19:37.610497',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1269,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 81.74.',-1.0,'SOL','failed','2026-07-07 02:21:41','2026-07-07 05:21:41.734715',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1270,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.821.',-1.0,'AVAX','failed','2026-07-07 02:23:46','2026-07-07 05:23:46.977456',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1271,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63625.0.',0.6,'BTC','failed','2026-07-07 02:25:51','2026-07-07 05:25:51.668216',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1272,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1825.',1.0,'ADA','failed','2026-07-07 02:27:56','2026-07-07 05:27:56.788946',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1273,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 581.49.',-1.0,'BNB','failed','2026-07-07 02:29:40','2026-07-07 05:29:40.727792',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1274,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.814.',-1.0,'AVAX','failed','2026-07-07 02:31:45','2026-07-07 05:31:45.365362',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1275,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1821.',1.0,'ADA','failed','2026-07-07 02:33:20','2026-07-07 05:33:20.514490',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1276,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 580.33.',0.8,'BNB','failed','2026-07-07 02:35:34','2026-07-07 05:35:34.239949',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1277,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1783.01.',-1.0,'ETH','failed','2026-07-07 02:37:48','2026-07-07 05:37:48.409012',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1278,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1819.',1.0,'ADA','failed','2026-07-07 02:39:32','2026-07-07 05:39:32.116348',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1279,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 581.83.',1.0,'BNB','failed','2026-07-07 02:41:17','2026-07-07 05:41:17.158739',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1280,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 582.15.',-1.0,'BNB','failed','2026-07-07 02:43:11','2026-07-07 05:43:11.764666',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1281,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1784.45.',-1.0,'ETH','failed','2026-07-07 02:45:45','2026-07-07 05:45:45.562058',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1282,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 582.34.',1.0,'BNB','failed','2026-07-07 02:47:40','2026-07-07 05:47:40.111516',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1283,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1781.5.',-1.0,'ETH','failed','2026-07-07 02:49:34','2026-07-07 05:49:34.726919',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1284,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.942.',-1.0,'LINK','failed','2026-07-07 02:52:09','2026-07-07 05:52:09.433940',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1285,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1779.09.',-1.0,'ETH','failed','2026-07-07 02:54:14','2026-07-07 05:54:14.602652',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1286,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 580.61.',-1.0,'BNB','failed','2026-07-07 02:55:58','2026-07-07 05:55:58.910214',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1287,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 580.54.',-1.0,'BNB','failed','2026-07-07 02:57:54','2026-07-07 05:57:54.484944',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1288,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1778.5.',1.0,'ETH','failed','2026-07-07 02:59:58','2026-07-07 05:59:58.458846',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1289,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.819.',-1.0,'AVAX','failed','2026-07-07 03:02:33','2026-07-07 06:02:33.675943',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1290,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1318.',1.0,'XRP','failed','2026-07-07 03:04:08','2026-07-07 06:04:08.281012',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1291,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1779.03.',-1.0,'ETH','failed','2026-07-07 03:06:32','2026-07-07 06:06:32.892946',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1292,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63388.9.',-1.0,'BTC','failed','2026-07-07 03:08:37','2026-07-07 06:08:37.692455',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1293,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1781.11.',-1.0,'ETH','failed','2026-07-07 03:10:23','2026-07-07 06:10:23.243975',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1294,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.825.',-1.0,'AVAX','failed','2026-07-07 03:12:08','2026-07-07 06:12:08.304169',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1295,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.915.',1.0,'LINK','failed','2026-07-07 03:14:23','2026-07-07 06:14:23.928046',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1296,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1817.',1.0,'ADA','failed','2026-07-07 03:16:29','2026-07-07 06:16:29.121494',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1297,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 81.32.',1.0,'SOL','failed','2026-07-07 03:18:34','2026-07-07 06:18:34.441126',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1298,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 580.15.',1.0,'BNB','failed','2026-07-07 03:21:00','2026-07-07 06:21:00.011537',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1299,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1312.',-1.0,'XRP','failed','2026-07-07 03:23:14','2026-07-07 06:23:14.769056',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1300,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.27.',1.0,'SOL','failed','2026-07-07 03:25:18','2026-07-07 06:25:18.869596',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1301,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1812.',1.0,'ADA','failed','2026-07-07 03:27:44','2026-07-07 06:27:44.445567',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1302,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.891.',1.0,'LINK','failed','2026-07-07 03:29:18','2026-07-07 06:29:18.573705',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1303,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1811.',-1.0,'ADA','failed','2026-07-07 03:31:02','2026-07-07 06:31:02.310087',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1304,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1814.',1.0,'ADA','failed','2026-07-07 03:33:17','2026-07-07 06:33:17.338157',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1305,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.901.',0.7,'LINK','failed','2026-07-07 03:35:22','2026-07-07 06:35:22.038847',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1306,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 81.25.',0.8,'SOL','failed','2026-07-07 03:37:27','2026-07-07 06:37:27.299572',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1307,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 81.24.',-1.0,'SOL','failed','2026-07-07 03:39:02','2026-07-07 06:39:02.530737',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1308,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 579.64.',-1.0,'BNB','failed','2026-07-07 03:41:16','2026-07-07 06:41:16.754598',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1309,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1812.',0.8,'ADA','failed','2026-07-07 03:43:10','2026-07-07 06:43:10.886572',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1310,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1771.58.',-1.0,'ETH','failed','2026-07-07 03:45:05','2026-07-07 06:45:05.246621',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1311,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.8.',-1.0,'AVAX','failed','2026-07-07 03:47:00','2026-07-07 06:47:00.482334',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1312,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1770.73.',1.0,'ETH','failed','2026-07-07 03:49:05','2026-07-07 06:49:05.319069',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1313,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1770.72.',-1.0,'ETH','failed','2026-07-07 03:51:10','2026-07-07 06:51:10.207204',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1314,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 81.06.',-1.0,'SOL','failed','2026-07-07 03:53:04','2026-07-07 06:53:04.948334',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1315,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 578.88.',1.0,'BNB','failed','2026-07-07 03:55:09','2026-07-07 06:55:09.380398',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1316,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.796.',-1.0,'AVAX','failed','2026-07-07 03:57:34','2026-07-07 06:57:34.554022',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1317,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.796.',1.0,'AVAX','failed','2026-07-07 03:59:38','2026-07-07 06:59:38.507005',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1318,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1772.27.',-1.0,'ETH','failed','2026-07-07 04:01:22','2026-07-07 07:01:22.823572',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1319,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1769.09.',1.0,'ETH','failed','2026-07-07 04:03:17','2026-07-07 07:03:17.053066',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1320,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 579.03.',-1.0,'BNB','failed','2026-07-07 04:05:00','2026-07-07 07:05:00.683601',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1321,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63202.0.',0.8,'BTC','failed','2026-07-07 04:07:16','2026-07-07 07:07:16.833614',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1322,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.788.',0.8,'AVAX','failed','2026-07-07 04:09:11','2026-07-07 07:09:11.626824',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1323,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.882.',-1.0,'LINK','failed','2026-07-07 04:11:26','2026-07-07 07:11:26.811598',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1324,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 81.01.',0.8,'SOL','failed','2026-07-07 04:13:20','2026-07-07 07:13:20.221814',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1325,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1279.',-1.0,'XRP','failed','2026-07-07 04:15:13','2026-07-07 07:15:13.982095',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1326,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1771.11.',1.0,'ETH','failed','2026-07-07 04:17:21','2026-07-07 07:17:21.952767',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1327,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63184.01.',1.0,'BTC','failed','2026-07-07 04:19:06','2026-07-07 07:19:06.592168',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1328,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1771.54.',-1.0,'ETH','failed','2026-07-07 04:21:40','2026-07-07 07:21:40.605005',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1329,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.772.',1.0,'AVAX','failed','2026-07-07 04:24:06','2026-07-07 07:24:06.220186',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1330,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.126.',0.6,'XRP','failed','2026-07-07 04:25:51','2026-07-07 07:25:51.487351',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1331,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.126.',1.0,'XRP','failed','2026-07-07 04:27:56','2026-07-07 07:27:56.621344',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1332,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 81.01.',-1.0,'SOL','failed','2026-07-07 04:30:01','2026-07-07 07:30:01.128368',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1333,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.774.',-1.0,'AVAX','failed','2026-07-07 04:31:36','2026-07-07 07:31:36.873667',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1334,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1276.',1.0,'XRP','failed','2026-07-07 04:33:39','2026-07-07 07:33:39.881474',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1335,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.876.',1.0,'LINK','failed','2026-07-07 04:36:14','2026-07-07 07:36:14.625936',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1336,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.868.',-1.0,'LINK','failed','2026-07-07 04:38:37','2026-07-07 07:38:37.718583',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1337,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 578.62.',1.0,'BNB','failed','2026-07-07 04:40:32','2026-07-07 07:40:32.767150',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1338,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1801.',1.0,'ADA','failed','2026-07-07 04:42:57','2026-07-07 07:42:57.918527',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1339,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.868.',1.0,'LINK','failed','2026-07-07 04:44:51','2026-07-07 07:44:51.469515',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1340,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 80.85.',-1.0,'SOL','failed','2026-07-07 04:46:55','2026-07-07 07:46:55.760198',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1341,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 578.26.',1.0,'BNB','failed','2026-07-07 04:49:20','2026-07-07 07:49:20.922321',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1342,10,'CMC ALERT: OPG is heavily pumping! 1-hour change: 46.45079471%. 24h Volume: $34,688,700.',0.8,'OPG','processed','2026-07-07 04:50:18','2026-07-07 07:50:18.658933',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1343,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1796.',1.0,'ADA','failed','2026-07-07 04:51:15','2026-07-07 07:51:15.116275',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1344,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1798.',-1.0,'ADA','failed','2026-07-07 04:53:09','2026-07-07 07:53:09.778274',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1345,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 80.82.',0.8,'SOL','failed','2026-07-07 04:55:04','2026-07-07 07:55:04.356227',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1346,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1246.',-1.0,'XRP','failed','2026-07-07 04:56:39','2026-07-07 07:56:39.123916',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1347,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.763.',1.0,'AVAX','failed','2026-07-07 04:58:44','2026-07-07 07:58:44.360568',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1348,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1255.',1.0,'XRP','failed','2026-07-07 05:00:37','2026-07-07 08:00:37.400914',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1349,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63089.99.',-1.0,'BTC','failed','2026-07-07 05:02:42','2026-07-07 08:02:42.542891',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1350,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.125.',1.0,'XRP','failed','2026-07-07 05:04:46','2026-07-07 08:04:46.681769',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1351,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 80.91.',0.8,'SOL','failed','2026-07-07 05:06:41','2026-07-07 08:06:41.482771',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1352,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.859.',-1.0,'LINK','failed','2026-07-07 05:08:26','2026-07-07 08:08:26.675894',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1353,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 80.78.',1.0,'SOL','failed','2026-07-07 05:10:01','2026-07-07 08:10:01.096443',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1354,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 578.46.',0.8,'BNB','failed','2026-07-07 05:12:05','2026-07-07 08:12:05.711279',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1355,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1796.',-1.0,'ADA','failed','2026-07-07 05:14:00','2026-07-07 08:14:00.971655',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1356,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 577.06.',-1.0,'BNB','failed','2026-07-07 05:16:15','2026-07-07 08:16:15.665662',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1357,10,'CMC ALERT: ACP is heavily pumping! 1-hour change: 11.01805627%. 24h Volume: $2,355,346.',0.7,'ACP','failed','2026-07-07 05:17:47','2026-07-07 08:17:47.124126',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1358,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1228.',-1.0,'XRP','failed','2026-07-07 05:17:59','2026-07-07 08:17:59.773415',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1359,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1221.',1.0,'XRP','failed','2026-07-07 05:20:14','2026-07-07 08:20:14.165905',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1360,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 80.48.',1.0,'SOL','failed','2026-07-07 05:22:09','2026-07-07 08:22:09.862381',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1361,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1762.62.',1.0,'ETH','failed','2026-07-07 05:23:54','2026-07-07 08:23:54.552560',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1362,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1761.45.',-1.0,'ETH','failed','2026-07-07 05:26:09','2026-07-07 08:26:09.330723',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1363,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1792.',1.0,'ADA','failed','2026-07-07 05:28:14','2026-07-07 08:28:14.046770',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1364,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62949.87.',1.0,'BTC','failed','2026-07-07 05:30:18','2026-07-07 08:30:18.672003',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1365,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.857.',-1.0,'LINK','failed','2026-07-07 05:32:03','2026-07-07 08:32:03.834766',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1366,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 80.87.',-1.0,'SOL','failed','2026-07-07 05:33:58','2026-07-07 08:33:58.958659',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1367,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 579.0.',0.7,'BNB','failed','2026-07-07 05:36:04','2026-07-07 08:36:04.143529',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1368,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 578.96.',1.0,'BNB','failed','2026-07-07 05:37:58','2026-07-07 08:37:58.085942',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1369,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 81.05.',-0.3,'SOL','failed','2026-07-07 05:40:02','2026-07-07 08:40:02.159822',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1370,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1285.',1.0,'XRP','failed','2026-07-07 05:41:57','2026-07-07 08:41:57.225987',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1371,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1769.12.',-1.0,'ETH','failed','2026-07-07 05:43:42','2026-07-07 08:43:42.483443',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1372,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1803.',0.7,'ADA','failed','2026-07-07 05:45:56','2026-07-07 08:45:56.849033',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1373,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 81.06.',-1.0,'SOL','failed','2026-07-07 05:47:51','2026-07-07 08:47:51.227491',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1374,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1769.01.',-1.0,'ETH','failed','2026-07-07 05:49:55','2026-07-07 08:49:55.227458',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1375,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.883.',0.7,'LINK','failed','2026-07-07 05:51:50','2026-07-07 08:51:50.247297',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1376,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1287.',0.7,'XRP','failed','2026-07-07 05:53:34','2026-07-07 08:53:34.417200',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1377,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1805.',1.0,'ADA','failed','2026-07-07 05:55:29','2026-07-07 08:55:29.551759',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1378,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.767.',1.0,'AVAX','failed','2026-07-07 05:57:14','2026-07-07 08:57:14.155811',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1379,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63137.99.',-1.0,'BTC','failed','2026-07-07 05:58:49','2026-07-07 08:58:49.424925',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1380,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1275.',1.0,'XRP','failed','2026-07-07 06:00:23','2026-07-07 09:00:23.537465',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1381,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 81.1.',0.8,'SOL','failed','2026-07-07 06:01:58','2026-07-07 09:01:58.581579',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1382,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.18.',1.0,'ADA','failed','2026-07-07 06:03:43','2026-07-07 09:03:43.465088',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1383,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63091.06.',1.0,'BTC','failed','2026-07-07 06:05:47','2026-07-07 09:05:47.338910',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1384,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.891.',0.8,'LINK','failed','2026-07-07 06:07:42','2026-07-07 09:07:42.830857',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1385,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1769.11.',-1.0,'ETH','failed','2026-07-07 06:09:26','2026-07-07 09:09:26.034747',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1386,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63070.01.',-1.0,'BTC','failed','2026-07-07 06:11:40','2026-07-07 09:11:40.178302',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1387,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 578.1.',-1.0,'BNB','failed','2026-07-07 06:13:24','2026-07-07 09:13:24.393581',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1388,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 81.01.',-1.0,'SOL','failed','2026-07-07 06:15:58','2026-07-07 09:15:58.964756',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1389,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63101.11.',-1.0,'BTC','failed','2026-07-07 06:18:04','2026-07-07 09:18:04.508985',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1390,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.743.',-1.0,'AVAX','failed','2026-07-07 06:20:18','2026-07-07 09:20:18.113797',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1391,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.881.',-1.0,'LINK','failed','2026-07-07 06:22:02','2026-07-07 09:22:02.261456',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1392,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.881.',-1.0,'LINK','failed','2026-07-07 06:24:06','2026-07-07 09:24:06.383354',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1393,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63101.47.',1.0,'BTC','failed','2026-07-07 06:26:09','2026-07-07 09:26:09.380604',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1394,4,'🚨 NEW CRYPTO TRADE ALERT 📈🔥

🔹 TRADE: AAVE LONG
🔹 Pair: AAVE/USDT
🔹 Risk: HIGH
🔹 Leverage: 3x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 11%

🕰️ Validity: till 09 Jul 2026, 11:55 AM

🔸 Entry: $92.35

🎯 Take Profit (TP) 1: $94.05
🎯 Take Profit (TP) 2: $95.75

🛑 Stop Loss (SL): $90.65

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',0.8,'AAVE','failed','2026-07-07 06:27:50','2026-07-07 09:27:50.571073',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1395,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63133.23.',1.0,'BTC','failed','2026-07-07 06:27:54','2026-07-07 09:27:54.074379',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1396,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 579.27.',1.0,'BNB','failed','2026-07-07 06:30:07','2026-07-07 09:30:07.918142',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1397,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1797.',1.0,'ADA','failed','2026-07-07 06:31:42','2026-07-07 09:31:43.002585',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1398,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 579.06.',-1.0,'BNB','failed','2026-07-07 06:33:26','2026-07-07 09:33:26.486172',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1399,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.13.',-1.0,'XRP','failed','2026-07-07 06:35:30','2026-07-07 09:35:30.919132',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1400,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63264.15.',1.0,'BTC','failed','2026-07-07 06:37:44','2026-07-07 09:37:44.991665',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1401,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.919.',1.0,'LINK','failed','2026-07-07 06:40:08','2026-07-07 09:40:08.056781',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1402,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 579.91.',1.0,'BNB','failed','2026-07-07 06:42:01','2026-07-07 09:42:01.128745',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1403,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1805.',0.75,'ADA','failed','2026-07-07 06:43:56','2026-07-07 09:43:56.172169',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1404,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.36.',1.0,'SOL','failed','2026-07-07 06:45:51','2026-07-07 09:45:51.698379',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1405,10,'CMC ALERT: TOESCOIN is heavily pumping! 1-hour change: 17.61505728%. 24h Volume: $1,000,289.',0.6,'TOESCOIN','failed','2026-07-07 06:47:29','2026-07-07 09:47:29.999028',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1406,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.774.',-1.0,'AVAX','failed','2026-07-07 06:47:46','2026-07-07 09:47:46.929267',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1407,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63295.0.',1.0,'BTC','failed','2026-07-07 06:49:41','2026-07-07 09:49:41.977768',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1408,4,'🚨 NEW CRYPTO TRADE ALERT 📈🔥

🔹 TRADE: BTC LONG
🔹 Pair: BTC/USDT
🔹 Risk: HIGH
🔹 Leverage: 6x
🔹 Risk Reward Ratio: 1:4
🔹 Potential Profit: 21.3%

🕰️ Validity: till 09 Jul 2026, 12:18 PM

🔸 Entry: $63282.8

🎯 Take Profit (TP) 1: $63844.8
🎯 Take Profit (TP) 2: $65530.8

🛑 Stop Loss (SL): $62720.8

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',1.0,'BTC','failed','2026-07-07 06:50:10','2026-07-07 09:50:10.747662',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1409,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.933.',1.0,'LINK','failed','2026-07-07 06:51:26','2026-07-07 09:51:26.979385',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1410,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.778.',0.1,'AVAX','failed','2026-07-07 06:53:41','2026-07-07 09:53:41.391829',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1411,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1779.88.',-0.1,'ETH','failed','2026-07-07 06:56:06','2026-07-07 09:56:06.717219',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1412,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1326.',1.0,'XRP','failed','2026-07-07 06:58:11','2026-07-07 09:58:11.832562',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1413,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1326.',1.0,'XRP','failed','2026-07-07 07:00:05','2026-07-07 10:00:05.856494',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1414,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 81.62.',1.0,'SOL','failed','2026-07-07 07:02:21','2026-07-07 10:02:21.035848',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1415,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1812.',-1.0,'ADA','failed','2026-07-07 07:04:05','2026-07-07 10:04:05.241773',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1416,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 579.64.',-1.0,'BNB','failed','2026-07-07 07:05:50','2026-07-07 10:05:50.882728',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1417,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1780.2.',-0.3,'ETH','failed','2026-07-07 07:08:25','2026-07-07 10:08:25.929078',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1418,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 579.63.',1.0,'BNB','failed','2026-07-07 07:09:59','2026-07-07 10:09:59.062559',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1419,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63352.01.',-1.0,'BTC','failed','2026-07-07 07:11:52','2026-07-07 10:11:52.725020',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1420,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.935.',1.0,'LINK','failed','2026-07-07 07:13:57','2026-07-07 10:13:57.816751',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1421,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1811.',-1.0,'ADA','failed','2026-07-07 07:16:02','2026-07-07 10:16:02.996059',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1422,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.181.',-1.0,'ADA','failed','2026-07-07 07:17:47','2026-07-07 10:17:47.130096',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1423,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63341.27.',0.8,'BTC','failed','2026-07-07 07:20:21','2026-07-07 10:20:21.325663',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1424,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.938.',0.4,'LINK','failed','2026-07-07 07:22:35','2026-07-07 10:22:35.897556',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1425,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.181.',-1.0,'ADA','failed','2026-07-07 07:24:39','2026-07-07 10:24:39.062995',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1426,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1327.',-1.0,'XRP','failed','2026-07-07 07:26:43','2026-07-07 10:26:43.775617',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1427,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.935.',-1.0,'LINK','failed','2026-07-07 07:28:38','2026-07-07 10:28:38.312628',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1428,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1317.',-1.0,'XRP','failed','2026-07-07 07:30:32','2026-07-07 10:30:32.172050',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1429,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.937.',1.0,'LINK','failed','2026-07-07 07:32:17','2026-07-07 10:32:17.384326',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1430,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1803.',-1.0,'ADA','failed','2026-07-07 07:34:01','2026-07-07 10:34:01.566921',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1431,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 578.71.',1.0,'BNB','failed','2026-07-07 07:36:36','2026-07-07 10:36:36.323498',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1432,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1279.',-1.0,'XRP','failed','2026-07-07 07:38:40','2026-07-07 10:38:40.885329',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1433,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63121.55.',-1.0,'BTC','failed','2026-07-07 07:40:56','2026-07-07 10:40:56.394083',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1434,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 579.08.',1.0,'BNB','failed','2026-07-07 07:42:31','2026-07-07 10:42:31.599322',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1435,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63176.01.',-1.0,'BTC','failed','2026-07-07 07:44:25','2026-07-07 10:44:25.661712',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1436,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.929.',1.0,'LINK','failed','2026-07-07 07:46:50','2026-07-07 10:46:50.279952',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1437,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 579.16.',1.0,'BNB','failed','2026-07-07 07:49:25','2026-07-07 10:49:25.441104',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1438,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.935.',-1.0,'LINK','failed','2026-07-07 07:51:49','2026-07-07 10:51:49.116982',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1439,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.935.',-1.0,'LINK','failed','2026-07-07 07:54:13','2026-07-07 10:54:13.705837',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1440,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.919.',1.0,'LINK','failed','2026-07-07 07:56:08','2026-07-07 10:56:08.493734',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1441,1,'VIP MARKET UPDATE: $SOL
➖➖➖➖➖➖➖
$SOL is trading around 81.06 and this setup has played out beautifully since the entry near the mid June lows. We''re currently sitting on 108% profit (5x) from this call, and price has already tagged 4 out of 8 targets on the way up along that rising trendline.

Structure remains firmly bullish above the 65.00 zone that''s held as solid support since the breakout. Holding above 81.00 keeps the path clear toward the remaining targets, with 84.00 as the next level in sight.
➖➖➖➖➖➖➖
- Binance Killers®',9.0,'SOL','processed','2026-07-07 07:57:09','2026-07-07 10:57:09.360751',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1442,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.914.',-1.0,'LINK','failed','2026-07-07 07:58:23','2026-07-07 10:58:23.253619',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1443,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1771.47.',-1.0,'ETH','failed','2026-07-07 08:00:16','2026-07-07 11:00:16.578107',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1444,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 81.48.',1.0,'SOL','failed','2026-07-07 08:02:30','2026-07-07 11:02:30.753663',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1445,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.39.',1.0,'SOL','failed','2026-07-07 08:04:15','2026-07-07 11:04:15.455204',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1446,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1768.72.',-1.0,'ETH','failed','2026-07-07 08:06:29','2026-07-07 11:06:29.177809',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1447,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 81.29.',-1.0,'SOL','failed','2026-07-07 08:08:43','2026-07-07 11:08:43.790705',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1448,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63078.74.',-1.0,'BTC','failed','2026-07-07 08:10:58','2026-07-07 11:10:58.914579',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1449,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 577.75.',-1.0,'BNB','failed','2026-07-07 08:13:04','2026-07-07 11:13:04.118233',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1450,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.42.',1.0,'SOL','failed','2026-07-07 08:15:28','2026-07-07 11:15:28.108064',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1451,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1793.',-1.0,'ADA','failed','2026-07-07 08:17:21','2026-07-07 11:17:21.041320',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1452,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.752.',1.0,'AVAX','failed','2026-07-07 08:19:34','2026-07-07 11:19:34.554185',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1453,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63142.3.',-1.0,'BTC','failed','2026-07-07 08:21:39','2026-07-07 11:21:39.202621',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1454,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 81.54.',-1.0,'SOL','failed','2026-07-07 08:23:12','2026-07-07 11:23:12.282959',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1455,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 577.87.',-1.0,'BNB','failed','2026-07-07 08:25:25','2026-07-07 11:25:25.716655',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1456,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.752.',0.7,'AVAX','failed','2026-07-07 08:27:10','2026-07-07 11:27:10.166791',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1457,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 577.28.',1.0,'BNB','failed','2026-07-07 08:29:23','2026-07-07 11:29:23.906967',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1458,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63047.99.',-1.0,'BTC','failed','2026-07-07 08:31:58','2026-07-07 11:31:58.019544',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1459,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1258.',-1.0,'XRP','failed','2026-07-07 08:34:11','2026-07-07 11:34:11.431329',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1460,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.179.',1.0,'ADA','failed','2026-07-07 08:35:56','2026-07-07 11:35:56.150867',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1461,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 81.41.',1.0,'SOL','failed','2026-07-07 08:38:20','2026-07-07 11:38:20.111075',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1462,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1770.41.',1.0,'ETH','failed','2026-07-07 08:40:34','2026-07-07 11:40:34.676161',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1463,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 577.89.',-1.0,'BNB','failed','2026-07-07 08:42:18','2026-07-07 11:42:18.492757',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1464,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1769.03.',1.0,'ETH','failed','2026-07-07 08:44:22','2026-07-07 11:44:22.128248',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1465,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 577.66.',1.0,'BNB','failed','2026-07-07 08:46:07','2026-07-07 11:46:07.338253',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1466,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 81.38.',0.8,'SOL','failed','2026-07-07 08:48:22','2026-07-07 11:48:22.138114',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1467,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.751.',-1.0,'AVAX','failed','2026-07-07 08:50:05','2026-07-07 11:50:05.570605',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1468,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 81.46.',-1.0,'SOL','failed','2026-07-07 08:51:59','2026-07-07 11:51:59.279724',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1469,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63050.86.',-1.0,'BTC','failed','2026-07-07 08:54:03','2026-07-07 11:54:03.467267',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1470,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.893.',1.0,'LINK','failed','2026-07-07 08:55:37','2026-07-07 11:55:37.135242',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1471,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1258.',0.8,'XRP','failed','2026-07-07 08:57:42','2026-07-07 11:57:42.826930',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1472,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1793.',1.0,'ADA','failed','2026-07-07 09:00:07','2026-07-07 12:00:07.905295',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1473,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 576.82.',1.0,'BNB','failed','2026-07-07 09:01:42','2026-07-07 12:01:42.635818',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1474,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 577.71.',-1.0,'BNB','failed','2026-07-07 09:03:47','2026-07-07 12:03:47.314333',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1475,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.762.',0.8,'AVAX','failed','2026-07-07 09:05:52','2026-07-07 12:05:52.378386',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1476,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63151.21.',0.8,'BTC','failed','2026-07-07 09:07:26','2026-07-07 12:07:26.606427',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1477,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.759.',1.0,'AVAX','failed','2026-07-07 09:09:01','2026-07-07 12:09:01.688808',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1478,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.75.',-1.0,'AVAX','failed','2026-07-07 09:11:35','2026-07-07 12:11:35.797316',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1479,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.44.',1.0,'SOL','failed','2026-07-07 09:13:20','2026-07-07 12:13:20.979383',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1480,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 578.11.',0.6,'BNB','failed','2026-07-07 09:15:04','2026-07-07 12:15:04.980903',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1481,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1774.39.',-1.0,'ETH','failed','2026-07-07 09:16:59','2026-07-07 12:16:59.124367',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1482,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1272.',-1.0,'XRP','failed','2026-07-07 09:19:34','2026-07-07 12:19:34.305378',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1483,4,'🚨 NEW CRYPTO TRADE ALERT 📈🔥

🔹 TRADE: LINK LONG
🔹 Pair: LINK/USDT
🔹 Risk: HIGH
🔹 Leverage: 4x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 11.5%

🕰️ Validity: till 09 Jul 2026, 02:47 PM

🔸 Entry: $7.915

🎯 Take Profit (TP) 1: $8.029
🎯 Take Profit (TP) 2: $8.143

🛑 Stop Loss (SL): $7.801

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',1.0,'LINK','failed','2026-07-07 09:20:11','2026-07-07 12:20:11.429830',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1484,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 577.63.',-1.0,'BNB','failed','2026-07-07 09:21:29','2026-07-07 12:21:29.832175',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1485,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1264.',-1.0,'XRP','failed','2026-07-07 09:23:24','2026-07-07 12:23:24.538733',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1486,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.783.',1.0,'AVAX','failed','2026-07-07 09:25:28','2026-07-07 12:25:28.797990',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1487,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 577.68.',-1.0,'BNB','failed','2026-07-07 09:27:13','2026-07-07 12:27:13.161037',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1488,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 81.29.',-1.0,'SOL','failed','2026-07-07 09:28:57','2026-07-07 12:28:57.349159',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1489,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63170.0.',0.8,'BTC','failed','2026-07-07 09:30:51','2026-07-07 12:30:51.505923',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1490,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1773.81.',0.6,'ETH','failed','2026-07-07 09:33:36','2026-07-07 12:33:36.723167',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1491,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 577.6.',-1.0,'BNB','failed','2026-07-07 09:35:42','2026-07-07 12:35:42.301571',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1492,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 81.2.',-1.0,'SOL','failed','2026-07-07 09:37:57','2026-07-07 12:37:57.370515',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1493,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 577.59.',1.0,'BNB','failed','2026-07-07 09:39:42','2026-07-07 12:39:42.433272',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1494,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.77.',-1.0,'AVAX','failed','2026-07-07 09:41:56','2026-07-07 12:41:56.621270',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1495,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63274.01.',0.6,'BTC','failed','2026-07-07 09:44:01','2026-07-07 12:44:01.242740',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1496,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1787.',1.0,'ADA','failed','2026-07-07 09:46:14','2026-07-07 12:46:14.222084',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1497,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.769.',1.0,'AVAX','failed','2026-07-07 09:48:28','2026-07-07 12:48:28.875779',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1498,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63296.01.',1.0,'BTC','failed','2026-07-07 09:50:33','2026-07-07 12:50:33.458841',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1499,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1787.',-1.0,'ADA','failed','2026-07-07 09:52:38','2026-07-07 12:52:38.726469',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1500,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 577.79.',-1.0,'BNB','failed','2026-07-07 09:54:53','2026-07-07 12:54:53.301668',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1501,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63240.68.',1.0,'BTC','failed','2026-07-07 09:56:47','2026-07-07 12:56:47.935647',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1502,10,'CMC ALERT: OBOL is heavily pumping! 1-hour change: 12.51874797%. 24h Volume: $2,041,993.',8.0,'OBOL','processed','2026-07-07 09:58:32','2026-07-07 12:58:32.352615',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1503,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 81.34.',1.0,'SOL','failed','2026-07-07 09:58:53','2026-07-07 12:58:53.154226',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1504,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.912.',-1.0,'LINK','failed','2026-07-07 10:00:47','2026-07-07 13:00:47.808363',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1505,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 81.4.',-1.0,'SOL','failed','2026-07-07 10:02:53','2026-07-07 13:02:53.427263',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1506,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63429.99.',1.0,'BTC','failed','2026-07-07 10:05:17','2026-07-07 13:05:17.131044',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1507,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1781.49.',-1.0,'ETH','failed','2026-07-07 10:07:20','2026-07-07 13:07:20.576794',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1508,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 579.01.',1.0,'BNB','failed','2026-07-07 10:09:49','2026-07-07 13:09:49.692208',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1509,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 81.44.',-1.0,'SOL','failed','2026-07-07 10:12:24','2026-07-07 13:12:24.143475',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1510,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.933.',-1.0,'LINK','failed','2026-07-07 10:13:59','2026-07-07 13:13:59.213193',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1511,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.783.',1.0,'AVAX','failed','2026-07-07 10:16:24','2026-07-07 13:16:24.948475',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1512,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.179.',1.0,'ADA','failed','2026-07-07 10:18:19','2026-07-07 13:18:19.230257',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1513,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.791.',0.7,'AVAX','failed','2026-07-07 10:20:14','2026-07-07 13:20:14.805433',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1514,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.791.',-1.0,'AVAX','failed','2026-07-07 10:21:59','2026-07-07 13:21:59.803066',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1515,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.784.',0.6,'AVAX','failed','2026-07-07 10:23:45','2026-07-07 13:23:45.097526',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1516,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1781.42.',1.0,'ETH','failed','2026-07-07 10:25:51','2026-07-07 13:25:51.033279',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1517,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.959.',-1.0,'LINK','failed','2026-07-07 10:27:46','2026-07-07 13:27:46.854600',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1518,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 81.22.',-1.0,'SOL','failed','2026-07-07 10:29:21','2026-07-07 13:29:21.911181',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1519,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.769.',1.0,'AVAX','failed','2026-07-07 10:31:37','2026-07-07 13:31:37.667003',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1520,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63261.05.',-1.0,'BTC','failed','2026-07-07 10:35:26','2026-07-07 13:35:26.944269',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1521,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.939.',-1.0,'LINK','failed','2026-07-07 10:41:24','2026-07-07 13:41:24.959578',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1522,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.14.',1.0,'SOL','failed','2026-07-07 10:43:21','2026-07-07 13:43:21.223088',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1523,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63272.38.',0.7,'BTC','failed','2026-07-07 10:45:36','2026-07-07 13:45:36.721425',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1524,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1777.02.',-1.0,'ETH','failed','2026-07-07 10:47:32','2026-07-07 13:47:32.219473',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1525,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 578.77.',1.0,'BNB','failed','2026-07-07 10:49:17','2026-07-07 13:49:17.248549',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1526,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.913.',-1.0,'LINK','failed','2026-07-07 10:51:52','2026-07-07 13:51:52.850582',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1527,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.902.',1.0,'LINK','failed','2026-07-07 11:04:38','2026-07-07 14:04:38.478475',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1528,6,'Bitcoin can fall below $58K if one of its ''cleanest'' metrics copies history: Analysis. <p style="float: right; margin: 0 0 10px 15px; width: 240px;"><img alt="Bitcoin can fall below $58K if one of its ''cleanest'' metrics copies history: Analysis" class="type:primaryImage" src="https://s3-images.ctmedia.io/media/article-covers/analys-analytics-building-window-glass-red.jpg" /></p><p>Bitcoin NUPL metric data suggested that BTC price action should make new cycle lows in order to preserve historical patterns.</p>',2.0,'BTC','processed','2026-07-07 11:05:19','2026-07-07 14:05:19.051582',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1529,10,'CMC ALERT: TST is heavily pumping! 1-hour change: 12.78744517%. 24h Volume: $15,660,220.',0.8,'TST','processed','2026-07-07 11:05:27','2026-07-07 14:05:27.988092',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1530,10,'CMC ALERT: STAR is heavily pumping! 1-hour change: 7.04204268%. 24h Volume: $8,138,573.',0.7,'STAR','failed','2026-07-07 11:05:36','2026-07-07 14:05:36.961676',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1531,10,'CMC ALERT: OBT is heavily pumping! 1-hour change: 12.04932054%. 24h Volume: $2,452,006.',0.7,'OBT','failed','2026-07-07 11:06:15','2026-07-07 14:06:15.045517',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1532,10,'CMC ALERT: APEPE is heavily pumping! 1-hour change: 8.81747421%. 24h Volume: $21,463,381.',0.7,'APEPE','failed','2026-07-07 11:06:24','2026-07-07 14:06:24.136174',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1533,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63218.16.',1.0,'BTC','failed','2026-07-07 11:07:27','2026-07-07 14:07:27.548735',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1534,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.902.',0.6,'LINK','failed','2026-07-07 11:09:22','2026-07-07 14:09:22.732145',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1535,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1771.',0.6,'ADA','processed','2026-07-07 11:11:27','2026-07-07 14:11:27.460674',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1536,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 578.01.',0.8,'BNB','failed','2026-07-07 11:13:22','2026-07-07 14:13:22.647159',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1537,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63145.99.',-1.0,'BTC','failed','2026-07-07 11:16:07','2026-07-07 14:16:07.784841',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1538,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.76.',-1.0,'AVAX','failed','2026-07-07 11:18:32','2026-07-07 14:18:32.638115',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1539,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63183.46.',-1.0,'BTC','failed','2026-07-07 11:20:58','2026-07-07 14:20:58.021629',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1540,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 578.24.',1.0,'BNB','failed','2026-07-07 11:23:12','2026-07-07 14:23:12.718426',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1541,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 80.98.',1.0,'SOL','failed','2026-07-07 11:24:57','2026-07-07 14:24:58.004567',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1542,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1777.06.',1.0,'ETH','failed','2026-07-07 11:27:12','2026-07-07 14:27:12.116073',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1543,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1777.11.',-1.0,'ETH','failed','2026-07-07 11:29:06','2026-07-07 14:29:06.844633',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1544,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 80.97.',-1.0,'SOL','failed','2026-07-07 11:31:11','2026-07-07 14:31:12.003706',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1545,10,'CMC ALERT: AGT is heavily pumping! 1-hour change: 6.34288507%. 24h Volume: $24,511,581.',0.7,'AGT','failed','2026-07-07 11:32:36','2026-07-07 14:32:36.128305',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1546,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 578.26.',-1.0,'BNB','failed','2026-07-07 11:33:37','2026-07-07 14:33:37.206739',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1547,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1216.',-1.0,'XRP','failed','2026-07-07 11:35:30','2026-07-07 14:35:30.704537',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1548,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1778.3.',0.6,'ETH','failed','2026-07-07 11:37:46','2026-07-07 14:37:46.284419',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1549,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 81.04.',-1.0,'SOL','failed','2026-07-07 11:40:01','2026-07-07 14:40:01.741525',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1550,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.779.',-1.0,'AVAX','failed','2026-07-07 11:42:05','2026-07-07 14:42:05.796160',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1551,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.08.',1.0,'SOL','failed','2026-07-07 11:43:50','2026-07-07 14:43:50.476304',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1552,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1776.',1.0,'ADA','processed','2026-07-07 11:45:35','2026-07-07 14:45:35.173141',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1553,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1782.89.',0.6,'ETH','failed','2026-07-07 11:47:30','2026-07-07 14:47:30.926158',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1554,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 81.3.',0.7,'SOL','failed','2026-07-07 11:49:26','2026-07-07 14:49:26.092194',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1555,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1256.',-1.0,'XRP','failed','2026-07-07 11:51:30','2026-07-07 14:51:30.836824',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1556,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.924.',1.0,'LINK','failed','2026-07-07 11:53:26','2026-07-07 14:53:26.069090',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1557,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1780.14.',-1.0,'ETH','failed','2026-07-07 11:55:21','2026-07-07 14:55:21.215656',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1558,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.125.',1.0,'XRP','failed','2026-07-07 11:57:45','2026-07-07 14:57:45.255022',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1559,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1780.6.',-1.0,'ETH','failed','2026-07-07 11:59:30','2026-07-07 14:59:30.473579',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1560,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1775.',-1.0,'ADA','processed','2026-07-07 12:01:25','2026-07-07 15:01:25.151765',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1561,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.925.',1.0,'LINK','failed','2026-07-07 12:03:18','2026-07-07 15:03:18.408647',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1562,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 81.56.',-1.0,'SOL','failed','2026-07-07 12:05:22','2026-07-07 15:05:22.666759',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1563,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63739.13.',-1.0,'BTC','failed','2026-07-07 12:07:46','2026-07-07 15:07:46.687579',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1564,10,'CMC ALERT: XPIN is heavily pumping! 1-hour change: 8.08549536%. 24h Volume: $4,178,371.',0.8,'XPIN','failed','2026-07-07 12:08:31','2026-07-07 15:08:31.743473',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1565,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1790.87.',-1.0,'ETH','failed','2026-07-07 12:10:00','2026-07-07 15:10:00.059670',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1566,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.821.',-1.0,'AVAX','processed','2026-07-07 12:12:35','2026-07-07 15:12:35.199286',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1567,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63801.99.',-1.0,'BTC','processed','2026-07-07 12:14:58','2026-07-07 15:14:58.482644',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1568,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1308.',-1.0,'XRP','failed','2026-07-07 12:16:43','2026-07-07 15:16:43.699953',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1569,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 581.38.',-1.0,'BNB','failed','2026-07-07 12:19:18','2026-07-07 15:19:18.334792',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1570,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1302.',-1.0,'XRP','failed','2026-07-07 12:20:53','2026-07-07 15:20:53.997486',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1571,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.805.',-1.0,'AVAX','failed','2026-07-07 12:22:47','2026-07-07 15:22:47.888898',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1572,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1794.',1.0,'ADA','processed','2026-07-07 12:25:00','2026-07-07 15:25:00.827771',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1573,10,'CMC ALERT: HIPPO is heavily pumping! 1-hour change: 7.38496068%. 24h Volume: $3,105,608.',0.8,'HIPPO','failed','2026-07-07 12:26:40','2026-07-07 15:26:40.768863',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1574,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63710.0.',-1.0,'BTC','failed','2026-07-07 12:27:15','2026-07-07 15:27:15.249193',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1575,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.89.',1.0,'SOL','failed','2026-07-07 12:29:19','2026-07-07 15:29:19.834751',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1576,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1309.',1.0,'XRP','failed','2026-07-07 12:30:54','2026-07-07 15:30:54.884419',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1577,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1786.43.',0.8,'ETH','failed','2026-07-07 12:32:38','2026-07-07 15:32:38.499051',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1578,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.799.',-1.0,'AVAX','failed','2026-07-07 12:34:33','2026-07-07 15:34:33.232807',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1579,3,'Shorting #TLM here

Short (10x-20x)

Entry: $0.003136

Reason: Chart looks bearish for it. Worth a short for short-mid term quick profits too.

Targets: $0.002977, $0.002821, $0.002661, $0.002507, $0.002191

Stop-loss: $0.003463',2.0,'TLM','processed','2026-07-07 12:35:30','2026-07-07 15:35:30.201770',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1580,10,'CMC ALERT: QUBIC is heavily pumping! 1-hour change: 7.18497451%. 24h Volume: $1,189,223.',0.8,'QUBIC','failed','2026-07-07 12:35:39','2026-07-07 15:35:39.124742',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1581,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.947.',-1.0,'LINK','failed','2026-07-07 12:36:47','2026-07-07 15:36:47.465289',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1582,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1284.',1.0,'XRP','failed','2026-07-07 12:39:12','2026-07-07 15:39:12.069171',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1583,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1785.35.',1.0,'ETH','failed','2026-07-07 12:41:16','2026-07-07 15:41:16.259451',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1584,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1797.',1.0,'ADA','failed','2026-07-07 12:43:40','2026-07-07 15:43:40.489090',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1585,10,'CMC ALERT: AGLD is heavily pumping! 1-hour change: 6.80459612%. 24h Volume: $12,386,271.',0.8,'AGLD','processed','2026-07-07 12:44:28','2026-07-07 15:44:28.091773',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1586,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63556.01.',-1.0,'BTC','failed','2026-07-07 12:45:54','2026-07-07 15:45:54.133945',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1587,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1782.37.',-1.0,'ETH','failed','2026-07-07 12:48:17','2026-07-07 15:48:17.988591',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1588,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1789.',0.6,'ADA','failed','2026-07-07 12:50:22','2026-07-07 15:50:22.218241',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1589,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 81.53.',-1.0,'SOL','failed','2026-07-07 12:52:36','2026-07-07 15:52:36.674486',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1590,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63501.58.',-1.0,'BTC','failed','2026-07-07 12:54:51','2026-07-07 15:54:51.320320',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1591,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.938.',-1.0,'LINK','failed','2026-07-07 12:57:16','2026-07-07 15:57:16.979405',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1592,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1274.',0.7,'XRP','failed','2026-07-07 12:58:51','2026-07-07 15:58:51.660768',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1593,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 81.44.',-1.0,'SOL','failed','2026-07-07 13:00:45','2026-07-07 16:00:45.958858',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1594,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63440.0.',-1.0,'BTC','failed','2026-07-07 13:03:21','2026-07-07 16:03:21.067416',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1595,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1777.51.',1.0,'ETH','failed','2026-07-07 13:05:35','2026-07-07 16:05:35.169449',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1596,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1239.',-1.0,'XRP','failed','2026-07-07 13:07:29','2026-07-07 16:07:29.500943',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1597,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 579.92.',0.8,'BNB','failed','2026-07-07 13:09:54','2026-07-07 16:09:54.177737',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1598,10,'CMC ALERT: MAGMA is heavily pumping! 1-hour change: 10.07390788%. 24h Volume: $3,627,490.',0.8,'MAGMA','failed','2026-07-07 13:11:40','2026-07-07 16:11:40.014513',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1599,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1237.',1.0,'XRP','failed','2026-07-07 13:11:47','2026-07-07 16:11:47.929441',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1600,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.903.',1.0,'LINK','failed','2026-07-07 13:14:11','2026-07-07 16:14:11.676246',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1601,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63278.72.',-1.0,'BTC','failed','2026-07-07 13:16:17','2026-07-07 16:16:17.154182',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1602,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.179.',-1.0,'ADA','failed','2026-07-07 13:18:12','2026-07-07 16:18:12.990220',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1603,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 81.28.',0.3,'SOL','failed','2026-07-07 13:20:07','2026-07-07 16:20:07.089760',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1604,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.902.',-1.0,'LINK','failed','2026-07-07 13:22:31','2026-07-07 16:22:31.811871',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1605,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63186.52.',1.0,'BTC','failed','2026-07-07 13:24:46','2026-07-07 16:24:46.950149',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1606,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63111.73.',-0.6,'BTC','failed','2026-07-07 13:26:51','2026-07-07 16:26:51.702684',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1607,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1779.',-1.0,'ADA','failed','2026-07-07 13:28:55','2026-07-07 16:28:55.892215',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1608,10,'CMC ALERT: BANANA is heavily pumping! 1-hour change: 24.34045186%. 24h Volume: $11,227,188.',-0.7,'BANANA','failed','2026-07-07 13:29:49','2026-07-07 16:29:49.124437',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1609,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1778.',-1.0,'ADA','failed','2026-07-07 13:30:41','2026-07-07 16:30:41.075438',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1610,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1225.',1.0,'XRP','failed','2026-07-07 13:32:45','2026-07-07 16:32:45.376031',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1611,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1773.34.',-1.0,'ETH','failed','2026-07-07 13:34:40','2026-07-07 16:34:40.057340',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1612,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63053.99.',-1.0,'BTC','failed','2026-07-07 13:36:44','2026-07-07 16:36:44.789310',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1613,10,'CMC ALERT: GROVE is heavily pumping! 1-hour change: 8.20325671%. 24h Volume: $1,535,026.',1.0,'ZEC','processed','2026-07-07 13:38:38','2026-07-07 16:38:38.172090',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1614,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1768.0.',1.0,'ETH','failed','2026-07-07 13:38:49','2026-07-07 16:38:49.862189',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1615,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1767.97.',1.0,'ETH','failed','2026-07-07 13:40:25','2026-07-07 16:40:25.092248',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1616,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 578.04.',-1.0,'BNB','failed','2026-07-07 13:42:38','2026-07-07 16:42:38.084550',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1617,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63079.99.',-1.0,'BTC','failed','2026-07-07 13:44:42','2026-07-07 16:44:42.221271',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1618,6,'Bitcoin nears cycle bottom as over half of supply is held at a loss, says K33. <p style="float: right; margin: 0 0 10px 15px; width: 240px;"><img alt="Bitcoin nears cycle bottom as over half of supply is held at a loss, says K33" class="type:primaryImage" src="https://s3-images.ctmedia.io/media/article-covers/hi-bitcoin-price-prediction-ticking-time-bomb.jpg" /></p><p>K33 said Bitcoin has historically bottomed within weeks of more than half of its circulating supply being held at a loss, with strong one-year returns following in most previous cycles.</p>',1.0,'ZEC','processed','2026-07-07 13:45:53','2026-07-07 16:45:53.942638',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1619,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 81.23.',1.0,'SOL','failed','2026-07-07 13:46:47','2026-07-07 16:46:47.407915',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1620,10,'CMC ALERT: 9BIT is heavily pumping! 1-hour change: 7.71031845%. 24h Volume: $3,616,364.',0.8,'9BIT','failed','2026-07-07 13:47:42','2026-07-07 16:47:42.958770',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1621,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1780.73.',1.0,'ETH','failed','2026-07-07 13:48:32','2026-07-07 16:48:32.038025',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1622,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.773.',-1.0,'AVAX','failed','2026-07-07 13:50:17','2026-07-07 16:50:17.089791',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1623,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 579.02.',-1.0,'BNB','failed','2026-07-07 13:52:10','2026-07-07 16:52:10.701473',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1624,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.125.',1.0,'XRP','failed','2026-07-07 13:53:55','2026-07-07 16:53:55.413933',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1625,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 80.83.',1.0,'SOL','failed','2026-07-07 13:56:11','2026-07-07 16:56:11.165905',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1626,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.747.',0.4,'AVAX','failed','2026-07-07 13:58:25','2026-07-07 16:58:25.890704',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1627,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 577.59.',1.0,'BNB','failed','2026-07-07 14:00:09','2026-07-07 17:00:09.233556',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1628,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63051.54.',-1.0,'BTC','failed','2026-07-07 14:02:22','2026-07-07 17:02:22.744293',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1629,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1773.61.',-1.0,'ETH','failed','2026-07-07 14:04:27','2026-07-07 17:04:27.795048',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1630,10,'CMC ALERT: BOUNTY is heavily pumping! 1-hour change: 8.7693107%. 24h Volume: $1,050,482.',0.7,'BOUNTY','failed','2026-07-07 14:05:54','2026-07-07 17:05:54.817797',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1631,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1234.',-1.0,'XRP','failed','2026-07-07 14:06:31','2026-07-07 17:06:31.492334',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1632,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 81.02.',-1.0,'SOL','failed','2026-07-07 14:08:16','2026-07-07 17:08:16.702076',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1633,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.871.',-1.0,'LINK','failed','2026-07-07 14:10:20','2026-07-07 17:10:20.889475',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1634,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.762.',-1.0,'AVAX','failed','2026-07-07 14:12:13','2026-07-07 17:12:13.855945',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1635,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63098.0.',-1.0,'BTC','failed','2026-07-07 14:14:28','2026-07-07 17:14:28.969178',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1636,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 80.87.',-1.0,'SOL','failed','2026-07-07 14:16:03','2026-07-07 17:16:04.001364',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1637,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1775.',-1.0,'ADA','failed','2026-07-07 14:18:09','2026-07-07 17:18:09.088397',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1638,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 578.1.',-1.0,'BNB','failed','2026-07-07 14:19:54','2026-07-07 17:19:54.181679',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1639,4,'🚨 NEW CRYPTO TRADE ALERT 📈🔥

🔹 TRADE: ZEC LONG
🔹 Pair: ZEC/USDT
🔹 Risk: HIGH
🔹 Leverage: 2x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 6.4%

🕰️ Validity: till 09 Jul 2026, 07:36 PM

🔸 Entry: $459.73

🎯 Take Profit (TP) 1: $467.1
🎯 Take Profit (TP) 2: $474.47

🛑 Stop Loss (SL): $452.36

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',-1.0,'ZEC','failed','2026-07-07 14:20:07','2026-07-07 17:20:07.491445',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1640,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1139.',1.0,'XRP','failed','2026-07-07 14:22:17','2026-07-07 17:22:17.632560',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1641,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.715.',-1.0,'AVAX','failed','2026-07-07 14:24:33','2026-07-07 17:24:33.318015',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1642,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1772.',-1.0,'ADA','failed','2026-07-07 14:26:37','2026-07-07 17:26:37.882260',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1643,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.04.',1.0,'SOL','failed','2026-07-07 14:28:32','2026-07-07 17:28:32.918139',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1644,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 578.94.',1.0,'BNB','failed','2026-07-07 14:30:28','2026-07-07 17:30:28.531067',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1645,10,'CMC ALERT: BLUAI is heavily pumping! 1-hour change: 10.02723373%. 24h Volume: $7,033,861.',0.8,'BLUAI','failed','2026-07-07 14:32:42','2026-07-07 17:32:42.325797',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1646,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.857.',1.0,'LINK','failed','2026-07-07 14:32:52','2026-07-07 17:32:52.873844',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1647,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1164.',-1.0,'XRP','failed','2026-07-07 14:34:58','2026-07-07 17:34:58.425701',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1648,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.176.',-1.0,'ADA','failed','2026-07-07 14:37:11','2026-07-07 17:37:11.707640',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1649,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 576.41.',-1.0,'BNB','failed','2026-07-07 14:39:05','2026-07-07 17:39:05.902165',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1650,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 80.94.',1.0,'SOL','failed','2026-07-07 14:41:40','2026-07-07 17:41:40.012169',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1651,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1126.',-1.0,'XRP','failed','2026-07-07 14:43:25','2026-07-07 17:43:25.202716',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1652,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1770.71.',-1.0,'ETH','failed','2026-07-07 14:45:19','2026-07-07 17:45:19.413785',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1653,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1151.',-1.0,'XRP','failed','2026-07-07 14:47:13','2026-07-07 17:47:13.659611',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1654,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 579.0.',1.0,'BNB','failed','2026-07-07 14:49:08','2026-07-07 17:49:08.248331',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1655,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.711.',0.8,'AVAX','failed','2026-07-07 14:51:53','2026-07-07 17:51:53.450808',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1656,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63313.61.',1.0,'BTC','processed','2026-07-07 14:54:06','2026-07-07 17:54:06.945781',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1657,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63376.01.',1.0,'BTC','failed','2026-07-07 14:56:02','2026-07-07 17:56:02.081796',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1658,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 81.74.',-1.0,'SOL','failed','2026-07-07 14:58:05','2026-07-07 17:58:05.256882',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1659,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1253.',1.0,'XRP','failed','2026-07-07 15:00:10','2026-07-07 18:00:10.719256',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1660,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63606.0.',1.0,'BTC','failed','2026-07-07 15:02:24','2026-07-07 18:02:24.116130',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1661,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1763.',0.7,'ADA','processed','2026-07-07 15:04:39','2026-07-07 18:04:39.166607',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1662,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1216.',1.0,'XRP','processed','2026-07-07 15:06:23','2026-07-07 18:06:23.584101',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1663,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 81.69.',-1.0,'SOL','failed','2026-07-07 15:08:18','2026-07-07 18:08:18.724504',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1664,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.726.',-1.0,'AVAX','failed','2026-07-07 15:10:03','2026-07-07 18:10:03.952976',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1665,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 580.51.',-1.0,'BNB','failed','2026-07-07 15:11:48','2026-07-07 18:11:48.979367',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1666,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63549.76.',1.0,'BTC','failed','2026-07-07 15:14:02','2026-07-07 18:14:02.558112',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1667,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.724.',1.0,'AVAX','failed','2026-07-07 15:16:06','2026-07-07 18:16:06.313812',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1668,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1787.31.',1.0,'ETH','failed','2026-07-07 15:18:30','2026-07-07 18:18:30.865333',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1669,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1236.',-1.0,'XRP','failed','2026-07-07 15:20:46','2026-07-07 18:20:46.504716',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1670,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1249.',1.0,'XRP','failed','2026-07-07 15:22:40','2026-07-07 18:22:40.462810',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1671,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 583.0.',-1.0,'BNB','failed','2026-07-07 15:24:35','2026-07-07 18:24:35.944488',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1672,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.947.',-1.0,'LINK','failed','2026-07-07 15:26:31','2026-07-07 18:26:31.057484',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1673,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.947.',1.0,'LINK','failed','2026-07-07 15:28:16','2026-07-07 18:28:16.321890',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1674,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1767.',1.0,'ADA','failed','2026-07-07 15:30:01','2026-07-07 18:30:01.428495',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1675,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.736.',1.0,'AVAX','failed','2026-07-07 15:31:45','2026-07-07 18:31:45.910180',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1676,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 82.0.',1.0,'SOL','failed','2026-07-07 15:34:21','2026-07-07 18:34:21.120363',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1677,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1306.',-1.0,'XRP','processed','2026-07-07 15:36:24','2026-07-07 18:36:25.000410',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1678,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1775.',-1.0,'ADA','failed','2026-07-07 15:38:19','2026-07-07 18:38:19.496141',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1679,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 82.02.',1.0,'SOL','failed','2026-07-07 15:40:55','2026-07-07 18:40:55.139082',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1680,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 583.39.',-1.0,'BNB','failed','2026-07-07 15:43:08','2026-07-07 18:43:08.827953',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1681,10,'CMC ALERT: XION is heavily pumping! 1-hour change: 7.64877522%. 24h Volume: $1,042,159.',0.7,'XION','failed','2026-07-07 15:45:03','2026-07-07 18:45:03.525109',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1682,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 584.05.',-1.0,'BNB','failed','2026-07-07 15:45:14','2026-07-07 18:45:14.187243',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1683,3,'#TLM Short Signal has achieved our 1st 2nd and 3rd Target✅✅✅

300% profit in 20x Leverage from average entry and 150% profit in 10x Leverage.

Another Big and Good One for Whales crypto 🐋  family',8.0,'TLM','processed','2026-07-07 15:46:32','2026-07-07 18:46:32.786322',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1684,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1778.',-1.0,'ADA','failed','2026-07-07 15:47:08','2026-07-07 18:47:08.490885',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1685,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1322.',-1.0,'XRP','processed','2026-07-07 15:49:14','2026-07-07 18:49:14.045484',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1686,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 8.01.',0.8,'LINK','failed','2026-07-07 15:51:18','2026-07-07 18:51:18.746993',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1687,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 64074.0.',-1.0,'BTC','failed','2026-07-07 15:53:03','2026-07-07 18:53:03.492733',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1688,10,'CMC ALERT: SPELL is heavily pumping! 1-hour change: 14.44125887%. 24h Volume: $6,378,851.',0.8,'SPELL','processed','2026-07-07 15:54:01','2026-07-07 18:54:01.916714',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1689,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 8.018.',1.0,'LINK','failed','2026-07-07 15:54:40','2026-07-07 18:54:40.389714',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1690,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 584.64.',0.8,'BNB','failed','2026-07-07 15:56:26','2026-07-07 18:56:26.524750',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1691,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.778.',1.0,'AVAX','failed','2026-07-07 15:58:32','2026-07-07 18:58:32.251198',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1692,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63920.19.',-1.0,'BTC','failed','2026-07-07 16:00:37','2026-07-07 19:00:37.148288',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1693,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1775.',1.0,'ADA','failed','2026-07-07 16:03:02','2026-07-07 19:03:02.719640',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1694,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63938.0.',1.0,'BTC','failed','2026-07-07 16:05:18','2026-07-07 19:05:18.804497',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1695,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.772.',-1.0,'AVAX','failed','2026-07-07 16:07:44','2026-07-07 19:07:44.633758',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1696,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 8.021.',-1.0,'LINK','failed','2026-07-07 16:09:49','2026-07-07 19:09:49.182301',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1697,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63841.64.',-1.0,'BTC','failed','2026-07-07 16:11:54','2026-07-07 19:11:54.724873',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1698,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63873.99.',-1.0,'BTC','failed','2026-07-07 16:14:20','2026-07-07 19:14:20.608858',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1699,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1773.',-1.0,'ADA','failed','2026-07-07 16:16:14','2026-07-07 19:16:14.994774',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1700,4,'🚨 NEW CRYPTO TRADE ALERT 📈🔥

🔹 TRADE: TAO LONG
🔹 Pair: TAO/USDT
🔹 Risk: HIGH
🔹 Leverage: 2x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 10.2%

🕰️ Validity: till 09 Jul 2026, 09:46 PM

🔸 Entry: $214.46

🎯 Take Profit (TP) 1: $219.94
🎯 Take Profit (TP) 2: $225.42

🛑 Stop Loss (SL): $208.98

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',1.0,'TAO','failed','2026-07-07 16:17:14','2026-07-07 19:17:14.167839',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1701,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 81.94.',-1.0,'SOL','failed','2026-07-07 16:18:10','2026-07-07 19:18:10.456790',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1702,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1798.46.',1.0,'ETH','failed','2026-07-07 16:20:24','2026-07-07 19:20:24.552317',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1703,10,'CMC ALERT: AMP is heavily pumping! 1-hour change: 13.13558611%. 24h Volume: $7,997,656.',0.7,'AMP','processed','2026-07-07 16:21:03','2026-07-07 19:21:03.170461',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1704,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.762.',1.0,'AVAX','failed','2026-07-07 16:22:38','2026-07-07 19:22:38.782100',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1705,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 82.33.',1.0,'SOL','failed','2026-07-07 16:25:03','2026-07-07 19:25:03.670286',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1706,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1778.',-1.0,'ADA','failed','2026-07-07 16:27:19','2026-07-07 19:27:19.456186',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1707,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63996.36.',-1.0,'BTC','failed','2026-07-07 16:29:15','2026-07-07 19:29:15.947806',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1708,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 82.29.',-1.0,'SOL','failed','2026-07-07 16:31:01','2026-07-07 19:31:01.033078',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1709,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63997.99.',-1.0,'BTC','failed','2026-07-07 16:33:06','2026-07-07 19:33:06.292182',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1710,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 82.17.',-1.0,'SOL','failed','2026-07-07 16:35:10','2026-07-07 19:35:10.684781',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1711,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 82.16.',-1.0,'SOL','failed','2026-07-07 16:37:15','2026-07-07 19:37:15.882931',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1712,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1800.66.',1.0,'ETH','failed','2026-07-07 16:39:09','2026-07-07 19:39:09.220255',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1713,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1779.',-1.0,'ADA','failed','2026-07-07 16:41:13','2026-07-07 19:41:13.073298',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1714,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 64018.77.',1.0,'BTC','failed','2026-07-07 16:43:08','2026-07-07 19:43:08.015384',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1715,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 64055.99.',-1.0,'BTC','failed','2026-07-07 16:44:42','2026-07-07 19:44:42.547892',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1716,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 64020.76.',-1.0,'BTC','failed','2026-07-07 16:46:46','2026-07-07 19:46:46.857984',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1717,10,'CMC ALERT: AUDIO is heavily pumping! 1-hour change: 11.90773523%. 24h Volume: $6,956,591.',0.8,'AUDIO','processed','2026-07-07 16:48:04','2026-07-07 19:48:04.107326',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1718,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 8.02.',1.0,'LINK','failed','2026-07-07 16:49:01','2026-07-07 19:49:01.017243',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1719,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 8.024.',1.0,'LINK','failed','2026-07-07 16:51:14','2026-07-07 19:51:14.894252',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1720,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 82.46.',0.7,'SOL','failed','2026-07-07 16:52:58','2026-07-07 19:52:58.110146',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1721,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 64103.92.',0.8,'BTC','failed','2026-07-07 16:55:32','2026-07-07 19:55:32.897268',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1722,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1305.',-1.0,'XRP','processed','2026-07-07 16:57:36','2026-07-07 19:57:36.850717',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1723,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 82.23.',-1.0,'SOL','failed','2026-07-07 16:59:21','2026-07-07 19:59:21.059483',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1724,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 585.11.',-1.0,'BNB','failed','2026-07-07 17:01:24','2026-07-07 20:01:24.729887',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1725,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1773.',1.0,'ADA','processed','2026-07-07 17:03:08','2026-07-07 20:03:08.755518',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1726,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1285.',1.0,'XRP','processed','2026-07-07 17:05:33','2026-07-07 20:05:33.705698',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1727,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1773.',-1.0,'ADA','processed','2026-07-07 17:08:17','2026-07-07 20:08:17.528921',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1728,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 8.006.',1.0,'LINK','failed','2026-07-07 17:10:32','2026-07-07 20:10:32.434061',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1729,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1771.',-1.0,'ADA','processed','2026-07-07 17:12:56','2026-07-07 20:12:56.938701',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1730,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1771.',-1.0,'ADA','processed','2026-07-07 17:15:11','2026-07-07 20:15:11.070720',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1731,10,'CMC ALERT: SDAI is heavily pumping! 1-hour change: 12.26713648%. 24h Volume: $2,369,295.',0.8,'SDAI','failed','2026-07-07 17:15:13','2026-07-07 20:15:13.255849',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1732,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 82.26.',-0.7,'SOL','failed','2026-07-07 17:17:36','2026-07-07 20:17:36.477110',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1733,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 584.5.',1.0,'BNB','failed','2026-07-07 17:19:21','2026-07-07 20:19:21.205252',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1734,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1766.',-0.7,'ADA','processed','2026-07-07 17:21:05','2026-07-07 20:21:05.754751',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1735,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.788.',1.0,'AVAX','processed','2026-07-07 17:22:50','2026-07-07 20:22:50.367844',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1736,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.789.',1.0,'AVAX','processed','2026-07-07 17:25:25','2026-07-07 20:25:25.517125',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1737,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1803.93.',-1.0,'ETH','failed','2026-07-07 17:27:30','2026-07-07 20:27:30.749994',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1738,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.996.',-1.0,'LINK','failed','2026-07-07 17:29:14','2026-07-07 20:29:14.928765',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1739,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 64134.05.',1.0,'BTC','failed','2026-07-07 17:31:18','2026-07-07 20:31:18.613369',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1740,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1804.25.',1.0,'ETH','failed','2026-07-07 17:33:22','2026-07-07 20:33:22.061621',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1741,10,'CMC ALERT: USTC is heavily pumping! 1-hour change: 17.90074471%. 24h Volume: $4,149,727.',-0.6,'USTC','failed','2026-07-07 17:33:22','2026-07-07 20:33:22.488130',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1742,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.996.',-1.0,'LINK','failed','2026-07-07 17:35:35','2026-07-07 20:35:35.595452',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1743,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 64150.0.',1.0,'BTC','failed','2026-07-07 17:37:59','2026-07-07 20:37:59.698023',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1744,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 585.8.',1.0,'BNB','failed','2026-07-07 17:40:02','2026-07-07 20:40:02.952797',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1745,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.789.',-1.0,'AVAX','failed','2026-07-07 17:42:16','2026-07-07 20:42:16.262290',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1746,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.178.',0.7,'ADA','processed','2026-07-07 17:44:49','2026-07-07 20:44:49.602780',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1747,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.789.',-1.0,'AVAX','failed','2026-07-07 17:46:33','2026-07-07 20:46:33.235992',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1748,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 64163.99.',-1.0,'BTC','failed','2026-07-07 17:48:47','2026-07-07 20:48:47.432629',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1749,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 585.62.',-1.0,'BNB','failed','2026-07-07 17:50:42','2026-07-07 20:50:42.153579',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1750,10,'CMC ALERT: BAR is heavily pumping! 1-hour change: 7.39056296%. 24h Volume: $3,938,549.',0.7,'BAR','failed','2026-07-07 17:51:11','2026-07-07 20:51:11.668839',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1751,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1292.',-1.0,'XRP','processed','2026-07-07 17:52:27','2026-07-07 20:52:27.758298',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1752,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 585.93.',-1.0,'BNB','failed','2026-07-07 17:55:03','2026-07-07 20:55:03.385056',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1753,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1778.',-1.0,'ADA','processed','2026-07-07 17:57:17','2026-07-07 20:57:17.083980',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1754,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 82.71.',-1.0,'SOL','processed','2026-07-07 17:59:52','2026-07-07 20:59:52.303433',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1755,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 82.58.',-1.0,'SOL','failed','2026-07-07 18:01:47','2026-07-07 21:01:47.165811',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1756,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1806.31.',1.0,'ETH','failed','2026-07-07 18:03:32','2026-07-07 21:03:32.756093',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1757,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 8.014.',-1.0,'LINK','failed','2026-07-07 18:05:05','2026-07-07 21:05:05.847942',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1758,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1298.',-1.0,'XRP','processed','2026-07-07 18:06:49','2026-07-07 21:06:49.381547',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1759,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 82.36.',1.0,'SOL','failed','2026-07-07 18:09:02','2026-07-07 21:09:02.722830',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1760,10,'CMC ALERT: CLAWD is heavily pumping! 1-hour change: 7.07753515%. 24h Volume: $1,256,903.',0.8,'CLAWD','failed','2026-07-07 18:09:21','2026-07-07 21:09:21.157274',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1761,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 82.35.',-0.6,'SOL','failed','2026-07-07 18:10:56','2026-07-07 21:10:56.021325',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1762,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 64039.42.',-0.7,'BTC','failed','2026-07-07 18:12:39','2026-07-07 21:12:39.290499',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1763,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1301.',-1.0,'XRP','processed','2026-07-07 18:14:32','2026-07-07 21:14:32.705669',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1764,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1296.',1.0,'XRP','processed','2026-07-07 18:16:38','2026-07-07 21:16:38.328325',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1765,10,'CMC ALERT: ORE is heavily pumping! 1-hour change: 7.75429327%. 24h Volume: $1,031,955.',0.8,'ORE','failed','2026-07-07 18:18:13','2026-07-07 21:18:13.328582',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1766,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.981.',-1.0,'LINK','failed','2026-07-07 18:18:21','2026-07-07 21:18:21.989570',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1767,3,'#TLM Short Signal has achieved our 4th Target✅✅✅✅

400% profit in 20x Leverage from average entry and 200% profit in 10x Leverage.

Another Big and Good One for Whales crypto 🐋  family',8.0,'TLM','processed','2026-07-07 18:18:42','2026-07-07 21:18:42.172816',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1768,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1805.3.',1.0,'ETH','failed','2026-07-07 18:20:27','2026-07-07 21:20:27.669383',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1769,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 64081.2.',-1.0,'BTC','failed','2026-07-07 18:22:32','2026-07-07 21:22:32.028970',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1770,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1804.72.',1.0,'ETH','failed','2026-07-07 18:24:45','2026-07-07 21:24:45.623419',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1771,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 584.81.',-1.0,'BNB','failed','2026-07-07 18:26:39','2026-07-07 21:26:39.711389',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1772,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.128.',-1.0,'XRP','processed','2026-07-07 18:28:24','2026-07-07 21:28:24.343289',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1773,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63963.34.',-1.0,'BTC','failed','2026-07-07 18:30:30','2026-07-07 21:30:30.424569',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1774,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63990.99.',1.0,'BTC','failed','2026-07-07 18:32:14','2026-07-07 21:32:14.225840',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1775,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.981.',-1.0,'LINK','failed','2026-07-07 18:33:59','2026-07-07 21:33:59.762594',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1776,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1801.03.',1.0,'ETH','failed','2026-07-07 18:35:44','2026-07-07 21:35:44.044511',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1777,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 64028.0.',-0.6,'BTC','failed','2026-07-07 18:37:39','2026-07-07 21:37:39.602758',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1778,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 584.95.',0.8,'BNB','failed','2026-07-07 18:39:14','2026-07-07 21:39:14.276164',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1779,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.981.',-1.0,'LINK','failed','2026-07-07 18:40:58','2026-07-07 21:40:58.608180',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1780,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.981.',0.85,'LINK','failed','2026-07-07 18:42:54','2026-07-07 21:42:54.178992',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1781,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 64068.06.',-1.0,'BTC','failed','2026-07-07 18:44:58','2026-07-07 21:44:58.970845',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1782,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 8.009.',-1.0,'LINK','failed','2026-07-07 18:47:02','2026-07-07 21:47:02.181624',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1783,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 82.24.',1.0,'SOL','failed','2026-07-07 18:48:47','2026-07-07 21:48:47.430319',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1784,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1222.',1.0,'XRP','processed','2026-07-07 18:50:23','2026-07-07 21:50:23.210002',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1785,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1791.12.',1.0,'ETH','failed','2026-07-07 18:52:28','2026-07-07 21:52:28.429880',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1786,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63776.01.',-1.0,'BTC','failed','2026-07-07 18:54:32','2026-07-07 21:54:32.451573',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1787,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1790.23.',1.0,'ETH','failed','2026-07-07 18:56:26','2026-07-07 21:56:26.446147',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1788,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.12.',1.0,'XRP','processed','2026-07-07 18:58:20','2026-07-07 21:58:20.481137',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1789,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1164.',1.0,'XRP','processed','2026-07-07 19:00:54','2026-07-07 22:00:54.679385',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1790,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.74.',-1.0,'AVAX','processed','2026-07-07 19:02:58','2026-07-07 22:02:58.646063',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1791,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63684.0.',-1.0,'BTC','failed','2026-07-07 19:05:14','2026-07-07 22:05:14.304408',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1792,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.31.',1.0,'SOL','failed','2026-07-07 19:07:10','2026-07-07 22:07:10.751756',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1793,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1162.',1.0,'XRP','processed','2026-07-07 19:08:55','2026-07-07 22:08:55.226506',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1794,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1163.',-1.0,'XRP','processed','2026-07-07 19:10:49','2026-07-07 22:10:49.194026',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1795,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 80.98.',-1.0,'SOL','failed','2026-07-07 19:12:53','2026-07-07 22:12:53.680765',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1796,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.881.',-1.0,'LINK','failed','2026-07-07 19:14:50','2026-07-07 22:14:50.127706',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1797,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1162.',-1.0,'XRP','processed','2026-07-07 19:17:14','2026-07-07 22:17:14.596702',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1798,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63420.0.',-1.0,'BTC','failed','2026-07-07 19:18:58','2026-07-07 22:18:58.777929',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1799,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.877.',-1.0,'LINK','failed','2026-07-07 19:21:13','2026-07-07 22:21:13.595236',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1800,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1781.01.',1.0,'ETH','failed','2026-07-07 19:23:27','2026-07-07 22:23:27.390293',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1801,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1780.18.',0.8,'ETH','failed','2026-07-07 19:25:53','2026-07-07 22:25:53.438580',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1802,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.723.',-1.0,'AVAX','processed','2026-07-07 19:27:48','2026-07-07 22:27:48.259019',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1803,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.176.',1.0,'ADA','processed','2026-07-07 19:29:53','2026-07-07 22:29:53.740658',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1804,10,'CMC ALERT: VR is heavily pumping! 1-hour change: 5.96474035%. 24h Volume: $1,546,811.',0.7,'VR','failed','2026-07-07 19:30:34','2026-07-07 22:30:34.609758',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1805,10,'CMC ALERT: CWT is heavily pumping! 1-hour change: 5.59989145%. 24h Volume: $1,840,280.',0.7,'CWT','failed','2026-07-07 19:30:43','2026-07-07 22:30:43.580396',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1806,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.73.',1.0,'AVAX','processed','2026-07-07 19:32:17','2026-07-07 22:32:17.450535',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1807,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1787.73.',-1.0,'ETH','failed','2026-07-07 19:34:13','2026-07-07 22:34:13.898075',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1808,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1787.94.',-1.0,'ETH','failed','2026-07-07 19:36:37','2026-07-07 22:36:38.000558',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1809,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.92.',1.0,'LINK','failed','2026-07-07 19:39:00','2026-07-07 22:39:00.927600',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1810,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63786.68.',1.0,'BTC','failed','2026-07-07 19:41:16','2026-07-07 22:41:16.460076',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1811,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 583.46.',0.7,'BNB','failed','2026-07-07 19:43:22','2026-07-07 22:43:22.081606',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1812,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1789.55.',0.6,'ETH','failed','2026-07-07 19:45:08','2026-07-07 22:45:08.440734',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1813,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1769.',0.7,'ADA','processed','2026-07-07 19:46:43','2026-07-07 22:46:43.669787',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1814,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1790.63.',0.6,'ETH','failed','2026-07-07 19:49:08','2026-07-07 22:49:08.544334',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1815,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 583.8.',0.8,'BNB','failed','2026-07-07 19:51:14','2026-07-07 22:51:14.274905',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1816,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1766.',-1.0,'ADA','processed','2026-07-07 19:53:39','2026-07-07 22:53:39.344662',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1817,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1768.',1.0,'ADA','processed','2026-07-07 19:55:34','2026-07-07 22:55:34.337754',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1818,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.761.',-1.0,'AVAX','processed','2026-07-07 19:57:18','2026-07-07 22:57:18.340579',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1819,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1222.',-1.0,'XRP','processed','2026-07-07 19:59:28','2026-07-07 22:59:29.006332',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1820,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.761.',1.0,'AVAX','processed','2026-07-07 20:01:25','2026-07-07 23:01:25.695118',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1821,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1218.',-1.0,'XRP','processed','2026-07-07 20:03:30','2026-07-07 23:03:30.656565',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1822,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 583.79.',-1.0,'BNB','failed','2026-07-07 20:05:25','2026-07-07 23:05:25.306054',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1823,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 582.87.',-1.0,'BNB','failed','2026-07-07 20:07:28','2026-07-07 23:07:28.300660',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1824,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1767.',-1.0,'ADA','processed','2026-07-07 20:09:32','2026-07-07 23:09:32.530861',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1825,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63751.99.',1.0,'BTC','failed','2026-07-07 20:12:27','2026-07-07 23:12:27.390404',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1826,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.919.',-1.0,'LINK','failed','2026-07-07 20:14:42','2026-07-07 23:14:42.942840',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1827,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.762.',0.4,'AVAX','processed','2026-07-07 20:16:38','2026-07-07 23:16:38.642548',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1828,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.762.',1.0,'AVAX','processed','2026-07-07 20:19:03','2026-07-07 23:19:03.535527',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1829,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63730.22.',-1.0,'BTC','failed','2026-07-07 20:21:08','2026-07-07 23:21:08.077957',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1830,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.92.',1.0,'LINK','failed','2026-07-07 20:23:03','2026-07-07 23:23:03.435166',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1831,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 581.99.',-1.0,'BNB','failed','2026-07-07 20:25:18','2026-07-07 23:25:18.886772',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1832,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63735.99.',-1.0,'BTC','failed','2026-07-07 20:27:02','2026-07-07 23:27:02.890205',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1833,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 581.58.',-1.0,'BNB','failed','2026-07-07 20:29:17','2026-07-07 23:29:17.881954',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1834,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63742.0.',1.0,'BTC','failed','2026-07-07 20:31:13','2026-07-07 23:31:13.290521',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1835,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.761.',1.0,'AVAX','processed','2026-07-07 20:33:19','2026-07-07 23:33:19.025173',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1836,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.9.',1.0,'LINK','failed','2026-07-07 20:35:32','2026-07-07 23:35:32.558744',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1837,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1763.',1.0,'ADA','processed','2026-07-07 20:37:37','2026-07-07 23:37:37.659975',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1838,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1785.38.',1.0,'ETH','failed','2026-07-07 20:39:53','2026-07-07 23:39:53.414556',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1839,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63712.0.',1.0,'BTC','failed','2026-07-07 20:41:48','2026-07-07 23:41:48.836441',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1840,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 81.24.',1.0,'SOL','failed','2026-07-07 20:43:53','2026-07-07 23:43:53.275694',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1841,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 81.15.',0.8,'SOL','failed','2026-07-07 20:46:17','2026-07-07 23:46:17.941177',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1842,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.895.',-1.0,'LINK','failed','2026-07-07 20:48:23','2026-07-07 23:48:23.087409',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1843,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63626.85.',0.75,'BTC','failed','2026-07-07 20:50:57','2026-07-07 23:50:57.570880',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1844,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1181.',0.7,'XRP','processed','2026-07-07 20:52:42','2026-07-07 23:52:42.157740',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1845,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1759.',-1.0,'ADA','processed','2026-07-07 20:54:48','2026-07-07 23:54:48.533138',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1846,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1176.',-1.0,'XRP','processed','2026-07-07 20:57:13','2026-07-07 23:57:13.185768',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1847,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1184.',-1.0,'XRP','processed','2026-07-07 20:59:17','2026-07-07 23:59:17.848387',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1848,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 581.42.',0.7,'BNB','failed','2026-07-07 21:01:01','2026-07-08 00:01:01.575037',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1849,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.74.',0.75,'AVAX','processed','2026-07-07 21:03:05','2026-07-08 00:03:05.717819',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1850,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.738.',0.85,'AVAX','processed','2026-07-07 21:05:00','2026-07-08 00:05:00.800905',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1851,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.909.',-1.0,'LINK','failed','2026-07-07 21:07:24','2026-07-08 00:07:24.831014',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1852,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1759.',1.0,'ADA','processed','2026-07-07 21:09:39','2026-07-08 00:09:39.616738',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1853,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 580.94.',-1.0,'BNB','failed','2026-07-07 21:11:43','2026-07-08 00:11:43.857171',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1854,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1786.7.',1.0,'ETH','failed','2026-07-07 21:13:59','2026-07-08 00:13:59.552963',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1855,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1761.',-1.0,'ADA','processed','2026-07-07 21:16:03','2026-07-08 00:16:03.056658',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1856,6,'Ether climbs toward $2K as Bitmine buys ETH, Robinhood L2 boost. <p style="float: right; margin: 0 0 10px 15px; width: 240px;"><img alt="Ether climbs toward $2K as Bitmine buys ETH, Robinhood L2 boost" class="type:primaryImage" src="https://s3-images.ctmedia.io/media/article-covers/article-covers-72223-ethereum-layer-twos-reportedly-processing-more-transactions-than-btc.jpg" /></p><p>ETH charts a path toward $2,000 as TradFi adoption, DAT buying and a long-awaited network upgrade boost investor interest. 
</p>',1.0,'ETH','processed','2026-07-07 21:17:45','2026-07-08 00:17:45.019296',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1857,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.88.',0.82,'LINK','failed','2026-07-07 21:18:09','2026-07-08 00:18:09.664937',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1858,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63578.01.',1.0,'BTC','failed','2026-07-07 21:19:44','2026-07-08 00:19:44.433775',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1859,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1776.99.',-1.0,'ETH','processed','2026-07-07 21:21:58','2026-07-08 00:21:58.639340',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1860,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1171.',1.0,'XRP','processed','2026-07-07 21:23:32','2026-07-08 00:23:32.913200',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1861,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.707.',1.0,'AVAX','processed','2026-07-07 21:26:06','2026-07-08 00:26:06.990177',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1862,10,'CMC ALERT: MARS is heavily pumping! 1-hour change: 8.32688679%. 24h Volume: $1,775,792.',0.8,'MARS','failed','2026-07-07 21:27:56','2026-07-08 00:27:56.885202',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1863,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63480.65.',0.7,'BTC','failed','2026-07-07 21:28:11','2026-07-08 00:28:11.807630',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1864,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 80.84.',-1.0,'SOL','failed','2026-07-07 21:30:16','2026-07-08 00:30:16.970622',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1865,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1777.31.',1.0,'ETH','processed','2026-07-07 21:32:10','2026-07-08 00:32:11.000296',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1866,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.116.',0.75,'XRP','processed','2026-07-07 21:34:46','2026-07-08 00:34:46.329985',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1867,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1774.99.',0.8,'ETH','processed','2026-07-07 21:36:41','2026-07-08 00:36:41.432875',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1868,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.714.',-1.0,'AVAX','processed','2026-07-07 21:38:46','2026-07-08 00:38:46.547392',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1869,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1774.41.',1.0,'ETH','processed','2026-07-07 21:41:01','2026-07-08 00:41:01.535494',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1870,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1749.',-1.0,'ADA','processed','2026-07-07 21:43:15','2026-07-08 00:43:15.697485',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1871,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 578.74.',-1.0,'BNB','failed','2026-07-07 21:45:41','2026-07-08 00:45:41.062985',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1872,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1777.22.',1.0,'ETH','processed','2026-07-07 21:47:25','2026-07-08 00:47:25.494359',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1873,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.704.',0.8,'AVAX','processed','2026-07-07 21:49:19','2026-07-08 00:49:19.717890',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1874,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1153.',0.8,'XRP','processed','2026-07-07 21:50:53','2026-07-08 00:50:53.658000',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1875,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63446.0.',0.8,'BTC','failed','2026-07-07 21:52:48','2026-07-08 00:52:48.815439',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1876,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63469.03.',-1.0,'BTC','failed','2026-07-07 21:54:43','2026-07-08 00:54:43.449665',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1877,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 80.83.',-1.0,'SOL','failed','2026-07-07 21:56:37','2026-07-08 00:56:37.611711',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1878,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.855.',1.0,'LINK','failed','2026-07-07 21:59:01','2026-07-08 00:59:01.875626',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1879,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.821.',0.7,'LINK','failed','2026-07-07 22:01:46','2026-07-08 01:01:46.384954',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1880,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 80.62.',-1.0,'SOL','failed','2026-07-07 22:03:31','2026-07-08 01:03:31.058871',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1881,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63326.3.',0.7,'BTC','failed','2026-07-07 22:05:15','2026-07-08 01:05:15.042413',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1882,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63346.49.',1.0,'BTC','failed','2026-07-07 22:07:09','2026-07-08 01:07:09.425060',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1883,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.695.',-1.0,'AVAX','processed','2026-07-07 22:09:04','2026-07-08 01:09:04.126130',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1884,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.695.',-1.0,'AVAX','processed','2026-07-07 22:11:18','2026-07-08 01:11:18.699696',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1885,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1746.',0.82,'ADA','processed','2026-07-07 22:13:24','2026-07-08 01:13:24.366157',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1886,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1775.61.',0.8,'ETH','processed','2026-07-07 22:15:48','2026-07-08 01:15:48.137852',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1887,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63470.0.',-0.4,'BTC','failed','2026-07-07 22:17:41','2026-07-08 01:17:41.149253',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1888,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63471.35.',0.8,'BTC','failed','2026-07-07 22:20:04','2026-07-08 01:20:04.841650',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1889,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1745.',1.0,'ADA','processed','2026-07-07 22:21:59','2026-07-08 01:21:59.469224',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1890,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63467.99.',1.0,'BTC','failed','2026-07-07 22:23:54','2026-07-08 01:23:54.108941',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1891,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.702.',0.8,'AVAX','processed','2026-07-07 22:25:49','2026-07-08 01:25:49.184118',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1892,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.702.',1.0,'AVAX','processed','2026-07-07 22:28:03','2026-07-08 01:28:03.397976',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1893,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 80.82.',-1.0,'SOL','failed','2026-07-07 22:29:47','2026-07-08 01:29:47.023793',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1894,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63443.0.',1.0,'BTC','failed','2026-07-07 22:32:22','2026-07-08 01:32:22.169660',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1895,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1152.',-1.0,'XRP','processed','2026-07-07 22:34:06','2026-07-08 01:34:06.716349',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1896,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1166.',1.0,'XRP','processed','2026-07-07 22:36:12','2026-07-08 01:36:12.344771',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1897,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 81.07.',1.0,'SOL','failed','2026-07-07 22:37:57','2026-07-08 01:37:57.439712',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1898,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1777.98.',0.8,'ETH','processed','2026-07-07 22:40:12','2026-07-08 01:40:12.525669',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1899,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.714.',1.0,'AVAX','processed','2026-07-07 22:42:15','2026-07-08 01:42:15.826481',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1900,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63623.16.',1.0,'BTC','failed','2026-07-07 22:44:20','2026-07-08 01:44:20.915080',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1901,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 579.07.',1.0,'BNB','failed','2026-07-07 22:46:45','2026-07-08 01:46:45.504060',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1902,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 578.96.',1.0,'BNB','failed','2026-07-07 22:49:19','2026-07-08 01:49:19.658682',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1903,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1776.73.',-1.0,'ETH','processed','2026-07-07 22:51:33','2026-07-08 01:51:33.861225',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1904,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 579.14.',-1.0,'BNB','failed','2026-07-07 22:53:49','2026-07-08 01:53:49.008061',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1905,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.874.',1.0,'LINK','failed','2026-07-07 22:56:03','2026-07-08 01:56:03.727164',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1906,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 80.86.',1.0,'SOL','failed','2026-07-07 22:58:19','2026-07-08 01:58:19.338687',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1907,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1747.',-1.0,'ADA','processed','2026-07-07 23:00:02','2026-07-08 02:00:02.886937',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1908,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.116.',-1.0,'XRP','failed','2026-07-07 23:01:36','2026-07-08 02:01:36.613975',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1909,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.709.',1.0,'AVAX','failed','2026-07-07 23:04:00','2026-07-08 02:04:00.710625',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1910,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.71.',1.0,'AVAX','failed','2026-07-07 23:06:05','2026-07-08 02:06:05.350547',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1911,10,'CMC ALERT: VELVET is heavily pumping! 1-hour change: 7.13349184%. 24h Volume: $16,984,789.',0.8,'VELVET','failed','2026-07-07 23:07:09','2026-07-08 02:07:09.395041',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1912,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1779.5.',-1.0,'ETH','processed','2026-07-07 23:08:20','2026-07-08 02:08:20.480487',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1913,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.882.',-1.0,'LINK','failed','2026-07-07 23:10:04','2026-07-08 02:10:04.414733',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1914,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1746.',-1.0,'ADA','failed','2026-07-07 23:12:18','2026-07-08 02:12:18.385241',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1915,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1778.2.',0.8,'ETH','processed','2026-07-07 23:14:03','2026-07-08 02:14:03.185670',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1916,10,'CMC ALERT: ARDR is heavily pumping! 1-hour change: 8.3800607%. 24h Volume: $1,118,526.',0.8,'ARDR','processed','2026-07-07 23:15:58','2026-07-08 02:15:58.312981',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1917,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 578.85.',-1.0,'BNB','failed','2026-07-07 23:16:17','2026-07-08 02:16:17.739805',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1918,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1751.',0.7,'ADA','failed','2026-07-07 23:18:34','2026-07-08 02:18:34.967088',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1919,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1751.',1.0,'ADA','failed','2026-07-07 23:20:49','2026-07-08 02:20:49.960302',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1920,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1780.27.',-1.0,'ETH','processed','2026-07-07 23:22:55','2026-07-08 02:22:55.514523',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1921,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.719.',1.0,'AVAX','processed','2026-07-07 23:24:40','2026-07-08 02:24:40.616993',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1922,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63634.98.',-1.0,'BTC','processed','2026-07-07 23:26:46','2026-07-08 02:26:46.194436',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1923,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1753.',-1.0,'ADA','processed','2026-07-07 23:28:40','2026-07-08 02:28:40.292515',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1924,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 81.13.',-1.0,'SOL','processed','2026-07-07 23:31:03','2026-07-08 02:31:03.815223',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1925,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.1157.',-1.0,'XRP','failed','2026-07-07 23:33:08','2026-07-08 02:33:08.873578',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1926,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1751.',-1.0,'ADA','processed','2026-07-07 23:35:02','2026-07-08 02:35:02.103188',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1927,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 578.51.',1.0,'BNB','failed','2026-07-07 23:37:16','2026-07-08 02:37:16.473194',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1928,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63544.91.',0.8,'BTC','failed','2026-07-07 23:39:29','2026-07-08 02:39:29.696641',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1929,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1143.',1.0,'XRP','failed','2026-07-07 23:41:14','2026-07-08 02:41:14.009581',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1930,10,'CMC ALERT: OXT is heavily pumping! 1-hour change: 8.63504479%. 24h Volume: $1,419,155.',0.7,'OXT','failed','2026-07-07 23:43:07','2026-07-08 02:43:07.683705',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1931,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1775.12.',0.7,'ETH','processed','2026-07-07 23:43:08','2026-07-08 02:43:08.408424',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1932,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.7.',1.0,'AVAX','failed','2026-07-07 23:45:48','2026-07-08 02:45:48.647886',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1933,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1772.24.',1.0,'ETH','processed','2026-07-07 23:47:37','2026-07-08 02:47:37.704835',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1934,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1772.04.',1.0,'ETH','processed','2026-07-07 23:49:24','2026-07-08 02:49:24.770545',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1935,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63440.0.',1.0,'BTC','failed','2026-07-07 23:51:36','2026-07-08 02:51:36.311191',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1936,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 80.74.',-1.0,'SOL','processed','2026-07-07 23:53:44','2026-07-08 02:53:44.151771',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1937,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.868.',1.0,'LINK','failed','2026-07-07 23:55:41','2026-07-08 02:55:41.832698',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1938,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 63365.83.',-1.0,'BTC','failed','2026-07-07 23:57:42','2026-07-08 02:57:42.256453',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1939,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 576.42.',1.0,'BNB','failed','2026-07-07 23:59:29','2026-07-08 02:59:29.731960',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1940,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1116.',-1.0,'XRP','failed','2026-07-08 00:01:10','2026-07-08 03:01:10.424907',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1941,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1771.47.',-1.0,'ETH','processed','2026-07-08 00:03:19','2026-07-08 03:03:19.515813',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1942,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63428.0.',1.0,'BTC','failed','2026-07-08 00:05:07','2026-07-08 03:05:07.117378',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1943,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63450.24.',-1.0,'BTC','failed','2026-07-08 00:07:02','2026-07-08 03:07:02.779762',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1944,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 576.52.',-1.0,'BNB','failed','2026-07-08 00:08:49','2026-07-08 03:08:49.683406',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1945,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 63481.16.',0.8,'BTC','failed','2026-07-08 00:10:44','2026-07-08 03:10:44.824689',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1946,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.663.',0.7,'AVAX','failed','2026-07-08 00:13:05','2026-07-08 03:13:05.739372',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1947,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 80.65.',1.0,'SOL','failed','2026-07-08 00:15:02','2026-07-08 03:15:02.978716',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1948,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63464.0.',1.0,'BTC','failed','2026-07-08 00:16:49','2026-07-08 03:16:49.137134',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1949,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.659.',0.8,'AVAX','failed','2026-07-08 00:18:57','2026-07-08 03:18:57.402651',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1950,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 576.96.',0.8,'BNB','failed','2026-07-08 00:20:46','2026-07-08 03:20:46.480943',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1951,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1123.',-1.0,'XRP','failed','2026-07-08 00:23:03','2026-07-08 03:23:03.168658',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1952,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 80.62.',-1.0,'SOL','failed','2026-07-08 00:25:14','2026-07-08 03:25:14.198434',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1953,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 578.15.',-1.0,'BNB','failed','2026-07-08 00:27:09','2026-07-08 03:27:09.368948',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1954,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1780.31.',-1.0,'ETH','processed','2026-07-08 00:28:58','2026-07-08 03:28:58.482057',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1955,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 577.94.',1.0,'BNB','failed','2026-07-08 00:30:34','2026-07-08 03:30:34.482610',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1956,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.868.',-1.0,'LINK','processed','2026-07-08 00:33:02','2026-07-08 03:33:02.791888',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1957,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1778.52.',1.0,'ETH','processed','2026-07-08 00:35:19','2026-07-08 03:35:19.168405',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1958,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.658.',1.0,'AVAX','failed','2026-07-08 00:37:25','2026-07-08 03:37:25.495007',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1959,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.868.',1.0,'LINK','failed','2026-07-08 00:39:10','2026-07-08 03:39:10.642817',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1960,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 578.47.',-1.0,'BNB','failed','2026-07-08 00:40:48','2026-07-08 03:40:48.708770',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1961,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1756.',-1.0,'ADA','failed','2026-07-08 00:43:08','2026-07-08 03:43:08.651453',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1962,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.115.',1.0,'XRP','failed','2026-07-08 00:45:05','2026-07-08 03:45:05.843662',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1963,10,'CMC ALERT: DUCK is heavily pumping! 1-hour change: 29.64667236%. 24h Volume: $1,018,507.',0.7,'DUCK','failed','2026-07-08 00:46:38','2026-07-08 03:46:38.212058',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1964,10,'CMC ALERT: ZBCN is heavily pumping! 1-hour change: 7.41424873%. 24h Volume: $11,879,961.',0.8,'ZBCN','failed','2026-07-08 00:46:47','2026-07-08 03:46:47.332676',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1965,10,'CMC ALERT: USDUC is heavily pumping! 1-hour change: 7.40944994%. 24h Volume: $1,440,605.',0.8,'USDUC','failed','2026-07-08 00:46:56','2026-07-08 03:46:56.556977',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1966,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 80.65.',-1.0,'SOL','failed','2026-07-08 00:47:03','2026-07-08 03:47:03.352172',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1967,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.868.',-1.0,'LINK','processed','2026-07-08 00:48:46','2026-07-08 03:48:46.750717',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1968,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1780.34.',-1.0,'ETH','processed','2026-07-08 00:51:00','2026-07-08 03:51:00.433765',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1969,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 80.63.',-1.0,'SOL','failed','2026-07-08 00:53:36','2026-07-08 03:53:36.116907',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1970,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1757.',1.0,'ADA','failed','2026-07-08 00:55:40','2026-07-08 03:55:40.245970',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1971,10,'CMC ALERT: BAS is heavily pumping! 1-hour change: 9.57464606%. 24h Volume: $5,791,335.',0.8,'BAS','failed','2026-07-08 00:55:45','2026-07-08 03:55:45.495801',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1972,10,'CMC ALERT: SNDKB is heavily pumping! 1-hour change: 8.0678422%. 24h Volume: $53,704,584.',1.0,'SNDKB','failed','2026-07-08 00:55:54','2026-07-08 03:55:54.328966',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1973,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1757.',0.7,'ADA','failed','2026-07-08 00:57:24','2026-07-08 03:57:24.531847',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1974,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 578.53.',1.0,'BNB','failed','2026-07-08 00:59:28','2026-07-08 03:59:28.708075',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1975,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.1139.',-1.0,'XRP','failed','2026-07-08 01:01:53','2026-07-08 04:01:53.036844',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1976,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63565.78.',-1.0,'BTC','failed','2026-07-08 01:03:38','2026-07-08 04:03:38.158870',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1977,10,'CMC ALERT: SNDKon is heavily pumping! 1-hour change: 7.72094778%. 24h Volume: $3,216,410.',0.8,'SNDKON','failed','2026-07-08 01:04:43','2026-07-08 04:04:43.249673',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1978,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 80.22.',-1.0,'SOL','failed','2026-07-08 01:05:43','2026-07-08 04:05:43.332952',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1979,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 80.29.',0.8,'SOL','failed','2026-07-08 01:07:38','2026-07-08 04:07:38.845649',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1980,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63502.91.',-1.0,'BTC','failed','2026-07-08 01:10:01','2026-07-08 04:10:01.832988',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1981,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.176.',1.0,'ADA','failed','2026-07-08 01:11:47','2026-07-08 04:11:47.475200',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1982,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63587.44.',-1.0,'BTC','failed','2026-07-08 01:13:31','2026-07-08 04:13:32.006667',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1983,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1779.75.',-1.0,'ETH','processed','2026-07-08 01:15:16','2026-07-08 04:15:16.699486',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1984,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.655.',1.0,'AVAX','failed','2026-07-08 01:16:59','2026-07-08 04:16:59.926828',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1985,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1776.69.',0.8,'ETH','processed','2026-07-08 01:18:53','2026-07-08 04:18:53.801268',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1986,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1756.',-1.0,'ADA','processed','2026-07-08 01:21:09','2026-07-08 04:21:09.756346',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1987,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1756.',0.6,'ADA','failed','2026-07-08 01:23:14','2026-07-08 04:23:14.778668',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1988,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 63582.0.',1.0,'BTC','failed','2026-07-08 01:25:08','2026-07-08 04:25:08.398393',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1989,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1776.5.',-1.0,'ETH','processed','2026-07-08 01:27:12','2026-07-08 04:27:12.780803',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1990,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.641.',1.0,'AVAX','failed','2026-07-08 01:29:26','2026-07-08 04:29:26.603719',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1991,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1752.',-1.0,'ADA','processed','2026-07-08 01:31:42','2026-07-08 04:31:42.281375',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1992,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.837.',1.0,'LINK','failed','2026-07-08 01:34:17','2026-07-08 04:34:17.752796',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1993,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 573.07.',-1.0,'BNB','failed','2026-07-08 01:36:51','2026-07-08 04:36:51.906206',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1994,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1005.',-1.0,'XRP','failed','2026-07-08 01:39:17','2026-07-08 04:39:17.051804',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1995,10,'CMC ALERT: DMC is heavily pumping! 1-hour change: 6.32522627%. 24h Volume: $2,494,537.',0.8,'DMC','failed','2026-07-08 01:40:53','2026-07-08 04:40:53.733317',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1996,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 572.81.',1.0,'BNB','failed','2026-07-08 01:41:31','2026-07-08 04:41:31.221988',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1997,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.575.',-1.0,'AVAX','processed','2026-07-08 01:43:34','2026-07-08 04:43:34.893006',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(1998,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 79.28.',1.0,'SOL','failed','2026-07-08 01:45:29','2026-07-08 04:45:29.562699',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1999,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 573.56.',1.0,'BNB','failed','2026-07-08 01:47:23','2026-07-08 04:47:23.049320',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2000,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.785.',-1.0,'LINK','failed','2026-07-08 01:49:27','2026-07-08 04:49:27.733544',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2001,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1736.',-1.0,'ADA','failed','2026-07-08 01:51:31','2026-07-08 04:51:31.949285',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2002,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 79.32.',-1.0,'SOL','failed','2026-07-08 01:53:46','2026-07-08 04:53:46.241566',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2003,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1731.',-1.0,'ADA','failed','2026-07-08 01:55:59','2026-07-08 04:55:59.235094',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2004,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0994.',1.0,'XRP','failed','2026-07-08 01:57:53','2026-07-08 04:57:53.859540',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2005,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 572.14.',-1.0,'BNB','failed','2026-07-08 02:00:07','2026-07-08 05:00:07.919795',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2006,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0966.',1.0,'XRP','failed','2026-07-08 02:02:01','2026-07-08 05:02:01.810690',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2007,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.711.',-1.0,'LINK','failed','2026-07-08 02:04:25','2026-07-08 05:04:25.960184',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2008,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 571.37.',1.0,'BNB','failed','2026-07-08 02:06:21','2026-07-08 05:06:21.392547',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2009,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1756.64.',-1.0,'ETH','processed','2026-07-08 02:08:25','2026-07-08 05:08:25.284408',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2010,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 78.98.',1.0,'SOL','failed','2026-07-08 02:09:58','2026-07-08 05:09:58.661897',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2011,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1717.',1.0,'ADA','failed','2026-07-08 02:12:21','2026-07-08 05:12:21.790517',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2012,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 570.4.',-1.0,'BNB','failed','2026-07-08 02:14:34','2026-07-08 05:14:34.793613',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2013,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 569.62.',-1.0,'BNB','failed','2026-07-08 02:17:09','2026-07-08 05:17:09.787856',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2014,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 570.35.',1.0,'BNB','failed','2026-07-08 02:18:55','2026-07-08 05:18:55.353335',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2015,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62824.88.',-1.0,'BTC','failed','2026-07-08 02:21:09','2026-07-08 05:21:09.908752',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2016,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1751.84.',1.0,'ETH','processed','2026-07-08 02:23:33','2026-07-08 05:23:33.539817',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2017,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1752.58.',0.6,'ETH','processed','2026-07-08 02:25:07','2026-07-08 05:25:07.960701',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2018,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1754.18.',-1.0,'ETH','processed','2026-07-08 02:27:12','2026-07-08 05:27:12.112919',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2019,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 571.09.',-1.0,'BNB','failed','2026-07-08 02:28:57','2026-07-08 05:28:57.141749',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2020,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 570.87.',-1.0,'BNB','failed','2026-07-08 02:31:10','2026-07-08 05:31:10.386021',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2021,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0955.',1.0,'XRP','failed','2026-07-08 02:32:54','2026-07-08 05:32:54.908524',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2022,10,'CMC ALERT: NEON is heavily pumping! 1-hour change: 25.60995122%. 24h Volume: $1,025,693.',0.8,'NEON','failed','2026-07-08 02:35:03','2026-07-08 05:35:03.290423',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2023,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.689.',1.0,'LINK','failed','2026-07-08 02:35:39','2026-07-08 05:35:39.600466',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2024,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 78.39.',0.6,'SOL','failed','2026-07-08 02:37:22','2026-07-08 05:37:22.521055',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2025,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1748.3.',-1.0,'ETH','processed','2026-07-08 02:39:27','2026-07-08 05:39:27.046026',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2026,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62909.6.',0.8,'BTC','failed','2026-07-08 02:41:42','2026-07-08 05:41:42.165692',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2027,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0987.',1.0,'XRP','failed','2026-07-08 02:43:16','2026-07-08 05:43:16.535398',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2028,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 571.28.',-1.0,'BNB','processed','2026-07-08 02:45:41','2026-07-08 05:45:41.096347',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2029,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 79.1.',0.8,'SOL','failed','2026-07-08 02:48:26','2026-07-08 05:48:26.200124',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2030,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.732.',1.0,'LINK','failed','2026-07-08 02:50:40','2026-07-08 05:50:40.726497',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2031,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62935.03.',-1.0,'BTC','failed','2026-07-08 02:52:55','2026-07-08 05:52:55.374893',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2032,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.732.',-1.0,'LINK','failed','2026-07-08 02:54:48','2026-07-08 05:54:48.570474',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2033,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0996.',-1.0,'XRP','failed','2026-07-08 02:57:11','2026-07-08 05:57:11.627999',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2034,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.408.',1.0,'AVAX','failed','2026-07-08 02:59:26','2026-07-08 05:59:26.309725',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2035,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.1007.',1.0,'XRP','failed','2026-07-08 03:01:10','2026-07-08 06:01:10.980643',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2036,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1718.',-1.0,'ADA','processed','2026-07-08 03:03:25','2026-07-08 06:03:25.307138',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2037,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.427.',1.0,'AVAX','failed','2026-07-08 03:04:59','2026-07-08 06:04:59.212741',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2038,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1014.',0.7,'XRP','failed','2026-07-08 03:07:54','2026-07-08 06:07:54.345736',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2039,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.725.',1.0,'LINK','failed','2026-07-08 03:10:07','2026-07-08 06:10:07.296061',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2040,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 79.27.',1.0,'SOL','failed','2026-07-08 03:12:00','2026-07-08 06:12:00.707557',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2041,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1719.',1.0,'ADA','failed','2026-07-08 03:13:56','2026-07-08 06:13:56.150895',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2042,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 571.42.',-1.0,'BNB','failed','2026-07-08 03:16:31','2026-07-08 06:16:31.252210',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2043,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1726.',-1.0,'ADA','processed','2026-07-08 03:18:26','2026-07-08 06:18:26.329267',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2044,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.1021.',0.82,'XRP','failed','2026-07-08 03:20:51','2026-07-08 06:20:51.549671',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2045,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 79.26.',-1.0,'SOL','failed','2026-07-08 03:23:26','2026-07-08 06:23:26.245730',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2046,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.428.',1.0,'AVAX','failed','2026-07-08 03:25:30','2026-07-08 06:25:30.246616',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2047,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1762.95.',-1.0,'ETH','processed','2026-07-08 03:27:33','2026-07-08 06:27:33.896447',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2048,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.101.',-1.0,'XRP','failed','2026-07-08 03:29:29','2026-07-08 06:29:29.153265',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2049,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 571.62.',-1.0,'BNB','failed','2026-07-08 03:31:33','2026-07-08 06:31:33.787696',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2050,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 79.04.',-1.0,'SOL','processed','2026-07-08 03:33:59','2026-07-08 06:33:59.253481',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2051,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.1003.',0.8,'XRP','failed','2026-07-08 03:36:14','2026-07-08 06:36:14.952685',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2052,10,'CMC ALERT: MAME is heavily pumping! 1-hour change: 7.47324423%. 24h Volume: $1,641,837.',0.7,'MAME','failed','2026-07-08 03:38:12','2026-07-08 06:38:12.607786',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2053,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1758.67.',-1.0,'ETH','processed','2026-07-08 03:38:20','2026-07-08 06:38:20.442158',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2054,10,'CMC ALERT: PROS is heavily pumping! 1-hour change: 6.35616343%. 24h Volume: $8,633,324.',0.7,'PROS','failed','2026-07-08 03:38:21','2026-07-08 06:38:21.837784',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2055,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.0997.',0.8,'XRP','failed','2026-07-08 03:40:14','2026-07-08 06:40:14.365749',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2056,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1757.66.',-1.0,'ETH','processed','2026-07-08 03:42:28','2026-07-08 06:42:28.510608',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2057,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 570.76.',1.0,'BNB','failed','2026-07-08 03:44:23','2026-07-08 06:44:23.074088',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2058,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 570.46.',-1.0,'BNB','failed','2026-07-08 03:46:46','2026-07-08 06:46:46.577951',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2059,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1711.',-1.0,'ADA','failed','2026-07-08 03:48:51','2026-07-08 06:48:51.129841',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2060,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62839.71.',1.0,'BTC','failed','2026-07-08 03:51:15','2026-07-08 06:51:15.679384',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2061,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1711.',-1.0,'ADA','failed','2026-07-08 03:53:20','2026-07-08 06:53:20.410993',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2062,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.388.',0.2,'AVAX','failed','2026-07-08 03:55:24','2026-07-08 06:55:24.963615',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2063,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.0955.',1.0,'XRP','failed','2026-07-08 03:57:28','2026-07-08 06:57:28.875656',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2064,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0954.',1.0,'XRP','failed','2026-07-08 03:59:33','2026-07-08 06:59:33.224895',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2065,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 568.47.',-0.6,'BNB','failed','2026-07-08 04:01:36','2026-07-08 07:01:36.878898',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2066,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62760.84.',1.0,'BTC','failed','2026-07-08 04:03:10','2026-07-08 07:03:10.049858',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2067,10,'CMC ALERT: SLX is heavily pumping! 1-hour change: 6.14003547%. 24h Volume: $201,869,494.',0.8,'SLX','failed','2026-07-08 04:05:10','2026-07-08 07:05:10.974141',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2068,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62824.0.',1.0,'BTC','failed','2026-07-08 04:05:13','2026-07-08 07:05:13.976178',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2069,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62792.81.',-1.0,'BTC','failed','2026-07-08 04:07:17','2026-07-08 07:07:17.796192',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2070,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 78.69.',-1.0,'SOL','failed','2026-07-08 04:09:01','2026-07-08 07:09:01.114528',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2071,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 569.49.',-1.0,'BNB','failed','2026-07-08 04:10:55','2026-07-08 07:10:55.701398',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2072,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 78.77.',-0.8,'SOL','failed','2026-07-08 04:13:09','2026-07-08 07:13:09.600694',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2073,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1706.',1.0,'ADA','failed','2026-07-08 04:15:13','2026-07-08 07:15:13.571071',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2074,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.0954.',0.7,'XRP','failed','2026-07-08 04:17:38','2026-07-08 07:17:38.081003',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2075,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 568.84.',0.8,'BNB','failed','2026-07-08 04:19:32','2026-07-08 07:19:32.296326',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2076,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0954.',1.0,'XRP','failed','2026-07-08 04:21:37','2026-07-08 07:21:37.843426',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2077,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 78.87.',-1.0,'SOL','failed','2026-07-08 04:24:32','2026-07-08 07:24:32.415384',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2078,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.412.',1.0,'AVAX','failed','2026-07-08 04:26:47','2026-07-08 07:26:47.458318',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2079,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 569.45.',-1.0,'BNB','failed','2026-07-08 04:28:31','2026-07-08 07:28:31.584400',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2080,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62891.17.',-1.0,'BTC','failed','2026-07-08 04:30:25','2026-07-08 07:30:25.627568',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2081,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 569.3.',-1.0,'BNB','failed','2026-07-08 04:32:09','2026-07-08 07:32:09.542692',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2082,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.171.',-1.0,'ADA','failed','2026-07-08 04:34:14','2026-07-08 07:34:14.166022',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2083,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.704.',1.0,'LINK','failed','2026-07-08 04:36:08','2026-07-08 07:36:08.858029',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2084,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 78.71.',-1.0,'SOL','failed','2026-07-08 04:37:44','2026-07-08 07:37:44.043897',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2085,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62716.02.',-1.0,'BTC','failed','2026-07-08 04:39:37','2026-07-08 07:39:37.267372',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2086,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.394.',1.0,'AVAX','failed','2026-07-08 04:41:42','2026-07-08 07:41:42.424980',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2087,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.393.',1.0,'AVAX','failed','2026-07-08 04:43:47','2026-07-08 07:43:47.614588',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2088,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1707.',0.8,'ADA','failed','2026-07-08 04:45:31','2026-07-08 07:45:31.718187',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2089,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1706.',1.0,'ADA','failed','2026-07-08 04:47:36','2026-07-08 07:47:36.722031',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2090,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1705.',-1.0,'ADA','failed','2026-07-08 04:49:51','2026-07-08 07:49:51.374065',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2091,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 78.56.',1.0,'SOL','failed','2026-07-08 04:52:35','2026-07-08 07:52:35.942558',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2092,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 568.61.',-1.0,'BNB','failed','2026-07-08 04:54:40','2026-07-08 07:54:40.669944',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2093,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62719.99.',1.0,'BTC','failed','2026-07-08 04:56:35','2026-07-08 07:56:35.451044',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2094,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1706.',-1.0,'ADA','failed','2026-07-08 04:58:38','2026-07-08 07:58:38.890628',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2095,10,'CMC ALERT: SYN is heavily pumping! 1-hour change: 8.53210127%. 24h Volume: $45,149,881.',0.8,'SYN','processed','2026-07-08 04:59:20','2026-07-08 07:59:20.285803',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2096,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1756.92.',1.0,'ETH','processed','2026-07-08 05:01:02','2026-07-08 08:01:02.103474',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2097,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.0937.',0.8,'XRP','failed','2026-07-08 05:03:07','2026-07-08 08:03:07.164651',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2098,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1756.68.',1.0,'ETH','processed','2026-07-08 05:05:30','2026-07-08 08:05:30.357809',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2099,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 78.75.',-1.0,'SOL','failed','2026-07-08 05:07:35','2026-07-08 08:07:35.097419',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2100,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62843.66.',1.0,'BTC','failed','2026-07-08 05:10:08','2026-07-08 08:10:08.268198',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2101,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0954.',-1.0,'XRP','failed','2026-07-08 05:11:43','2026-07-08 08:11:43.280806',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2102,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 569.75.',0.7,'BNB','failed','2026-07-08 05:13:47','2026-07-08 08:13:47.867855',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2103,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.717.',1.0,'LINK','failed','2026-07-08 05:16:01','2026-07-08 08:16:01.972158',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2104,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0947.',-1.0,'XRP','failed','2026-07-08 05:18:16','2026-07-08 08:18:16.208242',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2105,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1757.29.',-1.0,'ETH','processed','2026-07-08 05:20:20','2026-07-08 08:20:20.606436',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2106,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1705.',-1.0,'ADA','processed','2026-07-08 05:22:15','2026-07-08 08:22:15.473731',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2107,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.43.',-1.0,'AVAX','failed','2026-07-08 05:24:28','2026-07-08 08:24:28.695882',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2108,10,'CMC ALERT: MVL is heavily pumping! 1-hour change: 16.55413258%. 24h Volume: $1,085,917.',0.7,'MVL','failed','2026-07-08 05:26:29','2026-07-08 08:26:29.468548',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2109,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 569.06.',1.0,'BNB','failed','2026-07-08 05:27:01','2026-07-08 08:27:01.910146',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2110,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 78.64.',-1.0,'SOL','failed','2026-07-08 05:29:16','2026-07-08 08:29:16.518773',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2111,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 569.19.',-1.0,'BNB','failed','2026-07-08 05:31:11','2026-07-08 08:31:11.753326',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2112,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 78.51.',1.0,'SOL','failed','2026-07-08 05:33:25','2026-07-08 08:33:25.357094',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2113,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62777.99.',-1.0,'BTC','failed','2026-07-08 05:35:09','2026-07-08 08:35:09.454301',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2114,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.093.',0.8,'XRP','failed','2026-07-08 05:36:54','2026-07-08 08:36:54.173045',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2115,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0932.',-1.0,'XRP','failed','2026-07-08 05:39:07','2026-07-08 08:39:07.552215',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2116,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 78.52.',-1.0,'SOL','failed','2026-07-08 05:41:01','2026-07-08 08:41:01.980571',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2117,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.696.',1.0,'LINK','failed','2026-07-08 05:43:05','2026-07-08 08:43:05.351551',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2118,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0919.',1.0,'XRP','failed','2026-07-08 05:44:49','2026-07-08 08:44:49.474614',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2119,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0915.',-1.0,'XRP','failed','2026-07-08 05:46:44','2026-07-08 08:46:44.054942',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2120,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.69.',-1.0,'LINK','failed','2026-07-08 05:48:39','2026-07-08 08:48:39.221652',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2121,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1752.62.',-1.0,'ETH','processed','2026-07-08 05:51:13','2026-07-08 08:51:13.083064',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2122,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.414.',-1.0,'AVAX','failed','2026-07-08 05:53:28','2026-07-08 08:53:28.158739',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2123,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1753.02.',1.0,'ETH','processed','2026-07-08 05:55:32','2026-07-08 08:55:32.249360',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2124,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.414.',-1.0,'AVAX','failed','2026-07-08 05:57:16','2026-07-08 08:57:16.112530',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2125,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1753.71.',-1.0,'ETH','processed','2026-07-08 06:00:00','2026-07-08 09:00:00.762713',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2126,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1698.',-1.0,'ADA','failed','2026-07-08 06:02:24','2026-07-08 09:02:24.898046',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2127,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 78.37.',0.8,'SOL','failed','2026-07-08 06:04:28','2026-07-08 09:04:28.871030',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2128,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62581.04.',-1.0,'BTC','failed','2026-07-08 06:06:32','2026-07-08 09:06:32.020126',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2129,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1752.71.',1.0,'ETH','processed','2026-07-08 06:08:27','2026-07-08 09:08:27.503690',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2130,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 78.35.',-1.0,'SOL','failed','2026-07-08 06:11:02','2026-07-08 09:11:02.631204',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2131,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62579.71.',1.0,'BTC','failed','2026-07-08 06:13:16','2026-07-08 09:13:16.616913',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2132,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.684.',0.0,'UNKNOWN','processed','2026-07-08 06:15:51','2026-07-08 09:15:51.154539',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2133,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1752.26.',-1.0,'ETH','processed','2026-07-08 06:18:25','2026-07-08 09:18:25.316748',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2134,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.405.',1.0,'AVAX','failed','2026-07-08 06:20:59','2026-07-08 09:20:59.413330',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2135,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 567.17.',-1.0,'BNB','failed','2026-07-08 06:22:43','2026-07-08 09:22:43.780197',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2136,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 78.37.',-1.0,'SOL','processed','2026-07-08 06:25:07','2026-07-08 09:25:07.574164',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2137,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 78.31.',-1.0,'SOL','failed','2026-07-08 06:26:52','2026-07-08 09:26:52.633036',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2138,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 567.79.',-1.0,'BNB','failed','2026-07-08 06:28:46','2026-07-08 09:28:46.185981',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2139,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1695.',-1.0,'ADA','failed','2026-07-08 06:30:29','2026-07-08 09:30:29.930336',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2140,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 78.29.',-1.0,'SOL','failed','2026-07-08 06:32:34','2026-07-08 09:32:34.475847',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2141,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.658.',-1.0,'LINK','failed','2026-07-08 06:34:29','2026-07-08 09:34:29.578939',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2142,4,'🚨 NEW CRYPTO TRADE ALERT 📈🔥

🔹 TRADE: APE LONG
🔹 Pair: APE/USDT
🔹 Risk: HIGH
🔹 Leverage: 2x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 8.5%

🕰️ Validity: till 10 Jul 2026, 12:01 PM

🔸 Entry: $0.1464

🎯 Take Profit (TP) 1: $0.14951
🎯 Take Profit (TP) 2: $0.15262

🛑 Stop Loss (SL): $0.14329

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',-0.8,'APE','failed','2026-07-08 06:35:01','2026-07-08 09:35:01.819368',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2143,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.392.',-1.0,'AVAX','failed','2026-07-08 06:36:33','2026-07-08 09:36:33.477946',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2144,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.392.',-0.8,'AVAX','failed','2026-07-08 06:38:18','2026-07-08 09:38:18.508125',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2145,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 566.39.',-1.0,'BNB','failed','2026-07-08 06:39:52','2026-07-08 09:39:52.889135',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2146,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.392.',-0.8,'AVAX','failed','2026-07-08 06:41:48','2026-07-08 09:41:48.364256',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2147,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 566.27.',-1.0,'BNB','failed','2026-07-08 06:44:13','2026-07-08 09:44:13.408277',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2148,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1747.75.',0.7,'ETH','failed','2026-07-08 06:46:08','2026-07-08 09:46:08.481701',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2149,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 566.4.',-1.0,'BNB','failed','2026-07-08 06:48:13','2026-07-08 09:48:13.588942',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2150,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 566.91.',-1.0,'BNB','failed','2026-07-08 06:50:28','2026-07-08 09:50:28.822508',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2151,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62700.01.',-1.0,'BTC','failed','2026-07-08 06:52:54','2026-07-08 09:52:54.287801',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2152,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 78.32.',1.0,'SOL','failed','2026-07-08 06:54:48','2026-07-08 09:54:48.967393',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2153,3,'Shorting #JTO here

Short (10x-20x)

Entry: $0.7043

Reason: Chart looks bearish for it. Worth a short for short-mid term quick profits too.

Targets: $0.6687, $0.6338, $0.5989, $0.5633, $0.5284

Stop-loss: $0.7882',2.0,'JTO','processed','2026-07-08 06:55:31','2026-07-08 09:55:31.062357',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2154,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 566.61.',-1.0,'BNB','failed','2026-07-08 06:56:24','2026-07-08 09:56:24.120651',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2155,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 78.19.',1.0,'SOL','failed','2026-07-08 06:58:39','2026-07-08 09:58:39.173731',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2156,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 566.21.',1.0,'BNB','failed','2026-07-08 07:00:54','2026-07-08 10:00:54.219700',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2157,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 565.82.',-1.0,'BNB','failed','2026-07-08 07:03:08','2026-07-08 10:03:08.399644',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2158,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 565.72.',0.6,'BNB','failed','2026-07-08 07:05:41','2026-07-08 10:05:42.005847',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2159,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.657.',1.0,'LINK','failed','2026-07-08 07:07:15','2026-07-08 10:07:15.970879',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2160,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0893.',1.0,'XRP','failed','2026-07-08 07:09:30','2026-07-08 10:09:30.188083',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2161,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62634.0.',0.6,'BTC','failed','2026-07-08 07:11:15','2026-07-08 10:11:15.244075',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2162,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.653.',0.8,'LINK','failed','2026-07-08 07:12:50','2026-07-08 10:12:50.937114',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2163,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62741.33.',-1.0,'BTC','failed','2026-07-08 07:14:35','2026-07-08 10:14:35.585108',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2164,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0912.',1.0,'XRP','failed','2026-07-08 07:16:08','2026-07-08 10:16:08.562632',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2165,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0912.',-1.0,'XRP','failed','2026-07-08 07:18:23','2026-07-08 10:18:23.256146',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2166,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62693.07.',-1.0,'BTC','failed','2026-07-08 07:20:26','2026-07-08 10:20:26.679636',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2167,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.092.',-1.0,'XRP','failed','2026-07-08 07:22:30','2026-07-08 10:22:30.830515',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2168,3,'#JTO Short Signal has achieved our 1st Target ✅

100% profit in 20x Leverage from average entry and 50% profit in 10x Leverage.

Another Big and Good One for Whales crypto 🐋  family',8.0,'JTO','processed','2026-07-08 07:23:20','2026-07-08 10:23:20.173915',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2169,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1689.',-1.0,'ADA','failed','2026-07-08 07:24:25','2026-07-08 10:24:25.956031',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2170,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.424.',-1.0,'AVAX','failed','2026-07-08 07:26:29','2026-07-08 10:26:29.729363',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2171,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 567.41.',0.6,'BNB','failed','2026-07-08 07:28:13','2026-07-08 10:28:13.888751',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2172,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.7.',-1.0,'LINK','failed','2026-07-08 07:30:27','2026-07-08 10:30:27.966706',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2173,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1697.',-1.0,'ADA','failed','2026-07-08 07:32:02','2026-07-08 10:32:02.276955',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2174,10,'CMC ALERT: CTX is heavily pumping! 1-hour change: 19.28666203%. 24h Volume: $1,578,940.',-0.8,'CTX','failed','2026-07-08 07:32:29','2026-07-08 10:32:29.181408',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2175,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62834.73.',-1.0,'BTC','failed','2026-07-08 07:33:57','2026-07-08 10:33:57.088532',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2176,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.708.',-1.0,'LINK','failed','2026-07-08 07:36:01','2026-07-08 10:36:01.205178',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2177,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62830.0.',-1.0,'BTC','processed','2026-07-08 07:37:45','2026-07-08 10:37:45.792085',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2178,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62774.0.',-1.0,'BTC','failed','2026-07-08 07:39:21','2026-07-08 10:39:21.452260',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2179,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0936.',-0.6,'XRP','failed','2026-07-08 07:41:35','2026-07-08 10:41:35.176965',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2180,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1754.16.',-1.0,'ETH','failed','2026-07-08 07:43:19','2026-07-08 10:43:19.841403',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2181,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62803.3.',-1.0,'BTC','processed','2026-07-08 07:45:53','2026-07-08 10:45:53.114906',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2182,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 567.73.',-1.0,'BNB','failed','2026-07-08 07:47:37','2026-07-08 10:47:37.518141',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2183,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1695.',1.0,'ADA','failed','2026-07-08 07:49:31','2026-07-08 10:49:31.274522',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2184,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 567.68.',0.8,'BNB','failed','2026-07-08 07:51:55','2026-07-08 10:51:55.866675',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2185,3,'#JTO Short Signal has achieved our 2nd Target ✅✅

200% profit in 20x Leverage from average entry and 100% profit in 10x Leverage.

Another Big and Good One for Whales crypto 🐋  family',8.0,'JTO','processed','2026-07-08 07:53:38','2026-07-08 10:53:38.205923',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2186,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.094.',-1.0,'XRP','failed','2026-07-08 07:54:19','2026-07-08 10:54:19.302127',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2187,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62888.24.',0.78,'BTC','failed','2026-07-08 07:56:24','2026-07-08 10:56:24.427520',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2188,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0936.',0.8,'XRP','failed','2026-07-08 07:58:49','2026-07-08 10:58:49.044554',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2189,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 567.76.',1.0,'BNB','failed','2026-07-08 08:00:54','2026-07-08 11:00:54.273499',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2190,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 568.2.',-1.0,'BNB','failed','2026-07-08 08:03:19','2026-07-08 11:03:19.841965',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2191,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1694.',-1.0,'ADA','failed','2026-07-08 08:05:34','2026-07-08 11:05:34.432952',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2192,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0947.',-1.0,'XRP','failed','2026-07-08 08:07:38','2026-07-08 11:07:38.549321',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2193,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.714.',-1.0,'LINK','failed','2026-07-08 08:10:33','2026-07-08 11:10:33.286418',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2194,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62801.22.',-1.0,'BTC','processed','2026-07-08 08:12:47','2026-07-08 11:12:47.407713',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2195,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62848.0.',1.0,'BTC','failed','2026-07-08 08:15:11','2026-07-08 11:15:11.472591',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2196,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1748.47.',1.0,'ETH','failed','2026-07-08 08:17:04','2026-07-08 11:17:04.513065',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2197,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0875.',-1.0,'XRP','failed','2026-07-08 08:19:30','2026-07-08 11:19:30.039464',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2198,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.381.',-1.0,'AVAX','failed','2026-07-08 08:21:24','2026-07-08 11:21:24.274732',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2199,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1737.76.',-1.0,'ETH','failed','2026-07-08 08:23:29','2026-07-08 11:23:29.083301',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2200,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.597.',-1.0,'LINK','failed','2026-07-08 08:25:33','2026-07-08 11:25:33.748396',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2201,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 563.48.',-1.0,'BNB','failed','2026-07-08 08:27:17','2026-07-08 11:27:17.185797',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2202,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1666.',-1.0,'ADA','failed','2026-07-08 08:29:22','2026-07-08 11:29:22.230911',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2203,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1732.31.',-1.0,'ETH','failed','2026-07-08 08:31:55','2026-07-08 11:31:55.862900',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2204,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 562.61.',0.6,'BNB','failed','2026-07-08 08:34:00','2026-07-08 11:34:00.566146',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2205,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62060.0.',-1.0,'BTC','failed','2026-07-08 08:35:45','2026-07-08 11:35:45.943892',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2206,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.579.',-1.0,'LINK','failed','2026-07-08 08:37:50','2026-07-08 11:37:50.496509',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2207,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.324.',-1.0,'AVAX','failed','2026-07-08 08:39:44','2026-07-08 11:39:44.354471',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2208,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0772.',1.0,'XRP','failed','2026-07-08 08:41:49','2026-07-08 11:41:49.437211',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2209,7,'Live markets: Japan''s collapsing yen is pushing companies into bitcoin and XRP. ',0.8,'BTC','processed','2026-07-08 08:44:24','2026-07-08 11:44:24.648559',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2210,7,'Bitcoin under pressure as Trump says Iran ceasefire is over. ',5.0,'BTC','processed','2026-07-08 08:44:33','2026-07-08 11:44:33.753286',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2211,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62086.0.',0.75,'BTC','processed','2026-07-08 08:45:35','2026-07-08 11:45:35.878083',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2212,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62182.0.',1.0,'BTC','failed','2026-07-08 08:47:19','2026-07-08 11:47:19.627815',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2213,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 564.01.',1.0,'BNB','failed','2026-07-08 08:49:14','2026-07-08 11:49:14.244856',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2214,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.61.',-1.0,'LINK','failed','2026-07-08 08:51:09','2026-07-08 11:51:09.845755',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2215,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1740.38.',-1.0,'ETH','failed','2026-07-08 08:52:53','2026-07-08 11:52:53.690920',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2216,10,'CMC ALERT: ORBS is heavily pumping! 1-hour change: 21.40184545%. 24h Volume: $4,785,079.',-0.8,'ORBS','processed','2026-07-08 08:53:02','2026-07-08 11:53:02.651099',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2217,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 77.48.',-1.0,'SOL','failed','2026-07-08 08:54:38','2026-07-08 11:54:38.504595',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2218,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 562.49.',0.7,'BNB','failed','2026-07-08 08:56:24','2026-07-08 11:56:24.047913',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2219,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.356.',-1.0,'AVAX','failed','2026-07-08 08:58:29','2026-07-08 11:58:29.121162',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2220,7,'Live markets: Bitcoin drops as yen, Iran ceasefire collapse. ',5.0,'BTC','processed','2026-07-08 08:58:54','2026-07-08 11:58:54.488026',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2221,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.578.',-1.0,'LINK','failed','2026-07-08 09:00:22','2026-07-08 12:00:22.852166',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2222,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1662.',1.0,'ADA','failed','2026-07-08 09:02:26','2026-07-08 12:02:26.050376',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2223,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0798.',-1.0,'XRP','failed','2026-07-08 09:04:30','2026-07-08 12:04:30.431992',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2224,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1661.',1.0,'ADA','failed','2026-07-08 09:06:13','2026-07-08 12:06:13.832157',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2225,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 77.29.',-1.0,'SOL','failed','2026-07-08 09:08:47','2026-07-08 12:08:47.799919',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2226,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 61950.0.',0.7,'BTC','processed','2026-07-08 09:10:42','2026-07-08 12:10:42.472220',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2227,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 561.69.',-1.0,'BNB','failed','2026-07-08 09:12:46','2026-07-08 12:12:46.061339',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2228,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.352.',-1.0,'AVAX','failed','2026-07-08 09:14:41','2026-07-08 12:14:41.079394',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2229,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 561.58.',1.0,'BNB','failed','2026-07-08 09:16:55','2026-07-08 12:16:55.714155',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2230,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.553.',-1.0,'LINK','failed','2026-07-08 09:19:10','2026-07-08 12:19:10.285520',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2231,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.562.',-1.0,'LINK','failed','2026-07-08 09:21:14','2026-07-08 12:21:14.947146',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2232,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 61815.09.',-1.0,'BTC','failed','2026-07-08 09:22:59','2026-07-08 12:22:59.124129',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2233,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1731.45.',-1.0,'ETH','failed','2026-07-08 09:25:33','2026-07-08 12:25:33.174012',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2234,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1733.73.',-1.0,'ETH','failed','2026-07-08 09:27:28','2026-07-08 12:27:28.355958',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2235,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.56.',-1.0,'LINK','failed','2026-07-08 09:29:33','2026-07-08 12:29:33.032393',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2236,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 77.27.',0.7,'SOL','failed','2026-07-08 09:31:27','2026-07-08 12:31:27.240001',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2237,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 563.05.',-1.0,'BNB','failed','2026-07-08 09:33:20','2026-07-08 12:33:20.996193',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2238,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1738.67.',-0.8,'ETH','failed','2026-07-08 09:35:26','2026-07-08 12:35:26.518262',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2239,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1738.66.',-0.6,'ETH','failed','2026-07-08 09:37:30','2026-07-08 12:37:30.686384',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2240,10,'CMC ALERT: TAKE is heavily pumping! 1-hour change: 13.59263745%. 24h Volume: $1,841,284.',-0.6,'TAKE','processed','2026-07-08 09:38:09','2026-07-08 12:38:09.264847',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2241,10,'CMC ALERT: KRRX is heavily pumping! 1-hour change: 6.92523287%. 24h Volume: $2,048,346.',0.85,'KRRX','failed','2026-07-08 09:38:18','2026-07-08 12:38:18.109476',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2242,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1659.',1.0,'ADA','failed','2026-07-08 09:39:14','2026-07-08 12:39:14.129731',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2243,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 562.57.',-1.0,'BNB','failed','2026-07-08 09:40:58','2026-07-08 12:40:58.203842',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2244,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.368.',-1.0,'AVAX','failed','2026-07-08 09:43:11','2026-07-08 12:43:11.368059',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2245,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 562.85.',1.0,'BNB','failed','2026-07-08 09:45:26','2026-07-08 12:45:26.013694',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2246,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1738.71.',-1.0,'ETH','failed','2026-07-08 09:47:09','2026-07-08 12:47:09.393135',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2247,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1739.54.',0.6,'ETH','failed','2026-07-08 09:49:03','2026-07-08 12:49:03.318752',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2248,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.587.',1.0,'LINK','failed','2026-07-08 09:51:18','2026-07-08 12:51:18.837223',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2249,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1661.',0.7,'ADA','failed','2026-07-08 09:53:13','2026-07-08 12:53:13.803614',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2250,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 77.24.',-1.0,'SOL','failed','2026-07-08 09:55:26','2026-07-08 12:55:26.828766',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2251,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.578.',1.0,'LINK','failed','2026-07-08 09:57:41','2026-07-08 12:57:41.374974',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2252,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62053.62.',0.8,'BTC','failed','2026-07-08 10:00:06','2026-07-08 13:00:06.115214',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2253,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 77.18.',-0.8,'SOL','failed','2026-07-08 10:02:10','2026-07-08 13:02:10.277286',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2254,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 61966.8.',1.0,'BTC','failed','2026-07-08 10:04:33','2026-07-08 13:04:33.423019',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2255,10,'CMC ALERT: EURQ is heavily pumping! 1-hour change: 14.61185639%. 24h Volume: $8,386,624.',-1.0,'EURQ','failed','2026-07-08 10:05:13','2026-07-08 13:05:13.015014',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2256,10,'CMC ALERT: ALEO is heavily pumping! 1-hour change: 5.65171153%. 24h Volume: $2,098,741.',0.7,'ALEO','failed','2026-07-08 10:05:21','2026-07-08 13:05:21.788179',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2257,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 560.74.',-1.0,'BNB','failed','2026-07-08 10:06:37','2026-07-08 13:06:38.011387',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2258,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1657.',-1.0,'ADA','failed','2026-07-08 10:08:32','2026-07-08 13:08:32.222441',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2259,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 77.03.',-1.0,'SOL','failed','2026-07-08 10:10:36','2026-07-08 13:10:36.838393',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2260,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 61915.71.',-1.0,'BTC','failed','2026-07-08 10:12:30','2026-07-08 13:12:30.133245',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2261,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.36.',-1.0,'AVAX','failed','2026-07-08 10:14:44','2026-07-08 13:14:44.748524',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2262,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.56.',-0.8,'LINK','failed','2026-07-08 10:16:58','2026-07-08 13:16:58.701388',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2263,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 561.26.',-1.0,'BNB','failed','2026-07-08 10:19:03','2026-07-08 13:19:03.055129',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2264,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62037.91.',-1.0,'BTC','failed','2026-07-08 10:21:08','2026-07-08 13:21:08.142598',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2265,10,'CMC ALERT: POWER is heavily pumping! 1-hour change: 7.01845844%. 24h Volume: $2,993,923.',-0.6,'POWER','processed','2026-07-08 10:23:10','2026-07-08 13:23:10.769571',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2266,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0793.',-1.0,'XRP','failed','2026-07-08 10:23:32','2026-07-08 13:23:32.274374',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2267,6,'Berachain hard fork to replace dual-token model with WBERA rewards. <p style="float: right; margin: 0 0 10px 15px; width: 240px;"><img alt="Berachain hard fork to replace dual-token model with WBERA rewards" class="type:primaryImage" src="https://s3-images.ctmedia.io/media/article-covers/hi-why-banks-are-fighting-stablecoins-after-helping-shape-the-rules.jpg" /></p><p>Berachain launched the first stage of its PoL Next upgrade, which will phase out the BGT token and shift the network''s reward system to WBERA.</p>',5.0,'BGT','processed','2026-07-08 10:24:19','2026-07-08 13:24:19.655155',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2268,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 562.32.',-1.0,'BNB','failed','2026-07-08 10:25:27','2026-07-08 13:25:27.920108',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2269,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1668.',0.6,'ADA','failed','2026-07-08 10:27:12','2026-07-08 13:27:12.060807',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2270,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1668.',0.7,'ADA','failed','2026-07-08 10:29:17','2026-07-08 13:29:17.212954',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2271,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1666.',-1.0,'ADA','failed','2026-07-08 10:31:32','2026-07-08 13:31:32.312225',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2272,10,'CMC ALERT: SKEY is heavily pumping! 1-hour change: 7.38980937%. 24h Volume: $1,517,775.',0.8,'SKEY','failed','2026-07-08 10:32:08','2026-07-08 13:32:08.661342',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2273,10,'CMC ALERT: RESOLV is heavily pumping! 1-hour change: 7.04838958%. 24h Volume: $15,378,774.',-0.7,'RESOLV','processed','2026-07-08 10:32:17','2026-07-08 13:32:17.665708',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2274,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62116.0.',-1.0,'BTC','failed','2026-07-08 10:33:27','2026-07-08 13:33:27.365406',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2275,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.167.',-1.0,'ADA','failed','2026-07-08 10:35:22','2026-07-08 13:35:22.291738',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2276,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62124.28.',0.7,'BTC','failed','2026-07-08 10:36:56','2026-07-08 13:36:56.502981',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2277,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 77.39.',-1.0,'SOL','failed','2026-07-08 10:39:00','2026-07-08 13:39:00.198107',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2278,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.4.',1.0,'SOL','failed','2026-07-08 10:41:05','2026-07-08 13:41:05.270388',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2279,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1740.51.',-1.0,'ETH','failed','2026-07-08 10:42:49','2026-07-08 13:42:49.858769',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2280,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62140.51.',-1.0,'BTC','failed','2026-07-08 10:45:13','2026-07-08 13:45:13.300854',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2281,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.613.',-1.0,'LINK','failed','2026-07-08 10:47:26','2026-07-08 13:47:26.558097',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2282,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.601.',-1.0,'LINK','failed','2026-07-08 10:49:51','2026-07-08 13:49:51.206576',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2283,10,'CMC ALERT: LYN is heavily pumping! 1-hour change: 6.00061127%. 24h Volume: $7,736,817.',-0.8,'LYN','failed','2026-07-08 10:50:12','2026-07-08 13:50:12.532347',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2284,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.31.',1.0,'SOL','failed','2026-07-08 10:52:15','2026-07-08 13:52:15.196770',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2285,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.414.',-1.0,'AVAX','failed','2026-07-08 10:53:49','2026-07-08 13:53:49.396363',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2286,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.0826.',-1.0,'XRP','failed','2026-07-08 10:55:23','2026-07-08 13:55:23.126253',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2287,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62160.27.',-1.0,'BTC','failed','2026-07-08 10:57:37','2026-07-08 13:57:37.774885',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2288,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62175.0.',-1.0,'BTC','failed','2026-07-08 11:00:03','2026-07-08 14:00:03.256965',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2289,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 77.32.',-1.0,'SOL','failed','2026-07-08 11:01:38','2026-07-08 14:01:38.732850',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2290,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62136.43.',1.0,'BTC','failed','2026-07-08 11:03:13','2026-07-08 14:03:13.868819',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2291,4,'🚨 NEW CRYPTO TRADE ALERT 📈🔥

🔹 TRADE: BTC LONG
🔹 Pair: BTC/USDT
🔹 Risk: HIGH
🔹 Leverage: 15x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 6.2%

🕰️ Validity: till 10 Jul 2026, 04:32 PM

🔸 Entry: $62118.2

🎯 Take Profit (TP) 1: $62245.7
🎯 Take Profit (TP) 2: $62373.2

🛑 Stop Loss (SL): $61990.7

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',-1.0,'BTC','failed','2026-07-08 11:04:24','2026-07-08 14:04:24.301815',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2292,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.411.',0.7,'AVAX','failed','2026-07-08 11:05:18','2026-07-08 14:05:18.912417',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2293,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1738.81.',-1.0,'ETH','failed','2026-07-08 11:07:22','2026-07-08 14:07:22.621394',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2294,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62175.11.',1.0,'BTC','failed','2026-07-08 11:09:17','2026-07-08 14:09:17.024961',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2295,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62162.71.',-1.0,'BTC','failed','2026-07-08 11:10:50','2026-07-08 14:10:50.446366',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2296,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.604.',1.0,'LINK','failed','2026-07-08 11:13:14','2026-07-08 14:13:14.439675',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2297,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.411.',-1.0,'AVAX','failed','2026-07-08 11:15:29','2026-07-08 14:15:29.504773',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2298,10,'CMC ALERT: KAITO is heavily pumping! 1-hour change: 6.80633654%. 24h Volume: $43,765,171.',0.6,'KAITO','processed','2026-07-08 11:17:13','2026-07-08 14:17:13.249111',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2299,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 77.14.',-1.0,'SOL','failed','2026-07-08 11:17:54','2026-07-08 14:17:54.188203',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2300,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.417.',-1.0,'AVAX','failed','2026-07-08 11:19:38','2026-07-08 14:19:39.004561',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2301,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 77.19.',-1.0,'SOL','failed','2026-07-08 11:21:43','2026-07-08 14:21:43.129817',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2302,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0804.',-1.0,'XRP','failed','2026-07-08 11:23:47','2026-07-08 14:23:47.660250',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2303,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.604.',-1.0,'LINK','failed','2026-07-08 11:25:53','2026-07-08 14:25:53.325598',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2304,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.601.',0.7,'LINK','failed','2026-07-08 11:28:29','2026-07-08 14:28:29.139138',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2305,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 77.15.',-1.0,'SOL','failed','2026-07-08 11:30:54','2026-07-08 14:30:54.271965',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2306,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1736.76.',1.0,'ETH','failed','2026-07-08 11:32:59','2026-07-08 14:32:59.655549',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2307,7,'Live markets: Bitcoin drops as Trump says Iran ceasefire is over. ',5.0,'BTC','processed','2026-07-08 11:34:25','2026-07-08 14:34:25.033307',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2308,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1668.',-1.0,'ADA','failed','2026-07-08 11:35:13','2026-07-08 14:35:14.001553',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2309,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1737.67.',-1.0,'ETH','failed','2026-07-08 11:37:49','2026-07-08 14:37:49.343147',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2310,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62150.01.',1.0,'BTC','failed','2026-07-08 11:40:03','2026-07-08 14:40:03.857472',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2311,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 77.2.',1.0,'SOL','failed','2026-07-08 11:41:57','2026-07-08 14:41:57.474939',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2312,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.643.',-1.0,'LINK','failed','2026-07-08 11:44:43','2026-07-08 14:44:43.060364',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2313,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1745.2.',-1.0,'ETH','failed','2026-07-08 11:46:37','2026-07-08 14:46:37.783803',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2314,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 565.36.',1.0,'BNB','failed','2026-07-08 11:48:41','2026-07-08 14:48:41.974916',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2315,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 77.49.',-1.0,'SOL','failed','2026-07-08 11:50:47','2026-07-08 14:50:47.234114',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2316,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.631.',-1.0,'LINK','failed','2026-07-08 11:52:42','2026-07-08 14:52:42.271833',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2317,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 565.8.',0.7,'BNB','failed','2026-07-08 11:54:47','2026-07-08 14:54:47.192955',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2318,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.0865.',-1.0,'XRP','failed','2026-07-08 11:56:42','2026-07-08 14:56:42.967778',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2319,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1672.',0.7,'ADA','failed','2026-07-08 11:58:38','2026-07-08 14:58:38.571551',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2320,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.632.',0.6,'LINK','failed','2026-07-08 12:00:23','2026-07-08 15:00:23.932095',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2321,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1746.14.',1.0,'ETH','failed','2026-07-08 12:02:07','2026-07-08 15:02:07.188793',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2322,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0862.',-1.0,'XRP','failed','2026-07-08 12:04:11','2026-07-08 15:04:11.268210',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2323,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1748.24.',0.7,'ETH','failed','2026-07-08 12:06:05','2026-07-08 15:06:05.567012',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2324,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62368.0.',-1.0,'BTC','failed','2026-07-08 12:08:50','2026-07-08 15:08:50.399549',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2325,6,'Lyn Alden says Bitcoin needs no savior as Strategy sells $216M of BTC. <p style="float: right; margin: 0 0 10px 15px; width: 240px;"><img alt="Lyn Alden says Bitcoin needs no savior as Strategy sells $216M of BTC" class="type:primaryImage" src="https://s3-images.ctmedia.io/media/article-covers/lyn-alden1.jpg" /></p><p>Bitcoin-focused macroeconomist Lyn Alden said BTC must stand on its own as Strategy sold 3,588 BTC, while warning about leverage risks tied to STRC.</p>',5.0,'BTC','processed','2026-07-08 12:09:40','2026-07-08 15:09:40.041782',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2326,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.64.',0.8,'LINK','failed','2026-07-08 12:10:54','2026-07-08 15:10:54.034473',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2327,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 77.59.',-1.0,'SOL','failed','2026-07-08 12:12:49','2026-07-08 15:12:49.609862',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2328,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62329.07.',0.7,'BTC','failed','2026-07-08 12:14:53','2026-07-08 15:14:53.759230',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2329,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1748.8.',-0.6,'ETH','failed','2026-07-08 12:17:07','2026-07-08 15:17:07.208620',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2330,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62358.66.',-1.0,'BTC','failed','2026-07-08 12:19:02','2026-07-08 15:19:02.380686',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2331,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62353.94.',-1.0,'BTC','failed','2026-07-08 12:20:36','2026-07-08 15:20:36.507204',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2332,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.0865.',0.7,'XRP','failed','2026-07-08 12:22:41','2026-07-08 15:22:41.149898',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2333,3,'#JTO Short Signal has achieved our 3rd Target ✅✅✅

300% profit in 20x Leverage from average entry and 150% profit in 10x Leverage.

Another Big and Good One for Whales crypto 🐋  family',10.0,'JTO','processed','2026-07-08 12:23:51','2026-07-08 15:23:51.855181',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2334,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 565.73.',1.0,'BNB','failed','2026-07-08 12:24:46','2026-07-08 15:24:46.219820',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2335,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0859.',1.0,'XRP','failed','2026-07-08 12:27:19','2026-07-08 15:27:19.404528',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2336,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 565.42.',-1.0,'BNB','failed','2026-07-08 12:29:25','2026-07-08 15:29:25.118028',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2337,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0861.',-1.0,'XRP','failed','2026-07-08 12:31:30','2026-07-08 15:31:30.242670',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2338,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62200.53.',-1.0,'BTC','failed','2026-07-08 12:33:14','2026-07-08 15:33:14.115835',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2339,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.35.',1.0,'SOL','failed','2026-07-08 12:34:48','2026-07-08 15:34:48.743094',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2340,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1745.15.',1.0,'ETH','failed','2026-07-08 12:37:03','2026-07-08 15:37:03.349478',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2341,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62143.54.',-1.0,'BTC','failed','2026-07-08 12:38:56','2026-07-08 15:38:56.982818',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2342,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62119.54.',-1.0,'BTC','failed','2026-07-08 12:41:22','2026-07-08 15:41:22.183816',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2343,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 77.35.',-1.0,'SOL','failed','2026-07-08 12:43:25','2026-07-08 15:43:25.840652',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2344,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1744.17.',1.0,'ETH','failed','2026-07-08 12:45:10','2026-07-08 15:45:10.642286',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2345,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1743.57.',0.7,'ETH','failed','2026-07-08 12:47:14','2026-07-08 15:47:14.492700',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2346,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62070.0.',1.0,'BTC','failed','2026-07-08 12:49:29','2026-07-08 15:49:29.183474',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2347,7,'SpaceX''s first bitcoin wallet movements in six months likely don''t signal sales. ',8.0,'BTC','processed','2026-07-08 12:49:43','2026-07-08 15:49:43.720832',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2348,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.407.',-1.0,'AVAX','failed','2026-07-08 12:51:43','2026-07-08 15:51:43.506437',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2349,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1743.81.',-1.0,'ETH','failed','2026-07-08 12:53:48','2026-07-08 15:53:48.642581',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2350,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.407.',-1.0,'AVAX','failed','2026-07-08 12:55:53','2026-07-08 15:55:53.433975',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2351,10,'CMC ALERT: PLAY is heavily pumping! 1-hour change: 9.48917712%. 24h Volume: $6,506,938.',8.0,'PLAY','processed','2026-07-08 12:56:32','2026-07-08 15:56:32.621210',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2352,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.404.',1.0,'AVAX','failed','2026-07-08 12:58:07','2026-07-08 15:58:07.104884',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2353,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.598.',1.0,'LINK','failed','2026-07-08 12:59:42','2026-07-08 15:59:42.177712',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2354,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1667.',-1.0,'ADA','failed','2026-07-08 13:01:36','2026-07-08 16:01:36.852512',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2355,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1667.',-1.0,'ADA','failed','2026-07-08 13:03:32','2026-07-08 16:03:32.465287',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2356,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.0.',0.8,'SOL','failed','2026-07-08 13:05:37','2026-07-08 16:05:37.149692',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2357,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.386.',-1.0,'AVAX','failed','2026-07-08 13:08:02','2026-07-08 16:08:02.471312',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2358,6,'BTC speculators in focus as analysis says ''textbook Bitcoin bottom'' is underway. <p style="float: right; margin: 0 0 10px 15px; width: 240px;"><img alt="BTC speculators in focus as analysis says ''textbook Bitcoin bottom'' is underway" class="type:primaryImage" src="https://s3-images.ctmedia.io/media/article-covers/market-red-graph-falling-danger-stones-bitcoin.jpg" /></p><p>Analysis flagged a Bitcoin moving average derivative that last triggered at the end of the 2022 bear market as BTC price action returned to its reversal zone.</p>',0.7,'BTC','failed','2026-07-08 13:09:44','2026-07-08 16:09:44.445362',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2359,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 76.91.',1.0,'SOL','failed','2026-07-08 13:09:57','2026-07-08 16:09:57.179258',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2360,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 76.88.',-1.0,'SOL','failed','2026-07-08 13:12:00','2026-07-08 16:12:00.882868',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2361,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 61908.35.',-1.0,'BTC','failed','2026-07-08 13:14:04','2026-07-08 16:14:04.124622',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2362,10,'CMC ALERT: DONT is heavily pumping! 1-hour change: 84.91878094%. 24h Volume: $2,286,274.',-0.8,'DONT','failed','2026-07-08 13:14:33','2026-07-08 16:14:33.274521',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2363,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 564.34.',-1.0,'BNB','failed','2026-07-08 13:16:07','2026-07-08 16:16:07.727183',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2364,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 76.91.',0.8,'SOL','failed','2026-07-08 13:18:02','2026-07-08 16:18:02.832694',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2365,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1738.07.',-1.0,'ETH','failed','2026-07-08 13:20:57','2026-07-08 16:20:57.993029',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2366,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1663.',1.0,'ADA','failed','2026-07-08 13:23:03','2026-07-08 16:23:03.150778',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2367,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1736.62.',-1.0,'ETH','failed','2026-07-08 13:24:37','2026-07-08 16:24:37.810775',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2368,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 76.73.',1.0,'SOL','failed','2026-07-08 13:26:53','2026-07-08 16:26:53.136727',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2369,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.4.',-1.0,'AVAX','failed','2026-07-08 13:28:48','2026-07-08 16:28:48.341824',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2370,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 61896.5.',-1.0,'BTC','failed','2026-07-08 13:30:53','2026-07-08 16:30:53.894907',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2371,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 564.79.',-1.0,'BNB','failed','2026-07-08 13:32:49','2026-07-08 16:32:49.056205',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2372,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 565.01.',0.7,'BNB','failed','2026-07-08 13:34:53','2026-07-08 16:34:53.694854',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2373,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0839.',-1.0,'XRP','failed','2026-07-08 13:36:37','2026-07-08 16:36:37.873684',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2374,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1678.',1.0,'ADA','failed','2026-07-08 13:39:12','2026-07-08 16:39:12.411695',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2375,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.085.',-1.0,'XRP','failed','2026-07-08 13:41:17','2026-07-08 16:41:17.059132',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2376,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.468.',1.0,'AVAX','failed','2026-07-08 13:43:22','2026-07-08 16:43:22.240535',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2377,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 565.49.',1.0,'BNB','failed','2026-07-08 13:45:06','2026-07-08 16:45:06.467304',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2378,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 564.7.',1.0,'BNB','failed','2026-07-08 13:47:20','2026-07-08 16:47:20.980017',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2379,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1733.35.',1.0,'ETH','failed','2026-07-08 13:49:45','2026-07-08 16:49:45.619702',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2380,6,'Bull Bitcoin asks French court to strike down DAC8 implementing decree. <p style="float: right; margin: 0 0 10px 15px; width: 240px;"><img alt="Bull Bitcoin asks French court to strike down DAC8 implementing decree" class="type:primaryImage" src="https://s3-images.ctmedia.io/media/article-covers/big-brother-is-watching.jpg" /></p><p>The non-custodial Bitcoin exchange petitioned to annul a French decree implementing DAC8, arguing the rules could create surveillance and physical risks for up to 135 million European crypto holders.</p>',5.0,'BTC','processed','2026-07-08 13:49:51','2026-07-08 16:49:51.100511',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2381,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1734.5.',-1.0,'ETH','failed','2026-07-08 13:51:40','2026-07-08 16:51:40.197470',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2382,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.598.',1.0,'LINK','failed','2026-07-08 13:53:45','2026-07-08 16:53:45.849986',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2383,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 563.75.',-1.0,'BNB','failed','2026-07-08 13:56:01','2026-07-08 16:56:01.142581',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2384,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1734.72.',-1.0,'ETH','failed','2026-07-08 13:58:06','2026-07-08 16:58:06.079566',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2385,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1737.89.',-1.0,'ETH','failed','2026-07-08 13:59:41','2026-07-08 16:59:41.332533',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2386,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.636.',-1.0,'LINK','failed','2026-07-08 14:01:35','2026-07-08 17:01:35.505458',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2387,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 61995.1.',1.0,'BTC','failed','2026-07-08 14:03:40','2026-07-08 17:03:40.210714',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2388,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 565.47.',-1.0,'BNB','failed','2026-07-08 14:06:04','2026-07-08 17:06:04.861349',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2389,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 565.09.',1.0,'BNB','failed','2026-07-08 14:08:30','2026-07-08 17:08:30.130624',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2390,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 565.58.',1.0,'BNB','failed','2026-07-08 14:10:26','2026-07-08 17:10:26.029583',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2391,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1681.',-1.0,'ADA','failed','2026-07-08 14:12:19','2026-07-08 17:12:19.756325',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2392,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 77.29.',1.0,'SOL','failed','2026-07-08 14:14:14','2026-07-08 17:14:14.155174',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2393,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.09.',1.0,'SOL','failed','2026-07-08 14:16:09','2026-07-08 17:16:09.368170',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2394,10,'CMC ALERT: GWEI is heavily pumping! 1-hour change: 10.48270331%. 24h Volume: $17,773,273.',8.0,'GWEI','processed','2026-07-08 14:17:46','2026-07-08 17:17:46.236682',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2395,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.604.',-1.0,'LINK','failed','2026-07-08 14:18:03','2026-07-08 17:18:03.107983',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2396,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 564.38.',0.7,'BNB','failed','2026-07-08 14:19:57','2026-07-08 17:19:57.771706',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2397,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 77.38.',-1.0,'SOL','failed','2026-07-08 14:22:11','2026-07-08 17:22:11.802867',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2398,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0828.',-1.0,'XRP','failed','2026-07-08 14:24:05','2026-07-08 17:24:05.367506',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2399,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 77.29.',1.0,'SOL','failed','2026-07-08 14:26:00','2026-07-08 17:26:00.446990',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2400,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1733.97.',1.0,'ETH','failed','2026-07-08 14:28:15','2026-07-08 17:28:15.668045',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2401,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.61.',-1.0,'LINK','failed','2026-07-08 14:30:09','2026-07-08 17:30:09.894398',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2402,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1731.69.',-1.0,'ETH','failed','2026-07-08 14:32:25','2026-07-08 17:32:25.052285',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2403,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 77.0.',1.0,'SOL','failed','2026-07-08 14:34:09','2026-07-08 17:34:09.788264',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2404,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.438.',-1.0,'AVAX','failed','2026-07-08 14:36:34','2026-07-08 17:36:34.396958',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2405,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.603.',0.7,'LINK','failed','2026-07-08 14:38:20','2026-07-08 17:38:20.165403',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2406,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1668.',-1.0,'ADA','failed','2026-07-08 14:40:34','2026-07-08 17:40:34.861983',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2407,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 61916.15.',-1.0,'BTC','failed','2026-07-08 14:42:28','2026-07-08 17:42:28.758641',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2408,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.58.',0.8,'LINK','failed','2026-07-08 14:44:32','2026-07-08 17:44:32.900765',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2409,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.585.',-1.0,'LINK','failed','2026-07-08 14:46:36','2026-07-08 17:46:36.671312',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2410,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.395.',1.0,'AVAX','failed','2026-07-08 14:49:11','2026-07-08 17:49:11.034670',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2411,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0754.',-1.0,'XRP','failed','2026-07-08 14:50:56','2026-07-08 17:50:56.255869',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2412,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1726.32.',0.7,'ETH','failed','2026-07-08 14:52:51','2026-07-08 17:52:51.419165',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2413,10,'CMC ALERT: PERP is heavily pumping! 1-hour change: 11.58955615%. 24h Volume: $1,068,682.',8.0,'PERP','processed','2026-07-08 14:53:44','2026-07-08 17:53:44.046916',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2414,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62005.03.',-1.0,'BTC','failed','2026-07-08 14:54:56','2026-07-08 17:54:56.679712',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2415,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 564.85.',0.7,'BNB','failed','2026-07-08 14:57:31','2026-07-08 17:57:31.379432',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2416,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 77.12.',1.0,'SOL','failed','2026-07-08 14:59:26','2026-07-08 17:59:26.063559',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2417,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1669.',1.0,'ADA','failed','2026-07-08 15:01:01','2026-07-08 18:01:01.363516',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2418,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 563.57.',1.0,'BNB','failed','2026-07-08 15:03:05','2026-07-08 18:03:05.533528',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2419,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.574.',-1.0,'LINK','failed','2026-07-08 15:04:51','2026-07-08 18:04:51.327013',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2420,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1665.',1.0,'ADA','failed','2026-07-08 15:07:26','2026-07-08 18:07:26.625522',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2421,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 76.95.',1.0,'SOL','failed','2026-07-08 15:09:01','2026-07-08 18:09:01.763312',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2422,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.539.',-1.0,'LINK','failed','2026-07-08 15:11:27','2026-07-08 18:11:27.024342',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2423,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 562.02.',1.0,'BNB','failed','2026-07-08 15:13:52','2026-07-08 18:13:52.789732',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2424,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.356.',0.7,'AVAX','failed','2026-07-08 15:15:47','2026-07-08 18:15:47.816079',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2425,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1713.72.',0.7,'ETH','failed','2026-07-08 15:17:22','2026-07-08 18:17:22.206563',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2426,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.074.',-1.0,'XRP','failed','2026-07-08 15:19:57','2026-07-08 18:19:57.369375',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2427,7,'Crypto Long & Short: With MSTR concerns assuaged, look to traditional signals around BTC. ',-0.7,'BTC','failed','2026-07-08 15:19:59','2026-07-08 18:19:59.016852',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2428,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1718.84.',0.6,'ETH','failed','2026-07-08 15:22:21','2026-07-08 18:22:21.917181',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2429,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.072.',-1.0,'XRP','failed','2026-07-08 15:24:06','2026-07-08 18:24:06.549445',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2430,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 561.22.',-1.0,'BNB','failed','2026-07-08 15:26:01','2026-07-08 18:26:01.646594',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2431,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 61653.48.',1.0,'BTC','failed','2026-07-08 15:28:26','2026-07-08 18:28:26.397185',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2432,4,'🚨 NEW CRYPTO TRADE ALERT 📈🔥

🔹 TRADE: POL LONG
🔹 Pair: POL/USDT
🔹 Risk: HIGH
🔹 Leverage: 3x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 8.1%

🕰️ Validity: till 10 Jul 2026, 08:08 PM

🔸 Entry: $0.07605

🎯 Take Profit (TP) 1: $0.07708
🎯 Take Profit (TP) 2: $0.07811

🛑 Stop Loss (SL): $0.07502

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',-1.0,'POL','failed','2026-07-08 15:29:28','2026-07-08 18:29:28.026909',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2433,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 562.0.',-1.0,'BNB','failed','2026-07-08 15:30:20','2026-07-08 18:30:20.564382',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2434,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 76.46.',1.0,'SOL','failed','2026-07-08 15:32:15','2026-07-08 18:32:15.697190',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2435,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.541.',0.8,'LINK','failed','2026-07-08 15:34:10','2026-07-08 18:34:10.754286',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2436,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 76.57.',0.6,'SOL','failed','2026-07-08 15:35:56','2026-07-08 18:35:56.325724',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2437,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 562.52.',-1.0,'BNB','failed','2026-07-08 15:38:01','2026-07-08 18:38:01.493527',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2438,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 76.55.',-1.0,'SOL','failed','2026-07-08 15:40:05','2026-07-08 18:40:05.861359',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2439,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 561.55.',-1.0,'BNB','failed','2026-07-08 15:42:39','2026-07-08 18:42:39.707184',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2440,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 76.51.',-1.0,'SOL','failed','2026-07-08 15:44:45','2026-07-08 18:44:45.218950',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2441,6,'Bitcoin slides as Iran ceasefire collapse sees $75 oil on Hormuz blockade threats. <p style="float: right; margin: 0 0 10px 15px; width: 240px;"><img alt="Bitcoin slides as Iran ceasefire collapse sees $75 oil on Hormuz blockade threats" class="type:primaryImage" src="https://s3-images.ctmedia.io/media/article-covers/hi-how-to-make-a-profit-when-bitcoin-prices-are-stagnant-oil.jpg" /></p><p>Bitcoin price pressure took BTC toward the "crucial" $61,000 mark as oil prices soared on the collapse of the US-Iran ceasefire.</p>',5.0,'BTC','processed','2026-07-08 15:45:19','2026-07-08 18:45:19.799374',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2442,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0738.',-1.0,'XRP','failed','2026-07-08 15:46:40','2026-07-08 18:46:40.346593',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2443,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.532.',-1.0,'LINK','failed','2026-07-08 15:48:45','2026-07-08 18:48:45.128302',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2444,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.532.',-1.0,'LINK','failed','2026-07-08 15:51:10','2026-07-08 18:51:10.631551',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2445,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 562.38.',-0.8,'BNB','failed','2026-07-08 15:53:26','2026-07-08 18:53:26.322927',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2446,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 61727.81.',-1.0,'BTC','failed','2026-07-08 15:55:41','2026-07-08 18:55:41.503481',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2447,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1722.12.',-0.7,'ETH','failed','2026-07-08 15:57:46','2026-07-08 18:57:46.126668',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2448,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 562.42.',0.7,'BNB','failed','2026-07-08 15:59:51','2026-07-08 18:59:51.375524',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2449,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0742.',1.0,'XRP','failed','2026-07-08 16:01:56','2026-07-08 19:01:56.541455',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2450,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.551.',-1.0,'LINK','failed','2026-07-08 16:03:51','2026-07-08 19:03:51.759957',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2451,10,'CMC ALERT: TLOS is heavily pumping! 1-hour change: 12.59014004%. 24h Volume: $1,005,414.',8.0,'TLOS','processed','2026-07-08 16:05:55','2026-07-08 19:05:55.160697',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2452,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1726.72.',-1.0,'ETH','failed','2026-07-08 16:05:56','2026-07-08 19:05:56.607629',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2453,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.403.',-1.0,'AVAX','failed','2026-07-08 16:08:01','2026-07-08 19:08:01.187244',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2454,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1728.14.',-1.0,'ETH','failed','2026-07-08 16:10:05','2026-07-08 19:10:05.911927',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2455,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.573.',-0.8,'LINK','failed','2026-07-08 16:12:00','2026-07-08 19:12:00.521019',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2456,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0779.',-1.0,'XRP','failed','2026-07-08 16:13:45','2026-07-08 19:13:45.170911',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2457,10,'CMC ALERT: XCN is heavily pumping! 1-hour change: 9.26892418%. 24h Volume: $10,634,244.',8.0,'XCN','processed','2026-07-08 16:14:44','2026-07-08 19:14:44.071055',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2458,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.401.',0.8,'AVAX','failed','2026-07-08 16:16:00','2026-07-08 19:16:00.769365',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2459,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1672.',-1.0,'ADA','failed','2026-07-08 16:18:25','2026-07-08 19:18:25.946458',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2460,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 61918.0.',-1.0,'BTC','failed','2026-07-08 16:20:51','2026-07-08 19:20:51.086818',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2461,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 563.68.',-0.7,'BNB','failed','2026-07-08 16:22:55','2026-07-08 19:22:55.705829',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2462,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.407.',-1.0,'AVAX','failed','2026-07-08 16:25:00','2026-07-08 19:25:00.790338',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2463,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.167.',-1.0,'ADA','failed','2026-07-08 16:26:56','2026-07-08 19:26:56.003810',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2464,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1733.04.',1.0,'ETH','failed','2026-07-08 16:29:00','2026-07-08 19:29:00.665266',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2465,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1730.82.',-1.0,'ETH','failed','2026-07-08 16:30:55','2026-07-08 19:30:55.901718',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2466,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 61906.01.',-1.0,'BTC','failed','2026-07-08 16:33:10','2026-07-08 19:33:10.697761',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2467,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.577.',1.0,'LINK','failed','2026-07-08 16:34:54','2026-07-08 19:34:54.953248',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2468,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1727.55.',0.8,'ETH','failed','2026-07-08 16:37:00','2026-07-08 19:37:00.622871',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2469,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.566.',0.6,'LINK','failed','2026-07-08 16:38:45','2026-07-08 19:38:45.232589',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2470,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.411.',1.0,'AVAX','failed','2026-07-08 16:40:50','2026-07-08 19:40:50.822861',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2471,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.597.',-1.0,'LINK','failed','2026-07-08 16:42:35','2026-07-08 19:42:35.427951',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2472,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.605.',0.8,'LINK','failed','2026-07-08 16:44:30','2026-07-08 19:44:30.609241',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2473,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 565.8.',0.8,'BNB','failed','2026-07-08 16:46:45','2026-07-08 19:46:45.298512',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2474,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1671.',-1.0,'ADA','failed','2026-07-08 16:48:29','2026-07-08 19:48:29.626067',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2475,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.603.',-1.0,'LINK','failed','2026-07-08 16:50:33','2026-07-08 19:50:33.708259',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2476,10,'CMC ALERT: TAG is heavily pumping! 1-hour change: 21.18725767%. 24h Volume: $13,707,215.',-0.6,'TAG','processed','2026-07-08 16:50:56','2026-07-08 19:50:56.168596',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2477,10,'CMC ALERT: PIVX is heavily pumping! 1-hour change: 9.40612446%. 24h Volume: $2,165,049.',8.0,'PIVX','processed','2026-07-08 16:51:04','2026-07-08 19:51:04.928157',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2478,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1669.',-1.0,'ADA','failed','2026-07-08 16:52:37','2026-07-08 19:52:37.863591',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2479,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 77.3.',0.8,'SOL','failed','2026-07-08 16:54:23','2026-07-08 19:54:23.044199',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2480,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1672.',0.7,'ADA','failed','2026-07-08 16:56:18','2026-07-08 19:56:18.604526',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2481,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.24.',-0.8,'SOL','failed','2026-07-08 16:58:02','2026-07-08 19:58:02.387657',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2482,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.426.',0.8,'AVAX','failed','2026-07-08 17:00:06','2026-07-08 20:00:06.774739',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2483,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1734.56.',-1.0,'ETH','failed','2026-07-08 17:02:11','2026-07-08 20:02:11.047445',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2484,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.167.',0.7,'ADA','failed','2026-07-08 17:04:07','2026-07-08 20:04:07.354499',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2485,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 77.15.',-1.0,'SOL','failed','2026-07-08 17:06:12','2026-07-08 20:06:12.624766',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2486,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.441.',0.8,'AVAX','failed','2026-07-08 17:08:16','2026-07-08 20:08:16.253582',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2487,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62115.93.',-1.0,'BTC','failed','2026-07-08 17:10:21','2026-07-08 20:10:21.406284',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2488,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1734.9.',-1.0,'ETH','failed','2026-07-08 17:12:35','2026-07-08 20:12:35.594478',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2489,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.434.',-1.0,'AVAX','failed','2026-07-08 17:14:30','2026-07-08 20:14:30.381696',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2490,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.431.',1.0,'AVAX','failed','2026-07-08 17:16:05','2026-07-08 20:16:05.134546',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2491,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.616.',-1.0,'LINK','failed','2026-07-08 17:18:49','2026-07-08 20:18:49.728134',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2492,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.167.',-1.0,'ADA','failed','2026-07-08 17:20:44','2026-07-08 20:20:44.266061',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2493,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.45.',0.7,'AVAX','failed','2026-07-08 17:22:59','2026-07-08 20:22:59.516227',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2494,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62208.2.',-0.8,'BTC','failed','2026-07-08 17:24:44','2026-07-08 20:24:44.265713',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2495,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62242.35.',-1.0,'BTC','failed','2026-07-08 17:26:49','2026-07-08 20:26:49.270383',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2496,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62260.16.',-1.0,'BTC','failed','2026-07-08 17:28:32','2026-07-08 20:28:32.328057',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2497,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.58.',0.6,'SOL','failed','2026-07-08 17:30:36','2026-07-08 20:30:36.846091',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2498,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1671.',0.8,'ADA','failed','2026-07-08 17:32:42','2026-07-08 20:32:42.054883',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2499,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1673.',-1.0,'ADA','failed','2026-07-08 17:35:05','2026-07-08 20:35:05.825781',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2500,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62388.88.',-1.0,'BTC','failed','2026-07-08 17:37:10','2026-07-08 20:37:10.522770',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2501,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1671.',-1.0,'ADA','failed','2026-07-08 17:39:26','2026-07-08 20:39:26.065213',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2502,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.471.',-0.8,'AVAX','failed','2026-07-08 17:41:40','2026-07-08 20:41:40.790891',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2503,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 566.84.',-1.0,'BNB','failed','2026-07-08 17:43:25','2026-07-08 20:43:25.495664',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2504,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1663.',-1.0,'ADA','failed','2026-07-08 17:45:21','2026-07-08 20:45:21.277893',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2505,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1662.',-1.0,'ADA','failed','2026-07-08 17:47:26','2026-07-08 20:47:26.467105',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2506,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62252.0.',-0.7,'BTC','failed','2026-07-08 17:49:42','2026-07-08 20:49:42.043380',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2507,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62209.0.',0.8,'BTC','failed','2026-07-08 17:52:17','2026-07-08 20:52:17.096185',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2508,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1664.',-1.0,'ADA','failed','2026-07-08 17:54:02','2026-07-08 20:54:02.771983',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2509,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.08.',-1.0,'SOL','failed','2026-07-08 17:56:07','2026-07-08 20:56:07.160098',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2510,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0855.',0.75,'XRP','failed','2026-07-08 17:58:11','2026-07-08 20:58:11.706692',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2511,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62104.63.',-1.0,'BTC','failed','2026-07-08 17:59:57','2026-07-08 20:59:57.350182',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2512,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.166.',1.0,'ADA','failed','2026-07-08 18:02:12','2026-07-08 21:02:12.693480',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2513,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.628.',0.8,'LINK','failed','2026-07-08 18:03:57','2026-07-08 21:03:57.864974',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2514,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.28.',0.8,'SOL','failed','2026-07-08 18:06:11','2026-07-08 21:06:11.764989',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2515,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.63.',-1.0,'LINK','failed','2026-07-08 18:07:56','2026-07-08 21:07:56.408231',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2516,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.166.',0.8,'ADA','failed','2026-07-08 18:09:30','2026-07-08 21:09:30.665046',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2517,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0894.',-1.0,'XRP','failed','2026-07-08 18:11:16','2026-07-08 21:11:16.336738',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2518,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 565.28.',-0.8,'BNB','failed','2026-07-08 18:13:20','2026-07-08 21:13:20.288269',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2519,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.452.',1.0,'AVAX','failed','2026-07-08 18:15:44','2026-07-08 21:15:44.831511',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2520,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0895.',1.0,'XRP','failed','2026-07-08 18:18:20','2026-07-08 21:18:20.318661',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2521,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.24.',-0.7,'SOL','failed','2026-07-08 18:20:14','2026-07-08 21:20:14.524165',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2522,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1738.8.',0.8,'ETH','failed','2026-07-08 18:22:29','2026-07-08 21:22:29.125283',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2523,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0901.',-1.0,'XRP','failed','2026-07-08 18:24:44','2026-07-08 21:24:44.753045',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2524,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1736.05.',1.0,'ETH','failed','2026-07-08 18:26:39','2026-07-08 21:26:39.865408',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2525,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 565.1.',-1.0,'BNB','failed','2026-07-08 18:28:45','2026-07-08 21:28:45.115516',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2526,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1659.',-1.0,'ADA','failed','2026-07-08 18:30:48','2026-07-08 21:30:48.898987',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2527,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 564.88.',1.0,'BNB','failed','2026-07-08 18:32:42','2026-07-08 21:32:42.012946',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2528,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0856.',-1.0,'XRP','failed','2026-07-08 18:34:46','2026-07-08 21:34:46.098080',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2529,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62060.25.',-1.0,'BTC','failed','2026-07-08 18:36:21','2026-07-08 21:36:21.247125',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2530,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 564.5.',-1.0,'BNB','failed','2026-07-08 18:38:35','2026-07-08 21:38:35.215175',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2531,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62089.99.',-0.7,'BTC','failed','2026-07-08 18:40:30','2026-07-08 21:40:30.051555',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2532,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0849.',0.8,'XRP','failed','2026-07-08 18:42:52','2026-07-08 21:42:52.990134',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2533,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62082.72.',0.8,'BTC','failed','2026-07-08 18:44:38','2026-07-08 21:44:38.181890',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2534,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0872.',-1.0,'XRP','failed','2026-07-08 18:46:42','2026-07-08 21:46:42.813797',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2535,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 77.07.',-1.0,'SOL','failed','2026-07-08 18:48:37','2026-07-08 21:48:37.176062',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2536,6,'Bitcoin peels back to $62K as Fed-wary futures traders cut risk: Is the BTC rally over?. <p style="float: right; margin: 0 0 10px 15px; width: 240px;"><img alt="Bitcoin peels back to $62K as Fed-wary futures traders cut risk: Is the BTC rally over?" class="type:primaryImage" src="https://s3-images.ctmedia.io/media/article-covers/article-covers-70719-bitcoin-golden-cross-due-in-days-as-bears-draw-a-line-at-47k-btc-price.jpg" /></p><p>Bitcoin hovered around the $62,000 mark following a spike in oil prices, escalating hot war in Iran and traders’ move to cut risk ahead of a Federal Reserve policy statement.</p>',5.0,'BTC','processed','2026-07-08 18:50:44','2026-07-08 21:50:44.088801',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2537,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.472.',1.0,'AVAX','failed','2026-07-08 18:51:12','2026-07-08 21:51:12.830704',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2538,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.22.',0.8,'SOL','failed','2026-07-08 18:53:36','2026-07-08 21:53:36.964701',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2539,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 77.12.',0.8,'SOL','failed','2026-07-08 18:56:22','2026-07-08 21:56:22.083815',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2540,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1737.0.',1.0,'ETH','failed','2026-07-08 18:59:06','2026-07-08 21:59:06.323469',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2541,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 566.88.',-1.0,'BNB','failed','2026-07-08 19:01:31','2026-07-08 22:01:31.170335',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2542,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 566.49.',-1.0,'BNB','failed','2026-07-08 19:03:44','2026-07-08 22:03:44.611965',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2543,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1735.91.',-1.0,'ETH','failed','2026-07-08 19:05:48','2026-07-08 22:05:48.959458',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2544,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.626.',-1.0,'LINK','failed','2026-07-08 19:08:04','2026-07-08 22:08:04.243718',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2545,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1736.15.',1.0,'ETH','failed','2026-07-08 19:09:59','2026-07-08 22:09:59.393941',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2546,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62108.99.',1.0,'BTC','failed','2026-07-08 19:12:44','2026-07-08 22:12:44.557156',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2547,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1734.16.',1.0,'ETH','failed','2026-07-08 19:15:07','2026-07-08 22:15:07.946783',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2548,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.619.',-1.0,'LINK','failed','2026-07-08 19:17:12','2026-07-08 22:17:12.560447',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2549,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 566.01.',-1.0,'BNB','failed','2026-07-08 19:19:36','2026-07-08 22:19:36.818945',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2550,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.62.',0.6,'LINK','failed','2026-07-08 19:21:22','2026-07-08 22:21:22.302429',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2551,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.05.',1.0,'SOL','failed','2026-07-08 19:23:27','2026-07-08 22:23:27.338514',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2552,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62215.2.',-1.0,'BTC','failed','2026-07-08 19:25:00','2026-07-08 22:25:00.443794',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2553,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.07.',-1.0,'SOL','failed','2026-07-08 19:27:04','2026-07-08 22:27:04.653271',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2554,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.167.',-1.0,'ADA','failed','2026-07-08 19:29:08','2026-07-08 22:29:08.393501',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2555,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0891.',1.0,'XRP','failed','2026-07-08 19:31:32','2026-07-08 22:31:32.637639',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2556,10,'CMC ALERT: HIGH is heavily pumping! 1-hour change: 6.58870526%. 24h Volume: $26,009,650.',8.0,'HIGH','processed','2026-07-08 19:33:18','2026-07-08 22:33:18.970255',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2557,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.21.',0.6,'SOL','failed','2026-07-08 19:33:36','2026-07-08 22:33:36.387455',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2558,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62218.91.',1.0,'BTC','failed','2026-07-08 19:35:31','2026-07-08 22:35:31.614806',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2559,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1669.',-1.0,'ADA','failed','2026-07-08 19:37:16','2026-07-08 22:37:16.798029',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2560,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 567.25.',1.0,'BNB','failed','2026-07-08 19:38:51','2026-07-08 22:38:51.965087',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2561,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1739.57.',-1.0,'ETH','failed','2026-07-08 19:41:05','2026-07-08 22:41:05.642186',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2562,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62252.95.',-1.0,'BTC','failed','2026-07-08 19:43:01','2026-07-08 22:43:01.334816',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2563,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0897.',-1.0,'XRP','failed','2026-07-08 19:44:46','2026-07-08 22:44:46.003989',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2564,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0891.',-1.0,'XRP','failed','2026-07-08 19:46:49','2026-07-08 22:46:49.430331',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2565,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 77.27.',-1.0,'SOL','failed','2026-07-08 19:48:33','2026-07-08 22:48:33.357910',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2566,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.21.',0.8,'SOL','failed','2026-07-08 19:50:28','2026-07-08 22:50:28.612887',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2567,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0893.',-1.0,'XRP','failed','2026-07-08 19:52:33','2026-07-08 22:52:33.328648',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2568,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0894.',-1.0,'XRP','failed','2026-07-08 19:54:16','2026-07-08 22:54:17.003421',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2569,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1738.95.',1.0,'ETH','failed','2026-07-08 19:56:31','2026-07-08 22:56:31.861087',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2570,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62228.01.',-0.8,'BTC','failed','2026-07-08 19:58:27','2026-07-08 22:58:27.075468',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2571,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62288.22.',1.0,'BTC','failed','2026-07-08 20:00:11','2026-07-08 23:00:11.800630',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2572,10,'CMC ALERT: BPX is heavily pumping! 1-hour change: 462.32947553%. 24h Volume: $1,046,148.',-1.0,'BPX','failed','2026-07-08 20:00:28','2026-07-08 23:00:28.097795',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2573,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.628.',0.7,'LINK','failed','2026-07-08 20:02:27','2026-07-08 23:02:27.136076',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2574,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.453.',1.0,'AVAX','failed','2026-07-08 20:04:42','2026-07-08 23:04:42.201152',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2575,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62304.0.',-1.0,'BTC','failed','2026-07-08 20:06:47','2026-07-08 23:06:47.343754',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2576,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0906.',-1.0,'XRP','failed','2026-07-08 20:08:52','2026-07-08 23:08:52.069649',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2577,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 77.54.',-1.0,'SOL','failed','2026-07-08 20:10:36','2026-07-08 23:10:36.323819',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2578,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62217.79.',1.0,'BTC','failed','2026-07-08 20:12:11','2026-07-08 23:12:11.180491',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2579,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1737.76.',-1.0,'ETH','failed','2026-07-08 20:14:04','2026-07-08 23:14:04.928592',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2580,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62238.02.',-1.0,'BTC','failed','2026-07-08 20:15:50','2026-07-08 23:15:50.398592',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2581,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.0879.',-0.7,'XRP','failed','2026-07-08 20:17:45','2026-07-08 23:17:45.226865',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2582,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0879.',-1.0,'XRP','failed','2026-07-08 20:19:20','2026-07-08 23:19:20.187942',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2583,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.44.',-1.0,'AVAX','failed','2026-07-08 20:21:14','2026-07-08 23:21:14.912179',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2584,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.441.',-1.0,'AVAX','failed','2026-07-08 20:23:09','2026-07-08 23:23:09.170037',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2585,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1664.',-0.7,'ADA','failed','2026-07-08 20:25:14','2026-07-08 23:25:14.263403',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2586,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.441.',0.8,'AVAX','failed','2026-07-08 20:27:10','2026-07-08 23:27:10.064406',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2587,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0901.',1.0,'XRP','failed','2026-07-08 20:29:14','2026-07-08 23:29:14.732676',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2588,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1738.24.',0.8,'ETH','failed','2026-07-08 20:31:38','2026-07-08 23:31:38.017569',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2589,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.44.',1.0,'AVAX','failed','2026-07-08 20:33:32','2026-07-08 23:33:32.798287',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2590,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1737.21.',-1.0,'ETH','failed','2026-07-08 20:35:27','2026-07-08 23:35:27.886882',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2591,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.44.',-1.0,'AVAX','failed','2026-07-08 20:37:32','2026-07-08 23:37:32.954778',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2592,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1735.19.',-1.0,'ETH','failed','2026-07-08 20:39:47','2026-07-08 23:39:47.670074',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2593,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.17.',0.8,'SOL','failed','2026-07-08 20:42:02','2026-07-08 23:42:02.204943',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2594,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1664.',0.8,'ADA','failed','2026-07-08 20:44:06','2026-07-08 23:44:06.522891',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2595,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.442.',-1.0,'AVAX','failed','2026-07-08 20:46:20','2026-07-08 23:46:20.338249',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2596,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1664.',-1.0,'ADA','failed','2026-07-08 20:48:15','2026-07-08 23:48:15.486101',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2597,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.44.',-0.8,'AVAX','failed','2026-07-08 20:50:40','2026-07-08 23:50:40.518802',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2598,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1664.',0.6,'ADA','failed','2026-07-08 20:52:33','2026-07-08 23:52:33.735729',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2599,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1736.11.',1.0,'ETH','failed','2026-07-08 20:54:27','2026-07-08 23:54:27.136931',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2600,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.166.',0.7,'ADA','failed','2026-07-08 20:56:11','2026-07-08 23:56:11.543528',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2601,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62100.0.',-1.0,'BTC','failed','2026-07-08 20:58:35','2026-07-08 23:58:35.735065',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2602,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62101.99.',1.0,'BTC','failed','2026-07-08 21:00:30','2026-07-09 00:00:30.294698',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2603,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0884.',-1.0,'XRP','failed','2026-07-08 21:02:44','2026-07-09 00:02:44.880510',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2604,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0875.',-1.0,'XRP','failed','2026-07-08 21:04:58','2026-07-09 00:04:58.782377',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2605,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0879.',-1.0,'XRP','failed','2026-07-08 21:06:43','2026-07-09 00:06:43.955701',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2606,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.432.',1.0,'AVAX','failed','2026-07-08 21:08:58','2026-07-09 00:08:58.981708',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2607,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.08.',0.6,'SOL','failed','2026-07-08 21:11:14','2026-07-09 00:11:14.929732',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2608,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.432.',0.8,'AVAX','failed','2026-07-08 21:13:08','2026-07-09 00:13:08.721093',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2609,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.598.',-1.0,'LINK','failed','2026-07-08 21:15:02','2026-07-09 00:15:02.826975',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2610,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1656.',1.0,'ADA','failed','2026-07-08 21:16:47','2026-07-09 00:16:48.006798',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2611,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 565.41.',1.0,'BNB','failed','2026-07-08 21:19:02','2026-07-09 00:19:02.310903',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2612,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 565.21.',1.0,'BNB','failed','2026-07-08 21:22:05','2026-07-09 00:22:05.991039',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2613,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.087.',1.0,'XRP','failed','2026-07-08 21:23:50','2026-07-09 00:23:50.578222',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2614,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.598.',-1.0,'LINK','failed','2026-07-08 21:26:25','2026-07-09 00:26:25.677629',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2615,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.611.',1.0,'LINK','failed','2026-07-08 21:28:00','2026-07-09 00:28:00.399230',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2616,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.445.',-1.0,'AVAX','failed','2026-07-08 21:30:04','2026-07-09 00:30:04.982267',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2617,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.449.',-0.7,'AVAX','failed','2026-07-08 21:31:50','2026-07-09 00:31:50.207845',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2618,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 565.88.',-1.0,'BNB','failed','2026-07-08 21:34:04','2026-07-09 00:34:04.905717',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2619,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62064.45.',-1.0,'BTC','failed','2026-07-08 21:36:09','2026-07-09 00:36:09.441562',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2620,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1736.31.',-1.0,'ETH','failed','2026-07-08 21:37:55','2026-07-09 00:37:55.209848',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2621,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62113.45.',-1.0,'BTC','failed','2026-07-08 21:39:49','2026-07-09 00:39:49.847490',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2622,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.462.',0.5,'AVAX','failed','2026-07-08 21:41:24','2026-07-09 00:41:24.581066',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2623,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.462.',1.0,'AVAX','failed','2026-07-08 21:43:08','2026-07-09 00:43:08.081183',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2624,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.462.',-0.8,'AVAX','failed','2026-07-08 21:44:52','2026-07-09 00:44:52.394923',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2625,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0898.',-1.0,'XRP','failed','2026-07-08 21:47:05','2026-07-09 00:47:05.909916',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2626,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62150.0.',-1.0,'BTC','failed','2026-07-08 21:49:20','2026-07-09 00:49:20.420505',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2627,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0905.',-1.0,'XRP','failed','2026-07-08 21:51:34','2026-07-09 00:51:34.695026',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2628,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.631.',-1.0,'LINK','failed','2026-07-08 21:54:08','2026-07-09 00:54:08.666629',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2629,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 567.02.',-1.0,'BNB','failed','2026-07-08 21:56:11','2026-07-09 00:56:11.716639',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2630,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62234.7.',-1.0,'BTC','failed','2026-07-08 21:58:36','2026-07-09 00:58:36.045966',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2631,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 566.7.',-1.0,'BNB','failed','2026-07-08 22:00:29','2026-07-09 01:00:29.747220',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2632,6,'Bitcoin tumbles back to key $60K support level: What’s behind the sell pressure?. <p style="float: right; margin: 0 0 10px 15px; width: 240px;"><img alt="Bitcoin tumbles back to key $60K support level: What’s behind the sell pressure?" class="type:primaryImage" src="https://s3-images.ctmedia.io/media/article-covers/article-covers-247477-bitcoin-futures-data-shows-bears-gearing-up-for-an-assault-on-dollar60k.jpeg" /></p><p>Bitcoin faces renewed sell pressure amid an oil price surge, Japan economic contagion risks and a fresh round of selling from Strategy.</p>',2.0,'BTC','processed','2026-07-08 22:01:26','2026-07-09 01:01:26.274651',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2633,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1668.',-1.0,'ADA','failed','2026-07-08 22:02:13','2026-07-09 01:02:13.893558',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2634,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62289.99.',-1.0,'BTC','failed','2026-07-08 22:04:18','2026-07-09 01:04:18.594215',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2635,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.32.',-0.6,'SOL','failed','2026-07-08 22:06:22','2026-07-09 01:06:22.201457',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2636,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1669.',-0.8,'ADA','failed','2026-07-08 22:07:58','2026-07-09 01:07:58.171429',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2637,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1739.25.',0.8,'ETH','failed','2026-07-08 22:09:32','2026-07-09 01:09:32.673969',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2638,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1667.',0.75,'ADA','failed','2026-07-08 22:11:26','2026-07-09 01:11:26.860863',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2639,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 567.02.',-1.0,'BNB','failed','2026-07-08 22:13:52','2026-07-09 01:13:52.245620',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2640,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1738.33.',-0.7,'ETH','failed','2026-07-08 22:15:46','2026-07-09 01:15:46.996746',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2641,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.465.',-1.0,'AVAX','failed','2026-07-08 22:17:51','2026-07-09 01:17:51.384610',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2642,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 566.76.',0.8,'BNB','failed','2026-07-08 22:19:36','2026-07-09 01:19:36.170000',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2643,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62188.63.',1.0,'BTC','failed','2026-07-08 22:22:10','2026-07-09 01:22:10.240511',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2644,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.32.',0.7,'SOL','failed','2026-07-08 22:24:05','2026-07-09 01:24:05.005007',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2645,10,'CMC ALERT: WPAY is heavily pumping! 1-hour change: 9.4776716%. 24h Volume: $1,113,831.',-0.7,'WPAY','failed','2026-07-08 22:24:35','2026-07-09 01:24:35.404098',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2646,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 567.6.',0.7,'BNB','failed','2026-07-08 22:25:59','2026-07-09 01:25:59.304801',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2647,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1738.81.',-1.0,'ETH','failed','2026-07-08 22:28:12','2026-07-09 01:28:12.753838',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2648,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.459.',-1.0,'AVAX','failed','2026-07-08 22:29:46','2026-07-09 01:29:46.419115',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2649,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 567.77.',-1.0,'BNB','failed','2026-07-08 22:31:39','2026-07-09 01:31:39.415199',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2650,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.35.',1.0,'SOL','failed','2026-07-08 22:33:45','2026-07-09 01:33:45.183747',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2651,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 567.71.',-1.0,'BNB','failed','2026-07-08 22:35:59','2026-07-09 01:35:59.957921',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2652,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.465.',-1.0,'AVAX','failed','2026-07-08 22:37:44','2026-07-09 01:37:44.681059',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2653,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1669.',-1.0,'ADA','failed','2026-07-08 22:39:38','2026-07-09 01:39:38.611908',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2654,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 567.51.',-1.0,'BNB','failed','2026-07-08 22:41:44','2026-07-09 01:41:44.218292',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2655,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 77.43.',-1.0,'SOL','failed','2026-07-08 22:44:08','2026-07-09 01:44:08.885157',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2656,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0916.',1.0,'XRP','failed','2026-07-08 22:46:03','2026-07-09 01:46:03.681884',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2657,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 567.51.',0.6,'BNB','failed','2026-07-08 22:48:06','2026-07-09 01:48:06.697893',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2658,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1668.',-1.0,'ADA','failed','2026-07-08 22:50:41','2026-07-09 01:50:41.324593',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2659,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0921.',-1.0,'XRP','failed','2026-07-08 22:52:46','2026-07-09 01:52:46.556289',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2660,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1739.26.',1.0,'ETH','failed','2026-07-08 22:55:30','2026-07-09 01:55:30.479161',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2661,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0928.',-1.0,'XRP','failed','2026-07-08 22:58:25','2026-07-09 01:58:25.692127',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2662,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.49.',1.0,'SOL','failed','2026-07-08 23:00:28','2026-07-09 02:00:28.960734',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2663,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 568.29.',-1.0,'BNB','failed','2026-07-08 23:02:13','2026-07-09 02:02:13.612375',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2664,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1740.49.',0.8,'ETH','failed','2026-07-08 23:04:28','2026-07-09 02:04:28.852411',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2665,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62319.74.',1.0,'BTC','failed','2026-07-08 23:06:23','2026-07-09 02:06:23.613230',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2666,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.646.',-1.0,'LINK','failed','2026-07-08 23:08:28','2026-07-09 02:08:28.737604',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2667,10,'CMC ALERT: ELEVATE is heavily pumping! 1-hour change: 12.08989606%. 24h Volume: $1,351,571.',0.8,'ELEVATE','failed','2026-07-08 23:09:50','2026-07-09 02:09:50.263427',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2668,10,'CMC ALERT: WIN is heavily pumping! 1-hour change: 6.94609568%. 24h Volume: $1,341,899.',0.8,'WIN','processed','2026-07-08 23:09:59','2026-07-09 02:09:59.081552',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2669,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0908.',1.0,'XRP','failed','2026-07-08 23:10:23','2026-07-09 02:10:23.872475',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2670,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0914.',-1.0,'XRP','failed','2026-07-08 23:12:58','2026-07-09 02:12:58.545187',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2671,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0906.',-1.0,'XRP','failed','2026-07-08 23:14:53','2026-07-09 02:14:53.582216',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2672,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 567.77.',-1.0,'BNB','failed','2026-07-08 23:17:28','2026-07-09 02:17:28.785719',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2673,10,'CMC ALERT: BROCCOLI is heavily pumping! 1-hour change: 6.69158234%. 24h Volume: $4,352,252.',0.8,'BROCCOLI','failed','2026-07-08 23:18:48','2026-07-09 02:18:48.023777',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2674,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.461.',-1.0,'AVAX','failed','2026-07-08 23:19:24','2026-07-09 02:19:24.018816',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2675,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.0883.',1.0,'XRP','failed','2026-07-08 23:21:19','2026-07-09 02:21:19.189476',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2676,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1667.',1.0,'ADA','failed','2026-07-08 23:23:34','2026-07-09 02:23:34.392888',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2677,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.459.',1.0,'AVAX','failed','2026-07-08 23:25:58','2026-07-09 02:25:58.187084',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2678,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 567.66.',1.0,'BNB','failed','2026-07-08 23:27:52','2026-07-09 02:27:52.732923',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2679,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0882.',1.0,'XRP','failed','2026-07-08 23:30:17','2026-07-09 02:30:17.913810',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2680,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.0882.',0.8,'XRP','failed','2026-07-08 23:32:23','2026-07-09 02:32:23.555105',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2681,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.46.',-1.0,'AVAX','failed','2026-07-08 23:34:36','2026-07-09 02:34:36.522251',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2682,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 77.49.',1.0,'SOL','failed','2026-07-08 23:36:20','2026-07-09 02:36:20.286520',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2683,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1741.72.',1.0,'ETH','failed','2026-07-08 23:38:25','2026-07-09 02:38:25.334865',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2684,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 77.55.',-1.0,'SOL','failed','2026-07-08 23:40:40','2026-07-09 02:40:40.020214',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2685,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 77.59.',-1.0,'SOL','failed','2026-07-08 23:42:34','2026-07-09 02:42:34.837470',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2686,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.459.',1.0,'AVAX','failed','2026-07-08 23:44:38','2026-07-09 02:44:38.245397',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2687,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1668.',-1.0,'ADA','failed','2026-07-08 23:46:42','2026-07-09 02:46:42.113377',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2688,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.089.',0.8,'XRP','failed','2026-07-08 23:48:47','2026-07-09 02:48:47.306579',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2689,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.459.',-1.0,'AVAX','failed','2026-07-08 23:50:51','2026-07-09 02:50:51.720965',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2690,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.63.',1.0,'LINK','failed','2026-07-08 23:53:27','2026-07-09 02:53:27.135296',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2691,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 568.7.',-1.0,'BNB','failed','2026-07-08 23:55:12','2026-07-09 02:55:12.597874',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2692,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1744.21.',-1.0,'ETH','failed','2026-07-08 23:56:47','2026-07-09 02:56:47.468530',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2693,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.475.',0.7,'AVAX','failed','2026-07-08 23:58:21','2026-07-09 02:58:21.922164',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2694,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1744.19.',1.0,'ETH','failed','2026-07-09 00:00:17','2026-07-09 03:00:17.184568',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2695,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1668.',-1.0,'ADA','failed','2026-07-09 00:02:21','2026-07-09 03:02:21.035878',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2696,10,'CMC ALERT: OWL is heavily pumping! 1-hour change: 7.30861659%. 24h Volume: $1,136,802.',0.8,'OWL','failed','2026-07-09 00:03:57','2026-07-09 03:03:57.314398',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2697,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.628.',-1.0,'LINK','failed','2026-07-09 00:04:25','2026-07-09 03:04:25.744531',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2698,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1742.52.',1.0,'ETH','failed','2026-07-09 00:06:30','2026-07-09 03:06:30.441528',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2699,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.627.',1.0,'LINK','failed','2026-07-09 00:08:04','2026-07-09 03:08:04.822726',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2700,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 568.64.',0.7,'BNB','failed','2026-07-09 00:10:19','2026-07-09 03:10:19.473357',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2701,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1742.09.',1.0,'ETH','failed','2026-07-09 00:12:14','2026-07-09 03:12:14.498269',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2702,10,'CMC ALERT: ELMT is heavily pumping! 1-hour change: 32.30951891%. 24h Volume: $1,132,857.',0.8,'ELMT','failed','2026-07-09 00:13:06','2026-07-09 03:13:06.500131',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2703,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.09.',-1.0,'XRP','failed','2026-07-09 00:14:18','2026-07-09 03:14:18.799789',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2704,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.627.',-1.0,'LINK','failed','2026-07-09 00:16:11','2026-07-09 03:16:11.932078',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2705,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.483.',0.7,'AVAX','failed','2026-07-09 00:18:16','2026-07-09 03:18:16.555352',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2706,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.627.',0.7,'LINK','failed','2026-07-09 00:20:21','2026-07-09 03:20:21.298920',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2707,10,'CMC ALERT: BEE is heavily pumping! 1-hour change: 16.75173714%. 24h Volume: $1,173,417.',0.8,'BEE','failed','2026-07-09 00:21:55','2026-07-09 03:21:55.399869',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2708,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 77.65.',1.0,'SOL','failed','2026-07-09 00:22:35','2026-07-09 03:22:35.618237',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2709,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.465.',-1.0,'AVAX','failed','2026-07-09 00:24:30','2026-07-09 03:24:30.303859',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2710,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1668.',-1.0,'ADA','failed','2026-07-09 00:26:44','2026-07-09 03:26:44.682355',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2711,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 567.94.',-1.0,'BNB','failed','2026-07-09 00:28:59','2026-07-09 03:28:59.778025',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2712,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0909.',1.0,'XRP','failed','2026-07-09 00:30:44','2026-07-09 03:30:44.933016',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2713,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1741.75.',-1.0,'ETH','failed','2026-07-09 00:32:38','2026-07-09 03:32:38.666044',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2714,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0894.',-1.0,'XRP','failed','2026-07-09 00:35:13','2026-07-09 03:35:13.484073',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2715,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 77.71.',-1.0,'SOL','failed','2026-07-09 00:37:07','2026-07-09 03:37:07.811908',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2716,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0899.',-1.0,'XRP','failed','2026-07-09 00:39:03','2026-07-09 03:39:03.483870',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2717,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0886.',-1.0,'XRP','failed','2026-07-09 00:41:07','2026-07-09 03:41:07.536887',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2718,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1739.67.',-1.0,'ETH','failed','2026-07-09 00:43:31','2026-07-09 03:43:31.250472',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2719,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.619.',1.0,'LINK','failed','2026-07-09 00:45:25','2026-07-09 03:45:25.434239',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2720,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.45.',0.7,'AVAX','failed','2026-07-09 00:47:30','2026-07-09 03:47:30.460717',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2721,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0891.',1.0,'XRP','failed','2026-07-09 00:49:54','2026-07-09 03:49:54.783350',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2722,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0872.',1.0,'XRP','failed','2026-07-09 00:52:08','2026-07-09 03:52:08.840210',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2723,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0877.',1.0,'XRP','failed','2026-07-09 00:54:03','2026-07-09 03:54:03.259078',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2724,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.445.',1.0,'AVAX','failed','2026-07-09 00:56:17','2026-07-09 03:56:17.873598',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2725,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1737.37.',1.0,'ETH','failed','2026-07-09 00:58:13','2026-07-09 03:58:13.167931',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2726,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0879.',-1.0,'XRP','failed','2026-07-09 01:00:48','2026-07-09 04:00:48.248326',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2727,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.626.',0.7,'LINK','failed','2026-07-09 01:02:42','2026-07-09 04:02:42.843082',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2728,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0886.',-1.0,'XRP','failed','2026-07-09 01:05:07','2026-07-09 04:05:07.049507',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2729,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.473.',1.0,'AVAX','failed','2026-07-09 01:06:52','2026-07-09 04:06:52.273358',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2730,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0911.',-1.0,'XRP','failed','2026-07-09 01:09:06','2026-07-09 04:09:06.847349',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2731,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.678.',0.8,'LINK','failed','2026-07-09 01:11:31','2026-07-09 04:11:31.400147',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2732,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.673.',-1.0,'LINK','failed','2026-07-09 01:13:35','2026-07-09 04:13:35.639975',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2733,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 570.95.',1.0,'BNB','failed','2026-07-09 01:15:20','2026-07-09 04:15:20.280981',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2734,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.168.',-1.0,'ADA','failed','2026-07-09 01:17:24','2026-07-09 04:17:24.596820',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2735,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.689.',1.0,'LINK','failed','2026-07-09 01:18:59','2026-07-09 04:18:59.846416',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2736,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 571.12.',0.7,'BNB','failed','2026-07-09 01:21:15','2026-07-09 04:21:15.540369',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2737,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 78.39.',1.0,'SOL','failed','2026-07-09 01:23:30','2026-07-09 04:23:30.406119',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2738,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 570.6.',0.8,'BNB','failed','2026-07-09 01:25:34','2026-07-09 04:25:34.061894',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2739,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.516.',-1.0,'AVAX','failed','2026-07-09 01:27:08','2026-07-09 04:27:08.074967',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2740,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 78.22.',-1.0,'SOL','failed','2026-07-09 01:28:52','2026-07-09 04:28:52.090875',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2741,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 570.28.',-1.0,'BNB','failed','2026-07-09 01:30:57','2026-07-09 04:30:57.651913',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2742,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.168.',-1.0,'ADA','failed','2026-07-09 01:33:02','2026-07-09 04:33:02.995633',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2743,10,'CMC ALERT: VINE is heavily pumping! 1-hour change: 7.06211097%. 24h Volume: $6,545,051.',0.7,'VINE','failed','2026-07-09 01:34:04','2026-07-09 04:34:04.795149',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2744,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.168.',-1.0,'ADA','failed','2026-07-09 01:34:48','2026-07-09 04:34:48.772857',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2745,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.168.',-1.0,'ADA','failed','2026-07-09 01:36:43','2026-07-09 04:36:43.958307',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2746,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 77.96.',-1.0,'SOL','failed','2026-07-09 01:38:29','2026-07-09 04:38:29.318640',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2747,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 569.15.',1.0,'BNB','failed','2026-07-09 01:40:53','2026-07-09 04:40:53.991972',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2748,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0858.',-1.0,'XRP','failed','2026-07-09 01:42:48','2026-07-09 04:42:48.702635',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2749,10,'CMC ALERT: GROW is heavily pumping! 1-hour change: 10.54442406%. 24h Volume: $1,026,616.',0.8,'GROW','failed','2026-07-09 01:43:16','2026-07-09 04:43:16.596206',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2750,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.509.',-1.0,'AVAX','failed','2026-07-09 01:44:53','2026-07-09 04:44:53.021105',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2751,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1734.63.',-1.0,'ETH','failed','2026-07-09 01:47:06','2026-07-09 04:47:06.656676',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2752,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1667.',1.0,'ADA','failed','2026-07-09 01:49:41','2026-07-09 04:49:41.834230',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2753,10,'CMC ALERT: HOOD is heavily pumping! 1-hour change: 56.91090455%. 24h Volume: $1,024,467.',0.7,'HOOD','failed','2026-07-09 01:52:05','2026-07-09 04:52:05.535281',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2754,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1733.63.',-1.0,'ETH','failed','2026-07-09 01:52:06','2026-07-09 04:52:06.121285',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2755,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1733.13.',1.0,'ETH','failed','2026-07-09 01:54:31','2026-07-09 04:54:31.164526',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2756,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0834.',-1.0,'XRP','failed','2026-07-09 01:56:25','2026-07-09 04:56:25.788530',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2757,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 567.29.',1.0,'BNB','failed','2026-07-09 01:58:10','2026-07-09 04:58:10.481174',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2758,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 77.37.',-1.0,'SOL','failed','2026-07-09 02:00:25','2026-07-09 05:00:25.589495',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2759,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 567.13.',-1.0,'BNB','failed','2026-07-09 02:02:59','2026-07-09 05:02:59.327971',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2760,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.5.',-1.0,'AVAX','failed','2026-07-09 02:04:42','2026-07-09 05:04:42.271279',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2761,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 567.74.',-1.0,'BNB','failed','2026-07-09 02:06:47','2026-07-09 05:06:47.307465',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2762,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0881.',-1.0,'XRP','failed','2026-07-09 02:08:52','2026-07-09 05:08:52.576192',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2763,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.623.',1.0,'LINK','failed','2026-07-09 02:10:57','2026-07-09 05:10:57.678150',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2764,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 568.99.',-1.0,'BNB','failed','2026-07-09 02:13:41','2026-07-09 05:13:41.761921',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2765,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.167.',1.0,'ADA','failed','2026-07-09 02:15:35','2026-07-09 05:15:35.966208',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2766,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1666.',-1.0,'ADA','failed','2026-07-09 02:17:41','2026-07-09 05:17:41.118411',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2767,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0894.',1.0,'XRP','failed','2026-07-09 02:19:35','2026-07-09 05:19:35.338618',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2768,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1668.',-1.0,'ADA','failed','2026-07-09 02:21:30','2026-07-09 05:21:30.102749',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2769,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 568.96.',-1.0,'BNB','failed','2026-07-09 02:23:53','2026-07-09 05:23:53.030956',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2770,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1736.63.',-1.0,'ETH','failed','2026-07-09 02:26:07','2026-07-09 05:26:07.217099',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2771,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62022.44.',-1.0,'BTC','failed','2026-07-09 02:28:11','2026-07-09 05:28:11.878320',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2772,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1734.91.',-1.0,'ETH','failed','2026-07-09 02:29:47','2026-07-09 05:29:47.470593',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2773,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1734.79.',0.7,'ETH','failed','2026-07-09 02:31:21','2026-07-09 05:31:21.845805',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2774,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.5.',0.7,'SOL','failed','2026-07-09 02:33:17','2026-07-09 05:33:17.063676',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2775,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1727.71.',1.0,'ETH','failed','2026-07-09 02:35:30','2026-07-09 05:35:30.498308',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2776,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 77.41.',1.0,'SOL','failed','2026-07-09 02:37:46','2026-07-09 05:37:46.180333',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2777,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.469.',1.0,'AVAX','failed','2026-07-09 02:40:10','2026-07-09 05:40:10.382970',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2778,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 567.51.',1.0,'BNB','failed','2026-07-09 02:42:04','2026-07-09 05:42:04.611293',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2779,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 61864.22.',1.0,'BTC','failed','2026-07-09 02:43:59','2026-07-09 05:43:59.794816',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2780,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.476.',-1.0,'AVAX','failed','2026-07-09 02:45:42','2026-07-09 05:45:42.766892',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2781,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1663.',1.0,'ADA','failed','2026-07-09 02:47:57','2026-07-09 05:47:57.254047',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2782,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1661.',-1.0,'ADA','failed','2026-07-09 02:50:01','2026-07-09 05:50:01.125102',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2783,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 61705.36.',-1.0,'BTC','failed','2026-07-09 02:51:46','2026-07-09 05:51:46.171806',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2784,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.02.',0.6,'SOL','failed','2026-07-09 02:53:50','2026-07-09 05:53:50.806480',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2785,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.12.',1.0,'SOL','failed','2026-07-09 02:56:35','2026-07-09 05:56:35.406371',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2786,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.589.',-1.0,'LINK','failed','2026-07-09 02:58:39','2026-07-09 05:58:39.042688',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2787,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 61788.79.',1.0,'BTC','failed','2026-07-09 03:00:14','2026-07-09 06:00:14.188263',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2788,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 61828.09.',1.0,'BTC','failed','2026-07-09 03:02:27','2026-07-09 06:02:27.150547',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2789,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 77.03.',1.0,'SOL','failed','2026-07-09 03:04:22','2026-07-09 06:04:22.254845',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2790,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.593.',1.0,'LINK','failed','2026-07-09 03:06:26','2026-07-09 06:06:26.999312',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2791,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0845.',-1.0,'XRP','failed','2026-07-09 03:08:21','2026-07-09 06:08:21.113457',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2792,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 76.95.',1.0,'SOL','failed','2026-07-09 03:10:16','2026-07-09 06:10:16.728267',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2793,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.589.',-1.0,'LINK','failed','2026-07-09 03:12:20','2026-07-09 06:12:20.842624',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2794,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1727.51.',1.0,'ETH','failed','2026-07-09 03:14:24','2026-07-09 06:14:24.959049',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2795,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 61876.67.',1.0,'BTC','failed','2026-07-09 03:16:28','2026-07-09 06:16:28.904529',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2796,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0861.',1.0,'XRP','failed','2026-07-09 03:18:13','2026-07-09 06:18:13.830778',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2797,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.576.',-1.0,'LINK','failed','2026-07-09 03:20:08','2026-07-09 06:20:08.456257',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2798,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 566.18.',1.0,'BNB','failed','2026-07-09 03:22:12','2026-07-09 06:22:12.356278',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2799,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.598.',-1.0,'LINK','failed','2026-07-09 03:23:55','2026-07-09 06:23:55.284263',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2800,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 567.11.',1.0,'BNB','failed','2026-07-09 03:26:18','2026-07-09 06:26:18.332811',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2801,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1728.49.',0.6,'ETH','failed','2026-07-09 03:28:22','2026-07-09 06:28:22.911222',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2802,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.453.',1.0,'AVAX','failed','2026-07-09 03:30:27','2026-07-09 06:30:27.969826',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2803,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 77.17.',-1.0,'SOL','failed','2026-07-09 03:32:32','2026-07-09 06:32:32.692029',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2804,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 568.37.',-1.0,'BNB','failed','2026-07-09 03:34:36','2026-07-09 06:34:36.325869',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2805,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 568.27.',-1.0,'BNB','failed','2026-07-09 03:36:50','2026-07-09 06:36:50.851234',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2806,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 77.26.',-1.0,'SOL','failed','2026-07-09 03:38:56','2026-07-09 06:38:56.115809',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2807,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 61896.0.',1.0,'BTC','failed','2026-07-09 03:41:01','2026-07-09 06:41:01.320900',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2808,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.624.',-1.0,'LINK','failed','2026-07-09 03:43:04','2026-07-09 06:43:04.510942',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2809,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1667.',1.0,'ADA','failed','2026-07-09 03:45:38','2026-07-09 06:45:38.823741',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2810,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1665.',0.7,'ADA','failed','2026-07-09 03:47:33','2026-07-09 06:47:33.474537',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2811,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.618.',-1.0,'LINK','failed','2026-07-09 03:49:28','2026-07-09 06:49:28.235617',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2812,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0879.',-1.0,'XRP','failed','2026-07-09 03:51:11','2026-07-09 06:51:11.480940',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2813,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1664.',-1.0,'ADA','failed','2026-07-09 03:53:06','2026-07-09 06:53:06.095595',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2814,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 61966.52.',1.0,'BTC','failed','2026-07-09 03:54:50','2026-07-09 06:54:50.289134',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2815,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1665.',1.0,'ADA','failed','2026-07-09 03:57:03','2026-07-09 06:57:03.994214',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2816,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0881.',1.0,'XRP','failed','2026-07-09 03:59:19','2026-07-09 06:59:19.132263',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2817,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1663.',-1.0,'ADA','failed','2026-07-09 04:01:13','2026-07-09 07:01:13.301616',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2818,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 568.79.',1.0,'BNB','failed','2026-07-09 04:03:27','2026-07-09 07:03:27.412593',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2819,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62031.03.',0.6,'BTC','failed','2026-07-09 04:05:22','2026-07-09 07:05:22.519550',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2820,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.36.',1.0,'SOL','failed','2026-07-09 04:07:55','2026-07-09 07:07:55.854538',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2821,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 568.46.',-1.0,'BNB','failed','2026-07-09 04:10:20','2026-07-09 07:10:20.402069',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2822,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.087.',-1.0,'XRP','failed','2026-07-09 04:12:25','2026-07-09 07:12:25.063114',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2823,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.087.',1.0,'XRP','failed','2026-07-09 04:14:19','2026-07-09 07:14:19.822247',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2824,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.483.',1.0,'AVAX','failed','2026-07-09 04:16:03','2026-07-09 07:16:03.613919',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2825,10,'CMC ALERT: BLAST is heavily pumping! 1-hour change: 10.12264428%. 24h Volume: $3,810,696.',0.6,'BLAST','failed','2026-07-09 04:16:24','2026-07-09 07:16:24.349908',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2826,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.488.',1.0,'AVAX','processed','2026-07-09 04:17:48','2026-07-09 07:17:48.849134',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2827,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ADA/USDT at entry 0.1662.',0.6,'ADA','failed','2026-07-09 04:19:43','2026-07-09 07:19:43.635474',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2828,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 567.87.',0.6,'BNB','failed','2026-07-09 04:21:58','2026-07-09 07:21:58.645992',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2829,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62040.53.',1.0,'BTC','failed','2026-07-09 04:24:13','2026-07-09 07:24:13.395845',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2830,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.085.',1.0,'XRP','failed','2026-07-09 04:26:26','2026-07-09 07:26:26.789843',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2831,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1733.54.',-1.0,'ETH','failed','2026-07-09 04:29:01','2026-07-09 07:29:01.496018',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2832,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0888.',1.0,'XRP','failed','2026-07-09 04:31:16','2026-07-09 07:31:16.461082',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2833,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0899.',1.0,'XRP','failed','2026-07-09 04:33:51','2026-07-09 07:33:51.139043',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2834,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.518.',1.0,'AVAX','failed','2026-07-09 04:35:35','2026-07-09 07:35:35.822566',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2835,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 569.62.',0.6,'BNB','failed','2026-07-09 04:37:30','2026-07-09 07:37:30.528850',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2836,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 569.67.',1.0,'BNB','failed','2026-07-09 04:39:43','2026-07-09 07:39:43.953105',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2837,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 77.8.',-1.0,'SOL','failed','2026-07-09 04:42:07','2026-07-09 07:42:07.311433',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2838,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0917.',-1.0,'XRP','failed','2026-07-09 04:44:21','2026-07-09 07:44:21.499867',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2839,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62318.29.',-1.0,'BTC','failed','2026-07-09 04:46:46','2026-07-09 07:46:46.579159',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2840,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.168.',-1.0,'ADA','failed','2026-07-09 04:48:20','2026-07-09 07:48:20.728578',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2841,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.168.',-1.0,'ADA','failed','2026-07-09 04:50:24','2026-07-09 07:50:24.871514',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2842,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 77.89.',1.0,'SOL','failed','2026-07-09 04:51:59','2026-07-09 07:51:59.968897',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2843,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 570.12.',-1.0,'BNB','failed','2026-07-09 04:54:25','2026-07-09 07:54:25.237607',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2844,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1681.',-1.0,'ADA','failed','2026-07-09 04:56:18','2026-07-09 07:56:18.203962',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2845,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on SOL/USDT at entry 77.99.',0.8,'SOL','failed','2026-07-09 04:58:02','2026-07-09 07:58:02.488225',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1,'early_profit_exit_status','inactive','Early profit exit mode (inactive, active, ai_decide)','2026-05-28 09:05:06','2026-05-28 09:05:06',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2,'early_profit_exit_hours','1','Minimum holding time (in hours) before early profit checks trigger','2026-05-28 09:05:06','2026-05-28 09:05:06',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(4,'max_futures_leverage','5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(5,'paper_trading_status','active','Master toggle for Paper/Testnet Trading',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(6,'live_trading_status','inactive','Master toggle for Live Real-Money Trading',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(7,'futures_trading_status','active','Master toggle for Futures Trading (Live & Paper)',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(8,'risk_per_trade','0.10','Risk percentage of capital per trade',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(9,'min_notional','11.0','Minimum trade notional value',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(10,'poll_interval','60','Seconds to wait before processing LLM',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(11,'system_status','running','Master switch to pause execution',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(12,'emergency_stop','0','Emergency panic button',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(13,'last_heartbeat_onchain','2026-07-09 12:57:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(14,'last_heartbeat_cmc','2026-07-09 12:56:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(15,'last_heartbeat_monitor','2026-07-09 12:58:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(16,'last_heartbeat_auditor','2026-07-09 12:29:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(1,'early_profit_exit_status','inactive','Early profit exit mode (inactive, active, ai_decide)','2026-05-28 09:05:06','2026-05-28 09:05:06',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2,'early_profit_exit_hours','1','Minimum holding time (in hours) before early profit checks trigger','2026-05-28 09:05:06','2026-05-28 09:05:06',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(4,'max_futures_leverage','5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(5,'paper_trading_status','active','Master toggle for Paper/Testnet Trading',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(6,'live_trading_status','inactive','Master toggle for Live Real-Money Trading',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(7,'futures_trading_status','active','Master toggle for Futures Trading (Live & Paper)',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(8,'risk_per_trade','0.10','Risk percentage of capital per trade',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(9,'min_notional','11.0','Minimum trade notional value',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(10,'poll_interval','60','Seconds to wait before processing LLM',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(11,'system_status','running','Master switch to pause execution',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(12,'emergency_stop','0','Emergency panic button',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(13,'last_heartbeat_onchain','2026-07-09 12:57:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(14,'last_heartbeat_cmc','2026-07-09 12:56:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(15,'last_heartbeat_monitor','2026-07-09 13:01:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(16,'last_heartbeat_auditor','2026-07-09 12:29:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3078,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.713.',0.0,'UNKNOWN','processed','2026-07-09 12:10:33','2026-07-09 15:10:33.639761',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3079,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.733.',-1.0,'CL','failed','2026-07-09 12:12:57','2026-07-09 15:12:57.089643',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3080,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1689.',0.0,'CL','failed','2026-07-09 12:15:12','2026-07-09 15:15:12.692567',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3081,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on AVAX/USDT at entry 6.695.',0.0,'UNKNOWN','processed','2026-07-09 12:17:35','2026-07-09 15:17:35.891305',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3082,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1694.',1.500000000000000223e-01,'ADA','pending','2026-07-09 12:19:40','2026-07-09 15:19:40.137371',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3083,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0934.',2.299999999999999822e-01,'XRP','pending','2026-07-09 12:21:14','2026-07-09 15:21:14.265890',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3084,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 569.32.',0.25,'BNB','pending','2026-07-09 12:23:09','2026-07-09 15:23:09.584924',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3085,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.71.',0.89,'AVAX','pending','2026-07-09 12:25:24','2026-07-09 15:25:24.451412',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3086,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 569.68.',0.79,'BNB','pending','2026-07-09 12:27:48','2026-07-09 15:27:48.817446',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3087,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62812.67.',1.099999999999999867e-01,'BTC','pending','2026-07-09 12:30:03','2026-07-09 15:30:03.316386',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3088,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62756.31.',1.800000000000000489e-01,'BTC','pending','2026-07-09 12:31:57','2026-07-09 15:31:57.893688',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3089,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 569.47.',0.94,'BNB','pending','2026-07-09 12:33:41','2026-07-09 15:33:41.026466',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3090,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.729.',1.899999999999999468e-01,'AVAX','pending','2026-07-09 12:36:05','2026-07-09 15:36:05.229408',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3091,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 78.11.',0.76,'SOL','pending','2026-07-09 12:38:18','2026-07-09 15:38:18.508519',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3092,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62925.99.',0.9,'BTC','pending','2026-07-09 12:40:02','2026-07-09 15:40:02.587727',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3093,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62847.36.',1.800000000000000489e-01,'BTC','pending','2026-07-09 12:42:16','2026-07-09 15:42:16.873947',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3094,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62632.0.',0.14,'BTC','pending','2026-07-09 12:44:10','2026-07-09 15:44:10.971801',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3095,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62548.68.',0.14,'BTC','pending','2026-07-09 12:45:46','2026-07-09 15:45:46.140757',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3096,4,'🚨 NEW CRYPTO TRADE ALERT 📉🔥

🔹 TRADE: PUMPFUN SHORT
🔹 Pair: PUMPFUN/USDT
🔹 Risk: HIGH
🔹 Leverage: 4x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 14.4%

🕰️ Validity: till 11 Jul 2026, 06:14 PM

🔸 Entry: $0.0015028

🎯 Take Profit (TP) 1: $0.0014758
🎯 Take Profit (TP) 2: $0.0014488

🛑 Stop Loss (SL): $0.0015298

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',5.0,'PUMPFUN','processed','2026-07-09 12:47:26','2026-07-09 15:47:26.711768',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3097,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62562.13.',2.099999999999999645e-01,'BTC','pending','2026-07-09 12:47:41','2026-07-09 15:47:41.502328',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2912,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 78.4.',-1.0,'SOL','failed','2026-07-09 07:14:30','2026-07-09 10:14:30.125854',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2913,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0977.',-1.0,'XRP','failed','2026-07-09 07:16:24','2026-07-09 10:16:24.408893',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2914,10,'CMC ALERT: HPP is heavily pumping! 1-hour change: 9.42699086%. 24h Volume: $2,456,892.',1.0,'HPP','failed','2026-07-09 07:16:55','2026-07-09 10:16:55.308316',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2915,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 78.33.',1.0,'SOL','processed','2026-07-09 07:18:28','2026-07-09 10:18:28.588133',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2916,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BNB/USDT at entry 574.72.',0.0,'UNKNOWN','processed','2026-07-09 07:20:23','2026-07-09 10:20:23.702052',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2917,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 78.32.',-1.0,'SOL','processed','2026-07-09 07:21:59','2026-07-09 10:21:59.381495',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2918,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BNB/USDT at entry 573.73.',1.0,'BNB','processed','2026-07-09 07:23:34','2026-07-09 10:23:34.551853',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2919,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 573.6.',-1.0,'BNB','processed','2026-07-09 07:25:39','2026-07-09 10:25:39.222464',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2920,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 573.54.',-1.0,'BNB','processed','2026-07-09 07:27:54','2026-07-09 10:27:54.387331',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2921,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62929.33.',1.0,'BTC','processed','2026-07-09 07:29:58','2026-07-09 10:29:58.446972',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2922,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.808.',1.0,'AVAX','processed','2026-07-09 07:32:33','2026-07-09 10:32:33.589464',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2923,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.805.',1.0,'AVAX','processed','2026-07-09 07:34:47','2026-07-09 10:34:47.845497',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2924,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.802.',1.0,'AVAX','processed','2026-07-09 07:36:52','2026-07-09 10:36:52.892588',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2925,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ETH/USDT at entry 1751.63.',0.0,'UNKNOWN','processed','2026-07-09 07:39:06','2026-07-09 10:39:06.730686',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2926,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0952.',-1.0,'XRP','failed','2026-07-09 07:41:10','2026-07-09 10:41:10.962614',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2927,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1753.49.',0.0,'UNKNOWN','processed','2026-07-09 07:42:55','2026-07-09 10:42:55.622459',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2928,10,'CMC ALERT: NEX is heavily pumping! 1-hour change: 8.90222118%. 24h Volume: $57,493,800.',1.0,'NEX','failed','2026-07-09 07:44:07','2026-07-09 10:44:07.244007',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2929,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ADA/USDT at entry 0.1684.',0.0,'UNKNOWN','processed','2026-07-09 07:45:00','2026-07-09 10:45:00.265020',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2930,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1686.',-1.0,'ADA','failed','2026-07-09 07:47:14','2026-07-09 10:47:14.820061',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2931,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.1004.',-1.0,'XRP','failed','2026-07-09 07:49:09','2026-07-09 10:49:09.441590',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2932,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on LINK/USDT at entry 7.75.',0.0,'UNKNOWN','processed','2026-07-09 07:51:14','2026-07-09 10:51:14.201893',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2933,10,'CMC ALERT: COAI is heavily pumping! 1-hour change: 11.08593841%. 24h Volume: $10,763,169.',1.0,'COAI','failed','2026-07-09 07:52:56','2026-07-09 10:52:56.155904',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2934,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on XRP/USDT at entry 1.0994.',-1.0,'XRP','failed','2026-07-09 07:53:59','2026-07-09 10:53:59.309379',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2935,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.734.',-1.0,'LINK','failed','2026-07-09 07:56:13','2026-07-09 10:56:13.982209',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2936,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.738.',1.0,'AVAX','processed','2026-07-09 07:57:58','2026-07-09 10:57:58.752519',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2937,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1753.36.',1.0,'ETH','processed','2026-07-09 07:59:53','2026-07-09 10:59:53.852683',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2938,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BNB/USDT at entry 572.59.',-1.0,'BNB','processed','2026-07-09 08:02:18','2026-07-09 11:02:18.641373',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2939,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1684.',0.0,'UNKNOWN','processed','2026-07-09 08:04:03','2026-07-09 11:04:03.380289',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2940,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1752.99.',-1.0,'ETH','processed','2026-07-09 08:05:57','2026-07-09 11:05:57.627887',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2941,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0969.',-1.0,'XRP','failed','2026-07-09 08:08:03','2026-07-09 11:08:03.061217',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2942,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.739.',0.0,'UNKNOWN','processed','2026-07-09 08:09:37','2026-07-09 11:09:37.768036',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2943,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1754.03.',-1.0,'ETH','processed','2026-07-09 08:11:50','2026-07-09 11:11:50.918023',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2944,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on BTC/USDT at entry 62957.94.',1.0,'BTC','processed','2026-07-09 08:13:34','2026-07-09 11:13:34.807590',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2945,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.732.',1.0,'AVAX','processed','2026-07-09 08:15:08','2026-07-09 11:15:08.669731',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2946,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1754.83.',1.0,'ETH','processed','2026-07-09 08:17:03','2026-07-09 11:17:03.322056',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2947,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BNB/USDT at entry 572.46.',-1.0,'BNB','processed','2026-07-09 08:18:57','2026-07-09 11:18:57.965404',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2948,10,'CMC ALERT: RALLY is heavily pumping! 1-hour change: 29.22526352%. 24h Volume: $1,001,438.',1.0,'RALLY','failed','2026-07-09 08:20:05','2026-07-09 11:20:05.348281',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2949,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.745.',0.0,'UNKNOWN','processed','2026-07-09 08:20:53','2026-07-09 11:20:53.119056',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2950,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1757.35.',1.0,'ETH','processed','2026-07-09 08:23:16','2026-07-09 11:23:16.674940',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2951,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 572.68.',0.0,'UNKNOWN','processed','2026-07-09 08:25:21','2026-07-09 11:25:21.259215',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2952,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.749.',-1.0,'AVAX','processed','2026-07-09 08:27:16','2026-07-09 11:27:16.761833',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2953,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BNB/USDT at entry 572.97.',0.0,'UNKNOWN','processed','2026-07-09 08:29:11','2026-07-09 11:29:11.494323',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2954,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63040.0.',1.0,'BTC','processed','2026-07-09 08:31:26','2026-07-09 11:31:26.720556',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2955,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.749.',1.0,'AVAX','processed','2026-07-09 08:33:11','2026-07-09 11:33:11.126485',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2956,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0974.',1.0,'XRP','processed','2026-07-09 08:35:15','2026-07-09 11:35:15.330059',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2957,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1756.49.',-1.0,'ETH','processed','2026-07-09 08:37:08','2026-07-09 11:37:08.948068',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2958,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on SOL/USDT at entry 78.3.',-1.0,'SOL','processed','2026-07-09 08:39:13','2026-07-09 11:39:13.829928',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2959,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63075.23.',-1.0,'BTC','processed','2026-07-09 08:40:49','2026-07-09 11:40:49.525530',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2960,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 63060.01.',0.0,'UNKNOWN','processed','2026-07-09 08:43:03','2026-07-09 11:43:03.614768',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2961,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1757.77.',1.0,'ETH','processed','2026-07-09 08:45:17','2026-07-09 11:45:17.498878',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2962,10,'CMC ALERT: SWITCH is heavily pumping! 1-hour change: 15.84522872%. 24h Volume: $1,979,991.',1.0,'SWITCH','failed','2026-07-09 08:47:00','2026-07-09 11:47:00.444853',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2963,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on LINK/USDT at entry 7.765.',-1.0,'LINK','failed','2026-07-09 08:47:22','2026-07-09 11:47:22.666607',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2964,7,'Bitcoin''s dwindling exchange reserves don''t pack the same bullish punch anymore. ',4.0,'BTC','processed','2026-07-09 08:48:29','2026-07-09 11:48:29.268298',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2965,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ETH/USDT at entry 1755.28.',1.0,'ETH','processed','2026-07-09 08:49:37','2026-07-09 11:49:37.219985',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2966,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.765.',-1.0,'LINK','failed','2026-07-09 08:51:51','2026-07-09 11:51:51.973518',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2967,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62899.12.',1.0,'BTC','processed','2026-07-09 08:53:35','2026-07-09 11:53:35.661204',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2968,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 78.16.',1.0,'SOL','processed','2026-07-09 08:55:31','2026-07-09 11:55:31.243760',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2969,10,'CMC ALERT: Q is heavily pumping! 1-hour change: 7.42138596%. 24h Volume: $5,235,528.',1.0,'Q','failed','2026-07-09 08:56:18','2026-07-09 11:56:18.261845',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2970,10,'CMC ALERT: AIN is heavily pumping! 1-hour change: 8.13767068%. 24h Volume: $2,244,076.',1.0,'AIN','failed','2026-07-09 08:56:27','2026-07-09 11:56:27.058116',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2971,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.74.',1.7000000000000004e-01,'AVAX','pending','2026-07-09 08:57:45','2026-07-09 11:57:45.532876',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2972,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 78.09.',0.87,'SOL','pending','2026-07-09 08:59:20','2026-07-09 11:59:20.795597',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2973,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1753.15.',5.00000000000000444e-02,'ETH','pending','2026-07-09 09:00:56','2026-07-09 12:00:56.087592',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2974,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.75.',0.87,'LINK','pending','2026-07-09 09:02:41','2026-07-09 12:02:41.229764',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2975,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62890.61.',2.199999999999999734e-01,'BTC','pending','2026-07-09 09:04:15','2026-07-09 12:04:15.936438',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2976,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1752.81.',9.99999999999999777e-02,'ETH','pending','2026-07-09 09:06:21','2026-07-09 12:06:21.171641',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2977,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1674.',1.999999999999999555e-01,'ADA','pending','2026-07-09 09:08:05','2026-07-09 12:08:05.438329',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2967,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62899.12.',1.0,'BTC','processed','2026-07-09 08:53:35','2026-07-09 11:53:35.661204',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2968,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on SOL/USDT at entry 78.16.',1.0,'SOL','processed','2026-07-09 08:55:31','2026-07-09 11:55:31.243760',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2969,10,'CMC ALERT: Q is heavily pumping! 1-hour change: 7.42138596%. 24h Volume: $5,235,528.',1.0,'Q','failed','2026-07-09 08:56:18','2026-07-09 11:56:18.261845',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2970,10,'CMC ALERT: AIN is heavily pumping! 1-hour change: 8.13767068%. 24h Volume: $2,244,076.',1.0,'AIN','failed','2026-07-09 08:56:27','2026-07-09 11:56:27.058116',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2971,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on AVAX/USDT at entry 6.74.',-1.0,'AVAX','processed','2026-07-09 08:57:45','2026-07-09 11:57:45.532876',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2972,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 78.09.',1.0,'SOL','processed','2026-07-09 08:59:20','2026-07-09 11:59:20.795597',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2973,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1753.15.',-1.0,'ETH','processed','2026-07-09 09:00:56','2026-07-09 12:00:56.087592',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2974,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.75.',1.0,'LINK','processed','2026-07-09 09:02:41','2026-07-09 12:02:41.229764',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2975,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62890.61.',-1.0,'BTC','processed','2026-07-09 09:04:15','2026-07-09 12:04:15.936438',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2976,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on ETH/USDT at entry 1752.81.',-1.0,'ETH','processed','2026-07-09 09:06:21','2026-07-09 12:06:21.171641',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2977,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1674.',-1.0,'ADA','failed','2026-07-09 09:08:05','2026-07-09 12:08:05.438329',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2978,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on LINK/USDT at entry 7.743.',1.0,'LINK','processed','2026-07-09 09:10:19','2026-07-09 12:10:19.601058',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2979,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.726.',0.0,'UNKNOWN','processed','2026-07-09 09:12:03','2026-07-09 12:12:03.763323',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2980,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ADA/USDT at entry 0.1674.',-1.0,'ADA','failed','2026-07-09 09:13:48','2026-07-09 12:13:48.746734',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2981,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on BTC/USDT at entry 62864.64.',0.0,'UNKNOWN','processed','2026-07-09 09:15:33','2026-07-09 12:15:33.279074',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2982,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ETH/USDT at entry 1751.71.',1.0,'ETH','processed','2026-07-09 09:17:18','2026-07-09 12:17:18.835107',NULL,'Skipped or Rejected',NULL);
INSERT INTO "signals" VALUES(2983,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on ADA/USDT at entry 0.1673.',1.0,'ADA','processed','2026-07-09 09:19:43','2026-07-09 12:19:43.432043',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2984,4,'🚨 NEW CRYPTO TRADE ALERT 📈🔥

🔹 TRADE: BILL LONG
🔹 Pair: BILL/USDT
🔹 Risk: HIGH
🔹 Leverage: 2x
🔹 Risk Reward Ratio: 1:2
🔹 Potential Profit: 9.8%

🕰️ Validity: till 11 Jul 2026, 02:45 PM

🔸 Entry: $0.03846

🎯 Take Profit (TP) 1: $0.0394
🎯 Take Profit (TP) 2: $0.04034

🛑 Stop Loss (SL): $0.03752

⚠️ Disclaimer: Crypto assets are unregulated and extremely volatile. Losses are possible, and no regulatory recourse is available. Always DYOR before taking any trade.',1.0,'BILL','failed','2026-07-09 09:20:41','2026-07-09 12:20:41.703375',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2996,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on SOL/USDT at entry 78.04.',0.81,'SOL','pending','2026-07-09 09:39:15','2026-07-09 12:39:15.931078',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2997,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1754.47.',0.76,'ETH','pending','2026-07-09 09:41:10','2026-07-09 12:41:10.746364',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2998,10,'CMC ALERT: MITO is heavily pumping! 1-hour change: 10.73253529%. 24h Volume: $7,382,203.',10.0,'MITO','pending','2026-07-09 09:41:23','2026-07-09 12:41:23.869425',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(2999,10,'CMC ALERT: UMXM is heavily pumping! 1-hour change: 12.54920577%. 24h Volume: $14,082,213.',10.0,'UMXM','pending','2026-07-09 09:41:32','2026-07-09 12:41:32.679176',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3000,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on LINK/USDT at entry 7.73.',0.9,'LINK','pending','2026-07-09 09:42:55','2026-07-09 12:42:55.086471',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3001,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62803.08.',0.91,'BTC','pending','2026-07-09 09:44:49','2026-07-09 12:44:49.879327',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3002,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on BTC/USDT at entry 62873.92.',0.77,'BTC','pending','2026-07-09 09:49:29','2026-07-09 12:49:29.494633',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3003,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on XRP/USDT at entry 1.0938.',0.86,'XRP','pending','2026-07-09 09:51:14','2026-07-09 12:51:14.596162',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3004,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on AVAX/USDT at entry 6.734.',1.60000000000000031e-01,'AVAX','pending','2026-07-09 09:53:18','2026-07-09 12:53:18.348977',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3005,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0939.',0.85,'XRP','pending','2026-07-09 09:55:13','2026-07-09 12:55:13.827810',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3006,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.747.',1.7000000000000004e-01,'LINK','pending','2026-07-09 09:57:17','2026-07-09 12:57:17.941662',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3007,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62948.0.',6.000000000000005329e-02,'BTC','pending','2026-07-09 09:59:21','2026-07-09 12:59:21.422223',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3008,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on AVAX/USDT at entry 6.732.',0.93,'AVAX','pending','2026-07-09 10:01:46','2026-07-09 13:01:46.010700',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3009,6,'Bitcoin ETFs end ''most overwhelming'' $2.7B sell-off amid new $85M net outflow. <p style="float: right; margin: 0 0 10px 15px; width: 240px;"><img alt="Bitcoin ETFs end ''most overwhelming'' $2.7B sell-off amid new $85M net outflow" class="type:primaryImage" src="https://s3-images.ctmedia.io/media/article-covers/photo5366486023912757477y.jpg" /></p><p>Bitcoin spot ETFs posted a fresh net outflow on Wednesday as analysis said that their "most overwhelming" outflow streak had ended without a clear demand recovery.</p>',2.0,'BTC','processed','2026-07-09 10:02:07','2026-07-09 13:02:07.368178',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3010,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 78.06.',0.13,'SOL','pending','2026-07-09 10:03:28','2026-07-09 13:03:28.926054',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3011,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 62930.0.',0.94,'BTC','pending','2026-07-09 10:05:33','2026-07-09 13:05:33.069443',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3012,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0955.',2.099999999999999645e-01,'XRP','pending','2026-07-09 10:07:57','2026-07-09 13:07:57.704383',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3013,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 63008.28.',8.999999999999996892e-02,'BTC','pending','2026-07-09 10:10:02','2026-07-09 13:10:02.365499',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3014,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0961.',2.299999999999999822e-01,'XRP','pending','2026-07-09 10:12:06','2026-07-09 13:12:06.096958',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3015,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on AVAX/USDT at entry 6.716.',0.77,'AVAX','pending','2026-07-09 10:14:01','2026-07-09 13:14:01.173707',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3016,10,'CMC ALERT: MYX is heavily pumping! 1-hour change: 7.68499033%. 24h Volume: $13,797,069.',10.0,'MYX','pending','2026-07-09 10:14:19','2026-07-09 13:14:19.120197',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3017,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BTC/USDT at entry 63010.0.',0.88,'BTC','pending','2026-07-09 10:15:35','2026-07-09 13:15:35.414533',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3018,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1683.',6.999999999999995115e-02,'ADA','pending','2026-07-09 10:17:40','2026-07-09 13:17:41.001623',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3019,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on ADA/USDT at entry 0.1682.',0.92,'ADA','pending','2026-07-09 10:19:55','2026-07-09 13:19:55.669907',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3020,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on BNB/USDT at entry 571.22.',0.75,'BNB','pending','2026-07-09 10:21:59','2026-07-09 13:21:59.538607',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3021,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on SOL/USDT at entry 78.03.',1.800000000000000489e-01,'SOL','pending','2026-07-09 10:24:13','2026-07-09 13:24:13.042584',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3022,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a LONG position on XRP/USDT at entry 1.0928.',0.9,'XRP','pending','2026-07-09 10:26:07','2026-07-09 13:26:07.117807',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3023,6,'Revolut says USDT delisting is limited to EEA, Switzerland. <p style="float: right; margin: 0 0 10px 15px; width: 240px;"><img alt="Revolut says USDT delisting is limited to EEA, Switzerland" class="type:primaryImage" src="https://s3-images.ctmedia.io/media/article-covers/hi-dash-aims-to-correct-its-misclassification-as-a-privacy-coin-following-shapeshift-delisting1.jpg" /></p><p>Revolut said USDT support remains unchanged outside EEA and Switzerland as it winds down the stablecoin offering in selected European markets.</p>',5.0,'USDT','processed','2026-07-09 10:27:08','2026-07-09 13:27:08.172567',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3024,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.737.',1.099999999999999867e-01,'LINK','pending','2026-07-09 10:28:10','2026-07-09 13:28:10.446314',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3025,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on ETH/USDT at entry 1752.31.',0.89,'ETH','pending','2026-07-09 10:30:44','2026-07-09 13:30:44.799117',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3026,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on SOL/USDT at entry 78.02.',1.800000000000000489e-01,'SOL','pending','2026-07-09 10:32:59','2026-07-09 13:32:59.483966',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3027,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on XRP/USDT at entry 1.0927.',1.7000000000000004e-01,'XRP','pending','2026-07-09 10:35:23','2026-07-09 13:35:23.715888',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3028,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on ADA/USDT at entry 0.1676.',2.199999999999999734e-01,'ADA','pending','2026-07-09 10:37:38','2026-07-09 13:37:38.798400',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3029,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.094.',9.99999999999999777e-02,'XRP','pending','2026-07-09 10:40:13','2026-07-09 13:40:13.036998',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3030,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a LONG position on XRP/USDT at entry 1.0941.',0.9,'XRP','pending','2026-07-09 10:42:17','2026-07-09 13:42:17.140026',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3031,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1751.91.',1.899999999999999468e-01,'ETH','pending','2026-07-09 10:44:20','2026-07-09 13:44:20.779928',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3032,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on ETH/USDT at entry 1751.7.',1.7000000000000004e-01,'ETH','pending','2026-07-09 10:46:24','2026-07-09 13:46:24.496784',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3033,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on LINK/USDT at entry 7.731.',2.299999999999999822e-01,'LINK','pending','2026-07-09 10:48:38','2026-07-09 13:48:38.386764',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3034,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a LONG position on AVAX/USDT at entry 6.688.',0.92,'AVAX','pending','2026-07-09 10:50:43','2026-07-09 13:50:43.670720',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3035,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on BTC/USDT at entry 62806.95.',7.999999999999996003e-02,'BTC','pending','2026-07-09 10:52:39','2026-07-09 13:52:39.931488',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3036,10,'🚨 LEAD TRADER UPDATE: CoinMarketCap API opened a SHORT position on LINK/USDT at entry 7.727.',1.099999999999999867e-01,'LINK','pending','2026-07-09 10:54:43','2026-07-09 13:54:43.801747',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3037,12,'🚨 LEAD TRADER UPDATE: Lead Trader: ScalpGod opened a SHORT position on BTC/USDT at entry 62747.85.',1.7000000000000004e-01,'BTC','pending','2026-07-09 10:56:48','2026-07-09 13:56:48.669751',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3038,7,'Latin America’s biggest stock exchange now offers options on bitcoin, ether and solana futures. ',5.0,'BTC','processed','2026-07-09 10:57:23','2026-07-09 13:57:23.412901',NULL,NULL,NULL);
INSERT INTO "signals" VALUES(3039,11,'🚨 LEAD TRADER UPDATE: Lead Trader: WhalesHunter opened a SHORT position on XRP/USDT at entry 1.0921.',0.14,'XRP','pending','2026-07-09 10:58:52','2026-07-09 13:58:52.907831',NULL,NULL,NULL);
CREATE TABLE "sources" ("id" integer primary key autoincrement not null, "name" varchar not null, "type" varchar check ("type" in ('telegram', 'rss', 'api')) not null, "status" varchar not null default 'active', "historical_win_rate" float not null default '0', "created_at" datetime, "updated_at" datetime, "catch_up_hours" integer not null default '0');
INSERT INTO "sources" VALUES(1,'Binance Killers®','telegram','active',0.0,'2026-06-03 15:27:33','2026-06-03 15:27:33',0);
INSERT INTO "sources" VALUES(2,'CryptoNinjas Trading 🥷🏿','telegram','active',0.0,'2026-06-03 15:27:33','2026-06-03 15:27:33',0);
INSERT INTO "sources" VALUES(3,'Whales Crypto Guide','telegram','active',0.0,'2026-06-03 15:27:33','2026-06-03 15:27:33',0);
INSERT INTO "sources" VALUES(4,'Mudrex Crypto Insights','telegram','active',0.0,'2026-06-03 15:27:33','2026-06-03 15:27:33',0);
INSERT INTO "sources" VALUES(5,'The Crypto Express','telegram','active',0.0,'2026-06-03 15:27:33','2026-06-03 15:27:33',0);
INSERT INTO "sources" VALUES(6,'CoinTelegraph','rss','active',0.0,NULL,NULL,0);
INSERT INTO "sources" VALUES(7,'CoinDesk','rss','active',0.0,NULL,NULL,0);
INSERT INTO "sources" VALUES(8,'Whale Alert (On-Chain)','api','active',0.0,NULL,NULL,0);
INSERT INTO "sources" VALUES(9,'Coinglass Liquidations','api','active',0.0,NULL,NULL,0);
INSERT INTO "sources" VALUES(10,'CoinMarketCap API','api','active',0.0,NULL,NULL,0);
INSERT INTO "sources" VALUES(11,'Lead Trader: WhalesHunter','api','active',0.78,NULL,NULL,0);
INSERT INTO "sources" VALUES(12,'Lead Trader: ScalpGod','api','active',0.82,NULL,NULL,0);
