# C2W | Core2Web
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
$workspaceRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
& (Join-Path $workspaceRoot "setup_venv.bat")
if ($LASTEXITCODE -ne 0) { throw "Shared environment setup failed." }
$python = Join-Path $workspaceRoot ".venv\Scripts\python.exe"
& $python -m streamlit run app.py --server.headless true --server.port 8505 --server.fileWatcherType none
