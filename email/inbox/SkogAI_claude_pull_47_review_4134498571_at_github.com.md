MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/claude <claude@noreply.github.com>
Date: Sat, 18 Apr 2026 07:09:42 -0700
Subject: Re: [SkogAI/claude] fix: drop hardcoded skogix paths from settings.json (PR #47)
Message-ID: <SkogAI/claude/pull/47/review/4134498571@github.com>
In-Reply-To: <SkogAI/claude/pull/47@github.com>
References: <SkogAI/claude/pull/47@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69e390a69605b_fc110881776d"; charset="UTF-8"

@claude[bot] commented on this pull request.

## Code Review — PR #47: drop hardcoded skogix paths from settings.json

### Overview

Clean, surgical fix. Removes four `/home/skogix/...` references that were causing `No such file or directory` noise on any host that isn't literally `/home/skogix/claude`. The rationale is solid and the changes are minimal.

---

### Code Quality & Style ✅

The diff is focused and correct. Conventional commit prefix (`fix:`), clear PR description with per-commit breakdown, and follow-up issues already filed for related work (#43–#46). No style concerns.

---

### Specific Observations

**`.claude/settings.json` — hook path quoting (line ~39, ~100)**

```json
"command": "\"$CLAUDE_PROJECT_DIR\"/claude-todo/bin/claude-md-linecheck"
```

The quoting pattern `"$CLAUDE_PROJECT_DIR"/path` is correct bash for paths with spaces, but this relies entirely on `$CLAUDE_PROJECT_DIR` being set in the hook execution environment. If Claude Code doesn't export it in a given hook context (e.g. a future version changes the variable name, or hooks run in a stripped environment), the path silently degrades to `/claude-todo/bin/...` and fails with no obvious error.

**Suggestion:** Add a guard in the hook command or at minimum note the dependency explicitly in a comment. For the `Stop` hook especially, a failed-silently healthcheck is worse than no healthcheck.

---

**`CLAUDE.md` documentation still references `bin/` at repo root**

The PR updates the hook config to use `claude-todo/bin/`, but `CLAUDE.md` (project root) still documents the structure with `bin/` at the top level:

```
├── bin/                 — scripts and tools
│   ├── healthcheck
│   ├── context.sh
│   └── ...
```

This is a documentation inconsistency — new contributors will look for `bin/healthcheck` and won't find it. Issue #45 (consolidate paths) will likely resolve this, but worth a doc update here or at least a note in the PR.

---

**Test plan — unchecked item**

> - [ ] Verify on skogix-workstation that the previous behavior still holds

This is still open. Since `$CLAUDE_PROJECT_DIR` expands to the same absolute path on skogix-workstation, it should be safe — but worth calling out that this is untested before merge.

---

### Potential Issues

| Issue | Severity | Notes |
|---|---|---|
| `$CLAUDE_PROJECT_DIR` not guaranteed in all hook contexts | Low–Medium | Add guard or document the dependency |
| `CLAUDE.md` structure section shows stale `bin/` path | Low | Fix in this PR or add to #45 scope |
| `claude-todo/bin/` move assumed from commit `f37d4ba` | Low | Verify files actually exist at new path before merge |

---

### Summary

This is the right fix. The hardcoded paths were causing real errors and the change is minimal and correct. The only real concern is the implicit dependency on `$CLAUDE_PROJECT_DIR` being set — worth a guard or at least a test confirming the env var is present in both hook types. Everything else is minor housekeeping.

**Verdict: approve with minor suggestions.** The one unchecked test plan item and the `$CLAUDE_PROJECT_DIR` guard are the only things worth addressing before merge.



-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/claude/pull/47?email_source=notifications&email_token=AAFIQZ52RNUD5QSPXRUHTJ34WOECNA5CNFSNUABKM5UWIORPF5TWS5BNNB2WEL2QOVWGYUTFOF2WK43UKJSXM2LFO4XTIMJTGQ2DSOBVG4Y2M4TFMFZW63VGMF2XI2DPOKSWK5TFNZ2L24DSL5ZGK5TJMV3V63TPORUWM2LDMF2GS33OONPWG3DJMNVQ#pullrequestreview-4134498571
You are receiving this because you authored the thread.

Message ID: <SkogAI/claude/pull/47/review/4134498571@github.com>