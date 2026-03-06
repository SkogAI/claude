# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

# claude/ — project router

<what_is_this>

Meta-repository for SkogAI's Claude Code configuration and documentation. Not application code — this repo IS the AI operating environment: plugin management, fetched reference docs, knowledge base, and project planning files.

</what_is_this>

<structure>

```
marketplaces/     # git submodules — superpowers plugin suite (source repos)
  CLAUDE.md       # plugin registry: what each plugin does, hooks, skills, commands
skills/           # staging area for WIP skills (active via .claude/skills symlink)
commands/         # staging area for WIP commands (active via .claude/commands symlink)
hooks/            # staging area for WIP hooks (active via .claude/hooks symlink)
agents/           # staging area for WIP agents (active via .claude/agents symlink)
docs/
  fetch-docs.sh   # fetches latest Claude Code docs → docs/claude-code/*.md
  claude-code/    # gitignored fetched docs (run fetch-docs.sh to populate)
.skogai/
  knowledge/      # decisions/, learnings/, patterns/style/ — accumulated conventions
  memory/
    context/current.md  # generated from journal + decisions
    decisions.md        # append-only quick decision log
projects/         # planning overviews for active workstreams
.claude/
  settings.schema.example.json  # reference for settings.json structure
```

</structure>

<key_commands>

**Refresh Claude Code docs:**
```bash
cd docs && bash fetch-docs.sh
```
Fetches 59 pages from `code.claude.com/docs/en/*.md` into `docs/claude-code/`. Re-run any time docs may be stale.

**Check installed plugins:**
```bash
cat ~/.claude/plugins/installed_plugins.json
```
Currently installed: `superpowers@superpowers-dev` v4.3.1.

</key_commands>

<routing>

| need to know about... | read |
|---|---|
| plugins, skills, hooks, MCP tools | @marketplaces/CLAUDE.md |
| style conventions, naming, XML tags | @.skogai/knowledge/patterns/style/CLAUDE.md |
| commit format and git rules | @.skogai/knowledge/patterns/style/commit-conventions.md |
| current work state | @.skogai/memory/context/current.md (generated — run `skogai context refresh`) |
| quick decisions log | @.skogai/memory/decisions.md |
| @-reference system | @.skogai/knowledge/patterns/style/at-references.md |

</routing>

<conventions>

**Commits:** `{type}({phase}-{plan}): {description}` — types: feat, fix, test, refactor, docs, chore. Stage files individually, never `git add .`.

**@-references:** `@path/to/file` in prompts expands the real file at prompt-time (always current). Read tool may return cached content.

**Context philosophy:** routing over dumping. load the right thing at the right time. placeholders over pre-loading.

**Symlink pattern:** `.claude/{skills,commands,hooks,agents}` → `../` counterparts. Edit in project root, active immediately. Graduate to `~/.claude/` or a plugin when stable.

</conventions>
