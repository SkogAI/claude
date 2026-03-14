# Pitfalls Research

**Domain:** Claude Code skill/plugin development — context-agnostic tutorial plugin
**Researched:** 2026-03-14
**Confidence:** HIGH (derived from direct codebase analysis + authoritative skill-creator documentation)

---

## Critical Pitfalls

### Pitfall 1: Writing Skills for Large Contexts Only

**What goes wrong:**
Skills bloat SKILL.md past 500 lines because authors put all reference material, workflow details, and examples inline. A small-context agent (8K–32K tokens) loads the skill and immediately burns through most of its context budget on the skill file itself, leaving no room to do actual work. The agent either hallucinates or refuses the task.

**Why it happens:**
Authors write skills for themselves — they have the full context window and assume the agent does too. Inline examples feel "helpful." The 500-line guideline is known but treated as a suggestion.

**How to avoid:**
Treat SKILL.md as a router, not a document. Keep it under 500 lines. Move everything except essential principles and the routing table to `references/`, `workflows/`, and `templates/`. Each sub-file is loaded only when needed. A small-context agent reads only what the current step requires, not the entire skill corpus.

**Warning signs:**
- SKILL.md exceeds 300 lines during authoring
- Workflow steps are embedded inline rather than in `workflows/`
- The file contains full examples, schemas, or reference tables inline
- A fresh agent says "I need more context" immediately after invoking the skill

**Phase to address:** Phase 1 (skogai-routing cleanup) — establish the pattern before writing tutorial content

---

### Pitfall 2: Conflating "Filesystem as Memory" with GSD Planning Artifacts

**What goes wrong:**
`planning-with-files` and GSD's `.planning/` system both write to disk, but they serve different audiences. GSD phases, ROADMAP.md, and STATE.md are orchestrator artifacts — they describe the project. The "RAM-file" pattern (`task_plan.md`, `progress.md`, `findings.md`) is agent working memory — it describes the current session's mental state. Merging them produces files that are neither good project records nor good working memory.

**Why it happens:**
Both patterns sound like "write things down." The distinction between "project state" and "agent working memory" is subtle and gets collapsed during cleanup.

**How to avoid:**
Keep them separate by purpose and location. GSD writes to `.planning/`. Agent working memory writes to `.skogai/plan/<project>/`. When absorbing `planning-with-files` into the tutorial, preserve only what GSD doesn't cover: the RAM-file pattern for mid-session orientation. Discard anything GSD already does (phase tracking, commit records, verification).

**Warning signs:**
- A file exists in both `.planning/` and `.skogai/plan/` describing the same thing
- An agent reads `task_plan.md` to understand what GSD phase it's in
- A workflow tells agents to update ROADMAP.md for session-level notes

**Phase to address:** Phase 1 (absorbing planning-with-files) — decide what to keep vs. discard before writing tutorial content

---

### Pitfall 3: Hardcoded `@` Reference Paths That Break When Skills Move

**What goes wrong:**
Workflows and agent files use absolute-style paths like `@./.claude/get-shit-done/references/...` or `@./.claude/skills/skogai-routing/references/...`. When a skill is packaged as a plugin and installed at `~/.claude/`, those paths no longer resolve. Silent failure — the reference just doesn't load.

**Why it happens:**
Skills are developed in place at `~/claude/.claude/skills/` via symlink. Everything works during development. The path assumption gets baked in. Plugin packaging doesn't catch it.

**How to avoid:**
Within a skill, use relative paths. `./references/foo.md` resolves relative to the skill's directory regardless of where it's installed. Only use absolute paths for cross-skill references, and document them explicitly as external dependencies. Validate all `@`-references before packaging.

**Warning signs:**
- A workflow file contains `@./.claude/skills/` in any `@` reference
- A skill file references another skill's internals by path
- Moving the skill directory breaks any workflow step

**Phase to address:** Phase 1 (cleaning existing skills) — audit all four skills before creating plugin shell

---

### Pitfall 4: Description Field Under-Triggering

**What goes wrong:**
The `description` field in SKILL.md frontmatter is the primary mechanism Claude uses to decide whether to invoke a skill. Vague or narrow descriptions cause under-triggering — the tutorial skill never fires even when appropriate. Agents proceed without the skill's guidance and produce inconsistent results.

**Why it happens:**
Authors write descriptions for humans ("this skill does X"). Claude's triggering decision is pattern-matched against user intent. The description needs to name the contexts, not just the capability.

**How to avoid:**
Write descriptions that are "a little bit pushy" (per skill-creator documentation). Include the contexts AND the capability. For the tutorial plugin: name what a user would say when they want to learn the workflow, set up the workspace, or understand the SkogAI pattern. Include synonyms for common intents ("set up", "install", "learn", "follow the tutorial").

**Warning signs:**
- Description is one sentence naming only what the skill does
- Description does not mention specific user contexts or phrases
- Running a trigger eval with 10 realistic user prompts fires the skill fewer than 7 times

**Phase to address:** Phase 2 (plugin shell setup) — write the description last, after the skill content is stable, and run description optimization

---

### Pitfall 5: State Mutation Without Coordination in Parallel Agent Spawning

**What goes wrong:**
GSD workflows spawn multiple agents in parallel (e.g., four codebase-mapper agents). Each agent writes to `.planning/codebase/` concurrently. If two agents write to the same file at the same time, last-write-wins and data is silently lost. With `fs.readFileSync`/`writeFileSync` and no file locking (confirmed in `state.cjs`), this is not theoretical.

**Why it happens:**
The pattern is architecturally sound — agents write to different files. But during skill cleanup, if two phases both update STATE.md or ROADMAP.md, collisions occur. Parallel sub-agent spawning for tutorial validation could trigger this.

**How to avoid:**
When designing tutorial workflows that spawn agents: ensure each agent writes to a distinct file or section. Document the file-ownership rule explicitly. For any shared-state writes (STATE.md, ROADMAP.md), serialize: write sequentially, not in parallel. Don't spawn verification agents for the same output file in parallel.

**Warning signs:**
- A workflow spawns two agents both updating STATE.md
- A tutorial chapter that verifies multiple skills spawns parallel agents writing to the same summary file
- SUMMARY.md appears truncated or missing sections after multi-agent execution

**Phase to address:** Phase 1 (understanding GSD constraints before designing tutorial workflows)

---

### Pitfall 6: Building Tutorial Content Before Establishing the Pattern

**What goes wrong:**
Tutorial chapters are written before the skills they teach are clean and stable. Chapter 1 teaches `skogai-routing`, but if `skogai-routing` still has inconsistencies (mixed markdown/XML structure, oversized files), the tutorial either teaches the bad pattern or is immediately out of date when the skill is fixed.

**Why it happens:**
Tutorial writing and skill cleanup feel like separate tasks. The instinct is to parallelize them for speed. But the tutorial content is downstream of the skill quality.

**How to avoid:**
Treat skill cleanup as a hard prerequisite for tutorial content. Phase 1: clean and stabilize the four skills. Phase 2: write the plugin shell. Phase 3: write Chapter 1 content. Do not write tutorial prose that describes skill internals until those internals are final.

**Warning signs:**
- Tutorial text references specific file paths or line numbers in a skill
- Chapter content is being drafted while skill cleanup PRs are still open
- "We'll clean this up later" appears in tutorial draft comments

**Phase to address:** Entire project — this is a sequencing constraint, not a single-phase fix

---

## Technical Debt Patterns

| Shortcut | Immediate Benefit | Long-term Cost | When Acceptable |
|----------|-------------------|----------------|-----------------|
| Inline workflow steps in SKILL.md | Fewer files to manage | Blocks small-context agents; hard to update | Never — split into workflows/ regardless |
| Copy `planning-with-files` wholesale without triage | Preserves everything | Duplicates GSD artifacts; confuses agents about which system to use | Never for the final plugin |
| Skip trigger eval for tutorial description | Saves iteration time | Tutorial never fires for new users; adoption fails silently | Never — run at least a manual trigger check |
| Write tutorial referencing `~/.claude/` absolute paths | Works locally during dev | Breaks on any other install; not redistributable | Local dev only, never in committed plugin content |
| Use markdown headings instead of XML tags in skills | Easier to write | Claude parses XML more reliably; markdown headings in skills violate the pattern being taught | Never in skogai-* skills — the tutorial teaches XML structure |

---

## Integration Gotchas

| Integration | Common Mistake | Correct Approach |
|-------------|----------------|------------------|
| GSD state.cjs + parallel agents | Two agents updating STATE.md in parallel | Assign each agent a distinct output file; serialize STATE.md writes |
| skill-creator eval loop + skogai-routing | Running skill-creator evals against a skill mid-cleanup produces misleading scores | Freeze the skill before running evals; don't iterate on evals and skill content simultaneously |
| planning-with-files `.skogai/plan/` + GSD `.planning/` | Agents writing session notes into `.planning/phases/` where GSD tools parse structure | Keep agent RAM-files in `.skogai/plan/`, never in `.planning/` |
| Plugin install path + `@`-references | References valid at `~/.local/src/` but not at `~/.claude/skills/` | Use only relative paths within skill directories |
| GSD hooks (gsd-context-monitor.js) + temp file cleanup | `/tmp/claude-ctx-*` cleared; context warnings silently stop firing | Hooks must tolerate missing temp files; treat absence as "no prior state" not error |

---

## Performance Traps

| Trap | Symptoms | Prevention | When It Breaks |
|------|----------|------------|----------------|
| Loading entire skill corpus for a simple task | Agent context fills before doing any real work; 8K agents always fail | Progressive disclosure: SKILL.md under 500 lines, load only the relevant workflow | Any agent under ~32K context |
| Re-reading `task_plan.md` every tool call | Excessive context consumption on every step | Re-read only at phase boundaries or after a context reset, not every action | High-frequency tool-call workflows |
| Monolithic SKILL.md as a reference dump | Every invocation burns context on material irrelevant to the current task | Split: `references/` for deep knowledge, `SKILL.md` only for routing + principles | Any context size — wasteful even at 200K |
| Agent spawning for tasks that don't need it | Overhead per spawn; timing dependencies without explicit DAG | Use inline execution for single-step tasks; spawn only for parallel independent work | N/A — design smell regardless of scale |

---

## "Looks Done But Isn't" Checklist

- [ ] **Skill cleanup:** Verify each skill has no `#` markdown headings in the body — only XML tags. Check with `grep -n "^#" SKILL.md`.
- [ ] **Progressive disclosure:** Verify SKILL.md is under 500 lines. Any workflow step that requires >10 lines of instruction should be in `workflows/`.
- [ ] **Relative paths only:** Verify no `@` references in skills contain `/home/`, `~/.claude/`, or `~/.local/src/`. Run `grep -r "~/.claude" .claude/skills/skogai-*/`.
- [ ] **Plugin shell structure:** Verify plugin directory has `manifest.json` (or equivalent) before writing any chapter content into it.
- [ ] **planning-with-files absorption:** Verify the three RAM-files (`task_plan.md`, `findings.md`, `progress.md`) are preserved in concept but that the `.skogai/plan/` location is documented as distinct from `.planning/`.
- [ ] **Description trigger test:** Verify tutorial plugin description fires on at least 5 of these phrases: "learn skogai", "set up workspace", "chapter 1", "tutorial", "workflow setup", "SkogAI pattern".
- [ ] **Skill name/directory alignment:** Verify each skill's `name` frontmatter matches its directory name exactly — mismatch causes silent routing failures.

---

## Recovery Strategies

| Pitfall | Recovery Cost | Recovery Steps |
|---------|---------------|----------------|
| SKILL.md too large, small-context agents failing | MEDIUM | Extract content into `references/` and `workflows/` files; update SKILL.md routing table; test with a simulated 8K budget by counting lines loaded |
| Broken `@` references after skill move | LOW | `grep -r "@./.claude/skills" .` to find all references; replace with relative paths; retest all workflows |
| planning-with-files merged into GSD artifacts | HIGH | Separate by re-reading both systems; identify which files serve which purpose; move agent RAM-files back to `.skogai/plan/`; update all references |
| Tutorial content describes unstable skill internals | MEDIUM | Freeze skill first; audit all tutorial prose for path or structure references; update tutorial after each skill change |
| State collision from parallel agents | HIGH | Identify which agents share output files; redesign to serialize or split output targets; test with actual parallel execution |

---

## Pitfall-to-Phase Mapping

| Pitfall | Prevention Phase | Verification |
|---------|------------------|--------------|
| Skills written for large contexts only | Phase 1: Skill cleanup | SKILL.md line count < 500; test with 8K agent simulation |
| planning-with-files / GSD conflation | Phase 1: Absorb planning-with-files | No overlap between `.planning/` and `.skogai/plan/` for same content |
| Hardcoded `@` reference paths | Phase 1: Skill cleanup | `grep -r "~/.claude" .claude/skills/` returns empty |
| Description under-triggering | Phase 2: Plugin shell | Manual trigger eval passes 7/10 realistic prompts |
| Parallel agent state collision | Phase 1 (design constraint) | All spawned agents in tutorial workflows write to distinct files |
| Tutorial content before stable skills | Sequencing constraint (all phases) | No tutorial prose written until skill cleanup phase closes |

---

## Sources

- Direct codebase analysis: `.planning/codebase/CONCERNS.md` (2026-03-14)
- `skill-creator` SKILL.md — Anthropic's official skill authoring guidance (progressive disclosure, description triggering, 500-line limit, eval loop)
- `skogai-routing` SKILL.md — Router pattern, XML structure requirements, progressive disclosure math
- `planning-with-files` SKILL.md — RAM-file pattern, 3-file system, Manus principles
- `.planning/codebase/ARCHITECTURE.md` — Agent spawning model, state management flow, symlink lifecycle

---
*Pitfalls research for: Claude Code skill/plugin development (SkogAI Skills Chapter 1)*
*Researched: 2026-03-14*
