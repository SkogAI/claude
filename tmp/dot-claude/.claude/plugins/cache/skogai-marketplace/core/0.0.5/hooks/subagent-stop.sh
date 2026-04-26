#!/usr/bin/env bash
# SubagentStop hook - runs when subagent tasks complete
#
# Source: plugins/claude-docs/references/hooks.md
#
# Input JSON structure:
# {
#   "session_id": "abc123",
#   "transcript_path": "~/.claude/projects/.../00893aaf-19fa-41d2-8238-13269b9b3ca0.jsonl",
#   "permission_mode": "default",
#   "hook_event_name": "SubagentStop",
#   "stop_hook_active": true  # True when subagent is continuing due to stop hook
# }
#
# Note: Check stop_hook_active to prevent infinite loops. When true, the subagent
# is already continuing as a result of a stop hook.
#
# Output JSON structure (optional):
# {
#   "decision": "block" | undefined,  # "block" prevents subagent from stopping
#   "reason": "string"  # Must be provided when blocking - tells subagent how to proceed
# }
#
# Exit codes:
# - 0: Success. JSON output parsed for decision control
# - 2: Blocks stoppage, shows stderr to Claude subagent
# - Other: Non-blocking error, stderr shown to user in verbose mode

input=$(cat)
session_id=$(echo "$input" | jq -r '.session_id')
log_file="/tmp/${session_id}-subagent-stop.json"
echo "$input" > "$log_file"

exit 0
