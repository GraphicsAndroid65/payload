# GamerX AI - Stateless Chatbot (No Installation Required)
# Usage: iex (iwr 'https://raw.githubusercontent.com/GraphicsAndroid65/payload/main/chatbot-stateless.ps1').Content
# Then: ai "your question"

param(
    [Parameter(Mandatory=$false, ValueFromRemainingArguments=$true)]
    [string]$Query
)

# Configuration
$API_KEY = "AIzaSyA1tszcr-fKZNCotwm3Xt8yoyupBB2np6E"
$MODEL = "gemini-2.0-flash"

function Show-Help {
    Write-Host @"
╔════════════════════════════════════════════════════════════════╗
║              GamerX AI - Stateless Chatbot                     ║
║                                                                ║
║  No installation • No storage • Direct API calls              ║
╚════════════════════════════════════════════════════════════════╝

USAGE:
  ai "your question"           # Single query
  ai -help                     # Show this help

EXAMPLES:
  ai "write a python function to reverse a string"
  ai "write javascript code to fetch API"
  ai "C# code to read file"

FEATURES:
  ✓ No installation needed
  ✓ No data stored locally
  ✓ Direct Google Gemini API
  ✓ Code-only output
  ✓ Works on any Windows device
  ✓ No admin required

"@
}

function Invoke-GeminiAPI {
    param([string]$UserMessage)
    
    try {
        # Prepare API request
        $body = @{
            contents = @(
                @{
                    role = "user"
                    parts = @(
                        @{
                            text = "You are a code generation assistant. Output ONLY code, NO explanations, NO comments, NO markdown formatting, NO extra text. For code requests: output ONLY the code itself."
                        }
                    )
                },
                @{
                    role = "user"
                    parts = @(
                        @{
                            text = $UserMessage
                        }
                    )
                }
            )
            generationConfig = @{
                temperature = 0.5
                maxOutputTokens = 2048
            }
        } | ConvertTo-Json -Depth 10
        
        # Call Gemini API
        $uri = "https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${API_KEY}"
        
        $response = Invoke-RestMethod -Uri $uri -Method Post -Body $body -ContentType "application/json" -ErrorAction Stop
        
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

# Main logic
if ($Query -eq "-help" -or $Query -eq "help" -or $Query -eq "-h" -or [string]::IsNullOrWhiteSpace($Query)) {
    Show-Help
}
else {
    Write-Host "Thinking..." -ForegroundColor Yellow
    $response = Invoke-GeminiAPI $Query
    Write-Host $response
}
