@echo off
title Cryptrader System Launcher v4.0
echo ===================================================
echo   CRYPTRADER AI MULTI-ENGINE SYSTEM LAUNCHER v4.0
echo ===================================================
echo.
echo Launching decoupled engines...
echo.

cd ai_workers

:: Detect which virtual environment is present
set VENV_PATH=venv_new
if not exist venv_new (
    if exist venv (
        set VENV_PATH=venv
    ) else (
        echo [ERROR] Neither 'venv_new' nor 'venv' found in ai_workers/!
        echo Please create a virtual environment first.
        pause
        exit /b 1
    )
)

echo Using Python environment: ai_workers\%VENV_PATH%
echo.

:: Run Database Integrity Check & Health Recovery
echo Checking Database Health & Integrity...
.\%VENV_PATH%\Scripts\python.exe ..\recover_database.py
echo.

:: Run Database Maintenance
echo Running Database Maintenance (Pruning old records)...
.\%VENV_PATH%\Scripts\python.exe prune_db.py
echo.

:: 1. Launch Ingestor (RSS)
start "1. Ingestor (RSS)" cmd /k "echo Starting RSS Ingestor... && .\%VENV_PATH%\Scripts\python.exe ingestion.py"

:: 2. Launch Telegram Ingestor
start "2. Telegram Ingestor" cmd /k "echo Starting Telegram Ingestor... && .\%VENV_PATH%\Scripts\python.exe telegram_ingestor.py"

:: 3. Launch AI Classifier
start "3. AI Classifier" cmd /k "echo Starting AI Classifier (Local Ollama)... && .\%VENV_PATH%\Scripts\python.exe classifier.py"

:: 4. Launch Trade Executor (Signals Engine)
start "4. Trade Executor (Signals)" cmd /k "echo Starting Trade Executor (Signals)... && .\%VENV_PATH%\Scripts\python.exe executor.py --mode signals"

:: 5. Launch Trade Monitor (Exits Engine)
start "5. Trade Monitor (Exits)" cmd /k "echo Starting Trade Monitor (Exits)... && .\%VENV_PATH%\Scripts\python.exe executor.py --mode monitor"

:: 6. Launch Binance Copy Trading Monitor
start "6. Binance Copy Trading Monitor" cmd /k "echo Starting Binance Copy Trading Monitor... && .\%VENV_PATH%\Scripts\python.exe binance_copy_monitor.py"

:: 7. Launch Discord Ingestor (Commented out until Bot Token is created)
:: start "7. Discord Ingestor" cmd /k "echo Starting Discord Ingestor... && .\%VENV_PATH%\Scripts\python.exe discord_ingestor.py"

:: 8. Launch On-Chain Whale Monitor
start "8. On-Chain Monitor" cmd /k "echo Starting On-Chain Whale and Liquidation Monitor... && .\%VENV_PATH%\Scripts\python.exe onchain_monitor.py"

:: 9. Launch CoinMarketCap API Monitor
start "9. CoinMarketCap Monitor" cmd /k "echo Starting CoinMarketCap Market Mover Monitor... && .\%VENV_PATH%\Scripts\python.exe cmc_ingestor.py"

:: 10. Launch Automated DB Cleaner
start "10. Automated DB Cleaner" cmd /k "echo Starting Automated Database Cleaner... && .\%VENV_PATH%\Scripts\python.exe auto_cleaner.py"

:: 11. Launch Live Rolling DB Backup Engine
start "11. Live DB Backup Service" cmd /k "echo Starting Live Rolling Database Backup Engine... && .\%VENV_PATH%\Scripts\python.exe db_backup_manager.py"

:: 12. Launch Trade Auditor Engine
start "12. Trade Auditor" cmd /k "echo Starting Trade Auditor Engine... && .\%VENV_PATH%\Scripts\python.exe auditor.py"

:: 13. Launch TA Engine
start "13. TA Engine" cmd /k "echo Starting TA Engine (Pure Math)... && .\%VENV_PATH%\Scripts\python.exe ta_engine.py"

echo.
echo ===================================================
echo   ALL 13 ENGINES LAUNCHED SUCCESSFULLY (DECOUPLED)
echo ===================================================
echo.
echo The system is now split for maximum stability:
echo  - Signals Engine and Exits Monitor run separately.
echo  - Binance Copy Trading is integrated.
echo.

choice /C YN /M "Do you want to automatically arrange the terminal windows on your screen?"
if errorlevel 2 goto SkipArrange
if errorlevel 1 goto ArrangeWindows

:ArrangeWindows
echo Arranging windows in a grid...
powershell -ExecutionPolicy Bypass -File ..\arrange_terminals.ps1
goto SkipArrange

:SkipArrange
echo.
echo Dashboard URL: http://cryptrader.test
echo ===================================================
echo.
pause
