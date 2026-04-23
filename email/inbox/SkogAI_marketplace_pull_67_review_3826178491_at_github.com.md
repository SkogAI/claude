MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/marketplace <marketplace@noreply.github.com>
Date: Thu, 19 Feb 2026 06:14:38 -0800
Subject: Re: [SkogAI/marketplace] docs: Fix CLAUDE.md inconsistencies with actual implementation (PR #67)
Message-ID: <SkogAI/marketplace/pull/67/review/3826178491@github.com>
In-Reply-To: <SkogAI/marketplace/pull/67@github.com>
References: <SkogAI/marketplace/pull/67@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69971ace47507_105112847789e"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR attempts to fix documentation inconsistencies between CLAUDE.md and the actual codebase implementation. However, while some fixes are correct, critical errors in the hook output format documentation remain.

**Changes:**
- Split environment variables section into Claude Code vs Argcfile.sh contexts
- Updated worktree hook command documentation from `argc install` to `argc plugin update`
- Added `scripts/` directory prefix to Dreamers hook script paths
- Expanded hook output format section with event-specific schemas
- Added note clarifying hook event table shows marketplace-used subset





---

💡 <a href="/SkogAI/marketplace/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -83,7 +91,7 @@ The `plugin::update` command runs a full cycle: push → remove marketplace →
 ### Worktree Management
 
 `.config/wt.toml` defines lifecycle hooks for worktree operations:
-- `post-create = "argc install"` — runs after creating a new worktree
+- `post-create = "argc plugin update"` — runs after creating a new worktree

While this documentation change is correct (argc plugin update is the right command, not argc install), the actual .config/wt.toml file (line 13) still contains the incorrect command `post-create = "argc install"`. For consistency, that file should also be updated to use `argc plugin update`. Otherwise, the documentation will accurately describe what SHOULD happen, but not what actually DOES happen when the hook runs.

> @@ -131,6 +144,13 @@ Hooks are declared inline in `marketplace.json` and receive JSON via stdin. They
 }
 ```
 
+Other hook events use different output schemas:
+- `Stop`/`SubagentStop`: `{"decision": "continue"|"stop", "reason": "explanation"}`
+- `PreToolUse`: `{"permissionDecision": "allow"|"deny"|"ask", "updatedInput": {...}}`

The PreToolUse hook output format is incorrect. According to the actual implementation in plugins/core/hooks/pre-tool-use.sh (lines 22-30), the permissionDecision and updatedInput fields should be wrapped inside hookSpecificOutput, not as top-level fields. The correct format should be:

```json
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "allow"|"deny"|"ask",
    "permissionDecisionReason": "string",
    "updatedInput": {...}
  }
}
```
```suggestion
- `PreToolUse`: `{"hookSpecificOutput": {"hookEventName": "PreToolUse", "permissionDecision": "allow"|"deny"|"ask", "permissionDecisionReason": "string", "updatedInput": {...}}}`
```

> @@ -131,6 +144,13 @@ Hooks are declared inline in `marketplace.json` and receive JSON via stdin. They
 }
 ```
 
+Other hook events use different output schemas:
+- `Stop`/`SubagentStop`: `{"decision": "continue"|"stop", "reason": "explanation"}`

The Stop/SubagentStop hook output format is documented as top-level `{"decision": "continue"|"stop", "reason": "explanation"}`, but this is inconsistent with the actual implementation comments in plugins/core/hooks/stop.sh (lines 18-22) and plugins/core/hooks/subagent-stop.sh (lines 18-22), which show `{"decision": "block" | undefined, "reason": "string"}`. The value is "block" (not "stop"), and "continue" is represented by not including the decision field (undefined), not as a "continue" value.
```suggestion
- `Stop`/`SubagentStop`: `{"decision": "block", "reason": "string"}` (`decision` omitted means continue)
```

> @@ -212,10 +232,10 @@ This updates the version, generates changelog from commits since last tag, creat
 **Hooks (4):**
 | Hook | Script | Timeout | Purpose |
 |------|--------|---------|---------|
-| SessionStart | `session_start.ts` + `sync_letta_memory.ts` | 5s + 10s | Create conversation, sync memory |
-| UserPromptSubmit | `sync_letta_memory.ts` | 10s | Inject memory blocks & messages |
-| PreToolUse | `pretool_sync.ts` | 5s | Mid-workflow context updates |
-| Stop | `send_messages_to_letta.ts` | 15s | Async transcript sync |
+| SessionStart | `scripts/session_start.ts` + `scripts/sync_letta_memory.ts` | 5s + 10s | Create conversation, sync memory |
+| UserPromptSubmit | `scripts/sync_letta_memory.ts` | 10s | Inject memory blocks &amp; messages |

The line contains HTML entity encoding `&amp;` instead of the plain `&` character. In Markdown documentation, this should be just `&` unless there's a specific reason for HTML entity encoding (e.g., rendering in HTML context). This appears to be inconsistent with standard Markdown formatting.
```suggestion
| UserPromptSubmit | `scripts/sync_letta_memory.ts` | 10s | Inject memory blocks & messages |
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/marketplace/pull/67#pullrequestreview-3826178491
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/marketplace/pull/67/review/3826178491@github.com>