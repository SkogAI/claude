Canonical source: @personal/journal/CONVENTIONS.md

**Location rule:** `personal/journal/YYYY-MM-DD/<description>.md` — no other location, ever.

**Append-only rule:** Content is immutable after writing. Formatting corrections (typos, markdown fixes) are OK. Content changes, deletions, or rewrites are NOT OK. Each entry is a snapshot of that moment.

**Multiple entries per day is normal.** One file per topic or session. Group by date folder, not by file.

**Frontmatter is required** on every entry. See templates/entry.md for the exact shape.

**What triggers a write:**
- End of session with notable work, decisions, or insights
- `/wrap-up` phase 4
- Any moment worth preserving for future Claude sessions

**Reading:** `bin/context-journal.sh` reads both flat (legacy) and date-folder formats. It loads the most recent day's entries and lists older ones as references.
