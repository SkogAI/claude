---
title: CONTRIBUTING
type: note
permalink: skogai/skills/nelson-base/contributing
---

# Contributing

Thanks for your interest in contributing to Nelson.

## How to contribute

1. Fork the repo and create a branch from `main`
1. Make your changes
1. Open a pull request

## What to contribute

Bug fixes, improvements to the skill instructions or templates, documentation fixes, and new ideas are all welcome. If you're thinking about a larger change, open an issue first so we can discuss it.

## Skill structure

The skill lives in `.claude/skills/nelson/`. The key files:

- `SKILL.md` — Main skill instructions (the entrypoint Claude reads)
- `references/` — Supporting docs loaded on demand (risk tiers, templates, team sizing)
- `agents/` — Agent interface definitions

## Guidelines

- Keep things simple and clear
- Test your changes by installing the skill locally and running a mission
- Follow the existing style and tone
