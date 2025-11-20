# GamerX AI - One-Liner Installation Script
# This script can be hosted and executed via: iex (iwr 'https://bitly.com/gamerx-ai').Content
# Or: powershell -Command "iex (iwr 'https://bitly.com/gamerx-ai').Content"

Write-Host @"
╔════════════════════════════════════════════════════════════════╗
║                  GamerX AI - Installing...                    ║
╚════════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Cyan

# Download and extract repository
$tempDir = "$env:TEMP\gamerx-ai-temp"
$installDir = "$env:USERPROFILE\GamerX-AI"

Write-Host "Downloading GamerX AI..." -ForegroundColor Yellow

try {
    # Create temp directory
    if (Test-Path $tempDir) { Remove-Item $tempDir -Recurse -Force }
    New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
    
    # Download repository as ZIP
    $zipPath = "$tempDir\payload.zip"
    $repoUrl = "https://github.com/GraphicsAndroid65/payload/archive/refs/heads/main.zip"
    
    # Use WebClient for compatibility
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($repoUrl, $zipPath)
    
    Write-Host "✓ Downloaded repository" -ForegroundColor Green
    
    # Extract ZIP
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipPath, $tempDir)
    
    Write-Host "✓ Extracted files" -ForegroundColor Green
    
    # Copy to install directory
    if (Test-Path $installDir) { Remove-Item $installDir -Recurse -Force }
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
    
    # Copy chatbot files
    $sourceDir = "$tempDir\payload-main\ai-chatbot-windows"
    if (Test-Path $sourceDir) {
        Copy-Item "$sourceDir\*" -Destination $installDir -Recurse -Force
        Write-Host "✓ Installed to: $installDir" -ForegroundColor Green
    } else {
        Write-Host "❌ Could not find ai-chatbot-windows folder" -ForegroundColor Red
        exit 1
    }
    
    # Create config directory
    $configDir = "$env:APPDATA\ai-chatbot"
    if (-not (Test-Path $configDir)) {
        New-Item -ItemType Directory -Path $configDir -Force | Out-Null
        Write-Host "✓ Created config directory" -ForegroundColor Green
    }
    
    # Initialize history file
    $historyFile = "$configDir\chat_history.json"
    if (-not (Test-Path $historyFile)) {
        @() | ConvertTo-Json | Set-Content $historyFile
        Write-Host "✓ Initialized chat history" -ForegroundColor Green
    }
    
    # Update PowerShell profile
    $chatbotScript = "$installDir\src\chatbot.ps1"
    
    $profileContent = @"
# GamerX AI - Windows Terminal
# Auto-installed via one-liner

function ai {
    param([Parameter(Mandatory=`$false, ValueFromRemainingArguments=`$true)][string]`$Query)
    & "$chatbotScript" @args
}

Set-Alias -Name gx -Value ai -Force -Option AllScope
Write-Host "✓ GamerX AI loaded (use 'ai' or 'gx' command)" -ForegroundColor Green
"@
    
    try {
        $profileDir = Split-Path -Parent $PROFILE
        if (-not (Test-Path $profileDir)) {
            New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
        }
        Add-Content -Path $PROFILE -Value "`n$profileContent" -Force
        Write-Host "✓ Updated PowerShell profile" -ForegroundColor Green
    }
    catch {
        Write-Host "⚠️  Could not update profile (may be protected)" -ForegroundColor Yellow
        Write-Host "   You can still use: & '$chatbotScript' 'query'" -ForegroundColor Yellow
    }
    
    # Cleanup
    Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
    
    Write-Host @"

╔════════════════════════════════════════════════════════════════╗
║              GamerX AI - Installation Complete!               ║
╚════════════════════════════════════════════════════════════════╝

✓ Installation successful!

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
  ✓ No admin required
  ✓ Works on restricted devices
  ✓ Code-only output
  ✓ Chat history saved
  ✓ Gemini 2.0 Flash API

Ready to use! 🎉

"@ -ForegroundColor Green
    
}
catch {
    Write-Host "❌ Installation failed: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
