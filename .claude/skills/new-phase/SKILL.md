---
name: new-phase
description: scaffold a new planning phase directory under .planning/phases/ with all standard artifacts and a ROADMAP entry — invoke when starting a new project phase
---

<objective>
Create a properly named phase directory (NN-slug-name), populate it with artifact stubs from templates, and add the phase to .planning/ROADMAP.md. The phase is ready to plan by the end.
</objective>

<quick_start>
Needs: phase number + slug + one-line goal.
Creates: `.planning/phases/NN-slug/` with all standard files.
Updates: `.planning/ROADMAP.md` phase table.
</quick_start>

<intake>
Provide phase number, slug, and goal. If not given, ask for all three before proceeding.

Examples:
- `/new-phase 6 context-routing "Implement lazy context loading"` → ready to go
- `/new-phase` with no args → ask: number? slug? goal?
</intake>

<routing>
| Intent | Next |
|--------|------|
| create, scaffold, new, add, build phase | collect inputs → scripts/scaffold-phase.sh → workflows/scaffold.md |
| list, existing, what phases exist | `ls .planning/phases/` |
| structure, what files, format, how phases work | references/phase-structure.md |
</routing>

<reference_index>
- **phase-structure:** references/phase-structure.md — naming, file descriptions, numbering rules
- **templates:** templates/ — one per artifact type; scaffold script uses these
- **script:** scripts/scaffold-phase.sh — run with (number, slug, goal)
</reference_index>
