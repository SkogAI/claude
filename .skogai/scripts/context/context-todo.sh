#!/bin/bash

# context-todo.sh - Quick script to display current todo list in context format
# Usage: ./scripts/context/context-todo.sh [--limit N]

set -e  # Exit on error

# Default number of tasks to show
LIMIT=10

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --limit=*)
            LIMIT="${1#*=}"
            shift
            ;;
        *)
            echo "Unknown argument: $1" >&2
            echo "Usage: ./scripts/context-todo.sh [--limit=N]" >&2
            exit 1
            ;;
    esac
done

echo "# Current Todo List"
echo

# Try MCP Todo first
if command -v skogcli &> /dev/null; then
    if skogcli todo list --status=active --limit=$LIMIT &> /dev/null; then
        echo "## Active MCP Tasks"
        echo
        skogcli todo list --status=active --limit=$LIMIT
        echo

        # Get completed tasks too
        echo "## Recently Completed"
        echo
        skogcli todo list --status=completed --limit=3
        echo
    else
        # Fall back to legacy TASKS.md
        echo "## MCP Todo not available, falling back to legacy system"
        echo
    fi
fi

# Check for legacy TASKS.md
if [ -f "TASKS.md" ]; then
    echo "## Legacy Tasks"
    echo
    echo '```md'
    head -n 30 "TASKS.md"
    echo '```'
    echo
fi

# Check for Next Actions in latest journal
LATEST_JOURNAL=$(find journal -maxdepth 1 -name "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].md" -type f | sort -r | head -n 1)

if [ -f "$LATEST_JOURNAL" ]; then
    echo "## Next Actions (from latest journal)"
    echo
    echo '```md'
    grep -A 15 "^## Next Actions" "$LATEST_JOURNAL" | tail -n +2
    echo '```'
    echo
fi

# Show implementation journals for context on what's been completed
echo "## Recent Implementations"
echo
IMPLEMENTATION_JOURNALS=$(find journal -maxdepth 1 -name "*-implementation*.md" -type f | sort -r | head -n 3)
if [ -n "$IMPLEMENTATION_JOURNALS" ]; then
    for journal in $IMPLEMENTATION_JOURNALS; do
        JOURNAL_NAME=$(basename "$journal")
        TITLE=$(head -n 1 "$journal" | sed 's/^# //')
        echo "- [$TITLE](./$journal)"
    done
else
    echo "No recent implementation journals found."
fi
echo

echo "---"
echo "Generated on: $(date)"
