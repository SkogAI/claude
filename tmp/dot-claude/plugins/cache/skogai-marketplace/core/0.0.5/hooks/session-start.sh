#!/usr/bin/env bash
set -euo pipefail

# SessionStart hook - runs when Claude Code starts a new session or resumes
#
# Source: plugins/claude-docs/references/hooks.md
#
# Input JSON structure:
# {
#   "session_id": "abc123",
#   "transcript_path": "~/.claude/projects/.../00893aaf-19fa-41d2-8238-13269b9b3ca0.jsonl",
#   "permission_mode": "default",
#   "hook_event_name": "SessionStart",
#   "source": "startup"
# }
#
# Output JSON structure (optional):
# {
#   "hookSpecificOutput": {
#     "hookEventName": "SessionStart",
#     "additionalContext": "string"  # Added to context at session start
#   }
# }
#
# Exit codes:
# - 0: Success. JSON output in stdout is parsed for hookSpecificOutput
# - 2: N/A (SessionStart cannot block)
# - Other: Non-blocking error, stderr shown to user in verbose mode

input=$(cat)
session_id=$(echo "$input" | jq -r '.session_id')
log_file="/tmp/${session_id}-session-start.json"
echo "$input" > "$log_file"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Inject always_apply lessons as session-start guardrails
lesson_context=$(python3 "$SCRIPT_DIR/lesson_matcher.py" --mode session-start 2>/dev/null || true)

if [[ -n "$lesson_context" ]]; then
  jq -n \
    --arg context "$lesson_context" \
    '{
      "hookSpecificOutput": {
        "hookEventName": "SessionStart",
        "additionalContext": $context
      }
    }'
fi

exit 0
