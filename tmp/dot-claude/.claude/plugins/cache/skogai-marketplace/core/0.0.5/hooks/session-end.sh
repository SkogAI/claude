#!/usr/bin/env bash
# SessionEnd hook - runs when Claude Code session ends
#
# Source: plugins/claude-docs/references/hooks.md
#
# Input JSON structure:
# {
#   "session_id": "abc123",
#   "transcript_path": "~/.claude/projects/.../00893aaf-19fa-41d2-8238-13269b9b3ca0.jsonl",
#   "cwd": "/Users/...",
#   "permission_mode": "default",
#   "hook_event_name": "SessionEnd",
#   "reason": "exit"  # "clear" | "logout" | "prompt_input_exit" | "other"
# }
#
# Output: SessionEnd hooks cannot block session termination. No hookSpecificOutput support.
# Only stderr logging is available (shown in debug mode).
#
# Exit codes:
# - 0: Success
# - 2: N/A (SessionEnd cannot block)
# - Other: Non-blocking error, stderr shown to user in verbose mode

input=$(cat)
session_id=$(echo "$input" | jq -r '.session_id')
log_file="/tmp/${session_id}-session-end.json"
echo "$input" > "$log_file"

exit 0
