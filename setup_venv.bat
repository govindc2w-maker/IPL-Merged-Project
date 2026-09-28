@echo off
setlocal
cd /d "%~dp0"

if not exist ".venv\Scripts\python.exe" (
    echo [INFO] Creating the shared Python 3.12 environment...
    py -3.12 -m venv .venv
    if errorlevel 1 (
        echo [ERROR] Python 3.12 was not found. Install Python 3.12 and its Python Launcher, then run this script again.
        exit /b 1
    )
)

echo [INFO] Installing shared project dependencies into .venv...
".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 (
    echo [ERROR] Dependency installation failed.
    exit /b 1
)

echo [INFO] Shared virtual environment is ready.
exit /b 0