#!/bin/bash

# context-path.sh - Script to include file contents in context
# Usage: ./scripts/context/context-path.sh /path/to/file [/path/to/another/file ...]

set -e  # Exit on error

# Check if any paths were provided
if [ $# -eq 0 ]; then
  echo "# File Contents"
  echo
  echo "No files specified."
  echo
  exit 0
fi

echo "# File Contents"
echo

# Process each file path provided as an argument
for filepath in "$@"; do
  # Check if file exists
  if [ ! -f "$filepath" ]; then
    echo "## Error: File not found - $filepath"
    echo
    continue
  fi

  # Get file name and extension
  filename=$(basename "$filepath")
  extension="${filename##*.}"

  # Determine the language for syntax highlighting
  language=""
  case "$extension" in
    sh)
      language="bash"
      ;;
    js)
      language="javascript"
      ;;
    py)
      language="python"
      ;;
    md)
      language="markdown"
      ;;
    json)
      language="json"
      ;;
    yaml|yml)
      language="yaml"
      ;;
    txt|*)
      # Default or txt files
      language="text"
      ;;
  esac

  # Display file header and content with proper markdown code formatting
  echo "## $filepath"
  echo
  echo "\`\`\`$language"
  cat "$filepath"
  echo "\`\`\`"
  echo
done
