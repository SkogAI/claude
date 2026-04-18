#!/bin/bash

# search.sh - Search git-tracked files with context
# Usage: ./scripts/utils/search.sh <query> [context_lines]

set -e  # Exit on error

QUERY="$1"
CONTEXT=${2:-0}  # Default to 0 lines of context

if [ -z "$QUERY" ]; then
    echo "Usage: $0 <query> [context_lines]" >&2
    exit 1
fi

# For each matching file
git grep -l "$QUERY" | while read -r file; do
    # Get the matching line numbers
    line_nums=$(git grep -n "$QUERY" "$file" | cut -d: -f2)

    # For each match in the file
    while read -r line_num; do
        if [ -n "$line_num" ]; then
            start=$((line_num - CONTEXT))
            end=$((line_num + CONTEXT))
            [ $start -lt 1 ] && start=1

            # Determine if we need range or single line
            if [ $start -eq $end ]; then
                location="$file:$start"
            else
                location="$file:$start-$end"
            fi

            # Print as markdown codeblock
            echo "\`\`\`$location"
            sed -n "${start},${end}p" "$file"
            echo "\`\`\`"
            echo
        fi
    done <<< "$line_nums"
done
