<required_reading>
references/phase-structure.md
</required_reading>

<process>

**Step 1 — confirm inputs**
- Phase number (integer, e.g. `6`)
- Slug (kebab-case, e.g. `context-routing`)
- Goal (one sentence)

**Step 2 — run scaffold script**
```bash
bash .claude/skills/new-phase/scripts/scaffold-phase.sh <number> "<slug>" "<goal>"
```
Outputs the created paths. If the directory already exists, the script exits with an error — do not overwrite.

**Step 3 — fill in the stubs**
Open each created file and replace placeholders with real content:
- `NN-CONTEXT.md` — domain boundary, locked decisions, canonical refs, deferred ideas
- `NN-RESEARCH.md` — constraints, requirements, architecture patterns, known pitfalls
- `NN-VALIDATION.md` — success criteria + verification map
- `NN-01-PLAN.md` — first plan with concrete tasks

Leave `NN-VERIFICATION.md` and `NN-01-SUMMARY.md` empty until execution.

**Step 4 — update ROADMAP.md**
Add a row to the phase table in `.planning/ROADMAP.md`:
```
| NN | Phase Name | Planning | YYYY-MM-DD |
```

</process>

<success_criteria>
- `.planning/phases/NN-slug/` exists with all artifact files
- ROADMAP.md has a new row for this phase
- CONTEXT.md and RESEARCH.md have real content (not placeholder stubs)
- First plan is ready to execute
</success_criteria>
