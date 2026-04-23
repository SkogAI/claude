MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/claude <claude@noreply.github.com>
Date: Thu, 05 Mar 2026 21:42:20 -0800
Subject: Re: [SkogAI/claude] feat(.skogai): establish base layout and routing structure (PR #26)
Message-ID: <SkogAI/claude/pull/26/review/3901446764@github.com>
In-Reply-To: <SkogAI/claude/pull/26@github.com>
References: <SkogAI/claude/pull/26@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69aa693ca19bd_a011103123c9"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR establishes a clean base layout and routing structure for the `.skogai/` project intelligence directory and adds a new `skills/skogai-routing` skill for Claude Code tooling.

**Changes:**
- Reorganizes `.skogai/` — moves `context/` and `decisions.md` under a new `memory/` namespace, migrates loose templates into `templates/`, and renames all `SKOGAI.md` → `CLAUDE.md` throughout so Claude Code auto-loads them
- Updates CLAUDE.md routing tables to reflect the new paths and aligns them with skogai-routing principles (XML `<routing>` tables, progressive disclosure)
- Adds the `skills/skogai-routing` skill: a full router-pattern skill with 9 workflows, 10 reference files, and 2 templates teaching how to author, audit, and maintain skills

### Reviewed changes

Copilot reviewed 63 out of 66 changed files in this pull request and generated 6 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `CLAUDE.md` | Updates routing table for new `memory/` paths; structure diagram still references old paths |
| `.skogai/CLAUDE.md` | Rewrites root router with new `<routing>` table pointing to `memory/`, `knowledge/`, `journal/`, `templates/` |
| `.skogai/memory/CLAUDE.md` | New memory sub-router |
| `.skogai/memory/decisions.md` | Moved from root with new date header; carries broken line formatting |
| `.skogai/memory/context/current.md` | Placeholder for generated context |
| `.skogai/knowledge/CLAUDE.md` | Replaces `SKOGAI.md`, adds frontmatter requirements and routing |
| `.skogai/knowledge/patterns/style/CLAUDE.md` | Replaces `SKOGAI.md` with essential-principles and routing table |
| `.skogai/templates/CLAUDE.md` | New template index |
| `.skogai/templates/*.md` | Three starter templates (decision-record, knowledge-entry, project-status) |
| `.skogai/SKOGAI.md` | Reduced to a one-line redirect to `CLAUDE.md` |
| `.skogai/knowledge/SKOGAI.md` | Deleted (replaced by `CLAUDE.md`) |
| `.skogai/decisions.md` | Deleted (moved to `memory/`) |
| `.skogai/context/current.md` | Deleted (moved to `memory/context/`) |
| `.skogai/knowledge-entry.md` | Deleted (moved to `templates/`) |
| `skills/skogai-routing/SKILL.md` | New router skill — intake missing routing for option 5 |
| `skills/skogai-routing/workflows/*.md` | Nine new workflow files |
| `skills/skogai-routing/references/*.md` | Ten new reference files; `common-patterns.md` has an orphaned closing XML tag |
| `skills/skogai-routing/templates/*.md` | Two new output template files |
</details>






---

💡 <a href="/SkogAI/claude/new/master?filename=.github/instructions/*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -24,7 +24,7 @@ docs/
   claude-code/    # gitignored fetched docs (run fetch-docs.sh to populate)
 .skogai/
   knowledge/      # decisions/, learnings/, patterns/style/ — accumulated conventions
-  context/        # current.md — active work state across sessions
+  context/        # current.md — generated from journal + decisions (not manually edited)

The `<structure>` block in `CLAUDE.md` still shows `.skogai/context/` at line 27, but this PR moves the context file to `.skogai/memory/context/`. The routing table at line 59 is correctly updated to `@.skogai/memory/context/current.md`, but the structure diagram still references the old path. This will confuse anyone reading the structure overview.

> @@ -24,7 +24,7 @@ docs/
   claude-code/    # gitignored fetched docs (run fetch-docs.sh to populate)
 .skogai/
   knowledge/      # decisions/, learnings/, patterns/style/ — accumulated conventions
-  context/        # current.md — active work state across sessions
+  context/        # current.md — generated from journal + decisions (not manually edited)
   decisions.md    # append-only quick decision log

The `<structure>` block in `CLAUDE.md` still shows `.skogai/decisions.md` at line 28 as a top-level entry, but this PR moves `decisions.md` to `.skogai/memory/decisions.md`. The routing entry at line 60 is already updated to `@.skogai/memory/decisions.md`, but the structure section is inconsistent.

> +- **XML-style tags**: SKOGAI.md
+ files use `<what_is_this>`, `<structure>`, `<when_to_use>` tags for consistency (historical reason: earlier Claude models preferred this format)
+- **@ notation**: Using `@` prefix for references (bootstrap, config) and `$` for variables/state
+- **@ is source of truth**: `@/path` expands real files at prompt-time; Read tool often uses cached files
+- **@ in SKOGAI.md
+**: Always use `@` references for context that must be current - bypasses cache layer

Lines 6-7 and 10-11 of `.skogai/memory/decisions.md` have line breaks mid-sentence inside bullet items: `"- **XML-style tags**: SKOGAI.md\n files use..."` and `"- **@ in SKOGAI.md\n**: Always use..."`. These broken lines were carried from the old `.skogai/decisions.md` and should be fixed to produce readable entries. The old file had the same problem, so this is a missed opportunity to clean it up.

> +<principle>
+Choose one term and use it throughout the skill. Inconsistent terminology confuses Claude and reduces execution quality.
+</principle>
+
+<good_example>
+Consistent usage:
+
+- Always "API endpoint" (not mixing with "URL", "API route", "path")
+- Always "field" (not mixing with "box", "element", "control")
+- Always "extract" (not mixing with "pull", "get", "retrieve")
+
+```xml
+<objective>
+Extract data from API endpoints using field mappings.
+</objective>
+
+<quick_start>
+1. Identify the API endpoint
+2. Map response fields to your schema
+3. Extract field values
+</quick_start>
+```
+
+</good_example>
+
+<bad_example>
+Inconsistent usage creates confusion:
+
+```xml
+<objective>
+Pull data from API routes using element mappings.
+</objective>
+
+<quick_start>
+1. Identify the URL
+2. Map response boxes to your schema
+3. Retrieve control values
+</quick_start>
+```
+
+Claude must now interpret: Are "API routes" and "URLs" the same? Are "fields", "boxes", "elements", and "controls" the same?
+</bad_example>
+
+<implementation>
+1. Choose terminology early in skill development
+2. Document key terms in `<objective>` or `<context>`
+3. Use find/replace to enforce consistency
+4. Review reference files for consistent usage
+</implementation>
+</consistent_terminology>

In `skills/skogai-routing/references/common-patterns.md`, the closing tag `</consistent_terminology>` (line 173) has no matching opening `<consistent_terminology>` tag. The block starting around line 124 (the `<principle>` about choosing one term) is missing its outer XML wrapper tag. This orphaned closing tag will cause confusion and breaks the "pure XML structure" principle that this very skill is teaching.

> +<intake>
+What would you like to do?
+
+1. Create new skill
+2. Audit/modify existing skill
+3. Add component (workflow/reference/template/script)
+4. Get guidance
+5. Use the routing patterns in your general workflow
+
+If intent is clear from context, route directly. Otherwise, ask.
+</intake>

The `<routing>` table in `skills/skogai-routing/SKILL.md` includes intake option 5 ("Use the routing patterns in your general workflow") but the routing table below has no corresponding row for it. Users selecting option 5 will receive no guidance on what to read or do next. A routing entry (such as pointing to `references/recommended-structure.md` or `references/core-principles.md`) should be added for completeness.

> +<routing>
+| Response | Next Action | Workflow |
+|----------|-------------|----------|
+| 1, "create", "new", "build" | Ask: "Task-execution skill or domain expertise skill?" | Route to appropriate create workflow |
+| 2, "audit", "modify", "existing" | Ask: "Path to skill?" | Route to appropriate workflow |
+| 3, "add", "component" | Ask: "Add what? (workflow/reference/template/script)" | workflows/add-{type}.md |
+| 4, "guidance", "help" | General guidance | workflows/get-guidance.md |
+
+**Progressive disclosure for option 1 (create):**
+
+- Need to create a "Task-execution skill"? → workflows/create-new-skill.md
+- Looking for "Domain expertise skill"? → workflows/create-domain-expertise-skill.md
+
+**Progressive disclosure for option 3 (add component):**
+
+- Workflow → workflows/add-workflow.md
+- Reference → workflows/add-reference.md
+- Template → workflows/add-template.md
+- Script → workflows/add-script.md
+
+**Intent-based routing (if user provides clear intent without selecting menu):**
+
+- "audit this skill", "check skill", "review" → workflows/audit-skill.md
+- "verify content", "check if current" → workflows/verify-skill.md
+- "create domain expertise", "exhaustive knowledge base" → workflows/create-domain-expertise-skill.md
+- "create skill for X", "build new skill" → workflows/create-new-skill.md
+- "add workflow", "add reference", etc. → workflows/add-{type}.md
+- "upgrade to router" → workflows/upgrade-to-router.md
+
+**After reading the workflow, follow it exactly.**
+</routing>

The `<routing>` table in `skills/skogai-routing/SKILL.md` (line 84) does not include a routing entry for intake option 5: "Use the routing patterns in your general workflow." All other options (1-4) have corresponding routing entries, but option 5 is missing. An agent selecting option 5 will have no guidance on where to go next.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/claude/pull/26#pullrequestreview-3901446764
You are receiving this because you authored the thread.

Message ID: <SkogAI/claude/pull/26/review/3901446764@github.com>