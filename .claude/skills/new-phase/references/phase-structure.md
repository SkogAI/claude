# Phase Structure Reference

Canonical sources: @.planning/ROADMAP.md, @.planning/PROJECT.md

## Directory Naming
```
.planning/phases/NN-slug-name/
```
- `NN` = zero-padded integer (01, 02, 03…)
- Decimal phases (2.1) for urgent insertions — sorted between their surrounding integers in numeric order
- Slug: kebab-case description of the phase goal

## Artifact Files

Each file is prefixed with `NN` matching the phase number.

| File | Purpose | Written |
|------|---------|---------|
| NN-CONTEXT.md | Domain boundary, locked decisions, canonical refs, deferred ideas | Phase start |
| NN-RESEARCH.md | Constraints, requirements, architecture, known pitfalls | Phase start |
| NN-VALIDATION.md | Success criteria, test infra, verification map, Wave 0 checks | Phase start |
| NN-01-PLAN.md | Plan 1: objectives, execution context, tasks with subtasks | Before plan 1 |
| NN-01-SUMMARY.md | Plan 1 results: metrics, commits, files, decisions, deviations | After plan 1 |
| NN-02-PLAN.md | Plan 2 (if needed) | Before plan 2 |
| NN-02-SUMMARY.md | Plan 2 results | After plan 2 |
| NN-VERIFICATION.md | Final verification report: observable truths, artifact list, coverage | Phase end |

## Plan File Sections
- `objectives` — what this plan achieves toward the phase goal
- `execution_context` — assumptions, environment, access needed
- `tasks` — numbered tasks, each with subtasks and a `verify:` line

## Summary File Sections
- `performance_metrics` — tasks completed, deviations
- `accomplishments` — what was built or changed
- `files_created` / `files_modified` — path + description
- `decisions` — choices made during execution and why
- `issues` — problems encountered, resolved or open
- `next_phase_readiness` — what plan N+1 starts with, or done statement
