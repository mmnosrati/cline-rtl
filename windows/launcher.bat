@echo off
setlocal
title Cline RTL Pro
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0launcher.ps1"
if errorlevel 1 (
  echo.
  echo The launcher exited with an error.
  pause
)
