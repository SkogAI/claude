# Stack Research

**Domain:** Claude Code skill authoring and plugin packaging
**Researched:** 2026-03-14
**Confidence:** HIGH — derived from direct inspection of existing skills, official skill-creator tooling, and validator source code

---

## Recommended Stack

### Core Technologies

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| SKILL.md | n/a | Skill entry point | Always loaded when a skill is invoked. YAML frontmatter + XML body is the canonical format. No alternative. |
| YAML frontmatter | — | Skill metadata | `name` and `description` are required fields. The description is the primary trigger mechanism — Claude decides whether to invoke a skill based on it. |
| XML body structure | — | Skill content organisation | Pure XML (no markdown headings `#`, `##`, `###`) in the body. Semantic tags provide reliable parsing and token efficiency. Markdown formatting is permitted *within* tag content. |
| Markdown (within tags) | — | Content formatting | Used inside XML tag bodies for bold, lists, code blocks, links. Never used as structural headings. |
| Bash / zsh | — | Scripts that Claude executes | Shell scripts in `scripts/` are run directly. Best for environment setup, git operations, and workflow orchestration. |
| Python 3 | system | Evaluation and packaging tooling | `skill-creator` tooling is Python (`package_skill.py`, `quick_validate.py`, `run_eval.py`, `run_loop.py`). Only needed for eval loops and packaging — not for the skill files themselves. |
| Node.js / CommonJS | LTS | Hooks and GSD tooling | Claude Code hooks are `.cjs` files (`gsd-context-monitor.js`, `gsd-statusline.js`). The GSD framework is CommonJS-only. Not used inside skill files. |

### Skill File Format

The canonical skill structure understood by Claude Code:

```
skill-name/               ← directory name must match frontmatter `name`
├── SKILL.md              ← required, always loaded
├── workflows/            ← step-by-step procedures (optional)
│   └── *.md
├── references/           ← domain knowledge, loaded on demand (optional)
│   └── *.md
├── templates/            ← output structures Claude copies and fills (optional)
│   └── *.md
└── scripts/              ← executable code Claude runs as-is (optional)
    └── *.sh / *.py / *.cjs
```

**SKILL.md frontmatter schema** (enforced by `quick_validate.py`):

```yaml
---
name: skill-name           # kebab-case, max 64 chars, matches directory
description: "..."         # third person, max 1024 chars, no angle brackets
compatibility: "..."       # optional, max 500 chars, tool dependencies
allowed-tools: [...]       # optional, tool whitelist
license: "..."             # optional
metadata: {}               # optional, freeform
---
```

**Keys NOT allowed in frontmatter:** `version`, `tools`, `verified`, `lastVerifiedAt` — the `planning-with-files` skill uses these but the official validator (`quick_validate.py`) rejects them as unexpected keys.

### SKILL.md Body Structure

**Simple skill** (one workflow, under ~200 lines):

```xml
---
name: skill-name
description: What it does and when to use it (third person).
---

<objective>What this skill does and why</objective>

<quick_start>Immediate actionable guidance with minimal working example</quick_start>

<process>
Step-by-step procedure
</process>

<success_criteria>How to know it worked</success_criteria>
```

**Complex skill (router pattern)** — use when the skill has multiple distinct workflows or grows beyond ~200 lines:

```xml
---
name: skill-name
description: What it does and when to use it (third person).
---

<essential_principles>
Principles that apply to ALL workflows. Cannot be deferred.
</essential_principles>

<intake>
What do you want to do? (menu or intent detection)
</intake>

<routing>
| Response | Workflow |
|----------|----------|
| keyword  | workflows/option-a.md |
</routing>

<reference_index>
All domain knowledge in references/:
- topic-a.md, topic-b.md
</reference_index>

<workflows_index>
| Workflow | Purpose |
|----------|---------|
| option-a.md | ... |
</workflows_index>
```

### Plugin Packaging

A plugin is a directory of skills registered in `settings.json` via a marketplace entry. The `.skill` file format is a zip archive created by `package_skill.py`.

**Packaging command:**

```bash
python -m scripts.package_skill <path/to/skill-folder> [output-dir]
```

The packager runs `quick_validate.py` first; packaging fails if validation fails.

**What gets excluded** from the `.skill` zip:
- `__pycache__/`, `node_modules/`, `*.pyc`, `.DS_Store`
- `evals/` (at skill root only — not nested)

**Plugin registration** in `settings.json`:

```json
"enabledPlugins": {
  "skill-name@marketplace-name": true
},
"extraKnownMarketplaces": {
  "marketplace-name": {
    "source": {
      "source": "directory",
      "path": "/absolute/path/to/marketplace"
    }
  }
}
```

Skill permissions must be explicitly allowed:

```json
"permissions": {
  "allow": ["Skill(skill-name:*)"]
}
```

### Supporting Libraries

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| bats-core | latest | Shell script testing | When skills include `.sh` scripts that need automated verification |
| PyYAML | system | YAML parsing in validation scripts | Already used by `quick_validate.py` — do not replace |
| Python zipfile | stdlib | `.skill` packaging | Built into Python, no install needed |

### Development Tools

| Tool | Purpose | Notes |
|------|---------|-------|
| `skill-creator` skill | Draft, iterate, test, and optimise skills | Provides eval runner, viewer (`generate_review.py`), benchmark aggregator, description optimiser (`run_loop.py`) |
| `quick_validate.py` | Frontmatter validation before packaging | Checks allowed keys, kebab-case name, description constraints |
| `package_skill.py` | Creates distributable `.skill` zip | Run from `skill-creator/` directory as a module |
| `skogai-routing` skill | Teaches the router pattern | Reference implementation of the router + progressive disclosure approach |
| `skogai-bats-testing` skill | Shell testing patterns | Required when validating `.sh` scripts bundled in skills |

---

## What NOT to Use

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| Markdown headings (`#`, `##`, `###`) in skill body | Breaks XML parsing; not the canonical structure | Semantic XML tags (`<objective>`, `<process>`, etc.) |
| Non-standard frontmatter keys (`version`, `tools`, `verified`, `lastVerifiedAt`) | `quick_validate.py` rejects them with "Unexpected key(s)" error — packaging will fail | Stick to: `name`, `description`, `compatibility`, `allowed-tools`, `license`, `metadata` |
| First/second person in `description` ("I can help you…", "You can use…") | Violates validator expectations; reduces trigger accuracy | Third person: "Processes X and generates Y. Use when…" |
| Deeply nested references (SKILL.md → a.md → b.md) | Claude may only partially read deeply nested files | Keep all references one level from SKILL.md |
| Mixing XML and markdown headings | Creates ambiguous structure | Pure XML throughout, markdown only within tag content |
| Vague skill descriptions ("Helps with documents") | Prevents Claude from discovering and triggering the skill | Specific: what it does + explicit trigger phrases |
| Storing essential principles in reference files | SKILL.md is always loaded; reference files are not | Put unavoidable principles directly in SKILL.md |

---

## Alternatives Considered

| Recommended | Alternative | When to Use Alternative |
|-------------|-------------|-------------------------|
| Pure XML structure in SKILL.md body | Pure markdown headings | Never — XML is the canonical format per `skill-creator` and `skogai-routing` |
| Router pattern (SKILL.md + workflows/ + references/) | Single monolithic SKILL.md | Only for skills under ~200 lines with a single workflow and no distinct domains |
| Python for eval/packaging scripts | Node.js or bash | Python is only used for tooling scripts, not skill content. Bash is fine for skill scripts. Node.js is used only in GSD hooks — not for skill authoring. |
| `evals/evals.json` for test cases | Ad-hoc manual testing | Always use `evals/evals.json` when the skill has verifiable outputs — the `skill-creator` tooling expects this schema |

---

## Stack Patterns by Variant

**If building a simple skill (one domain, one workflow):**
- Use single `SKILL.md` with `<objective>`, `<quick_start>`, `<process>`, `<success_criteria>`
- No subdirectories needed
- Target under 200 lines

**If building a complex skill (multiple workflows or domains):**
- Use router pattern: `SKILL.md` + `workflows/` + `references/`
- SKILL.md: essential principles + intake + routing table
- Each workflow specifies which references to read
- Target SKILL.md under 500 lines; reference files unlimited

**If the skill bundles executable code:**
- Put scripts in `scripts/` subdirectory
- Prefer Python for data-processing scripts (already required for packaging tooling)
- Prefer Bash for environment/git/workflow scripts
- Reference scripts from SKILL.md with explicit invocation instructions

**If the skill is chapter-based (this project):**
- One plugin directory containing multiple skill subdirectories
- Each skill is independently invocable
- Chapter overview skill acts as the router/entry-point
- Register the plugin once in `settings.json`; individual skills are discovered automatically

---

## Version Compatibility

| Component | Compatible With | Notes |
|-----------|-----------------|-------|
| `quick_validate.py` | Python 3.x + PyYAML | No pinned version requirement found; use system Python |
| `.skill` format | Claude Code (any version) | Standard zip file; format is stable |
| `settings.json` plugin schema | Claude Code (current) | `enabledPlugins`, `extraKnownMarketplaces`, `Skill()` permissions all verified in this workspace |

---

## Sources

- `/home/skogix/claude/.claude/skills/skogai-routing/SKILL.md` — authoritative router pattern, structure rules, frontmatter spec (HIGH confidence)
- `/home/skogix/claude/.claude/skills/skill-creator/SKILL.md` — official Anthropic skill authoring guide, progressive disclosure rules, packaging workflow (HIGH confidence)
- `/home/skogix/claude/.claude/skills/skill-creator/scripts/quick_validate.py` — authoritative list of allowed frontmatter keys, validation constraints (HIGH confidence — source code)
- `/home/skogix/claude/.claude/skills/skill-creator/scripts/package_skill.py` — `.skill` zip format, exclusion rules (HIGH confidence — source code)
- `/home/skogix/claude/.claude/skills/skogai-routing/references/skill-structure.md` — XML structure requirements, required tags (HIGH confidence)
- `/home/skogix/claude/.claude/skills/skogai-routing/references/recommended-structure.md` — router pattern templates (HIGH confidence)
- `/home/skogix/claude/.claude/skills/skogai-routing/references/common-patterns.md` — anti-patterns with rationale (HIGH confidence)
- `/home/skogix/claude/.claude/settings.json` — plugin registration format, marketplace config, Skill() permissions (HIGH confidence — live config)
- `/home/skogix/claude/.planning/codebase/STACK.md` — current workspace tech inventory (HIGH confidence)

---

*Stack research for: Claude Code skill authoring and plugin packaging*
*Researched: 2026-03-14*
