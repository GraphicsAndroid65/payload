# Python Code Examples

Generate Python code using GamerX AI Chatbot

## Basic Functions

### Reverse a String

```powershell
ai "write a python function to reverse a string"
```

**Output**:
```python
def reverse_string(s):
    return s[::-1]
```

### Check Prime Number

```powershell
ai "write a function to check if a number is prime"
```

**Output**:
```python
def is_prime(n):
    if n < 2:
        return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False
    return True
```

### Calculate Factorial

```powershell
ai "write a function to calculate factorial"
```

**Output**:
```python
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)
```

## Data Processing

### Read CSV File

```powershell
ai "write python code to read a CSV file and print column names"
```

### Parse JSON

```powershell
ai "write python code to parse JSON and extract specific fields"
```

### Sort Dictionary

```powershell
ai "write python code to sort a dictionary by values"
```

## Web Development

### Fetch API

```powershell
ai "write python code to fetch data from an API using requests"
```

### Parse HTML

```powershell
ai "write python code to parse HTML using BeautifulSoup"
```

## Decorators & Advanced

### Timing Decorator

```powershell
ai "write a python decorator to measure function execution time"
```

### Retry Decorator

```powershell
ai "write a python decorator to retry a function on failure"
```

## File Operations

### List Files

```powershell
ai "write python code to list all files in a directory"
```

### Copy Files

```powershell
ai "write python code to copy files from one directory to another"
```

### Search in Files

```powershell
ai "write python code to search for a string in multiple files"
```

## String Operations

### Remove Duplicates

```powershell
ai "write python code to remove duplicate characters from a string"
```

### Count Occurrences

```powershell
ai "write python code to count word occurrences in a string"
```

## List Operations

### Find Common Elements

```powershell
ai "write python code to find common elements in two lists"
```

### Flatten Nested List

```powershell
ai "write python code to flatten a nested list"
```

## Dictionary Operations

### Merge Dictionaries

```powershell
ai "write python code to merge multiple dictionaries"
```

### Find Key by Value

```powershell
ai "write python code to find dictionary key by value"
```

## Regular Expressions

### Email Validation

```powershell
ai "write python code to validate email using regex"
```

### Phone Number Extraction

```powershell
ai "write python code to extract phone numbers from text using regex"
```

## Database

### SQLite Connection

```powershell
ai "write python code to connect to SQLite database and query data"
```

### Insert Records

```powershell
ai "write python code to insert records into SQLite database"
```

## Testing

### Unit Test

```powershell
ai "write a python unit test for a function that adds two numbers"
```

### Mock Testing

```powershell
ai "write python code to mock an API response in tests"
```

## Tips

- Be specific about requirements
- Mention Python version if needed (Python 2 vs 3)
- Include input/output examples for clarity
- Ask for explanations separately if needed

## Interactive Mode

For longer conversations:

```powershell
ai -chat
```

Then ask multiple related questions in sequence.
