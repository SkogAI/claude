#!/bin/bash

# context-interaction.sh - Script to include interaction information in context
# Usage: ./scripts/context/context-interaction.sh [interactive|non-interactive]
# Purpose: Inform Goose about the type of interaction (chat or one-way)

set -e  # Exit on error

# Function to show help for this script
show_interaction_help() {
  echo "# Interaction Mode Usage Information"
  echo
  echo "Usage: context-interaction.sh <mode>"
  echo
  echo "Available modes:"
  echo "  interactive      - Set up context for interactive chat session"
  echo "  non-interactive  - Set up context for one-way (non-chat) interaction"
  echo
  echo "Examples:"
  echo "  context-interaction.sh interactive     # Prepare for chat session"
  echo "  context-interaction.sh non-interactive # Prepare for one-way communication"
  echo
  echo "Use with run.sh:"
  echo "  ./run.sh --interactive"
  echo "  ./run.sh --non-interactive"
}

# Check if a mode was specified
if [ -z "$1" ]; then
  show_interaction_help
  exit 0
fi

MODE="$1"

echo "# Interaction Information"
echo

case "$MODE" in
  "interactive")
    echo "## Interactive Session"
    echo
    echo "**This is an interactive chat session.**"
    echo
    echo "- You are being run with the \`--interactive\` flag"
    echo "- The user will be able to respond to your messages"
    echo "- You can engage in back-and-forth conversation"
    echo "- This context will persist through the conversation"
    echo "- Feel free to ask clarifying questions or request additional context as needed"
    echo
    echo "Prepared for multi-turn interaction."
    ;;

  "non-interactive")
    echo "## One-Way Communication"
    echo
    echo "**This is a non-interactive, one-way communication.**"
    echo
    echo "- You are being run with the \`--non-interactive\` flag"
    echo "- The user will not be able to respond to your message"
    echo "- You should provide a complete response based on current context"
    echo "- Make clear recommendations without requiring follow-up"
    echo "- If you need clarification, explain what is ambiguous and provide alternatives"
    echo
    echo "Prepared for single-turn interaction."
    ;;

  *)
    echo "## Unknown Interaction Mode"
    echo
    echo "Unknown mode: $MODE"
    echo "Available modes: interactive, non-interactive"
    echo
    show_interaction_help
    ;;
esac

echo
echo "---"
echo "Interaction mode set on $(date)"
