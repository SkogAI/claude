#!/bin/bash

# Enhanced context builder for Claude with MCP integration
# Usage: ./scripts/context/context-enhanced.sh [options]

set -e  # Exit on error

# Force UTF-8 encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Resolve script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make all component scripts executable
chmod +x "$SCRIPT_DIR"/context-*.sh

# Create tmp directory if it doesn't exist
mkdir -p tmp

# Output file
OUTPUT_FILE="tmp/context.md"

# Write context summary header
{
  echo "# SkogAI Context Summary"
  echo
  echo "Generated on: $(date)"
  echo
  echo "---"
  echo

  # Use the enhanced Claude context script
  "$SCRIPT_DIR/context-claude-enhanced.sh"

  # Add a marker to indicate end of loaded context
  echo
  echo "---"
  echo
  echo "**END OF LOADED CONTEXT - CONVERSATION STARTS HERE**"
  echo
} > "$OUTPUT_FILE"

# Optional display of results
if [[ "$1" == "--display" ]]; then
  cat "$OUTPUT_FILE"
  echo
  # Calculate approximate tokens
  TOTAL_CHARS=$(wc -c < "$OUTPUT_FILE")
  ESTIMATED_TOKENS=$((TOTAL_CHARS / 4))
  echo "Estimated token usage: ~$ESTIMATED_TOKENS tokens"
fi

echo "Context generated successfully to $OUTPUT_FILE"
