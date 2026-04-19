---
categories:
  - journal
tags:
  - linear
  - templates
  - skogai-routing
  - documentation
permalink: claude/journal/2026-04-19/linear-sko-166-template-review
title: Linear SKO-166 templates review and alignment
type: journal
---

# Linear SKO-166 templates review and alignment

## What happened

Handled Linear session `af12a79e-797a-4321-b7fd-991676d817c4` for SKO-166 with the directive to review templates against skogai-routing basics and overall quality.

Reviewed `.skogai/templates/` and compared current structure to routing principles in `.skogai/skills/skogai-routing/references/claude-md-rules.md` and related style conventions.

Applied focused updates to make templates immediately usable and consistent with the routing/discoverability model.

## Changes made

- Updated `.skogai/templates/CLAUDE.md`
  - switched to explicit `## contents` section for discoverability
  - listed all current templates in the directory (core + planning helpers)
  - kept this file as a lightweight router/index (no heavy inlined content)

- Upgraded `.skogai/templates/knowledge-entry.md`
  - replaced placeholder `[@todo]` body with practical sections
  - added `category` and clearer status enum in frontmatter comments

- Upgraded `.skogai/templates/decision-record.md`
  - replaced placeholder `[@todo]` body with ADR structure (`context`, `decision`, `alternatives-considered`, `consequences`, `follow-up`)
  - added optional supersession metadata fields

- Upgraded `.skogai/templates/project-status.md`
  - replaced placeholder `[@todo]` body with actionable status sections (`summary`, `current-focus`, `milestones`, `risks`, `next-update`)
  - added `title` field for consistency with existing markdown metadata patterns

## Key decisions

- Kept changes minimal and scoped to template usability + routing alignment.
- Did not remove optional templates (`findings.md`, `progress.md`, `task_plan.md`), but made sure they are discoverable via templates router.
- Preserved existing permalink namespace style (`claude/projects/dot-skogai/...`) for consistency with current repository metadata.

## Worth remembering

Template stubs with only `[@todo]` create friction at creation time. Better starter templates are still lightweight, but include enough structure to make first use copy-paste-ready.
