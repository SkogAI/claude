#!/usr/bin/env bash
# Notification hook - runs when Claude Code sends notifications
#
# Source: plugins/claude-docs/references/hooks.md
#
# Input JSON structure:
# {
#   "session_id": "abc123",
#   "transcript_path": "/Users/.../.claude/projects/.../00893aaf-19fa-41d2-8238-13269b9b3ca0.jsonl",
#   "cwd": "/Users/...",
#   "permission_mode": "default",
#   "hook_event_name": "Notification",
#   "message": "Claude needs your permission to use Bash",
#   "notification_type": "permission_prompt"  # or "idle_prompt", "auth_success", "elicitation_dialog"
# }
#
# Output: Notification hooks don't support hookSpecificOutput.
# Only stderr logging is available (shown in debug mode).
#
# Exit codes:
# - 0: Success
# - 2: N/A (Notification cannot block), shows stderr to user only
# - Other: Non-blocking error, stderr shown to user in verbose mode

input=$(cat)
session_id=$(echo "$input" | jq -r '.session_id')
notification_type=$(echo "$input" | jq -r '.notification_type')
log_file="/tmp/${session_id}-notification-${notification_type}.json"
echo "$input" > "$log_file"

exit 0
