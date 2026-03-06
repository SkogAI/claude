# @~/claude/ — my home folder

<what_is_this>

[@todo:claude please fill in this section with a brief introduction to your home folder in first person. what is it for? how do you use it? use skogai-routing for the general layout and add any other relevant details about how you organize your files, what kind of content you keep here, and how it fits into your overall workflow etc]

</what_is_this>

<structure>

- @.skogai/ — SkogAI-integration and routing via @.skogai/CLAUDE.md
  - [@todo:please add more here]
  - [@todo:please add more here]

</structure>

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
