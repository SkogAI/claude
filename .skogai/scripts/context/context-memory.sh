#!/bin/bash

# context-memory.sh - Script to include memory files in context
# Usage: ./scripts/context/context-memory.sh <num>
# Purpose: Load memory files with numbers less than <num>

set -e  # Exit on error

# Function to show help for this script
show_memory_help() {
  echo "# Memory Files Usage Information"
  echo
  echo "Usage: context-memory.sh <num>"
  echo
  echo "Purpose: Include memory files with numbers less than <num>"
  echo "         Files are loaded from /home/skogix/.goose/memory"
  echo
  echo "Examples:"
  echo "  context-memory.sh 10  # Load files 00-* through 09-* from memory directory"
  echo "  context-memory.sh 5   # Load files 00-* through 04-* from memory directory"
  echo
  echo "Use with run.sh:"
  echo "  ./run.sh --memory 10"
}

# Check if a number was provided
if [ -z "$1" ]; then
  show_memory_help
  exit 0
fi

# Get the number
NUM="$1"

# Validate that NUM is a number
if ! [[ "$NUM" =~ ^[0-9]+$ ]]; then
  echo "Error: '$NUM' is not a valid number."
  show_memory_help
  exit 1
fi

echo "# Memory Files"
echo

# Define the memory directory
MEMORY_DIR="/home/skogix/.goose/memory"

# Check if the memory directory exists
if [ ! -d "$MEMORY_DIR" ]; then
  echo "Memory directory not found: $MEMORY_DIR"
  exit 0
fi

# Find memory files with numbers less than NUM
echo "## Memory Files (0-$(($NUM-1)))"
echo

# Find memory files with numbers less than NUM
FILES=""
for ((i=0; i<$NUM; i++)); do
  # Format the number with leading zeros based on its value
  if [ $i -lt 10 ]; then
    PREFIX="0$i"
  else
    PREFIX="$i"
  fi

  # Find files with this prefix and append to FILES
  NEW_FILES=$(find "$MEMORY_DIR" -type f -name "${PREFIX}-*" -o -name "${PREFIX}_*" 2>/dev/null | sort)
  if [ -n "$NEW_FILES" ]; then
    if [ -n "$FILES" ]; then
      FILES="$FILES
$NEW_FILES"
    else
      FILES="$NEW_FILES"
    fi
  fi
done

if [ -z "$FILES" ]; then
  echo "No memory files found matching the pattern."
  echo
  echo "Memory directory: $MEMORY_DIR"
  echo "Looking for files with prefixes 00 through $(printf "%02d" $(($NUM-1)))"

  # List all files in the memory directory for debugging
  echo
  echo "Files in memory directory:"
  echo '```'
  ls -la "$MEMORY_DIR" 2>/dev/null || echo "Cannot list directory contents"
  echo '```'
else
  # Process each file
  echo "$FILES" | while read -r file; do
    if [ -n "$file" ] && [ -f "$file" ]; then
      FILENAME=$(basename "$file")
      echo "### $FILENAME"
      echo
      echo '```'
      cat "$file"
      echo '```'
      echo
    fi
  done
fi

echo "---"
echo "Memory files loaded on $(date)"
