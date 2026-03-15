# Step 1: New Project

`/gsd:new-project` is where everything starts — and it's the most leveraged moment in the entire workflow. Time spent here saves exponentially more time later, because every downstream agent inherits your decisions through the files this step produces.

## What It Does

The command walks through four stages:

1. **Questioning** — "What do you want to build?" followed by deep follow-ups
2. **Research** — Four parallel agents investigate your domain
3. **Requirements** — Your features, scoped into v1 vs later
4. **Roadmap** — Phases with dependencies, success criteria, requirement mapping

Each stage produces a file. Each file is committed immediately — if your session crashes mid-way, you don't lose what came before.

## Stage 1: Questioning → PROJECT.md

This is a conversation, not a form. The agent asks "What do you want to build?" and then follows threads based on your answer. It's probing for:

- What problem sparked this
- What you mean by vague terms (everyone's "simple" is different)
- What's already decided vs what's flexible
- What's explicitly out of scope

The result is `PROJECT.md` — the single source of truth for what this project is. Every agent in every future phase reads this file first.

**Why it matters:** Without PROJECT.md, each agent invents its own understanding of your project. With it, they all start from the same page.

### Example: PROJECT.md

Here's what a real PROJECT.md looks like. This is for a small recipe manager — simple enough to follow, complex enough to show the pattern:

```markdown
# Recipe Manager

## What This Is

A command-line tool for managing personal recipes. Store recipes as markdown
files, search by ingredient or tag, generate shopping lists from meal plans.

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
```

Notice what's NOT in here: implementation details, tech stack choices, architecture diagrams. PROJECT.md captures *what* and *why*, not *how*. The *how* comes later.

## Stage 2: Research (Optional)

Four specialist agents run in parallel, each investigating one dimension of your domain:

| Agent | Investigates | Produces |
|-------|-------------|----------|
| Stack | What tools/libraries to use | `research/STACK.md` |
| Features | What's table stakes vs differentiating | `research/FEATURES.md` |
| Architecture | How systems like this are typically structured | `research/ARCHITECTURE.md` |
| Pitfalls | What projects like this commonly get wrong | `research/PITFALLS.md` |

A fifth agent synthesizes all four into `research/SUMMARY.md`.

**Why parallel?** Each researcher gets a fresh context window — they're not competing for space. And they don't depend on each other, so running them sequentially would just waste time.

**Why it matters:** You might know your domain well, but the agents that plan and execute your project don't. Research gives them domain knowledge through files rather than hoping they infer it correctly.

You can skip this stage if you're confident in the domain. The command asks.

## Stage 3: Requirements → REQUIREMENTS.md

This is where features get scoped. If research ran, the agent presents discovered features grouped by category and asks which ones belong in v1. If not, it gathers requirements through conversation.

Each requirement gets an ID (like `RECIPE-01`) and falls into one of three buckets:

- **v1** — building this now
- **v2** — building this later
- **Out of scope** — explicitly not building this

### Example: REQUIREMENTS.md

```markdown
# Requirements: Recipe Manager

**Defined:** 2026-03-15
**Core Value:** Find any recipe fast and turn a week of meals into one shopping list

## v1 Requirements

### Storage
- [ ] **STOR-01**: Recipes stored as markdown files with YAML frontmatter (title, tags, prep_time, servings)
- [ ] **STOR-02**: Recipes organized in a single directory (flat, not nested)
- [ ] **STOR-03**: Ingredient lists use a consistent format parseable for shopping lists

### Search
- [ ] **SRCH-01**: Search recipes by name (substring match)
- [ ] **SRCH-02**: Filter recipes by tag
- [ ] **SRCH-03**: Search recipes by ingredient

### Shopping
- [ ] **SHOP-01**: Select multiple recipes and generate a combined shopping list
- [ ] **SHOP-02**: Shopping list groups items by category (produce, dairy, etc.)
- [ ] **SHOP-03**: Duplicate ingredients across recipes are merged with quantities summed

### Import
- [ ] **IMPT-01**: Import a recipe from a URL (extract title, ingredients, steps)

## v2 Requirements

### Advanced Search
- **SRCH-04**: Fuzzy search (typo-tolerant)
- **SRCH-05**: Search by prep time range

### Meal Planning
- **MEAL-01**: Create weekly meal plans
- **MEAL-02**: Generate shopping list from meal plan

## Out of Scope

| Feature | Reason |
|---------|--------|
| Mobile app | CLI-first, keep scope tight |
| Multi-user | Personal tool |
| Nutritional data | Not a diet app |
| Recipe rating/reviews | Not a social platform |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| STOR-01 | Phase 1 | Pending |
| STOR-02 | Phase 1 | Pending |
| STOR-03 | Phase 1 | Pending |
| SRCH-01 | Phase 2 | Pending |
| SRCH-02 | Phase 2 | Pending |
| SRCH-03 | Phase 2 | Pending |
| SHOP-01 | Phase 3 | Pending |
| SHOP-02 | Phase 3 | Pending |
| SHOP-03 | Phase 3 | Pending |
| IMPT-01 | Phase 3 | Pending |

---
*Requirements defined: 2026-03-15*
```

**The IDs matter.** Later, when a plan says "this task implements STOR-01 and STOR-02", you can trace exactly which requirement each piece of code satisfies. Nothing gets lost.

## Stage 4: Roadmap → ROADMAP.md

A specialized roadmapper agent reads PROJECT.md, REQUIREMENTS.md, and the research summary, then produces a phased plan. It:

- Groups requirements into phases by dependency (what needs to exist before what)
- Derives success criteria for each phase (observable, testable outcomes)
- Maps every v1 requirement to exactly one phase (100% coverage — nothing falls through)

### Example: ROADMAP.md

```markdown
# Roadmap: Recipe Manager

## Overview

Three phases driven by dependency constraints. Storage must exist before search
can query it. Search and storage must work before shopping lists can combine
results from queries. Import is grouped with shopping because it produces the
same artifact (a stored recipe).

## Phases

- [ ] **Phase 1: Recipe Storage** — Store, read, and organize recipes as markdown files
- [ ] **Phase 2: Search** — Find recipes by name, tag, or ingredient
- [ ] **Phase 3: Shopping & Import** — Generate shopping lists, import from URLs

## Phase Details

### Phase 1: Recipe Storage
**Goal**: A user can create, store, and read recipes as markdown files
**Depends on**: Nothing (first phase)
**Requirements**: STOR-01, STOR-02, STOR-03
**Success Criteria:**
  1. User can create a recipe file with valid frontmatter and it's parseable
  2. All recipe files live in a single configured directory
  3. Ingredient format is consistent and machine-readable

Plans:
- [ ] 01-01: Set up project structure and recipe schema
- [ ] 01-02: Implement recipe parser and writer

### Phase 2: Search
**Goal**: A user can find any recipe by name, tag, or ingredient
**Depends on**: Phase 1
**Requirements**: SRCH-01, SRCH-02, SRCH-03
**Success Criteria:**
  1. Searching "chicken" returns all recipes containing chicken as ingredient
  2. Filtering by tag "italian" returns only Italian recipes
  3. Name search finds partial matches

Plans:
- [ ] 02-01: Implement search commands (name, tag, ingredient)

### Phase 3: Shopping & Import
**Goal**: A user can generate a shopping list from recipes and import new ones
**Depends on**: Phase 2
**Requirements**: SHOP-01, SHOP-02, SHOP-03, IMPT-01
**Success Criteria:**
  1. Selecting 3 recipes produces a single merged shopping list
  2. Shopping list groups items by category
  3. Importing a recipe URL produces a valid recipe file

Plans:
- [ ] 03-01: Implement shopping list generator
- [ ] 03-02: Implement URL recipe importer

## Progress

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Recipe Storage | 0/2 | Not started | - |
| 2. Search | 0/1 | Not started | - |
| 3. Shopping & Import | 0/2 | Not started | - |
```

**Why success criteria, not just requirements?** Requirements say what to build. Success criteria say how you'll know it works. "User can search by ingredient" is a requirement. "Searching 'chicken' returns all recipes containing chicken" is testable.

## What You Have Now

After `/gsd:new-project`, your `.planning/` directory looks like this:

```
.planning/
  PROJECT.md          — What you're building and why
  config.json         — How you want to work (mode, models, toggles)
  REQUIREMENTS.md     — What to build, scoped and ID'd
  ROADMAP.md          — When to build it, in what order
  STATE.md            — Where you are right now
  research/           — Domain knowledge (if you ran research)
    STACK.md
    FEATURES.md
    ARCHITECTURE.md
    PITFALLS.md
    SUMMARY.md
```

Every file is committed. Every file is readable. Any agent — or human — can pick up from here and know exactly what's going on.

**Next:** [Discuss Phase](02-discuss-phase.md) — Before planning begins, lock in the decisions that would otherwise be guessed at.
