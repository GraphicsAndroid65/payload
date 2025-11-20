# GamerX AI - Windows Terminal Chatbot

A professional AI chatbot integrated directly into Windows PowerShell and CMD. Ask for code, get code - no explanations, no comments, just pure output. **Works on any Windows device - no admin required!**

## 🎯 Features

- **Terminal Integration**: Works directly in PowerShell and CMD
- **Code-Only Output**: No explanations, comments, or extra text
- **Interactive Chat Mode**: Real-time conversations
- **Chat History**: Automatically saved locally
- **Gemini 2.0 Flash API**: Fast and reliable responses
- **Easy Installation**: One-command setup (no admin needed!)
- **Windows Native**: No external dependencies
- **Admin-Protected Devices**: Works even on restricted networks
- **GamerX Branding**: Professional and sleek

## 📋 Requirements

- Windows 10 or later
- PowerShell 5.0 or later (built-in)
- Internet connection
- **No administrator access required!**

## 🚀 Installation

### Step 1: Download or Clone

```bash
git clone https://github.com/GraphicsAndroid65/payload.git
cd payload/ai-chatbot-windows
```

### Step 2: Run Installation Script

Open PowerShell (no admin required!) and run:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
.\install.ps1
```

**Note**: If you get a permission error on the execution policy, you can still use:
```powershell
& .\src\chatbot.ps1 "your query"
```

### Step 3: Restart PowerShell

Close and reopen PowerShell for changes to take effect. Done!

## 💡 Usage

### Single Query (Code Generation)

```powershell
ai "write a python function to reverse a string"
```

**Output** (just code):
```python
def reverse_string(s):
    return s[::-1]
```

### Interactive Chat Mode

```powershell
ai -chat
```

Then type your questions:
```
You: write a javascript function to fetch an API
AI: async function fetchAPI(url) {
      const response = await fetch(url);
      return response.json();
    }

You: explain decorators in Python
AI: Decorators are functions that modify other functions...
```

### View Chat History

```powershell
ai -history
```

### Clear Chat History

```powershell
ai -clear
```

### Show Help

```powershell
ai -help
```

## 📝 Examples

### Python Code Generation

```powershell
ai "write a function to check if a number is prime"
```

### JavaScript Code Generation

```powershell
ai "javascript code to validate email address"
```

### Algorithm Implementation

```powershell
ai "write a merge sort algorithm in C++"
```

### Data Processing

```powershell
ai "python code to read CSV and print column names"
```

### Ask Questions

```powershell
ai "what does this code do: def factorial(n): return 1 if n<=1 else n*factorial(n-1)"
```

## 🎮 Keyboard Shortcuts

| Action | Key |
|--------|-----|
| Exit Chat Mode | `exit` |
| Clear History | `clear` |
| Show Help | `help` |
| Copy Output | `Ctrl + C` |
| Paste | `Ctrl + V` |

## 📁 Project Structure

```
ai-chatbot-windows/
├── src/
│   └── chatbot.ps1          # Main PowerShell script
├── install.ps1              # Installation script
├── setup.bat                # Batch setup (alternative)
├── README.md                # This file
├── QUICKSTART.md            # Quick start guide
└── examples/
    ├── python_examples.md   # Python code examples
    ├── javascript_examples.md
    └── general_examples.md
```

## 🔧 Configuration

### API Key

The API key is hardcoded in `src/chatbot.ps1`. To change it:

1. Open `src/chatbot.ps1`
2. Find: `$API_KEY = "AIzaSyA1tszcr-fKZNCotwm3Xt8yoyupBB2np6E"`
3. Replace with your own Gemini API key from https://aistudio.google.com

### Chat History Location

- **Windows**: `%APPDATA%\ai-chatbot\chat_history.json`
- **Full Path**: `C:\Users\YourUsername\AppData\Roaming\ai-chatbot\chat_history.json`

## 🐛 Troubleshooting

### "Cannot be loaded because running scripts is disabled"

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

### "The term 'ai' is not recognized"

- Restart PowerShell
- Or reload profile: `. $PROFILE`

### "Error: No response from API"

- Check internet connection
- Verify API key is correct
- Check Gemini API quota at https://aistudio.google.com

### Installation script requires Administrator

- Right-click PowerShell
- Select "Run as Administrator"
- Run the install script again

## 📚 Advanced Usage

### Using with Other Tools

```powershell
# Generate code and save to file
ai "write a hello world program in Python" | Out-File hello.py

# Generate code and pipe to another command
ai "write a JSON object" | ConvertFrom-Json
```

### Batch Operations

```powershell
# Create multiple files from AI-generated code
$languages = @("Python", "JavaScript", "C++")
foreach ($lang in $languages) {
    ai "write hello world in $lang" | Out-File "hello.$lang"
}
```

## 🔐 Security

- API key is stored in the script (consider environment variables for production)
- Chat history is stored locally in `%APPDATA%\ai-chatbot\`
- No data is sent to external servers except Gemini API

## 📊 System Requirements

- **Disk Space**: ~5 MB
- **Memory**: Minimal (PowerShell native)
- **Network**: Required for API calls
- **OS**: Windows 10+

## 🤝 Contributing

Feel free to fork and submit pull requests!

## 📄 License

MIT License - See LICENSE file for details

## 🎉 Getting Started

1. Install: `.\install.ps1` (as Administrator)
2. Restart PowerShell
3. Try: `ai "write a python function to reverse a string"`
4. Enjoy!

## 📞 Support

For issues or questions:
- Check the QUICKSTART.md
- Review examples/ folder
- Open an issue on GitHub

---

**Version**: 1.0
**Framework**: PowerShell 5.0+
**API**: Google Gemini 2.0 Flash
**Status**: ✅ Production Ready
