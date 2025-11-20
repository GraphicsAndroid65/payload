# GamerX AI - Windows Terminal Chatbot
# Professional AI assistant for PowerShell/CMD
# No admin required - works on any Windows device
# Usage: ai "write a python function to reverse a string"

param(
    [Parameter(Mandatory=$false, ValueFromRemainingArguments=$true)]
    [string]$Query
)

# Configuration
$API_KEY = "AIzaSyA1tszcr-fKZNCotwm3Xt8yoyupBB2np6E"
$CONFIG_DIR = "$env:APPDATA\ai-chatbot"
$HISTORY_FILE = "$CONFIG_DIR\chat_history.json"
$MODEL = "gemini-2.0-flash"

# Ensure config directory exists
if (-not (Test-Path $CONFIG_DIR)) {
    New-Item -ItemType Directory -Path $CONFIG_DIR -Force | Out-Null
}

# Initialize history file if it doesn't exist
if (-not (Test-Path $HISTORY_FILE)) {
    @() | ConvertTo-Json | Set-Content $HISTORY_FILE
}

function Get-ChatHistory {
    try {
        $history = Get-Content $HISTORY_FILE -Raw | ConvertFrom-Json
        return $history
    }
    catch {
        return @()
    }
}

function Save-ChatHistory {
    param([array]$History)
    $History | ConvertTo-Json | Set-Content $HISTORY_FILE
}

function Add-HistoryEntry {
    param(
        [string]$Role,
        [string]$Content
    )
    $history = Get-ChatHistory
    $entry = @{
        role = $Role
        content = $Content
        timestamp = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
    }
    $history += $entry
    Save-ChatHistory $history
}

function Invoke-GeminiAPI {
    param(
        [string]$UserMessage
    )
    
    try {
        # Build conversation history
        $history = Get-ChatHistory
        $messages = @()
        
        # Add system instruction as first message
        $systemMsg = @{
            role = "user"
            parts = @(@{
                text = @"
You are a code generation assistant. 
IMPORTANT RULES:
- Output ONLY code, NO explanations
- NO commented lines unless absolutely necessary
- NO "Here's the code:" or similar text
- NO markdown formatting (no ```python etc)
- NO extra text before or after code
- Keep code simple and direct
- Match the exact question requirements
- If asked for explanation, provide brief text only
- For code requests: output ONLY the code itself
"@
            })
        }
        $messages += $systemMsg
        
        # Add recent history (last 5 messages)
        $recentHistory = $history | Select-Object -Last 5
        foreach ($msg in $recentHistory) {
            $messages += @{
                role = $msg.role
                parts = @(@{ text = $msg.content })
            }
        }
        
        # Add current message
        $messages += @{
            role = "user"
            parts = @(@{ text = $UserMessage })
        }
        
        # Prepare API request
        $body = @{
            contents = $messages
            generationConfig = @{
                temperature = 0.5
                maxOutputTokens = 2048
            }
        } | ConvertTo-Json -Depth 10
        
        # Call Gemini API
        $uri = "https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${API_KEY}"
        
        $response = Invoke-RestMethod -Uri $uri -Method Post -Body $body -ContentType "application/json"
        
        if ($response.candidates -and $response.candidates[0].content.parts) {
            $responseText = $response.candidates[0].content.parts[0].text
            return $responseText
        }
        else {
            return "Error: No response from API"
        }
    }
    catch {
        return "Error: $($_.Exception.Message)"
    }
}

function Show-Help {
    Write-Host @"
╔════════════════════════════════════════════════════════════════╗
║              GamerX AI - Windows Terminal                      ║
║                                                                ║
║  No admin required - works on any Windows device              ║
╚════════════════════════════════════════════════════════════════╝

USAGE:
  ai "your question or code request"
  ai -chat              # Interactive chat mode
  ai -history           # Show chat history
  ai -clear             # Clear chat history
  ai -help              # Show this help
  gx "query"            # Short alias

EXAMPLES:
  ai "write a python function to reverse a string"
  ai "explain what this code does: def foo(): pass"
  ai "javascript code to fetch API"
  ai -chat
  gx "C# code for HTTP request"

FEATURES:
  ✓ Code-only output (no explanations)
  ✓ Chat history saved locally
  ✓ Interactive chat mode
  ✓ Works in PowerShell and CMD
  ✓ No administrator required
  ✓ Works on admin-protected devices
  ✓ Gemini 2.0 Flash API

BRAND: GamerX AI
VERSION: 1.0
STATUS: Production Ready

"@
}

function Show-History {
    $history = Get-ChatHistory
    if ($history.Count -eq 0) {
        Write-Host "No chat history found."
        return
    }
    
    Write-Host "╔════════════════════════════════════════════════════════════════╗"
    Write-Host "║                      Chat History                             ║"
    Write-Host "╚════════════════════════════════════════════════════════════════╝"
    Write-Host ""
    
    foreach ($entry in $history) {
        $role = $entry.role.ToUpper()
        $color = if ($role -eq "USER") { "Cyan" } else { "Green" }
        Write-Host "[$($entry.timestamp)] $role:" -ForegroundColor $color
        Write-Host $entry.content
        Write-Host ""
    }
}

function Clear-History {
    @() | ConvertTo-Json | Set-Content $HISTORY_FILE
    Write-Host "✓ Chat history cleared" -ForegroundColor Green
}

function Start-ChatMode {
    Write-Host "╔════════════════════════════════════════════════════════════════╗"
    Write-Host "║              GamerX AI - Interactive Chat Mode                 ║"
    Write-Host "║                                                                ║"
    Write-Host "║  No admin required - works on any Windows device              ║"
    Write-Host "╚════════════════════════════════════════════════════════════════╝"
    Write-Host "Type 'exit' to quit, 'clear' to clear history, 'help' for help"
    Write-Host ""
    
    while ($true) {
        Write-Host "You: " -ForegroundColor Cyan -NoNewline
        $input = Read-Host
        
        if ($input -eq "exit") {
            Write-Host "Goodbye!" -ForegroundColor Green
            break
        }
        elseif ($input -eq "clear") {
            Clear-History
            continue
        }
        elseif ($input -eq "help") {
            Show-Help
            continue
        }
        elseif ([string]::IsNullOrWhiteSpace($input)) {
            continue
        }
        
        Write-Host "Thinking..." -ForegroundColor Yellow
        $response = Invoke-GeminiAPI $input
        
        Write-Host "AI: " -ForegroundColor Green
        Write-Host $response
        Write-Host ""
        
        Add-HistoryEntry "user" $input
        Add-HistoryEntry "assistant" $response
    }
}

# Main logic
if ($Query -eq "-help" -or $Query -eq "help" -or $Query -eq "-h") {
    Show-Help
}
elseif ($Query -eq "-history") {
    Show-History
}
elseif ($Query -eq "-clear") {
    Clear-History
}
elseif ($Query -eq "-chat") {
    Start-ChatMode
}
elseif ([string]::IsNullOrWhiteSpace($Query)) {
    Show-Help
}
else {
    # Single query mode
    Write-Host "Thinking..." -ForegroundColor Yellow
    $response = Invoke-GeminiAPI $Query
    Write-Host $response
    
    Add-HistoryEntry "user" $Query
    Add-HistoryEntry "assistant" $response
}
