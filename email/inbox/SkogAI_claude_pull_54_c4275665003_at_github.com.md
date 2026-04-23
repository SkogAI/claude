MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/claude <claude@noreply.github.com>
Date: Sun, 19 Apr 2026 03:00:12 -0700
Subject: Re: [SkogAI/claude] feat: move home-folder executables into .skogai/tools and add tooling router docs (PR #54)
Message-ID: <SkogAI/claude/pull/54/c4275665003@github.com>
In-Reply-To: <SkogAI/claude/pull/54@github.com>
References: <SkogAI/claude/pull/54@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69e4a7aceefb_f9110818946b"; charset="UTF-8"

claude[bot] left a comment (SkogAI/claude#54)

## Code Review: feat: move home-folder executables into .skogai/tools

### Summary
Clean restructuring that moves tools to a canonical location with good compatibility wrapper pattern. A few shell scripting issues need attention before this lands.

---

### 🟡 Warnings (Should Fix)

1. **Unquoted variable in `for` loop — word splitting on filenames** — `.skogai/tools/context-journal.sh:107,115`
   - Problem: `for JOURNAL in $RECENT_JOURNALS` and `for JOURNAL in $OLDER_JOURNALS` are unquoted. Any filename with spaces (unlikely today, but possible) will split incorrectly.
   - Suggestion: Use `while IFS= read -r JOURNAL; do ... done <<< "$RECENT_JOURNALS"` or store results in an array.

2. **Hardcoded relative path in compatibility wrappers** — `claude-todo/bin/context-git.sh:4` (and all wrappers)
   - Problem: `exec "$SCRIPT_DIR/../../.skogai/tools/$(basename "$0")"` assumes `claude-todo/bin/` is always exactly two levels deep from the repo root. If the directory moves, all wrappers silently break.
   - Suggestion: Derive the repo root via `git rev-parse --show-toplevel` and use that as the anchor: `REPO_ROOT="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel)"` then `exec "$REPO_ROOT/.skogai/tools/$(basename "$0")" "$@"`.

3. **`context-workspace.sh` will abort if `tree` is not installed** — `.skogai/tools/context-workspace.sh:28`
   - Problem: `set -e` is in effect. If `tree` is not on PATH the script exits with an error code that will silently swallow the workspace section in `context.sh`. The `|| echo '(no X directory)'` fallbacks handle missing _directories_, not a missing `tree` binary.
   - Suggestion: Guard with `if command -v tree >/dev/null 2>&1; then ... else echo "(tree not installed)"; fi`.

4. **`build-system-prompt.sh` is not ported** — missing from `.skogai/tools/`
   - Problem: The original `bin/` had `build-system-prompt.sh` (documented in the old `CLAUDE.md`), but there is no corresponding file in `.skogai/tools/` and no wrapper in `claude-todo/bin/`. The new `CLAUDE.md` for `healthcheck` also checks `bin/CLAUDE.md` (via `check_any_file "bin router" "bin/CLAUDE.md" "claude-todo/bin/CLAUDE.md"`) — if anything still calls `build-system-prompt.sh` it will silently be missing.
   - Suggestion: Either port it or explicitly document that it was intentionally dropped.

---

### 🔵 Suggestions (Consider)

1. **`python3` dependency for mtime sorting** — `.skogai/tools/context-journal.sh:79`
   - Current: `python3 -c "import os,sys; print(int(os.stat(sys.argv[1]).st_mtime), sys.argv[1])"` to sort by mtime.
   - Better: `stat -c '%Y %n'` (GNU/Linux) or `stat -f '%m %N'` (BSD/macOS) avoids spawning a Python process per file and removes the implicit `python3` dependency. Since `healthcheck` warns when python3 is missing, this is not a hard failure, but lighter is better.

2. **`find-agent-root.sh` never checks `/` itself** — `.skogai/tools/find-agent-root.sh:19`
   - Current: `while [ "$dir" != "/" ]` — exits the loop without checking `/`.
   - Edge case: A repo rooted at `/` (unlikely in practice) would fall through to the git fallback. Low risk but worth knowing.

3. **`context-journal.sh` missing `set -u` and `set -o pipefail`** — `.skogai/tools/context-journal.sh:13`
   - Current: `set -e` only.
   - Other scripts use `set -euo pipefail`. Inconsistency means unbound variable refs here won't be caught.

4. **`fetch-docs.sh` silently swallows per-page failures** — `.skogai/tools/fetch-docs.sh`
   - `set -euo pipefail` will abort on the first `curl` failure, leaving a partial download without indication of which pages succeeded. Consider `curl --fail` (exits non-zero on HTTP errors) and/or a loop that prints failures without aborting, depending on desired behaviour.

---

### ✅ Good Practices

- Wrapper `exec` pattern is clean — replaces the process rather than forking, preserves exit codes and signals correctly.
- `find-agent-root.sh` dual-mode (source vs execute via `BASH_SOURCE[0]`) is well-implemented.
- `healthcheck` counter pattern (`OK`/`WARN`/`FAIL`) gives granular exit semantics without aborting early.
- Compatibility wrappers preserve `"$@"` forwarding — arguments pass through correctly.
- `CLAUDE.md` routing references updated consistently across top-level and `claude-todo/bin/`.

---

### Verdict
- [x] ⚠️ Approve with Suggestions

The wrapper fragility (#2) and missing `build-system-prompt.sh` (#4) are the highest-priority items. The rest are polish.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/claude/pull/54?email_source=notifications&email_token=AAFIQZ24Z2YLTWLLJX23UUT4WSPSXA5CNFSNUABFM5UWIORPF5TWS5BNNB2WEL2JONZXKZKDN5WW2ZLOOQXTIMRXGU3DMNJQGAZ2M4TFMFZW63VGMF2XI2DPOKSWK5TFNZ2LK4DSL5RW63LNMVXHIX3POBSW4X3DNRUWG2Y#issuecomment-4275665003
You are receiving this because you authored the thread.

Message ID: <SkogAI/claude/pull/54/c4275665003@github.com>