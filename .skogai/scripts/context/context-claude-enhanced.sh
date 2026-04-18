#!/bin/bash

# Enhanced Context Loading Script for Claude
# Usage: ./scripts/context/context-claude-enhanced.sh [options]
# This script builds on context-claude.sh with added MCP integration

set -e # Exit on error

# Force UTF-8 encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Default number of tasks to show
TASKS_TO_SHOW=5

# Default number of recent memories to retrieve
MEMORIES_TO_SHOW=3

# Default memories tag to filter by (empty means no filter)
MEMORIES_TAG=""

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
  --tasks=*)
    TASKS_TO_SHOW="${1#*=}"
    shift
    ;;
  --memories=*)
    MEMORIES_TO_SHOW="${1#*=}"
    shift
    ;;
  --memories-tag=*)
    MEMORIES_TAG="${1#*=}"
    shift
    ;;
  *)
    echo "Unknown argument: $1" >&2
    exit 1
    ;;
  esac
done

########## CLAUDE IDENTITY SECTION ##########

# Add Claude section header
echo "# Claude's Role in SkogAI"
echo

# Check if CLAUDE.md exists
if [ -f "CLAUDE.md" ]; then
  # Output Claude.md content
  cat "CLAUDE.md"
  echo
else
  echo "CLAUDE.md not found, skipping section."
  echo
fi

########## ACTIVE TASKS SECTION ##########

# Check if skogcli is available (for MCP todo integration)
if command -v skogcli &>/dev/null; then
  echo "# Active Tasks"
  echo

  # Try to use MCP todo system first
  if gptodo list --sort=state --active-only &>/dev/null; then
    echo "## Current MCP Todo Tasks"
    echo
    echo '```'
    gptodo list --sort=state --active-only
    echo '```'
    echo
  else
    # Fall back to legacy TASKS.md if MCP todo failed
    if [ -f "TASKS.md" ]; then
      echo "## Current Tasks (Legacy System)"
      echo
      echo '```TASKS.md'
      head -n 30 "TASKS.md"
      echo '```'
      echo
    else
      echo "No task tracking system found."
      echo
    fi
  fi
else
  # Fall back to legacy TASKS.md if skogcli not available
  if [ -f "TASKS.md" ]; then
    echo "# Active Tasks (Legacy System)"
    echo
    echo '```TASKS.md'
    head -n 30 "TASKS.md"
    echo '```'
    echo
  else
    echo "No task tracking system found."
    echo
  fi
fi

########## RECENT JOURNAL SECTION ##########

if [ -d journal ]; then
  echo "# Recent Journal Entries"
  echo

  # Get most recent journal file (sort by filename in reverse order)
  JOURNAL=$(find journal -maxdepth 1 -name "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].md" -type f | sort -r | head -n 1)

  if [ -f "$JOURNAL" ]; then
    # Get the date from filename
    DATE=$(basename "$JOURNAL" .md)

    # Determine if this is today's or a past journal
    if [ "$(date +%Y-%m-%d)" = "$DATE" ]; then
      HEADER="Today's Journal Entry"
    elif [ "$(date -d yesterday +%Y-%m-%d)" = "$DATE" ]; then
      HEADER="Yesterday's Journal Entry"
    else
      HEADER="Journal Entry from $DATE"
    fi

    echo "## $HEADER"
    echo

    # Output journal content
    cat "$JOURNAL"
    echo
  else
    echo "No journal entries found."
    echo
  fi
else
  echo "Journal folder not found, skipping journal section."
  echo
fi

########## MEMORY SECTION ##########

# Check if skogcli is available (for MCP memory integration)
if command -v skogcli &>/dev/null; then
  echo "# Recent Memories"
  echo

  # Try to retrieve recent memories from MCP memory system
  if [ -z "$MEMORIES_TAG" ]; then
    # If no tag specified, retrieve most recent memories
    if skogcli memory list --page-size=$MEMORIES_TO_SHOW &>/dev/null; then
      echo "## Recent Important Information"
      echo
      skogcli memory list --page-size=$MEMORIES_TO_SHOW
      echo
    else
      echo "No recent memories found or MCP memory system unavailable."
      echo
    fi
  else
    # If tag specified, retrieve memories with that tag
    if skogcli memory search "$MEMORIES_TAG" --page-size=$MEMORIES_TO_SHOW &>/dev/null; then
      echo "## Recent Memories Tagged with '$MEMORIES_TAG'"
      echo
      skogcli memory search "$MEMORIES_TAG" --page-size=$MEMORIES_TO_SHOW
      echo
    else
      echo "No memories with tag '$MEMORIES_TAG' found or MCP memory system unavailable."
      echo
    fi
  fi
else
  echo "MCP memory system not available, skipping memory section."
  echo
fi

########## KNOWLEDGE BASE SECTION ##########

# Check for knowledge base entries we want to include
if [ -d knowledge ]; then
  echo "# Key Knowledge Base Entries"
  echo

  # List of important knowledge base files to include
  KNOWLEDGE_FILES=(
    "knowledge/agent-roles.md"
    "knowledge/skogai-overview.md"
    "knowledge/dots-roleplay-system.md"
  )

  # Output content of each file if it exists
  for file in "${KNOWLEDGE_FILES[@]}"; do
    if [ -f "$file" ]; then
      FILENAME=$(basename "$file")
      echo "## $FILENAME"
      echo
      cat "$file"
      echo
    fi
  done
else
  echo "Knowledge base not found, skipping knowledge section."
  echo
fi

########## WORKSPACE STATUS SECTION ##########

echo "# Workspace Status"
echo

# Add Git Status
echo "## Git Status"
echo
echo '```git'
git status -s
echo '```'
echo

# Add MCP server status if available
if [ -f "./Claude/check_local_service.sh" ]; then
  echo "## MCP Server Status"
  echo
  echo '```'
  ./Claude/check_local_service.sh || echo "MCP server not running"
  echo '```'
  echo
fi

# Add workspace structure (limited to key directories)
echo "## Workspace Structure"
echo

# Get tree structure for key directories
echo '```tree'
LANG=C tree -L 1 --dirsfirst --noreport .
if [ -d "tasks" ]; then
  LANG=C tree -L 1 --dirsfirst --noreport ./tasks
fi
if [ -d "journal" ]; then
  LANG=C tree -L 1 --dirsfirst --noreport ./journal
fi
if [ -d "knowledge" ]; then
  LANG=C tree -L 1 --dirsfirst --noreport ./knowledge
fi
if [ -d "people" ]; then
  LANG=C tree -L 1 --dirsfirst --noreport ./people
fi
echo '```'
echo

########## CONTEXT STATS SECTION ##########

echo "# Context Information"
echo

# Calculate approximate token usage for this context
TOTAL_CHARS=$(wc -c <$0)
ESTIMATED_TOKENS=$((TOTAL_CHARS / 4))

echo "- Context Generated: $(date)"
echo "- Estimated Token Usage: ~$ESTIMATED_TOKENS tokens"
echo "- MCP Integration: $(if command -v skogcli &>/dev/null; then echo "Active"; else echo "Inactive"; fi)"
echo "- System Type: SkogAI with Claude 3 Integration"
echo
echo "---"
echo
cat ./tmp/previous-conversation.md 2>/dev/null || echo "No previous conversation found."
echo
echo
echo "Context generated using the enhanced context-claude-enhanced.sh script"
