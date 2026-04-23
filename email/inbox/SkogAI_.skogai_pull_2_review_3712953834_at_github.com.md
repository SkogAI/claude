MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.skogai" <.skogai@noreply.github.com>
Date: Tue, 27 Jan 2026 11:01:07 -0800
Subject: Re: [SkogAI/.skogai] refactor: Organize scripts/ into subdirectories (PR #2)
Message-ID: <SkogAI/.skogai/pull/2/review/3712953834@github.com>
In-Reply-To: <SkogAI/.skogai/pull/2@github.com>
References: <SkogAI/.skogai/pull/2@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69790b731da94_fa111822525e"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR reorganizes the `scripts/` directory into clearer subdirectories, updates internal and documentation references to match the new layout, and introduces some new tooling (queue management via `Argcfile.sh` and a `state-status` reporting script).

**Changes:**
- Move context-generation scripts into `scripts/context/` and update all usage/docs (`context.sh`, enhanced Claude context, new small context helpers).
- Move generic utility tools into `scripts/utils/` and fix their usage examples; add a new `state-status.py` utility.
- Introduce a bootstrap subdirectory (`scripts/bootstrap/`) and wire docs and scripts to the new bootstrap path.
- Add `Argcfile.sh` defining an `argc`-driven CLI for managing a local operations queue.

### Reviewed changes

Copilot reviewed 24 out of 36 changed files in this pull request and generated 4 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| tools/.gitkeep | Placeholder to ensure `tools/` is tracked; no functional impact. |
| scripts/utils/wordcount.py | Updates usage example to reflect new `scripts/utils/` path. |
| scripts/utils/state-status.py | Adds a new `uv`-runnable CLI to inspect and summarize task/tweet/email “state” directories with rich-formatted output. |
| scripts/utils/search.sh | Fixes usage comment to the new `scripts/utils/search.sh` path. |
| scripts/utils/search.py | Fixes docstring usage to the new `scripts/utils/search.py` path. |
| scripts/utils/migrate-journals.py | Updates usage examples to the new `scripts/utils/migrate-journals.py` path (including the “to execute migration” hint). |
| scripts/github/README.md | Updates integration instructions to call `scripts/context/context.sh` instead of the old top-level `scripts/context.sh`. |
| scripts/context/context.sh | Adjusts usage comment to the new location; continues to orchestrate context generation from component scripts. |
| scripts/context/context-workspace.sh | Updates usage comment to match its new subdirectory. |
| scripts/context/context-todo.sh | Updates usage comment to match its new subdirectory. |
| scripts/context/context-start.sh | New helper that prints a structured “Claude context setup” header with timestamp. |
| scripts/context/context-regular-git-diff.sh | New helper that prints a “Working Directory Changes” heading followed by `git diff`. |
| scripts/context/context-persona.sh | Empty placeholder file for future persona context support, referenced in the README. |
| scripts/context/context-path.sh | Updates usage comment to reflect its placement under `scripts/context/`. |
| scripts/context/context-model.sh | Updates usage comment to reflect its placement under `scripts/context/`. |
| scripts/context/context-message.sh | Updates usage comment to reflect its placement under `scripts/context/`. |
| scripts/context/context-memory.sh | Updates usage comment to reflect its placement under `scripts/context/`. |
| scripts/context/context-journal.sh | Updates usage comment to reflect its placement under `scripts/context/`. |
| scripts/context/context-interaction.sh | Updates usage comment to reflect its placement under `scripts/context/`. |
| scripts/context/context-git.sh | Updates usage comment to reflect its placement under `scripts/context/`; main git-context logic unchanged. |
| scripts/context/context-git-status.sh | New helper that prints git-flow branch lists (features/releases) for context. |
| scripts/context/context-git-status-verbose.sh | New helper that prints `git status` with a section header. |
| scripts/context/context-git-log.sh | New helper that prints a short recent `git log --oneline -3`. |
| scripts/context/context-git-diff.sh | New helper intended to print a “Git Flow Diff” via an external `scripts/git/git-diff.sh`. |
| scripts/context/context-env.sh | New helper intended to surface `state/claude.env` contents into context. |
| scripts/context/context-enhanced.sh | Enhanced orchestrator now resolves its own directory, makes `context-*.sh` executable in-place, and writes context to `tmp/context.md`, with an optional `--display` mode and token estimate. |
| scripts/context/context-end.sh | New helper that prints a closing Claude context marker. |
| scripts/context/context-claude.sh | Updates usage comment for the new path; continues to print Claude’s guidelines. |
| scripts/context/context-claude-enhanced.sh | Enhanced Claude-specific context builder that aggregates project, state, knowledge, and workspace details. |
| scripts/bootstrap/consumer-init.sh | Updates the bootstrap invocation to `./scripts/bootstrap/bootstrap.sh` inside the `.skogai` submodule. |
| scripts/bootstrap/bootstrap.sh | New bootstrap script that symlinks key paths into the consumer repo and configures the `.skogai` submodule branch. |
| scripts/README.md | Rewritten to describe the new `scripts/context/`, `scripts/utils/`, and `scripts/bootstrap/` structure and updated usage examples. |
| memory/context/current.md | Updates the example bootstrap invocation to the new `scripts/bootstrap/bootstrap.sh` path. |
| SKOGAI.md | Updates the bootstrap command example to `./scripts/bootstrap/bootstrap.sh`. |
| Argcfile.sh | New `argc` command file defining a queue-management CLI for operations (init, run, add, list, status, clear, retry, etc.). |
| .envrc | Updates the commented bootstrap hint to `.skogai/scripts/bootstrap/bootstrap.sh`. |
</details>






---

💡 <a href="/SkogAI/.skogai/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +# @cmd creates queue directory and empty queue.json if missing
+# ensures ~/.cache/skogai/queue.json exists with {"operations": []}
+
+init() {
+  mkdir -p "$QUEUE_DIR"
+  cat >"$QUEUE_DIR/$QUEUE_FILE" <<'EOF'
+{
+  "operations": [
+    {
+      "id": "abc123def4567890",
+      "command": "echo hello world",
+      "status": "pending",
+      "attempts": 0,
+      "max_attempts": 5,
+      "created_at": "2025-12-22T10:00:00+01:00",
+      "last_error": null
+    },
+    {
+      "id": "def456abc7890123",
+      "command": "sleep 2 && echo done",
+      "status": "completed",
+      "attempts": 1,
+      "max_attempts": 5,
+      "created_at": "2025-12-22T09:30:00+01:00",
+      "completed_at": "2025-12-22T09:30:05+01:00",
+      "last_error": null
+    },
+    {
+      "id": "ghi789jkl0123456",
+      "command": "false",
+      "status": "failed",
+      "attempts": 5,
+      "max_attempts": 5,
+      "created_at": "2025-12-22T09:00:00+01:00",
+      "failed_at": "2025-12-22T09:15:00+01:00",
+      "last_error": "exit code 1"
+    },
+    {
+      "id": "jkl012mno3456789",
+      "command": "ls -la /tmp",
+      "status": "running",
+      "attempts": 1,
+      "max_attempts": 5,
+      "created_at": "2025-12-22T10:05:00+01:00",
+      "last_error": null
+    }
+  ]
+}

The `init` command's documentation says it "creates queue directory and empty queue.json" and that the file will contain `{"operations": []}`, but the implementation actually seeds `queue.json` with four sample operations. This mismatch can be confusing for users and tools consuming the queue; consider either updating the comment to describe the seeded sample data or changing the JSON template to match the documented empty-operations structure.

> @@ -0,0 +1,254 @@
+#!/usr/bin/env bash
+
+set -e
+
+# @env QUEUE_DIR=/home/skogix/.cache/skogai-queue/

`QUEUE_DIR` is hard-coded to `/home/skogix/.cache/skogai-queue/`, which bakes a specific username and absolute path into the CLI defaults and will break for other users/machines. It would be more portable to base this default on `$HOME` (or another configurable root) so the queue can be used in different environments without editing the script.
```suggestion
# @env QUEUE_DIR=$HOME/.cache/skogai-queue/
```

> +      "status": "running",
+      "attempts": 1,
+      "max_attempts": 5,
+      "created_at": "2025-12-22T10:05:00+01:00",
+      "last_error": null
+    }
+  ]
+}
+EOF
+}
+
+# @cmd Run queue
+# @option --op-id[`_choice_operations`]
+# @option --arg args~ additional arguments to pass to queue run
+run() {
+  /home/skogix/.local/bin/queue run "${argc_op_id}" "${argc_args}"

In `run()`, additional arguments are passed to the underlying `queue` binary as `"${argc_args}"`, which collapses all extra args into a single space-separated string instead of preserving individual arguments. This will cause incorrect behavior when multiple `--arg` values or values containing spaces are provided; consider expanding the argc-generated array (e.g., using the `[@]` form) so each argument is forwarded correctly.
```suggestion
  /home/skogix/.local/bin/queue run "${argc_op_id}" "${argc_args[@]}"
```

> +
+# @cmd list-queue
+# @alias list
+# @alias ls
+# @option --filter[pending|running|completed|failed] status filter
+list-queue() {
+  if [[ "$argc_filter" == "all" ]]; then
+    jq '.operations[]' "$QUEUE_DIR/$QUEUE_FILE"
+  else
+    jq --arg f "$argc_filter" '.operations[] | select(.status == $f)' "$QUEUE_DIR/$QUEUE_FILE"
+  fi
+}
+
+_choice_status_with_all() {
+  echo "all"
+  cat "${_choice_status}"

`_choice_status_with_all()` currently calls `cat "${_choice_status}"`, which attempts to read from a file named by the value of `_choice_status` rather than invoking the `_choice_status` function. This will either fail or silently do nothing, breaking shell completion for the `--filter` option; you likely meant to execute `_choice_status` and print its output alongside `all`.
```suggestion
  _choice_status
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.skogai/pull/2#pullrequestreview-3712953834
You are receiving this because you authored the thread.

Message ID: <SkogAI/.skogai/pull/2/review/3712953834@github.com>