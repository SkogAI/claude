#!/usr/bin/env bash
set -euo pipefail

# Debug hook — logs event info to stderr and a log file
# Receives JSON via stdin with hook_event_name and other fields

input=$(cat)
event=$(echo "$input" | jq -r '.hook_event_name // "unknown"')
tool=$(echo "$input" | jq -r '.tool_name // empty')
timestamp=$(date '+%H:%M:%S')

logfile="${CLAUDE_PROJECT_DIR:-.}/.hook-debug.log"

if [ -n "$tool" ]; then
  line="[$timestamp] HOOK: $event (tool: $tool)"
else
  line="[$timestamp] HOOK: $event"
fi

echo "$line" >> "$logfile"
echo "$line" >&2
