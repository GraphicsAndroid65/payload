# GamerX AI - One-Liner Installation

## 🚀 Super Simple Installation

Users can install GamerX AI with a **single command** - no downloads, no admin needed!

### Method 1: Using Bitly Link (Recommended)

**Step 1**: Open PowerShell (regular user, no admin)

**Step 2**: Copy and paste this command:

```powershell
iex (iwr 'https://bitly.com/gamerx-ai').Content
```

**Step 3**: Press Enter and wait for installation

**Step 4**: Close and reopen PowerShell

**Step 5**: Start using!

```powershell
ai "write a python function"
```

---

## 📋 How It Works

### What the One-Liner Does

```powershell
iex (iwr 'https://bitly.com/gamerx-ai').Content
```

Breaking it down:
- `iwr` = Invoke-WebRequest (downloads the script)
- `iex` = Invoke-Expression (runs the script)
- The script automatically:
  - Downloads GamerX AI from GitHub
  - Extracts files to `%USERPROFILE%\GamerX-AI`
  - Creates config directory
  - Updates PowerShell profile
  - Sets up aliases

### No Admin Required
- ✅ Works on any Windows device
- ✅ No administrator access needed
- ✅ Works on corporate networks
- ✅ Works on school/university computers

---

## 💻 Usage After Installation

### Single Query
```powershell
ai "write a python function to reverse a string"
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

### Short Alias
```powershell
gx "write javascript code"
```

---

## 🔗 Bitly Link Setup

To create the Bitly link:

1. Go to https://bitly.com
2. Create account (free)
3. Click "Create" → "Shorten a link"
4. Paste this URL:
   ```
   https://raw.githubusercontent.com/GraphicsAndroid65/payload/main/ai-chatbot-windows/install-oneliner.ps1
   ```
5. Set custom link: `gamerx-ai`
6. Copy the shortened link

**Result**: `https://bitly.com/gamerx-ai`

---

## 📝 Alternative Methods

### Method 2: Direct GitHub URL

```powershell
iex (iwr 'https://raw.githubusercontent.com/GraphicsAndroid65/payload/main/ai-chatbot-windows/install-oneliner.ps1').Content
```

### Method 3: From File

If you have the script locally:

```powershell
iex (Get-Content 'C:\path\to\install-oneliner.ps1' | Out-String)
```

---

## 🎯 Complete Setup Example

### For New Users

```powershell
# 1. Open PowerShell (no admin)
# 2. Paste this command:
iex (iwr 'https://bitly.com/gamerx-ai').Content

# 3. Wait for installation to complete
# 4. Close PowerShell
# 5. Reopen PowerShell
# 6. Start using:
ai "write hello world in python"
```

### That's it! 🎉

---

## ✨ Features

After installation, you get:

✅ **Code Generation**
```powershell
ai "write a function to check if number is prime"
```

✅ **Interactive Chat**
```powershell
ai -chat
```

✅ **Chat History**
```powershell
ai -history
```

✅ **Code-Only Output**
- No explanations
- No comments
- Pure code

✅ **Works Everywhere**
- Home computers
- Corporate networks
- School/University
- Admin-protected devices

---

## 🔧 Troubleshooting

### "Execution Policy" Error

If you get an execution policy error, run:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

Then run the one-liner again.

### "Command Not Found" After Installation

Close and reopen PowerShell completely.

### "Download Failed" Error

Try the direct GitHub URL method:

```powershell
iex (iwr 'https://raw.githubusercontent.com/GraphicsAndroid65/payload/main/ai-chatbot-windows/install-oneliner.ps1').Content
```

### Still Not Working?

Manual installation:

```powershell
git clone https://github.com/GraphicsAndroid65/payload.git
cd payload/ai-chatbot-windows
.\install.ps1
```

---

## 📊 Installation Locations

After installation:

- **Installed**: `C:\Users\YourName\GamerX-AI\`
- **Config**: `C:\Users\YourName\AppData\Roaming\ai-chatbot\`
- **History**: `C:\Users\YourName\AppData\Roaming\ai-chatbot\chat_history.json`

---

## 🎓 Quick Reference

| Command | Purpose |
|---------|---------|
| `ai "query"` | Single code query |
| `ai -chat` | Interactive chat mode |
| `ai -history` | Show chat history |
| `ai -clear` | Clear history |
| `ai -help` | Show help |
| `gx "query"` | Short alias |

---

## 🚀 Share This

Share the one-liner with others:

```
Open PowerShell and paste:
iex (iwr 'https://bitly.com/gamerx-ai').Content
```

---

## ✅ Installation Complete!

Your GamerX AI is ready to use!

```powershell
ai "write a hello world program"
```

Enjoy! 🎉

---

**Version**: 1.0
**Installation Method**: One-Liner
**Admin Required**: ❌ NO
**Time to Install**: < 1 minute
**Brand**: GamerX AI
