MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/marketplace <marketplace@noreply.github.com>
Date: Sun, 22 Mar 2026 22:29:09 -0700
Subject: Re: [SkogAI/marketplace] feat(core): add skogai-jq library and simplify simple hooks (PR #71)
Message-ID: <SkogAI/marketplace/pull/71/review/3989424684@github.com>
In-Reply-To: <SkogAI/marketplace/pull/71@github.com>
References: <SkogAI/marketplace/pull/71@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69c0cfa566887_cf111831501fa"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR introduces a shared Bash library for Claude Code hook scripts to centralize JSON input parsing, common field extraction, and structured debug logging, then refactors multiple “simple” hook scripts to source and use it instead of duplicating boilerplate.

**Changes:**
- Added `plugins/core/scripts/skogai-jq.sh` to standardize hook stdin parsing, field extraction, and JSON-formatted outputs/logging helpers.
- Refactored multiple hook scripts to source the shared library and replace repeated `cat|jq|echo >> /tmp/...` boilerplate with `skogai_jq_field` + `skogai_jq_log`.
- Normalized/shortened hook header comments to a compact “Input/Output/Exit” format.

### Reviewed changes

Copilot reviewed 14 out of 14 changed files in this pull request and generated 4 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| plugins/core/scripts/skogai-jq.sh | New shared library for parsing hook JSON, extracting fields, and writing structured logs / emitting hook outputs |
| plugins/core/hooks/worktree-remove.sh | Simplified to source shared library and log worktree removal context |
| plugins/core/hooks/worktree-create.sh | Simplified to source shared library and log worktree creation context |
| plugins/core/hooks/teammate-idle.sh | Simplified to source shared library and log teammate idling context |
| plugins/core/hooks/task-completed.sh | Simplified to source shared library and log task completion context |
| plugins/core/hooks/subagent-stop.sh | Simplified to source shared library and log stop-hook state |
| plugins/core/hooks/subagent-start.sh | Simplified to source shared library and log subagent type |
| plugins/core/hooks/session-end.sh | Simplified to source shared library and log session end reason |
| plugins/core/hooks/pre-compact.sh | Simplified to source shared library and log compact trigger |
| plugins/core/hooks/post-tool-use.sh | Simplified to source shared library and log tool completion |
| plugins/core/hooks/post-tool-use-failure.sh | Simplified to source shared library and log tool failure |
| plugins/core/hooks/permission-request.sh | Simplified to source shared library and log permission request context |
| plugins/core/hooks/notification.sh | Simplified to source shared library and log notification type |
| plugins/core/hooks/config-change.sh | Simplified to source shared library and log config changes |
</details>






---

💡 <a href="/SkogAI/marketplace/new/master?filename=.github/instructions/*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +# --- Field extraction ---
+# Usage: val=$(skogai_jq_field ".tool_name" "default_value")
+skogai_jq_field() {
+  local path="$1"
+  local default="${2:-}"
+  if [[ -n "$default" ]]; then
+    echo "$HOOK_INPUT" | jq -r "${path} // \"${default}\""
+  else
+    echo "$HOOK_INPUT" | jq -r "${path} // empty"
+  fi
+}
+
+# --- Structured debug logging ---
+# Appends a JSONL entry: {ts, event, session_id, summary, input}
+# Usage: skogai_jq_log "Logged session end, reason: exit"
+skogai_jq_log() {
+  local summary="${1:-}"
+  jq -n \
+    --arg ts "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
+    --arg event "$HOOK_EVENT" \
+    --arg sid "$HOOK_SESSION_ID" \
+    --arg summary "$summary" \
+    --argjson input "$HOOK_INPUT" \
+    '{ts: $ts, event: $event, session_id: $sid, summary: $summary, input: $input}' \
+    >> "$HOOK_LOG"
+}

This new shared library is now on the execution path for many hooks, but there are no tests validating its core behaviors (field extraction defaults, log entry shape/JSONL single-line formatting, and resilience to malformed input). The repo already uses bats to test hook scripts; adding a focused bats test suite for `skogai-jq.sh` would help prevent regressions as more hooks migrate to it.

> +#   SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
+#   source "$SCRIPT_DIR/../scripts/skogai-jq.sh"
+#
+# After sourcing, these are available:
+#   $HOOK_INPUT       — raw JSON from stdin
+#   $HOOK_SESSION_ID  — extracted session_id
+#   $HOOK_EVENT       — extracted hook_event_name
+#   $HOOK_LOG         — log file path (/tmp/${session_id}.jsonl)
+#
+# Functions:
+#   skogai_jq_field ".path" ["default"]  — extract field from input
+#   skogai_jq_log "summary"             — append structured JSONL debug entry
+#   skogai_jq_context "event" "text"    — output hookSpecificOutput JSON
+#   skogai_jq_decision "decision" "reason" — output decision JSON
+
+set -euo pipefail

`set -euo pipefail` is executed when this file is sourced, which changes error-handling semantics for every hook that sources it. Several hooks in this PR state “Exit: 0 always”, but with `-e` enabled any `jq`/I/O error inside the library can cause an early non-zero exit, potentially changing hook behavior. Consider removing strict-mode changes from the library (let each hook opt in), or explicitly restoring the previous settings in hooks that must never fail (e.g., `set +e` / guarding `jq` calls).
```suggestion

```

> +  jq -n \
+    --arg ts "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
+    --arg event "$HOOK_EVENT" \
+    --arg sid "$HOOK_SESSION_ID" \
+    --arg summary "$summary" \
+    --argjson input "$HOOK_INPUT" \
+    '{ts: $ts, event: $event, session_id: $sid, summary: $summary, input: $input}' \

`skogai_jq_log` is intended to write JSONL, but `jq -n` without `-c` will pretty-print objects across multiple lines, breaking JSONL semantics. Also, `--argjson input "$HOOK_INPUT"` passes the entire input JSON as a command-line argument, which can fail for large hook payloads (e.g., tool inputs with file contents) due to OS argument size limits. Prefer reading the hook JSON from stdin (e.g., `jq -c ... <<<"$HOOK_INPUT"` and use `. as $input | {…}`) so each log entry is guaranteed single-line and avoids ARG_MAX issues.
```suggestion
  echo "$HOOK_INPUT" | jq -c \
    --arg ts "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
    --arg event "$HOOK_EVENT" \
    --arg sid "$HOOK_SESSION_ID" \
    --arg summary "$summary" \
    '. as $input | {ts: $ts, event: $event, session_id: $sid, summary: $summary, input: $input}' \
```

> +  if [[ -n "$default" ]]; then
+    echo "$HOOK_INPUT" | jq -r "${path} // \"${default}\""
+  else
+    echo "$HOOK_INPUT" | jq -r "${path} // empty"
+  fi

`skogai_jq_field` builds the jq program by interpolating the default value directly into the filter string. If the default contains quotes/backslashes/newlines, this can produce invalid jq or unexpected results. Additionally, using `echo "$HOOK_INPUT"` can mangle certain inputs (e.g., leading `-n`, escape sequences); `printf '%s'` or a here-string is safer. Suggest passing defaults via `jq --arg default "$default"` and feeding input via stdin without `echo`.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/marketplace/pull/71#pullrequestreview-3989424684
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/marketplace/pull/71/review/3989424684@github.com>