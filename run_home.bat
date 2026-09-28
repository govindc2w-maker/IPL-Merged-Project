@echo off
setlocal
cd /d "%~dp0"
title Merged IPL Project - Home Page
call setup_venv.bat
if errorlevel 1 exit /b 1
echo [INFO] Starting Home Page with the shared virtual environment...
set "IPL_API_PORT=8002"
set "IPL_API_URL=http://127.0.0.1:8002"
".venv\Scripts\python.exe" -m streamlit run home.py --server.port 8502
