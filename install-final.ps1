# GamerX AI - Complete Standalone Installation
# This script downloads and installs everything needed
# Usage: iex (iwr 'https://raw.githubusercontent.com/GraphicsAndroid65/payload/main/install-final.ps1').Content

Write-Host @"
╔════════════════════════════════════════════════════════════════╗
║         GamerX AI - Windows Terminal Installation             ║
║                                                                ║
║  Works on any Windows device (no admin required!)             ║
╚════════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Cyan

# Setup directories
$installDir = "$env:USERPROFILE\GamerX-AI"
$configDir = "$env:APPDATA\ai-chatbot"
$chatbotScript = "$installDir\chatbot.ps1"

Write-Host "Setting up GamerX AI..." -ForegroundColor Yellow

# Create directories
try {
    if (Test-Path $installDir) {
        Remove-Item $installDir -Recurse -Force -ErrorAction SilentlyContinue
    }
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
    New-Item -ItemType Directory -Path $configDir -Force | Out-Null
    Write-Host "✓ Created directories" -ForegroundColor Green
}
catch {
    Write-Host "⚠️  Warning creating directories" -ForegroundColor Yellow
}

# Download chatbot script
Write-Host "Downloading chatbot script..." -ForegroundColor Yellow
try {
    $chatbotUrl = "https://raw.githubusercontent.com/GraphicsAndroid65/payload/main/src/chatbot.ps1"
    Invoke-WebRequest -Uri $chatbotUrl -OutFile $chatbotScript -ErrorAction Stop
    Write-Host "✓ Downloaded chatbot script" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to download chatbot script" -ForegroundColor Red
    Write-Host "   Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Initialize history file
$historyFile = "$configDir\chat_history.json"
try {
    if (-not (Test-Path $historyFile)) {
        @() | ConvertTo-Json | Set-Content $historyFile
    }
    Write-Host "✓ Initialized chat history" -ForegroundColor Green
}
catch {
    Write-Host "⚠️  Warning initializing history" -ForegroundColor Yellow
}

# Create profile directory if needed
$profileDir = Split-Path -Parent $PROFILE
try {
    if (-not (Test-Path $profileDir)) {
        New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
    }
}
catch {
    Write-Host "⚠️  Warning creating profile directory" -ForegroundColor Yellow
}

# Update PowerShell profile
Write-Host "Updating PowerShell profile..." -ForegroundColor Yellow
$profileContent = @"

# GamerX AI - Windows Terminal
# Installed via one-liner installation

`$gamerxAIScript = '$chatbotScript'

function ai {
    param([Parameter(Mandatory=`$false, ValueFromRemainingArguments=`$true)][string]`$Query)
    if (Test-Path `$gamerxAIScript) {
        & `$gamerxAIScript @args
    } else {
        Write-Host "❌ GamerX AI script not found" -ForegroundColor Red
    }
}

Set-Alias -Name gx -Value ai -Force -Option AllScope
Write-Host "✓ GamerX AI loaded (use 'ai' or 'gx' command)" -ForegroundColor Green
"@

try {
    Add-Content -Path $PROFILE -Value $profileContent -Force
    Write-Host "✓ Updated PowerShell profile" -ForegroundColor Green
}
catch {
    Write-Host "⚠️  Could not update profile (may be protected)" -ForegroundColor Yellow
}

Write-Host @"

╔════════════════════════════════════════════════════════════════╗
║              GamerX AI - Installation Complete!               ║
╚════════════════════════════════════════════════════════════════╝

✓ Setup complete (no admin required!)
✓ Config directory created
✓ Chat history initialized
✓ PowerShell profile updated

NEXT STEPS:
1. Close and reopen PowerShell
2. Type: ai "write a python function"
3. Or: gx "write javascript code"
4. Or: ai -chat (for interactive mode)

QUICK COMMANDS:
  ai "query"           - Single query
  ai -chat             - Interactive chat
  ai -history          - Show history
  ai -clear            - Clear history
  ai -help             - Show help
  gx "query"           - Short alias

LOCATION:
  Installed: $installDir
  Config: $configDir
  History: $historyFile

FEATURES:
  ✓ Works on admin-protected devices
  ✓ No administrator required
  ✓ Code-only output mode
  ✓ Chat history saved locally
  ✓ Gemini 2.0 Flash API

Ready to use! 🎉

"@ -ForegroundColor Green
