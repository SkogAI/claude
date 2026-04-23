MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/claude <claude@noreply.github.com>
Date: Mon, 02 Mar 2026 15:44:24 -0800
Subject: Re: [SkogAI/claude] Make Claude Code settings and env vars explicit (PR #25)
Message-ID: <SkogAI/claude/pull/25/review/3879399441@github.com>
In-Reply-To: <SkogAI/claude/pull/25@github.com>
References: <SkogAI/claude/pull/25@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a620d88dd80_1351110269779"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR makes Claude Code configuration more explicit by expanding `.claude/settings.json` with documented settings/env defaults, adjusting local environment loading, and adding a helper launch script under `.skogai/` to run `claude` with a consistent configuration.

**Changes:**
- Add `.skogai/run.sh` to export Claude Code-related env vars and invoke `claude` with a standardized set of flags.
- Expand `.claude/settings.json` with explicit settings defaults, env vars, permissions structure, and sandbox/hooks blocks.
- Comment out `CLAUDE_CODE_SIMPLE` in `.envrc`.

### Reviewed changes

Copilot reviewed 3 out of 3 changed files in this pull request and generated 8 comments.

| File | Description |
| ---- | ----------- |
| `.skogai/run.sh` | New launch script that sets env vars and runs `claude` with explicit flags/settings. |
| `.envrc` | Stops exporting `CLAUDE_CODE_SIMPLE` by default (now commented). |
| `.claude/settings.json` | Makes many Claude Code settings/env vars explicit; extends permissions and adds sandbox/hooks sections. |





---

💡 <a href="/SkogAI/claude/new/master?filename=.github/instructions/*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +# Paths
+export CLAUDE_CONFIG_DIR="/home/skogix/.claude"
+# export CLAUDE_CODE_TMPDIR=""              # override /tmp for internal temp files

`CLAUDE_CONFIG_DIR` is exported as `/home/skogix/.claude`, which will break on other machines and duplicates the same value set in `.claude/settings.json`. Prefer using `~/.claude` / `$HOME/.claude`, or omit it from the script and let the settings file (or user environment) control it.

> +  "spinnerVerbs": {
+    "mode": "append",
+    "verbs": []
+  },
+

`spinnerVerbs.verbs` is an empty array, but the repo’s Claude Code settings schema requires `spinnerVerbs.verbs` to have at least 1 item. As written, this can make the settings file invalid and fail to load. Either remove `spinnerVerbs` entirely (to use defaults) or provide at least one verb.
```suggestion

```

> +  "prefersReducedMotion": true,
+  "showTurnDuration": true,
+  "spinnerTipsEnabled": true,
+  "terminalProgressBarEnabled": false,
+  "alwaysThinkingEnabled": false,

These values don’t match the documented defaults in the schema example bundled in this repo: `prefersReducedMotion` defaults to `false` and `terminalProgressBarEnabled` defaults to `true`. If the goal is to make defaults explicit without behavior changes, update these to match the schema defaults (or omit them).

>    "env": {
-    "CLAUDE_CONFIG_DIR": "/home/skogix/.claude"
+    "CLAUDE_CONFIG_DIR": "/home/skogix/.claude",

`CLAUDE_CONFIG_DIR` is set to a user-specific absolute path (`/home/skogix/.claude`). This makes the project settings file non-portable and will break for any other username/OS. Prefer `~/.claude` (if tilde expansion is supported here) or avoid setting this in the project settings and leave it to user-level config.
```suggestion
    "CLAUDE_CONFIG_DIR": "~/.claude",
```

> @@ -0,0 +1,100 @@
+#!/usr/bin/env bash
+
+cd /home/skogix/skogai || exit

This `cd` to an absolute path hard-codes a single machine/user layout, so the script won’t work when run from other clones/hosts. Prefer changing to the repo root relative to the script location (e.g., resolving the directory of the script) and/or allowing an override via an env var.
```suggestion
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="${SKOGAI_REPO_ROOT:-${SCRIPT_DIR%/.skogai}}"
cd "$REPO_ROOT" || exit
```

> +# UI
+# export IS_DEMO=""                         # set true to hide email/org, skip onboarding
+# export CLAUDE_CODE_HIDE_ACCOUNT_INFO=""   # set 1 to hide email/org
+# export USE_BUILTIN_RIPGREP=""             # set 0 to use system rg
+
+# Plugins
+# export FORCE_AUTOUPDATE_PLUGINS=""        # set true to force plugin updates
+# export CLAUDE_CODE_PLUGIN_GIT_TIMEOUT_MS="120000"
+
+# --- claude invocation ---
+# --resume="claude-code-settings-and-envs" \
+# --system-prompt="" \
+claude \
+  --worktree="claude-code-settings-and-envs" \
+  --setting-sources="project" \
+  --settings="/home/skogix/.claude/settings.json" \

`--setting-sources="project"` suggests you intend to load the repo’s `.claude/settings.json`, but `--settings` points at a user-level file in `/home/skogix/.claude/settings.json`. This makes the launch script ignore the project settings changes in this PR. Point `--settings` at the repo’s `.claude/settings.json` (or drop `--settings` if `--setting-sources=project` already picks it up).
```suggestion

```

> +  --disallowed-tools="NotebookEdit Computer WebSearch WebFetch" \
+  --append-system-prompt='[$claude]hi claude![$/claude]' \
+  --add-dir="/home/skogix/skogai" \

`--append-system-prompt` hard-codes an extra “hi claude!” system instruction into every run, which is not a documented default and will change behavior (contradicting the stated goal of matching previous implicit behavior). Consider removing this from the default script (or leaving it commented with an explanation of when to enable).

> +  --settings="/home/skogix/.claude/settings.json" \
+  --plugin-dir="/home/skogix/.local/src/marketplace" \
+  --permission-mode="plan" \
+  --mcp-config="/home/skogix/skogai/config/mcp.json" \
+  --effort="high" \

Several flags are hard-coded to `/home/skogix/...` paths (`--settings`, `--plugin-dir`, `--mcp-config`, `--add-dir`). This makes the script machine-specific and difficult for others to run. Prefer deriving these from `$HOME` and the repo root (or allowing overrides via env vars).

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/claude/pull/25#pullrequestreview-3879399441
You are receiving this because you authored the thread.

Message ID: <SkogAI/claude/pull/25/review/3879399441@github.com>