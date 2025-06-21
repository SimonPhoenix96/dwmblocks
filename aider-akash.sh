#!/bin/bash
# Aider with Akash Chat Configuration
# Usage: ./aider-akash.sh [your-akash-api-key]

# Set your Akash API key (replace with your actual key)
AKASH_API_KEY="${1:-sk-xxxxxxxx}"

if [ "$AKASH_API_KEY" = "sk-xxxxxxxx" ]; then
    echo "Please provide your Akash API key as an argument:"
    echo "Usage: $0 your-akash-api-key"
    echo ""
    echo "You can get an API key from Akash Network"
    exit 1
fi

echo "Starting Aider with Akash Chat..."
echo "Model: Meta-Llama-3-1-8B-Instruct-FP8"
echo "API Base: https://chatapi.akash.network/api/v1"
echo ""

# Export environment variables for OpenAI compatibility
export OPENAI_API_KEY="$AKASH_API_KEY"
export OPENAI_API_BASE="https://chatapi.akash.network/api/v1"

# Remove the API key argument before passing to aider
shift

# Run Aider with the Akash model
aider \
  --model "Meta-Llama-3-1-8B-Instruct-FP8" \
  --openai-api-base "https://chatapi.akash.network/api/v1" \
  --openai-api-key "$AKASH_API_KEY" \
  --no-show-model-warnings \
  "$@"
