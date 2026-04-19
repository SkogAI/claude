---
categories:
  - journal
tags:
  - templates
  - routing
  - skogai
  - linear
permalink: journal/2026-04-19/templates-routing-audit
title: Templates Routing Audit (SKO-124)
type: journal
---

## Summary

Reviewed `.skogai/templates/` against `skogai-routing` principles (router clarity, progressive disclosure, and copy+fill template behavior).

## Findings

- `templates/CLAUDE.md` functioned as an index, but was more content-heavy than needed for a directory router.
- Template bodies (`decision-record.md`, `knowledge-entry.md`, `project-status.md`) were placeholder-only (`[@todo]`) and did not provide structured starter sections.

## Changes made

- Simplified `.skogai/templates/CLAUDE.md` into a clearer router-style file with:
  - concise `<what_is_this>`
  - explicit `<contents>` list for discoverability
  - short `<usage>` rules emphasizing copy-only behavior
- Replaced `[@todo]` placeholders in all three templates with concrete starter sections:
  - `decision-record.md`: context, options-considered, decision, consequences
  - `knowledge-entry.md`: summary, context, observation, applicability, evidence, related
  - `project-status.md`: summary, goals, progress, risks, next-actions, links

## Validation

- Ran `git diff --check` (clean)
- Verified templates are still stubs and intended to be copied/fill-in-place in destination directories
