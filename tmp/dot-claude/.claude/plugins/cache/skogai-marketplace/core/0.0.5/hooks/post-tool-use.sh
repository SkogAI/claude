#!/usr/bin/env bash
# PostToolUse hook - runs after tool calls complete
#
# Source: plugins/claude-docs/references/hooks.md
#
# Input JSON structure:
# {
#   "session_id": "abc123",
#   "transcript_path": "/Users/.../.claude/projects/.../00893aaf-19fa-41d2-8238-13269b9b3ca0.jsonl",
#   "cwd": "/Users/...",
#   "permission_mode": "default",
#   "hook_event_name": "PostToolUse",
#   "tool_name": "Write",  # Tool that was executed
#   "tool_input": {
#     "file_path": "/path/to/file.txt",
#     "content": "file content"
#   },
#   "tool_response": {
#     "filePath": "/path/to/file.txt",
#     "success": true
#   },
#   "tool_use_id": "toolu_01ABC123..."
# }
#
# Output JSON structure (optional):
# {
#   "decision": "block" | undefined,  # "block" prompts Claude with reason
#   "reason": "string",  # Explanation for decision
#   "hookSpecificOutput": {
#     "hookEventName": "PostToolUse",
#     "additionalContext": "string"  # Additional information for Claude
#   }
# }
#
# Exit codes:
# - 0: Success. JSON output parsed for hookSpecificOutput
# - 2: Shows stderr to Claude (tool already ran)
# - Other: Non-blocking error, stderr shown to user in verbose mode

input=$(cat)
session_id=$(echo "$input" | jq -r '.session_id')
tool_name=$(echo "$input" | jq -r '.tool_name')
log_file="/tmp/${session_id}-post-tool-use-${tool_name}.json"
echo "$input" > "$log_file"

exit 0
