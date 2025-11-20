@echo off
REM GamerX AI Chatbot - Batch Setup Script
REM Alternative installation method for Windows

setlocal enabledelayedexpansion

echo.
echo ╔════════════════════════════════════════════════════════════════╗
echo ║    GamerX AI Chatbot - Windows Terminal Setup                 ║
echo ╚════════════════════════════════════════════════════════════════╝
echo.

REM Check if running as Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ❌ This script must be run as Administrator!
    echo Please right-click this file and select "Run as Administrator"
    pause
    exit /b 1
)

echo ✓ Running as Administrator
echo.

REM Get the directory where this script is located
set "SCRIPT_DIR=%~dp0"
set "CHATBOT_SCRIPT=%SCRIPT_DIR%src\chatbot.ps1"

REM Check if chatbot script exists
if not exist "%CHATBOT_SCRIPT%" (
    echo ❌ Chatbot script not found at: %CHATBOT_SCRIPT%
    pause
    exit /b 1
)

echo ✓ Found chatbot script
echo.

REM Create config directory
set "CONFIG_DIR=%APPDATA%\ai-chatbot"
if not exist "%CONFIG_DIR%" (
    mkdir "%CONFIG_DIR%"
    echo ✓ Created config directory: %CONFIG_DIR%
) else (
    echo ✓ Config directory already exists
)

REM Initialize history file
set "HISTORY_FILE=%CONFIG_DIR%\chat_history.json"
if not exist "%HISTORY_FILE%" (
    echo. > "%HISTORY_FILE%"
    echo ✓ Initialized chat history
) else (
    echo ✓ Chat history already exists
)

echo.
echo ╔════════════════════════════════════════════════════════════════╗
echo ║                  Setup Complete!                              ║
echo ╚════════════════════════════════════════════════════════════════╝
echo.
echo NEXT STEPS:
echo 1. Open PowerShell as Administrator
echo 2. Run: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
echo 3. Run: %SCRIPT_DIR%install.ps1
echo.
echo Or use directly from PowerShell:
echo   ai "write a python function to reverse a string"
echo.
echo Config Location: %CONFIG_DIR%
echo History File: %HISTORY_FILE%
echo Script Location: %CHATBOT_SCRIPT%
echo.

pause
