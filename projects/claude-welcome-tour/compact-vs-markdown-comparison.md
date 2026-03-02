# Compact Summaries vs Hand-Written Markdown: Comparison

Comparing the three auto-compact JSONL summaries against the hand-written `session-summary-2026-03-02.md`.

---

## Sources Analyzed

| Source | Type | Timestamp | Useful content? |
|--------|------|-----------|----------------|
| `agent-acompact-a07d56e063b3cac6.jsonl` | Auto-compact | 11:15 | Yes — most detailed compact |
| `agent-acompact-f8d4e6fed77209a2.jsonl` | Auto-compact | 17:10 | Yes — later snapshot |
| `agent-acompact-1b9463d78c41944e.jsonl` | Auto-compact | 17:08 | No — auth error, empty |
| `session-summary-2026-03-02.md` | Hand-written markdown | Unknown | Yes — unique insights |

---

## What Each Format Captured That the Other Didn't

### Only in the auto-compacts
- Full code snippets for `csync.sh`, `clog.sh`, `cgit.sh`
- Exact file paths and line references
- Structured "All user messages" section with verbatim quotes
- The planned clog.sh pathspec fix command
- Detailed error-by-error breakdown with resolution steps
- Context routing philosophy details ("routing over dumping", "~10k right tokens vs 50k dump")
- The `.gitignore` user created
- That `csync.sh` still uses `cgit.sh` (csync migration issue)

### Only in the hand-written markdown
- The `bisf9iew9.txt` bloating file discovery (7736 lines choking `/diff`)
- The failed `csync-check.sh` overengineering incident and its cleanup
- Git diff format details (`i/`/`w/` prefixes from `diff.mnemonicPrefix = true`)
- Color codes as provenance (`[32m]` = new since last csync)
- "Mistakes Made" section — honest self-assessment of what went wrong
- Design principles as a distilled list
- The observation that Claude was patronizing about things the user built
- User was on mobile — brevity matters

---

## Pros and Cons

### Auto-Compact (JSONL summaries)

**Pros:**
- Comprehensive and structured — follows a consistent 9-section template every time
- Captures verbatim user messages (critical for understanding intent drift)
- Includes full code snippets inline — no need to re-read files
- Tracks pending tasks with clear ownership
- "Current Work" section precisely describes where things left off
- Machine-parseable (JSONL wrapping, though the content is markdown)
- Happens automatically on context window pressure — no user effort
- Multiple snapshots at different times give a timeline of how understanding evolved

**Cons:**
- Redundant across compacts — the two successful ones overlap ~80%
- Verbose — ~2000-3000 words each, much of it boilerplate structure
- Misses experiential insights (the "what went wrong" narrative)
- Doesn't capture discoveries made between compacts (the bisf9iew9.txt finding happened in a section that got compacted differently)
- No editorial judgment — everything gets equal weight
- The failed compact (auth error) is a silent data loss — no retry, no warning
- Template structure forces padding even when a section has nothing useful ("Errors: none" still takes space)
- Can't capture user's editorial voice or priorities

### Hand-Written Markdown

**Pros:**
- Editorial judgment — prioritizes what actually matters
- Captures the "why" and the narrative, not just the "what"
- Mistakes section is invaluable — compacts don't do honest self-assessment
- Design principles distilled to actionable rules
- Concise — 70 lines covers more ground than 6000 words of compacts
- The TODO checklist is more accurate (reflects current reality, not a snapshot from hours ago)
- Captures experiential knowledge: color codes, diff formats, the fundamental cache asymmetry
- Human-readable at a glance — tables, short sections, no boilerplate

**Cons:**
- Manual effort required from the user
- Misses verbatim user messages (can't reconstruct intent changes)
- No code snippets — have to go find the files
- Single snapshot — no timeline of how understanding evolved
- Can drift from reality if not updated (the TODO list here is more current, but could get stale)
- Depends on user remembering to write it

---

## Recommendation

**Use both, but for different purposes:**

1. **Auto-compacts** are good as raw material / insurance against context loss. They capture everything including things you didn't know were important yet. But they shouldn't be the primary reference.

2. **Hand-written markdown** should be the authoritative session summary. It has editorial judgment, captures experiential knowledge, and is actually readable.

3. **The merge** (what `merged-session-summary.md` does) is the ideal: take the structure and completeness of compacts, add the editorial insight and experiential knowledge from the markdown, deduplicate, and produce one authoritative document.

4. **For SkogAI context routing**: the auto-compacts could feed into an automated summarization pipeline, but the output should look more like the hand-written markdown — concise, opinionated, actionable.
