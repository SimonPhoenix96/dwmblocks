#!/bin/bash
# Enhanced Aider with Akash Chat Configuration
# Usage: ./aider-akash-enhanced.sh [api-key] [model-choice]

AKASH_API_KEY="${1:-sk-xxxxxxxx}"
MODEL_CHOICE="${2:-1}"

if [ "$AKASH_API_KEY" = "sk-xxxxxxxx" ]; then
    echo "Please provide your Akash API key as the first argument:"
    echo "Usage: $0 your-akash-api-key [model-choice]"
    echo ""
    echo "Model choices:"
    echo "  1 - Meta-Llama-3-1-8B-Instruct-FP8 (default)"
    echo "  2 - Meta-Llama-4-Maverick-17B-128E-Instruct-FP8"
    echo ""
    echo "You can get an API key from Akash Network"
    exit 1
fi

# Set model based on choice
case $MODEL_CHOICE in
    1)
        MODEL_NAME="openai/Meta-Llama-3-1-8B-Instruct-FP8"
        echo "Using Model: Meta-Llama-3-1-8B-Instruct-FP8"
        ;;
    2)
        MODEL_NAME="openai/Meta-Llama-4-Maverick-17B-128E-Instruct-FP8"
        echo "Using Model: Meta-Llama-4-Maverick-17B-128E-Instruct-FP8"
        ;;
    *)
        echo "Invalid model choice: $MODEL_CHOICE"
        echo "Available choices: 1 (Llama-3.1-8B) or 2 (Llama-4-Maverick-17B)"
        exit 1
        ;;
esac

echo "API Base: https://chatapi.akash.network/api/v1"
echo "Starting Aider..."
echo ""

# Export environment variables for OpenAI compatibility
export OPENAI_API_KEY="$AKASH_API_KEY"
export OPENAI_API_BASE="https://chatapi.akash.network/api/v1"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Remove the first two arguments (API key and model choice) before passing to aider
shift 2

# Run Aider with the Akash model and model settings file
aider \
  --model "$MODEL_NAME" \
  --openai-api-base "https://chatapi.akash.network/api/v1" \
  --openai-api-key "$AKASH_API_KEY" \
  --model-settings-file "$SCRIPT_DIR/akash-models.json" \
  --no-show-model-warnings \
  "$@"
