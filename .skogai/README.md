---
title: README
type: note
permalink: claude/projects/dot-skogai/readme
---

# .skogai

Minimal bootstrap repository for SkogAI projects, designed to be included as a git submodule at `.skogai/`.

## Purpose

This repository provides shared configuration and context files that are common across SkogAI projects:

- **Worktrunk Configuration** (`.config/wt.toml`) - Standard git worktree workflow settings
- **Claude Code Context** (`CLAUDE.md`) - Project instructions for Claude Code sessions
- **Documentation Standards** - Conventions for SkogAI project structure

## Usage

### Adding to a new project

```bash
git submodule add <repo-url> .skogai
git submodule update --init --recursive
```

### Updating in an existing project

```bash
cd .skogai
git pull origin master
cd ..
git add .skogai
git commit -m "Update .skogai submodule"
```

## What's Included

```
.skogai/
├── CLAUDE.md      # Claude Code instructions
├── README.md      # This file
├── .config/
│   └── wt.toml   # Worktrunk configuration
└── .gitignore     # Ignore patterns
```

## Principles

- **Portable**: No absolute paths or user-specific settings
- **Minimal**: Only what's genuinely shared across projects
- **Optional**: Projects can override or ignore as needed

## Contributing

Changes to this repository affect all SkogAI projects that include it as a submodule. Keep it simple and portable.
