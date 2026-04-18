#!/bin/bash

# context-model.sh - Script to include model information in context
# Usage: ./scripts/context/context-model.sh [model]
# Models:
#   ollama      - Local Ollama model
#   openrouter  - OpenRouter hosted model

set -e  # Exit on error

# Function to show help for this script
show_model_help() {
  echo "# Model Selection Usage Information"
  echo
  echo "Usage: context-model.sh <model>"
  echo
  echo "Available models:"
  echo "  ollama      - Local Ollama model"
  echo "  openrouter  - OpenRouter hosted model"
  echo
  echo "Examples:"
  echo "  context-model.sh ollama      # Set Ollama as the model"
  echo "  context-model.sh openrouter  # Set OpenRouter as the model"
  echo
  echo "Use with run.sh:"
  echo "  ./run.sh --model ollama"
  echo "  ./run.sh --model openrouter"
}

# Check if a model was specified
if [ -z "$1" ]; then
  show_model_help
  exit 0
fi

MODEL="$1"

echo "# Model Information"
echo

case $MODEL in
  "ollama")
    echo "## Ollama Local Model"
    echo
    echo "**You are running on a local Ollama model.**"
    echo
    echo "- Model is hosted locally on the user's machine"
    echo "- No data is sent to external services"
    echo "- May have more limited capabilities than cloud models"
    echo "- Consider resource constraints of local hardware"
    echo
    echo "[PLACEHOLDER: Additional Ollama-specific details will be added here]"
    ;;

  "openrouter")
    echo "## OpenRouter Model"
    echo
    echo "**You are running on an OpenRouter-hosted model.**"
    echo
    echo "- Model is hosted on OpenRouter's infrastructure"
    echo "- Data is processed through the OpenRouter API"
    echo "- May have access to more advanced capabilities"
    echo "- API rate limits may apply"
    echo
    echo "[PLACEHOLDER: Additional OpenRouter-specific details will be added here]"
    ;;

  *)
    echo "## Unknown Model"
    echo
    echo "Unknown model: $MODEL"
    echo "Available models: ollama, openrouter"
    echo
    show_model_help
    ;;
esac

echo
echo "---"
echo "Model set on $(date)"
