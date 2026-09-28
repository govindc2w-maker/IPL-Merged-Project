@echo off
rem C2W | Core2Web
SETLOCAL EnableDelayedExpansion
cd /d "%~dp0"

:: Set console title
title IPL Prediction Project - Runner

call "%~dp0..\setup_venv.bat"
if errorlevel 1 exit /b 1
set "PYTHON=%~dp0..\.venv\Scripts\python.exe"

:: Check command-line argument
if "%~1"=="" goto menu
if /I "%~1"=="backend" goto run_backend
if /I "%~1"=="frontend" goto run_frontend
if /I "%~1"=="both" goto run_both
if /I "%~1"=="help" goto run_help

echo [ERROR] Unknown option: %1
goto run_help

:menu
cls
echo ===================================================
echo   IPL Prediction Project - Control Panel
echo ===================================================
echo.
echo   [1] Start FastAPI Backend
echo   [2] Start Streamlit Frontend
echo   [3] Start Both (Backend + Frontend)
echo   [4] Install/Update Dependencies
echo   [5] Exit
echo.
echo ===================================================
set /p opt="Select an option (1-5): "

if "%opt%"=="1" goto run_backend
if "%opt%"=="2" goto run_frontend
if "%opt%"=="3" goto run_both
if "%opt%"=="4" goto run_install
if "%opt%"=="5" goto exit_run
goto menu

:run_backend
echo.
echo [INFO] Starting FastAPI Backend on http://127.0.0.1:8001 ...
cd /d "%~dp0backend"
"%PYTHON%" -m uvicorn main:app --reload --host 127.0.0.1 --port 8001
cd /d "%~dp0"
goto exit_run

:run_frontend
echo.
echo [INFO] Starting Streamlit Frontend ...
cd /d "%~dp0frontend"
"%PYTHON%" -m streamlit run app.py
cd /d "%~dp0"
goto exit_run

:run_both
echo.
echo [INFO] Launching FastAPI Backend in a new window...
start "IPL Backend (FastAPI)" "%ComSpec%" /c ""%~f0" backend"

echo [INFO] Launching Streamlit Frontend...
cd /d "%~dp0frontend"
"%PYTHON%" -m streamlit run app.py
cd /d "%~dp0"
goto exit_run

:run_install
echo.
echo [INFO] Installing/Updating dependencies from requirements.txt...
"%PYTHON%" -m pip install -r "%~dp0..\requirements.txt"
echo [INFO] Installation completed.
pause
goto menu

:run_help
echo.
echo Usage: run.bat [option]
echo.
echo Options:
echo   backend   Starts the FastAPI Backend
echo   frontend  Starts the Streamlit Frontend
echo   both      Starts both the Backend and Frontend
echo   help      Displays this help menu
echo.
pause
goto exit_run

:exit_run
echo.
echo [INFO] Exiting runner.
