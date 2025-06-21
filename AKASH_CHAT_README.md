# Aider with Akash Chat Integration

This directory contains configuration files and scripts to use Aider with Akash Chat's OpenAI-compatible API.

## Available Models

1. **Meta-Llama-3-1-8B-Instruct-FP8** - Standard 8B parameter model
2. **Meta-Llama-4-Maverick-17B-128E-Instruct-FP8** - Advanced 17B parameter model with 128K context

## Setup Methods

### Method 1: Using the Simple Script

```bash
# Replace 'your-api-key' with your actual Akash API key
./aider-akash.sh your-api-key

# Example
./aider-akash.sh sk-abc123def456ghi789
```

### Method 2: Using the Enhanced Script (Recommended)

```bash
# Use Llama-3.1-8B (default)
./aider-akash-enhanced.sh your-api-key 1

# Use Llama-4-Maverick-17B
./aider-akash-enhanced.sh your-api-key 2

# You can also pass additional aider arguments
./aider-akash-enhanced.sh your-api-key 1 --no-git --verbose
```

### Method 3: Using Environment Variables

```bash
# Edit akash-env.sh and set your API key
nano akash-env.sh

# Source the environment
source akash-env.sh

# Now you can use aider directly
aider --model Meta-Llama-3-1-8B-Instruct-FP8
aider --model Meta-Llama-4-Maverick-17B-128E-Instruct-FP8
```

### Method 4: Manual Command Line

```bash
# Direct command line usage
aider \
  --model "Meta-Llama-4-Maverick-17B-128E-Instruct-FP8" \
  --openai-api-base "https://chatapi.akash.network/api/v1" \
  --openai-api-key "your-api-key"
```

## Statusbar Integration

A dwmblocks statusbar widget has been added for easy access to Aider:

### Statusbar Widget: `sb-start-aider`

The statusbar shows:
- 🤖 - Aider is not running
- 🤖🟢 - Aider is currently running

### Click Actions:

- **Left Click**: Start Aider with Meta-Llama-3.1-8B-Instruct-FP8 (fast, cost-effective)
- **Right Click**: Start Aider with Meta-Llama-4-Maverick-17B-128E-Instruct-FP8 (powerful, advanced)
- **Middle Click**: Show help information
- **Shift + Left Click**: Open Aider configuration documentation

The widget automatically detects if Aider is running and updates the visual indicator accordingly.

## Getting an Akash API Key

1. Visit the Akash Network documentation
2. Generate an API key using their key generation endpoint
3. Replace `sk-xxxxxxxx` in the scripts with your actual key

## Testing the Setup

You can test the API connection manually:

```bash
curl https://chatapi.akash.network/api/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your-api-key" \
  -d '{
    "model": "Meta-Llama-3-1-8B-Instruct-FP8",
    "messages": [
      {
        "role": "user",
        "content": "Hello, please respond with just the word test."
      }
    ]
  }'
```

## Files in this Directory

- `aider-akash.sh` - Simple script for basic usage
- `aider-akash-enhanced.sh` - Enhanced script with model selection
- `akash-models.json` - Model configuration file for Aider
- `akash-env.sh` - Environment variable configuration
- `AKASH_CHAT_README.md` - This documentation file

## Troubleshooting

1. **Authentication Error**: Make sure your API key is valid
2. **Model Not Found**: Verify the model name matches exactly
3. **Connection Issues**: Check your internet connection and API endpoint

## Example Usage

```bash
# Start Aider with the advanced model for a coding project
./aider-akash-enhanced.sh sk-your-key 2

# In the Aider session, you can now:
# - Ask questions about your code
# - Request code modifications
# - Get help with debugging
# - Generate new features
```

The Akash Chat integration provides a cost-effective alternative to other AI services while maintaining full compatibility with Aider's features.
