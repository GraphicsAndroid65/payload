# GamerX AI Chatbot - Installation Script for Windows
# Works without Administrator privileges

param(
    [switch]$Force
)

Write-Host @"
╔════════════════════════════════════════════════════════════════╗
║         GamerX AI - Windows Terminal Installation             ║
║                                                                ║
║  Works on any Windows device (no admin required!)             ║
╚════════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Cyan

# Get script directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$chatbotScript = Join-Path $scriptDir "src\chatbot.ps1"

# Check if chatbot script exists
if (-not (Test-Path $chatbotScript)) {
    Write-Host "❌ Chatbot script not found at: $chatbotScript" -ForegroundColor Red
    exit 1
}

# Create profile directory if it doesn't exist
$profileDir = Split-Path -Parent $PROFILE
if (-not (Test-Path $profileDir)) {
    try {
        New-Item -ItemType Directory -Path $profileDir -Force -ErrorAction Stop | Out-Null
        Write-Host "✓ Created profile directory" -ForegroundColor Green
    }
    catch {
        Write-Host "⚠️  Could not create profile directory (may be protected)" -ForegroundColor Yellow
    }
}

# Backup existing profile if it exists
if (Test-Path $PROFILE) {
    try {
        $backupPath = "$PROFILE.backup"
        Copy-Item $PROFILE $backupPath -Force -ErrorAction Stop
        Write-Host "✓ Backed up existing profile" -ForegroundColor Green
    }
    catch {
        Write-Host "⚠️  Could not backup profile (may be protected)" -ForegroundColor Yellow
    }
}

# Create or update profile with chatbot function
$profileContent = @"
# GamerX AI - Windows Terminal
# Added by installation script

function ai {
    param(
        [Parameter(Mandatory=`$false, ValueFromRemainingArguments=`$true)]
        [string]`$Query
    )
    & "$chatbotScript" @args
}

# Alias for convenience
Set-Alias -Name gx -Value ai -Force -Option AllScope

Write-Host "✓ GamerX AI loaded (use 'ai' or 'gx' command)" -ForegroundColor Green
"@

# Try to update profile
try {
    Add-Content -Path $PROFILE -Value "`n$profileContent" -Force -ErrorAction Stop
    Write-Host "✓ Updated PowerShell profile" -ForegroundColor Green
}
catch {
    Write-Host "⚠️  Could not update profile (may be protected)" -ForegroundColor Yellow
    Write-Host "   You can still use: & '$chatbotScript' 'your query'" -ForegroundColor Yellow
}

# Create config directory
$configDir = "$env:APPDATA\ai-chatbot"
if (-not (Test-Path $configDir)) {
    New-Item -ItemType Directory -Path $configDir -Force | Out-Null
    Write-Host "✓ Created config directory: $configDir" -ForegroundColor Green
}

# Initialize history file
$historyFile = "$configDir\chat_history.json"
if (-not (Test-Path $historyFile)) {
    @() | ConvertTo-Json | Set-Content $historyFile
    Write-Host "✓ Initialized chat history" -ForegroundColor Green
}

Write-Host @"

╔════════════════════════════════════════════════════════════════╗
║              GamerX AI - Installation Complete!               ║
╚════════════════════════════════════════════════════════════════╝

✓ Setup complete (no admin required!)
✓ Config directory created
✓ Chat history initialized

NEXT STEPS:
1. Close and reopen PowerShell
2. Type: ai "write a python function to reverse a string"
3. Or type: ai -chat (for interactive mode)

USAGE:
  ai "your question"           # Single query
  ai -chat                     # Interactive chat
  ai -history                  # Show chat history
  ai -clear                    # Clear history
  ai -help                     # Show help
  gx "query"                   # Short alias

ALTERNATIVE (if profile update fails):
  & '$chatbotScript' "your query"

LOCATION:
  Config: $configDir
  History: $historyFile
  Script: $chatbotScript

FEATURES:
  ✓ Works on admin-protected devices
  ✓ No administrator required
  ✓ Code-only output mode
  ✓ Chat history saved locally
  ✓ Gemini 2.0 Flash API

"@ -ForegroundColor Green

Write-Host "Press any key to continue..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
