@echo off
title Cryptrader System Launcher v3.0
echo ========================================
echo   CRYPTRADER AI ENGINES LAUNCHER v3.0
echo ========================================
echo.
echo Launching 5 Engines using venv_new...
echo.

cd ai_workers

:: Launch Ingestor (RSS)
start "Ingestor (RSS)" cmd /k "echo Starting RSS Ingestor... && .\venv_new\Scripts\python.exe ingestion.py"

:: Launch Telegram Ingestor
start "Telegram Ingestor" cmd /k "echo Starting Telegram Ingestor... && .\venv_new\Scripts\python.exe telegram_ingestor.py"

:: Launch AI Classifier
start "AI Classifier" cmd /k "echo Starting AI Classifier (Local Ollama)... && .\venv_new\Scripts\python.exe classifier.py"

:: Launch Trade Executor
start "Trade Executor" cmd /k "echo Starting Trade Executor... && .\venv_new\Scripts\python.exe executor.py"


echo.
echo ========================================
echo   ALL SYSTEMS LAUNCHED SUCCESSFULLY
echo ========================================
echo.
pause
