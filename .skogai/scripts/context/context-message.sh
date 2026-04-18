#!/bin/bash

# context-message.sh - Script to include user message in context
# Usage: ./scripts/context/context-message.sh "User message here"

set -e  # Exit on error

# Function to show help for this script
show_message_help() {
  echo "# Message Context Usage Information"
  echo
  echo "Usage: context-message.sh \"Your message here\""
  echo
  echo "Purpose: Include a specific user message in the context"
  echo
  echo "Examples:"
  echo "  context-message.sh \"Please analyze this code\"  # Add a specific message to context"
  echo
  echo "Use with run.sh:"
  echo "  ./run.sh --message \"Your message here\""
}

# Check if a message was provided
if [ -z "$1" ]; then
  show_message_help
  exit 0
fi

# Get the message
MESSAGE="$1"

echo "# User Message"
echo
echo "The user has provided the following message:"
echo
echo "> $MESSAGE"
echo
echo "[PLACEHOLDER: Additional message processing will be implemented here in the future]"
echo
echo "---"
echo "Message received on $(date)"
