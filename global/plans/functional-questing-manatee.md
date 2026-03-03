# Claude Welcome Tour — Working Notes

## Dual Git Architecture

**Local repo** (`git` in `~/claude/`):
- 7,365 tracked files — curated project content
- Projects, global/ symlinks, scripts, .skogai/ context
- Bulk comes from global/projects/ (conversation transcripts) and global/usage-data/

**Bare repo** (`claude-dotfiles`, git-dir `/mnt/sda1/claude-global.git`, work-tree `$HOME`):
- Raw observability of everything Claude CLI writes at runtime
- Tracks: .claude/debug/, history.jsonl, projects/*.jsonl, plugins/, settings, plans, shell-snapshots
- Also tracks .zsh_history
- csync.sh auto-commits both repos on every message (UserPromptSubmit hook)

**Key insight**: local repo = curated, bare repo = raw runtime. Both stay in lockstep via csync.

## Git Wrappers

- `claude-dotfiles` — use for bare repo operations (replaces cgit.sh)
- `git` — use for local ~/claude/ repo
- `skogai-dotfiles` — exists but not yet explored (for ~/skogai/ presumably)

## Cleanup Done

- Deleted: global/skills/, projects/skogai-core/, ~/.claude/skills/
- User handles all git commits manually during tour

## Key Insight: Cache Pollution & Plan Mode

**Problem:** Claude's Anthropic-side cache serves stale files as if current. Skills deleted weeks ago, old configs, ghost project scaffolds — all read as "real." This led to the /init CLAUDE.md documenting things that didn't exist.

**Why plan mode matters:** Read-only mode means all reads/writes go through cache, never touching the user's filesystem directly. Both sides accumulate git diffs independently. Changes only flow to disk when plan mode exits. This is controlled context flow.

**Why explicit deletes:** Force cache invalidation by running actual rm + verify with read-tool. Only way to make cache agree with reality for specific paths.

**Design principle for SkogAI:** Stale context is worse than no context. Context that was true once but isn't anymore generates confident wrong answers. This is the core motivation for the fresh rebuild — no way to audit what's real vs cached ghost data in the old setup.

## Fix: clog.sh readable output

**Problem:** clog.sh output is unreadable because the bare repo section is 6500+ lines of noise. Debug logs, conversation transcripts (.jsonl), tool-results, and .zsh_history dominate the `--stat` output. Single jsonl lines can be 25k+ tokens, making even the /tmp/clog.txt file impossible for Claude to read.

**What's noise in bare repo:**
- `.claude/debug/` — internal debug logs (thousands of lines per sync)
- `.claude/projects/*/*.jsonl` — conversation transcripts (huge single lines)
- `.claude/projects/*/tool-results/` — tool output blobs
- `.claude/projects/*/subagents/` — subagent transcripts
- `.zsh_history` — shell history
- `snapshot-zsh-*.sh` — shell snapshots

**What's signal in bare repo:**
- `.claude/plans/` — plan files
- `.claude/settings.json` — settings changes
- `.claude/commands/` — custom commands
- `.claude/.claude.json` — config changes
- `.claude/plugins/` — plugin state
- `.claude/CLAUDE.md` — instructions

**Fix:** Exclude noise paths from bare repo log using git pathspec exclusions.

**File:** `scripts/clog.sh`

**New content:**
```bash
#!/usr/bin/env bash
# Show recent commits from both claude repos

claude-dotfiles log --oneline --stat -20 \
  -- ':!.claude/debug' ':!.claude/projects' ':!.zsh_history' ':!snapshot-zsh-*' \
  >/tmp/clog.txt
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::" >>/tmp/clog.txt
git log --oneline --stat -20 >>/tmp/clog.txt
```

This keeps plan/settings/command/config changes visible while filtering out the debug/transcript/history noise. The local repo section stays unchanged since it's already clean.

**Verification:** Run `./scripts/clog.sh` then read `/tmp/clog.txt` — should be well under 256KB and show meaningful changes only.

## Fix: csync.sh — use `claude-dotfiles` wrapper

**Context:** csync.sh still uses `./scripts/cgit.sh` for bare repo operations. Should use `claude-dotfiles` to match clog.sh and the rest of the setup. Also rsyncs `skills` dir which no longer exists.

**Changes to `scripts/csync.sh`:**
- Lines 12-14: replace `./scripts/cgit.sh` → `claude-dotfiles`
- Line 7: remove `skills` from the rsync dir list

**Verification:** Run `claude-dotfiles status` and `git status` — both clean after sync.

## Update tour CLAUDE.md

Record what was done, new insights about cache pollution, and updated script documentation.

**File:** `projects/claude-welcome-tour/CLAUDE.md`

## Still To Explore

- ~/skogai/ and skogai-dotfiles — will set up together
- rtk, beads/br — clarify or remove references
- .skogai/ contents — "probably doesn't make sense yet"
- skogapi/ — FastAPI service, status unknown
- Installed 3 official plugins this session (claude-code-setup, claude-md-management, skill-creator)
