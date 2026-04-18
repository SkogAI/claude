#!/bin/bash

# Output Claude's guidelines and preferences for the context
# Usage: ./scripts/context/context-claude.sh

set -e  # Exit on error

# Force UTF-8 encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Check if CLAUDE.md exists
if [ ! -f "CLAUDE.md" ]; then
    echo "CLAUDE.md not found, skipping section."
    exit 0
fi

# Add Claude section header
echo "# Claude's Guidelines and Preferences"
echo

# Output Claude.md content
echo "\`\`\`CLAUDE.md"
cat "CLAUDE.md"
echo "\`\`\`"
echo

# Add SkogAI specific information
echo "# SkogAI Integration Notes"
echo "- Claude is fully integrated with the SkogAI ecosystem"
echo "- Uses SkogAI MCP protocols for cross-agent communication"
echo "- Follows SkogAI documentation standards"
echo "- Leverages SkogAI tools for enhanced capabilities"
