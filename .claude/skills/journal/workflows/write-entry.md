<required_reading>
templates/entry.md
</required_reading>

<process>

**Step 1 — date + slug**
```bash
date +%Y-%m-%d
```
Slug: kebab-case topic of this session (e.g. `phase-5-planning`, `hook-implementation`). Ask if unclear.

**Step 2 — check existing entries today**
Look at `personal/journal/YYYY-MM-DD/` — if the folder exists, list its files.
Do NOT append to an existing entry; create a new file per topic.

**Step 3 — write the file**
Copy `templates/entry.md`. Fill all frontmatter fields — no empty placeholders:
- `tags`: 1–3 topic slugs
- `permalink`: `journal/YYYY-MM-DD/slug`
- `title`: human-readable sentence

Body: what happened, decisions made, insights a future Claude session should have.

Save to: `personal/journal/YYYY-MM-DD/<slug>.md`

</process>

<success_criteria>
- File exists at `personal/journal/YYYY-MM-DD/<slug>.md`
- All frontmatter fields populated
- Body captures what a future Claude would want to know
- No existing entry was modified
</success_criteria>
