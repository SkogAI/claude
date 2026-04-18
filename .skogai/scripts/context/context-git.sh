#!/bin/bash

# context-git.sh - Script to include git information in context
# Usage: ./scripts/context/context-git.sh [mode]
# Modes:
#   recent  - Show diff between HEAD and previous commit (HEAD^ HEAD)
#   stats   - Show diff statistics summary
#   full    - Show full diff with more details
#   conflict - Show diffs for conflicted files (if any)

set -e  # Exit on error

# Function to show help for this script
show_git_help() {
  echo "# Git Diff Usage Information"
  echo
  echo "Usage: context-git.sh <mode>"
  echo
  echo "Available modes:"
  echo "  recent   - Show diff between HEAD and previous commit"
  echo "  stats    - Show diff statistics summary"
  echo "  full     - Show full diff with more details"
  echo "  conflict - Show diffs for conflicted files (if any)"
  echo
  echo "Examples:"
  echo "  context-git.sh recent    # Show changes in most recent commit"
  echo "  context-git.sh stats     # Show statistics about changed files"
  echo "  context-git.sh full      # Show detailed diff with full index info"
  echo "  context-git.sh conflict  # Show information about merge conflicts"
  echo
  echo "Use with run.sh:"
  echo "  ./run.sh --diff recent"
  echo "  ./run.sh --diff stats"
}

# Check if a mode was specified
if [ -z "$1" ]; then
  show_git_help
  exit 0
fi

# Default mode if not specified
MODE="$1"

echo "# Git Repository Information"
echo

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "Not a git repository. No git information available."
  echo
  exit 0
fi

# Get repository information
REPO_NAME=$(basename -s .git `git config --get remote.origin.url 2>/dev/null` || basename `git rev-parse --show-toplevel`)
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "detached HEAD")

echo "## Repository: $REPO_NAME ($BRANCH branch)"
echo

# Show git status if available
echo "## Git Status"
echo
echo '```git'
git status --short
echo '```'
echo

# Handle different modes
case $MODE in
  "recent")
    echo "## Recent Changes (last commit)"
    echo
    # Check if we have at least one commit
    if git rev-parse HEAD^ > /dev/null 2>&1; then
      echo '```diff'
      git diff HEAD^ HEAD
      echo '```'
    else
      echo "No previous commits found."
    fi
    ;;

  "stats")
    echo "## Diff Statistics"
    echo
    # Check if we have at least one commit
    if git rev-parse HEAD > /dev/null 2>&1; then
      echo '```'
      git diff --stat
      echo '```'
    else
      echo "No commits found."
    fi
    ;;

  "full")
    echo "## Full Diff (detailed)"
    echo
    # Check if we have at least one commit
    if git rev-parse HEAD^ > /dev/null 2>&1; then
      echo '```diff'
      git diff HEAD^ HEAD --full-index
      echo '```'
    else
      echo "No previous commits found."
    fi
    ;;

  "conflict")
    echo "## Merge Conflicts"
    echo
    # Check for conflict markers in git status
    CONFLICT_FILES=$(git status --short | grep '^UU' | cut -c4-)

    if [ -n "$CONFLICT_FILES" ]; then
      echo "The following files have conflicts:"
      echo
      echo '```'
      echo "$CONFLICT_FILES"
      echo '```'
      echo

      echo "## Conflict Diffs"
      echo

      for file in $CONFLICT_FILES; do
        echo "### $file"
        echo
        echo '```diff'
        git diff -- "$file"
        echo '```'
        echo
      done
    else
      echo "No merge conflicts found."
    fi
    ;;

  *)
    echo "## Git Diff"
    echo
    echo "Unknown mode: $MODE"
    echo "Available modes: recent, stats, full, conflict"
    echo
    show_git_help
    ;;
esac

echo
echo "---"
echo "Git information generated on $(date)"
