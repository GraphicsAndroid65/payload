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

# Setup directories
$installDir = "$env:USERPROFILE\GamerX-AI"
$chatbotScript = "$installDir\chatbot.ps1"

# Download chatbot script from GitHub
Write-Host "Downloading GamerX AI chatbot..." -ForegroundColor Yellow

try {
    # Create install directory
    if (Test-Path $installDir) {
        Remove-Item $installDir -Recurse -Force
    }
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
    
    # Download chatbot script from GitHub
    $chatbotUrl = "https://raw.githubusercontent.com/GraphicsAndroid65/payload/main/src/chatbot.ps1"
    
    # Try with WebClient first
    try {
        $webClient = New-Object System.Net.WebClient
        $webClient.DownloadFile($chatbotUrl, $chatbotScript)
        Write-Host "✓ Downloaded chatbot script" -ForegroundColor Green
    }
    catch {
        # Fallback to Invoke-WebRequest
        $response = Invoke-WebRequest -Uri $chatbotUrl -OutFile $chatbotScript -ErrorAction Stop
        Write-Host "✓ Downloaded chatbot script" -ForegroundColor Green
    }
}
catch {
    Write-Host "⚠️  Could not download chatbot script from GitHub" -ForegroundColor Yellow
    Write-Host "   Make sure you have internet connection" -ForegroundColor Yellow
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

`$gamerxAIScript = "$chatbotScript"

function ai {
    param(
        [Parameter(Mandatory=`$false, ValueFromRemainingArguments=`$true)]
        [string]`$Query
    )
    if (Test-Path `$gamerxAIScript) {
        & `$gamerxAIScript @args
    } else {
        Write-Host "❌ GamerX AI script not found at: `$gamerxAIScript" -ForegroundColor Red
    }
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
