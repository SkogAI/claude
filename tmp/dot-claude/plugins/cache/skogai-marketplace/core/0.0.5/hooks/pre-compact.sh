#!/usr/bin/env bash
# PreCompact hook - runs before Claude Code compacts (summarizes) conversation
#
# Source: plugins/claude-docs/references/hooks.md
#
# Input JSON structure:
# {
#   "session_id": "abc123",
#   "transcript_path": "~/.claude/projects/.../00893aaf-19fa-41d2-8238-13269b9b3ca0.jsonl",
#   "permission_mode": "default",
#   "hook_event_name": "PreCompact",
#   "trigger": "manual",  # "manual" (via /compact) or "auto" (automatic)
#   "custom_instructions": ""  # User's instructions from /compact, empty for auto
# }
#
# Output: PreCompact hooks don't support hookSpecificOutput and cannot block compaction.
# Only stderr logging is available (shown in debug mode).
#
# Use case: Save full transcript, backup, archive pre-compact state.
#
# Exit codes:
# - 0: Success
# - 2: N/A (PreCompact cannot block), shows stderr to user only
# - Other: Non-blocking error, stderr shown to user in verbose mode

input=$(cat)
session_id=$(echo "$input" | jq -r '.session_id')
trigger=$(echo "$input" | jq -r '.trigger')
log_file="/tmp/${session_id}-pre-compact-${trigger}.json"
echo "$input" > "$log_file"

exit 0
