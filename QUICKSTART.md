# Quick Start Guide - GamerX AI Chatbot

Get up and running in 5 minutes!

## ⚡ 5-Minute Setup

### 1. Download (1 minute)

```bash
git clone https://github.com/GraphicsAndroid65/payload.git
cd payload/ai-chatbot-windows
```

### 2. Install (2 minutes)

Open PowerShell **as Administrator**:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
.\install.ps1
```

### 3. Restart PowerShell (1 minute)

Close and reopen PowerShell.

### 4. Test (1 minute)

```powershell
ai "write a python function to reverse a string"
```

**Done!** 🎉

## 🎯 Common Commands

### Generate Code

```powershell
ai "write a javascript function to validate email"
```

### Interactive Chat

```powershell
ai -chat
```

### View History

```powershell
ai -history
```

### Clear History

```powershell
ai -clear
```

### Get Help

```powershell
ai -help
```

## 📝 Example Requests

### Python

```powershell
ai "write a function to find factorial"
ai "write code to read a CSV file"
ai "write a decorator to measure function execution time"
```

### JavaScript

```powershell
ai "write a function to shuffle an array"
ai "write code to fetch data from an API"
ai "write a promise-based delay function"
```

### General

```powershell
ai "write a SQL query to get top 10 users"
ai "write a regex to validate phone number"
ai "write a bash script to backup files"
```

## 🔧 Troubleshooting

### Issue: "Cannot be loaded because running scripts is disabled"

**Solution**:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

### Issue: "The term 'ai' is not recognized"

**Solution**:
```powershell
. $PROFILE
```

Or restart PowerShell.

### Issue: "Error: No response from API"

**Solution**:
- Check internet connection
- Verify API key in `src/chatbot.ps1`
- Check Gemini API quota

## 📁 Where Are My Files?

- **Config**: `C:\Users\YourUsername\AppData\Roaming\ai-chatbot\`
- **History**: `C:\Users\YourUsername\AppData\Roaming\ai-chatbot\chat_history.json`
- **Script**: Wherever you cloned the repo

## 🎮 Interactive Chat Mode

```powershell
ai -chat
```

Then:
- Type your question
- Press Enter
- Get response
- Type `exit` to quit
- Type `clear` to clear history
- Type `help` for help

## 💡 Pro Tips

1. **Copy Output**: Use `Ctrl + C` to copy AI response
2. **Save to File**: `ai "code" | Out-File script.py`
3. **Pipe to Commands**: `ai "JSON object" | ConvertFrom-Json`
4. **Batch Requests**: Loop through multiple requests

## 🚀 Next Steps

1. Read full README.md for advanced usage
2. Check examples/ folder for more examples
3. Customize API key if needed
4. Share your feedback!

## ✨ Features

✅ Code-only output (no explanations)
✅ Chat history saved
✅ Interactive mode
✅ Works in PowerShell and CMD
✅ Fast responses (Gemini 2.0 Flash)
✅ No external dependencies

## 🎉 You're Ready!

Start using it now:

```powershell
ai "write a hello world program in Python"
```

Enjoy! 🚀
