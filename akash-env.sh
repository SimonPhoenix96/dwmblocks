# Akash Chat Environment Configuration for Aider
# Source this file to set up environment variables
# Usage: source akash-env.sh

# Set your Akash API key here (replace with your actual key)
export AKASH_API_KEY="sk-xxxxxxxx"

# OpenAI compatibility settings for Aider
export OPENAI_API_KEY="$AKASH_API_KEY"
export OPENAI_API_BASE="https://chatapi.akash.network/api/v1"

# Default model
export AIDER_MODEL="Meta-Llama-3-1-8B-Instruct-FP8"

echo "Akash Chat environment configured!"
echo "API Base: $OPENAI_API_BASE"
echo "Default Model: $AIDER_MODEL"
echo ""
echo "You can now run: aider --model Meta-Llama-3-1-8B-Instruct-FP8"
echo "Or use the custom model: aider --model Meta-Llama-4-Maverick-17B-128E-Instruct-FP8"
