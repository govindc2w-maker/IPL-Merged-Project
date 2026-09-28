# C2W | Core2Web
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
$workspaceRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
& (Join-Path $workspaceRoot "setup_venv.bat")
if ($LASTEXITCODE -ne 0) { throw "Shared environment setup failed." }
$python = Join-Path $workspaceRoot ".venv\Scripts\python.exe"
& $python train.py
