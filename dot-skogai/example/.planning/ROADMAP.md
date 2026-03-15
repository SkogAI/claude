# Roadmap: Recipe Manager

## Overview

Three phases driven by dependency constraints. Storage must exist before search can query it. Search and storage must work before shopping lists can combine results from queries. Import is grouped with shopping because it produces the same artifact (a stored recipe).

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
