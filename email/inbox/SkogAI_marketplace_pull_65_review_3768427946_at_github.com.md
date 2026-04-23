MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/marketplace <marketplace@noreply.github.com>
Date: Sat, 07 Feb 2026 15:25:58 -0800
Subject: Re: [SkogAI/marketplace] docs: Comprehensive CLAUDE.md rewrite with plugin system architecture (PR #65)
Message-ID: <SkogAI/marketplace/pull/65/review/3768427946@github.com>
In-Reply-To: <SkogAI/marketplace/pull/65@github.com>
References: <SkogAI/marketplace/pull/65@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6987ca064f0db_cd11381485277"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR rewrites `CLAUDE.md` to be the primary architectural/reference document for the `skogai-marketplace` Claude Code plugin marketplace, describing repository layout, configuration rules, hook lifecycle, and per-plugin specifications for the six plugins.

**Changes:**
- Reorganized and expanded documentation around repository structure, configuration principles, and argc/worktree workflows.
- Added a hook system overview (events, declaration example, output format) and development conventions.
- Added detailed per-plugin reference sections (purpose, source, contents, hooks/timeouts, architecture notes).





---

💡 <a href="/SkogAI/marketplace/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

>  
-### argc Commands (Preferred)
+`.config/wt.toml` defines lifecycle hooks for worktree operations:
+- `post-create = "argc install"` — runs after creating a new worktree

This section states worktree post-create runs `argc install`, but the root Argcfile.sh currently does not define an `install` command (only plugin::update and worktree::switch). As written, the worktree hook will fail; either implement an `install` command in Argcfile.sh or adjust the worktree trigger/docs to call an existing argc command.
```suggestion
- `post-create = "argc plugin update"` — runs after creating a new worktree
```

>  
-**Adding the marketplace** (use SSH):
-```bash
-claude plugin marketplace add git@github.com:SkogAI/marketplace.git
+| Hook | When | Can Block? |
+|------|------|------------|
+| `SessionStart` | Session begins | No |
+| `SessionEnd` | Session ends | No |
+| `UserPromptSubmit` | User sends a message | Yes |
+| `PreToolUse` | Before tool execution | Yes |
+| `PostToolUse` | After tool execution | No |
+| `PreCompact` | Before context compaction | No |
+| `Stop` | Session termination | No |
+| `SubagentStop` | Subagent termination | No |
+| `Notification` | Notification received | No |
+

The hook event table is incomplete relative to the bundled official hooks docs in `plugins/claude-docs/skills/references/` (e.g., PermissionRequest, PostToolUseFailure, SubagentStart are missing). If this table is intended as the authoritative reference, it should either list all supported events or explicitly state it’s a subset used by this marketplace.
```suggestion

_Note: This table lists only the hook events currently used by the skogai-marketplace plugins. For the full set of supported Claude hook events, refer to the official hook documentation in `plugins/claude-docs/skills/references/`._ 
```

> +Hooks are declared inline in `marketplace.json` and receive JSON via stdin. They output JSON via stdout.
 
-**Adding the marketplace** (use SSH):
-```bash
-claude plugin marketplace add git@github.com:SkogAI/marketplace.git
+| Hook | When | Can Block? |
+|------|------|------------|
+| `SessionStart` | Session begins | No |
+| `SessionEnd` | Session ends | No |
+| `UserPromptSubmit` | User sends a message | Yes |
+| `PreToolUse` | Before tool execution | Yes |
+| `PostToolUse` | After tool execution | No |
+| `PreCompact` | Before context compaction | No |
+| `Stop` | Session termination | No |
+| `SubagentStop` | Subagent termination | No |
+| `Notification` | Notification received | No |
+
+**Standard hook output format:**
+```json
+{
+  "hookSpecificOutput": {
+    "hookEventName": "HookName",
+    "additionalContext": "injected context string"
+  }
+}
 ```

“Standard hook output format” is presented as universal, but hook output is event-specific (e.g., Stop/SubagentStop use decision+reason; Notification/SessionEnd/PreCompact don’t accept hookSpecificOutput; PreToolUse uses permissionDecision/updatedInput). Consider rewording this as an example for SessionStart/UserPromptSubmit context injection and linking/pointing to the local `claude-docs` hooks reference for the per-event schemas.

> +| SessionStart | `session_start.ts` + `sync_letta_memory.ts` | 5s + 10s | Create conversation, sync memory |
+| UserPromptSubmit | `sync_letta_memory.ts` | 10s | Inject memory blocks & messages |
+| PreToolUse | `pretool_sync.ts` | 5s | Mid-workflow context updates |
+| Stop | `send_messages_to_letta.ts` | 15s | Async transcript sync |

The Dreamers hook scripts are listed without their actual locations; in `.claude-plugin/marketplace.json` these commands run files under `${CLAUDE_PLUGIN_ROOT}/scripts/...` (not just `session_start.ts`, etc.). Including the full relative paths (or noting they live in `scripts/`) would reduce ambiguity when implementing or debugging hook commands.
```suggestion
| SessionStart | `scripts/session_start.ts` + `scripts/sync_letta_memory.ts` | 5s + 10s | Create conversation, sync memory |
| UserPromptSubmit | `scripts/sync_letta_memory.ts` | 10s | Inject memory blocks & messages |
| PreToolUse | `scripts/pretool_sync.ts` | 5s | Mid-workflow context updates |
| Stop | `scripts/send_messages_to_letta.ts` | 15s | Async transcript sync |
```

> +| Variable | Description | Example |
+|----------|-------------|---------|
+| `$CLAUDE_CONFIG_DIR` | Base Claude configuration | `~/.claude` |
+| `$CLAUDE_PROJECT_DIR` | Marketplace root (where Argcfile.sh lives) | `/home/skogix/skogai-marketplace` |
+| `$CLAUDE_PLUGIN_ROOT` | Plugin cache dir (version-specific) | `$CLAUDE_CONFIG_DIR/plugins/cache/skogai-marketplace/core/0.0.4` |
 
-The marketplace uses `argc` as the universal entry point for all automation. This means:
+**Path resolution rules:**
+- Use `$CLAUDE_PROJECT_DIR` for marketplace root files (like `Argcfile.sh`)
+- Use `$CLAUDE_PLUGIN_ROOT` for plugin-specific files (hooks, scripts)
+- Use `$CLAUDE_CONFIG_DIR` for global Claude Code configuration
 
-- **Claude Code hooks call argc** (most hooks will invoke argc commands)
-- **Worktree triggers call argc** (`.config/wt.toml` defines triggers that call argc)
-- **Git workflows call argc** (commit/merge to master triggers argc updates)
-- **Most things in skogai call argc**
+**Key filesystem paths:**
+- Marketplace source: `$CLAUDE_CONFIG_DIR/plugins/marketplaces/skogai-marketplace`
+- Plugin cache: `$CLAUDE_CONFIG_DIR/plugins/cache/skogai-marketplace/<plugin>/<version>`

The path guidance here conflicts with the repository’s root Argcfile.sh, which uses CLAUDE_MARKETPLACE_PATH and CLAUDE_CACHE_PATH (hard-coded defaults) rather than deriving paths from $CLAUDE_CONFIG_DIR/$CLAUDE_PROJECT_DIR. Either document those variables as the actual source of truth for the CLI, or update Argcfile.sh to consistently use the Claude-provided path env vars so the docs match behavior.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/marketplace/pull/65#pullrequestreview-3768427946
You are receiving this because you authored the thread.

Message ID: <SkogAI/marketplace/pull/65/review/3768427946@github.com>