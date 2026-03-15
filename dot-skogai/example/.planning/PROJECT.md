# Recipe Manager

## What This Is

A command-line tool for managing personal recipes. Store recipes as markdown files, search by ingredient or tag, generate shopping lists from meal plans.

## Core Value

Find any recipe fast and turn a week of meals into one shopping list.

## Requirements

### Validated

(None yet — ship to validate)

### Active

- [ ] Store recipes as markdown files with YAML frontmatter
- [ ] Search recipes by ingredient, tag, or name
- [ ] Generate shopping lists from selected recipes
- [ ] Tag recipes (cuisine, meal type, prep time)
- [ ] Import recipes from URL (basic scraping)

### Out of Scope

- Mobile app — CLI only for v1
- Multi-user / sharing — personal tool
- Nutritional tracking — not a diet app
- Meal planning calendar — just pick recipes, get a list

## Constraints

- Must work offline (no cloud dependency)
- Recipes stored as plain files (grep-friendly, git-friendly)
- No database — filesystem is the database

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Markdown + YAML frontmatter | Human-readable, version-controllable, grep-friendly | — Pending |
| No database | Filesystem IS the database — same philosophy as the GSD workflow itself | — Pending |
| CLI first | Keeps scope tight, can always add TUI later | — Pending |

---
*Last updated: 2026-03-15 after initialization*
