# GamerX AI - No Admin Required!

## ✅ Works on Any Windows Device

Your GamerX AI chatbot now works **without administrator privileges** - even on admin-protected corporate devices!

## 🎯 Key Features

✅ **No Admin Required**
- Works on any Windows device
- No administrator access needed
- Works on corporate/restricted networks
- Works on school/university computers

✅ **GamerX Branding**
- Professional "GamerX AI" branding
- Short alias: `gx` command
- Modern and sleek interface

✅ **Fallback Options**
- If profile update fails, you can still use the script directly
- Multiple ways to run the chatbot
- Graceful error handling

## 🚀 Installation (No Admin!)

### Step 1: Clone Repository
```bash
git clone https://github.com/GraphicsAndroid65/payload.git
cd payload/ai-chatbot-windows
```

### Step 2: Run Installation
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
.\install.ps1
```

**No administrator required!** The script handles permission errors gracefully.

### Step 3: Restart PowerShell
Close and reopen PowerShell.

### Step 4: Start Using
```powershell
ai "write a python function"
```

## 💻 Usage

### Primary Commands
```powershell
ai "your question"           # Single query
ai -chat                     # Interactive chat
ai -history                  # Show history
ai -clear                    # Clear history
ai -help                     # Show help
gx "query"                   # Short alias
```

### Fallback (if profile update fails)
```powershell
& .\src\chatbot.ps1 "your query"
```

## 🔐 Security & Permissions

### What Doesn't Require Admin
- ✅ Running PowerShell scripts
- ✅ Creating user config directory
- ✅ Saving chat history
- ✅ Using Gemini API

### What Might Be Protected
- ❌ Modifying system-wide PowerShell profile (not needed)
- ❌ Installing system packages (not needed)
- ❌ Modifying system registry (not needed)

## 🎯 Works On

- ✅ Home Windows 10/11
- ✅ Corporate Windows with restrictions
- ✅ School/University computers
- ✅ Admin-protected devices
- ✅ Shared computers
- ✅ Virtual machines
- ✅ Remote desktop sessions

## 📝 Error Handling

If you encounter permission errors:

1. **Execution Policy Error**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
   ```

2. **Profile Update Failed**
   - The script will notify you
   - You can still use: `& .\src\chatbot.ps1 "query"`
   - Chat history still works

3. **Config Directory Error**
   - Script handles this gracefully
   - Falls back to temp directory
   - Chat history still works

## 🎉 Features

### No Admin Features
- ✅ Code generation (code-only)
- ✅ Interactive chat mode
- ✅ Chat history saved locally
- ✅ Gemini 2.0 Flash API
- ✅ Full functionality

### GamerX Branding
- ✅ "GamerX AI" in all headers
- ✅ Professional styling
- ✅ `gx` short alias
- ✅ Modern interface

## 🔧 Technical Details

### How It Works Without Admin

1. **User-Level Execution Policy**
   - Sets policy only for current user
   - No system-wide changes
   - Doesn't require admin

2. **User Config Directory**
   - Stores in `%APPDATA%\ai-chatbot\`
   - User has full permissions
   - No admin needed

3. **Chat History**
   - Saved in user directory
   - JSON format
   - Fully accessible

4. **PowerShell Profile**
   - Updates user profile only
   - Not system profile
   - Graceful fallback if fails

## 📊 Compatibility

| Device Type | Admin Required | Works |
|------------|----------------|-------|
| Home PC | No | ✅ Yes |
| Corporate | No | ✅ Yes |
| School/Uni | No | ✅ Yes |
| Shared PC | No | ✅ Yes |
| VM | No | ✅ Yes |
| Remote Desktop | No | ✅ Yes |

## 🎓 Example Usage

### On Corporate Device
```powershell
# No admin needed!
cd C:\Users\YourName\Downloads\payload\ai-chatbot-windows
.\install.ps1

# Works immediately
ai "write a C# function"
```

### On Restricted Network
```powershell
# Still works!
gx "write SQL query"

# Chat history saved locally
ai -history
```

### Fallback Method
```powershell
# If profile update fails, use directly
& .\src\chatbot.ps1 "your query"

# Still saves history
ai -history
```

## ✨ What's New

- ✅ Removed admin requirement
- ✅ Added GamerX branding
- ✅ Added `gx` alias
- ✅ Better error handling
- ✅ Graceful fallbacks
- ✅ Works on restricted devices

## 🚀 Ready to Use!

Your GamerX AI chatbot is ready to use on **any Windows device** - no admin required!

```powershell
ai "write a hello world program"
```

Enjoy! 🎉

---

**Version**: 1.0
**Status**: ✅ Production Ready
**Admin Required**: ❌ NO
**Works On**: All Windows devices
**Brand**: GamerX AI
