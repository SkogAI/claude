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
