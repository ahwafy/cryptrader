@echo off
title Cryptrader Trade Auditor Launcher (Gemini Teacher)
echo =======================================================
echo   CRYPTRADER TRADE AUDITOR LAUNCHER (Gemini Teacher)
echo =======================================================
echo.
echo Launching Gemini Trade Auditor Engine...
echo.

cd ai_workers

:: Launch Trade Auditor (Gemini Teacher) directly in this window for easy log viewing
.\venv_new\Scripts\python.exe auditor.py

echo.
echo =======================================================
echo   TRADE AUDITOR SYSTEM CLOSED
echo =======================================================
echo.
pause
