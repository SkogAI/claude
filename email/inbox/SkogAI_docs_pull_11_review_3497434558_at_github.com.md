MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/docs <docs@noreply.github.com>
Date: Sat, 22 Nov 2025 22:32:20 -0800
Subject: Re: [SkogAI/docs] Add detailed migration plan for repository restructure=0A=0A8-phase plan to consolidate agents, reorganize lore, create governance=0Asection, centralize technical docs and prompts, and clean up workspace.=0AIncludes specific file move commands and verification checklist. (PR #11)
Message-ID: <SkogAI/docs/pull/11/review/3497434558@github.com>
In-Reply-To: <SkogAI/docs/pull/11@github.com>
References: <SkogAI/docs/pull/11@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6922aa7459128_f011001043144"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds comprehensive documentation for the SkogAI repository restructure initiative. It provides both an inventory of the current state and a detailed migration plan to consolidate and reorganize the documentation.

**Key Changes:**
- Complete inventory of the current repository structure with descriptions of ~450+ files across 100+ directories
- 8-phase migration plan to reorganize agents, lore, governance, technical documentation, prompts, and workspace areas
- Verification checklist to ensure migration completeness

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 15 comments.

| File | Description |
| ---- | ----------- |
| REPOSITORY-INDEX.md | Comprehensive inventory documenting the current state of the SkogAI documentation repository, including file trees, summaries, and statistics |
| MIGRATION-PLAN.md | Detailed 8-phase migration plan with bash commands to restructure the repository, including target structure, migration order recommendations, and verification checklist |





---

💡 <a href="/SkogAI/docs/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +mv memory/ansible/ technical/ansible/
+```
+
+### technical/cloudflare/
+```bash
+mv memory/inventory/ technical/cloudflare/
+mv memory/guides/Cloudflare\ MCP\ Setup\ Guide*.md technical/cloudflare/
+```
+
+### technical/dev/
+```bash
+mv memory/dev/ technical/dev/
+```
+
+---
+
+## Phase 5: Centralize Prompts
+
+```bash
+# Main prompts directory - keep structure but organize
+# Move agent-specific prompts to agents/ (done in Phase 1)
+
+# Organize remaining prompts
+mkdir -p prompts/system prompts/tools prompts/meta
+
+# System prompts
+mv prompts/claude.md prompts/system/
+mv prompts/librarian.md prompts/system/
+mv prompts/documentation-manager.md prompts/system/
+mv prompts/skogai-xml.md prompts/system/
+
+# Tool prompts
+mv prompts/%*.md prompts/tools/
+mv prompts/argc-creator.md prompts/tools/
+mv prompts/tool-*.md prompts/tools/
+mv prompts/neovim-manager.md prompts/tools/
+
+# Meta prompts
+mv prompts/metaprompt*.md prompts/meta/
+mv prompts/prompt-creator.md prompts/meta/
+mv prompts/skogai-prompt-creator.md prompts/meta/
+mv prompts/character-*.md prompts/meta/
+
+# Notation/conversion
+mv prompts/convert-to-skogai-*.md prompts/tools/
+mv prompts/skogai-notation.md prompts/tools/
+```
+
+---
+
+## Phase 6: Historical & Archives
+
+### historical/important-moments/
+```bash
+mv important-moments/ historical/important-moments/
+```
+
+### historical/archived/
+```bash
+# Old lore experiments (moved in Phase 2)
+# Analysis documents
+mv analysis/ historical/analysis/
+
+# Old archives content
+mv archives/notes/ historical/archived/notes/
+mv archives/logs/ historical/archived/logs/
+mv archives/reports/ historical/archived/reports/
+```
+
+---
+
+## Phase 7: Workspace & Cleanup
+
+### _workspace/
+```bash
+mkdir -p _workspace/drafts _workspace/review _workspace/logs
+
+mv archives/drafts/ _workspace/drafts/
+mv to-be-looked-over/ _workspace/review/
+mv logs/ _workspace/logs/
+```
+
+### Delete/Remove
+```bash
+# Duplicate mirrors
+rm -rf curated/home/skogix/skogai/docs/
+rm -rf curated/home/skogix/skogai/data/node_modules/
+
+# Empty directories after moves
+rm -rf archives/profiles/
+rm -rf archives/system/
+rm -rf archives/lore/
+rm -rf archives/tracking/  # after moving relevant files
+rm -rf official/  # after moving all content
+rm -rf profiles/  # after moving to agents/
+
+# Session data (consider gitignoring instead)
+# .claude/data/sessions/ - may want to keep but gitignore
+# .aichat-sessions/ - may want to keep but gitignore
+```

Consider using `git mv` instead of `mv` for all file operations. This preserves git history and makes the changes easier to review and rollback. If this is intentional use of `mv`, document why `git mv` is not being used.

> +```bash
+mv lore/goose/*.md agents/goose/memory-blocks/
+mv lore/personas/Goose\ Character\ Profile\ Summary.md agents/goose/
+```
+
+### agents/intern/
+```bash
+mv profiles/intern.md agents/intern/profile.md
+mv profiles/intern/ agents/intern/
+mv official/intern-001-provisional-mandate.md agents/intern/mandate.md
+```
+
+### agents/automation/
+```bash
+mv agents/documentation/ agents/automation/documentation/
+mv agents/git-commiter.md agents/automation/

Typo in filename: "git-commiter.md" should be "git-committer.md" (double 't'). This should match the corrected filename from the repository.
```suggestion
mv agents/git-committer.md agents/automation/
```

> +```
+
+### technical/notation/
+```bash
+mv memory/ontology/ technical/notation/
+```
+
+### technical/ansible/
+```bash
+mv memory/ansible/ technical/ansible/
+```
+
+### technical/cloudflare/
+```bash
+mv memory/inventory/ technical/cloudflare/
+mv memory/guides/Cloudflare\ MCP\ Setup\ Guide*.md technical/cloudflare/

The escaped space in the wildcard pattern `Cloudflare\ MCP\ Setup\ Guide*.md` may cause issues with shell expansion. Consider using quotes: `"Cloudflare MCP Setup Guide"*.md` or `"Cloudflare MCP Setup Guide"*` to ensure proper matching.
```suggestion
mv memory/guides/"Cloudflare MCP Setup Guide"*.md technical/cloudflare/
```

> +```
+
+---
+
+## Phase 1: Consolidate Agents
+
+### agents/amy/
+```bash
+# Profile
+mv archives/profiles/amy.md agents/amy/profile.md
+
+# Memory blocks
+mv lore/amy/*.md agents/amy/memory-blocks/
+
+# Related content
+mv lore/personas/Amy\ Character\ Profile\ Summary.md agents/amy/

File paths with spaces (e.g., `Amy\ Character\ Profile\ Summary.md`) should be quoted to handle edge cases and improve readability. Consider using `"Amy Character Profile Summary.md"` instead of escaped spaces throughout the migration plan.
```suggestion
mv "lore/personas/Amy Character Profile Summary.md" agents/amy/
```

> +mv archives/drafts/ _workspace/drafts/
+mv to-be-looked-over/ _workspace/review/
+mv logs/ _workspace/logs/
+```
+
+### Delete/Remove
+```bash
+# Duplicate mirrors
+rm -rf curated/home/skogix/skogai/docs/
+rm -rf curated/home/skogix/skogai/data/node_modules/
+
+# Empty directories after moves
+rm -rf archives/profiles/
+rm -rf archives/system/
+rm -rf archives/lore/
+rm -rf archives/tracking/  # after moving relevant files

The comment suggests deleting `archives/tracking/` but in Phase 3 (line 173-174) files are moved from this directory. If not all files are moved, this could result in unintended data loss. Either ensure all files are moved or document which files should remain and be deleted.
```suggestion
rm -rf archives/tracking/  # ONLY after moving all files out; ensure directory is empty to avoid data loss
```

> +```bash
+# Keep existing lore/skogix/ structure
+# Move additional skogix content
+mv lore/skogix-notation.md lore/skogix/
+mv lore/skogix-poet.md lore/skogix/
+mv archives/profiles/skogix.md lore/skogix/profile.md
+```
+
+### lore/ root cleanup
+```bash
+# Move Amy-specific to agents
+mv lore/amy_ravenwolf_blog.md agents/amy/
+mv lore/amy1.yml agents/amy/
+
+# Move system-related
+mv lore/systems/ technical/systems/

Moving `lore/systems/` to `technical/systems/` but the target directory structure shows `technical/` should contain specific subdirectories (architecture, memory-system, notation, ansible, cloudflare) without a generic `systems/` directory. Consider whether this should go into an existing subdirectory or if the target structure needs updating.
```suggestion
# Move each file/subdirectory from lore/systems/ to the appropriate technical/ subdirectory
mv lore/systems/architecture.md technical/architecture/
mv lore/systems/memory.md technical/memory-system/
mv lore/systems/notation.md technical/notation/
mv lore/systems/ansible/ technical/ansible/
mv lore/systems/cloudflare.md technical/cloudflare/
# (Add more lines as needed for other files in lore/systems/)
```

> +---
+
+## Phase 1: Consolidate Agents
+
+### agents/amy/
+```bash
+# Profile
+mv archives/profiles/amy.md agents/amy/profile.md
+
+# Memory blocks
+mv lore/amy/*.md agents/amy/memory-blocks/
+
+# Related content
+mv lore/personas/Amy\ Character\ Profile\ Summary.md agents/amy/
+mv archives/lore/amy_lore_mandate.md agents/amy/
+```

The `mv` command will fail if the target directory `agents/amy/` doesn't exist. Consider adding `mkdir -p agents/amy/memory-blocks/` before moving files, or document that directories should be created first.

> +## Phase 2: Reorganize Lore
+
+### lore/origin/
+```bash
+mv lore/SKOGAI.md lore/origin/
+mv lore/base-origin-story.md lore/origin/
+mv lore/skogai-lore.md lore/origin/
+mv lore/skogai-lore-master-knowledge.md lore/origin/
+mv lore/skogai-lore-backup.md lore/origin/
+mv lore/original-skogai-character-card-*.md lore/origin/
+mv lore/original-skogix-cyberpunk-character-card-*.md lore/origin/
+```
+
+### lore/events/
+```bash
+mv lore/events/*.md lore/events/  # already there

The command `mv lore/events/*.md lore/events/` is a no-op (moving files from a directory to the same directory). This should either be removed or clarified if the intention is different.
```suggestion
# All .md files are already in lore/events/, no move needed
```

> +```bash
+mv archives/profiles/dot.md agents/dot/profile.md
+mv lore/dot/*.md agents/dot/memory-blocks/
+mv lore/personas/Dot\ Character\ Profile\ Summary.md agents/dot/
+```
+
+### agents/goose/
+```bash
+mv lore/goose/*.md agents/goose/memory-blocks/
+mv lore/personas/Goose\ Character\ Profile\ Summary.md agents/goose/
+```
+
+### agents/intern/
+```bash
+mv profiles/intern.md agents/intern/profile.md
+mv profiles/intern/ agents/intern/

Moving `profiles/intern/` to `agents/intern/` will merge the directory contents, but if there are files with the same name in both locations, the `mv` command behavior may vary by system. Consider explicitly handling potential conflicts or using `cp -r` followed by verification before removing the source.
```suggestion
cp -rn profiles/intern/. agents/intern/
# Verify the contents of agents/intern/ and resolve any conflicts if necessary
rm -r profiles/intern/
```

> @@ -0,0 +1,364 @@
+# Documentation Repository Migration Plan
+

The migration plan is missing important preliminary information: prerequisites (e.g., ensure git status is clean), backup instructions, and whether these commands should be run from the repository root. Adding this context at the beginning would make the plan more actionable and safer to execute.
```suggestion

## Prerequisites and Safety Instructions

Before proceeding with this migration, please ensure the following:

1. **Clean Working Directory:**  
   Ensure your git working directory is clean. Commit or stash any changes before starting.  
   ```sh
   git status
   ```

2. **Backup:**  
   Make a backup of your repository or the relevant files. You can create a new branch or copy the repository directory.  
   ```sh
   git checkout -b backup/migration-prep
   # or manually copy the repository directory
   ```

3. **Run from Repository Root:**  
   Unless otherwise specified, run all commands from the root of the repository.

4. **Required Tools:**  
   Ensure you have all necessary tools installed (e.g., git, any migration scripts, etc.).

---
```

> +│   ├── notification.json         # Agent notification logs
+│   ├── post_tool_use.json        # Post-tool-use event logs
+│   ├── pre_tool_use.json         # Pre-tool-use event logs
+│   ├── status_line.json          # Status line update logs
+│   ├── stop.json                 # Agent stop event logs
+│   ├── subagent_stop.json        # Sub-agent stop event logs
+│   └── user_prompt_submit.json   # User prompt submission logs
+│
+└── prompts/
+    ├── code-documentor.md        # System prompt for the code documentation agent
+    ├── lore-keeper.md            # System prompt for the lore/history documentation agent
+    └── memory-indexer.md         # System prompt for the knowledge base indexing agent
+```
+
+```
+└── git-commiter.md               # Documentation/prompt for a git commit automation agent

Typo in filename: "git-commiter.md" should be "git-committer.md" (double 't'). This appears to be the actual filename based on the description "Documentation/prompt for a git commit automation agent".
```suggestion
└── git-committer.md              # Documentation/prompt for a git commit automation agent
```

> +- Search for broken internal links
+- Update any hardcoded paths in scripts

The "Update references" section mentions searching for broken links and updating hardcoded paths in scripts, but provides no specific guidance on how to do this or which tools to use. Consider adding concrete commands (e.g., `grep -r "old/path" .` or specific script names that need updating).
```suggestion
- Search for broken internal links
  - Example: Use `grep` to find Markdown links that may be broken after moving files:
    ```bash
    grep -rE '\[.*\]\((?!http)([^)]+)\)' docs/ | grep -vE '(/media/|/generated/)' # Find all internal Markdown links
    # Optionally, use a Markdown link checker tool, e.g. markdown-link-check
    ```
- Update any hardcoded paths in scripts
  - Example: Search for old directory paths in scripts and update them:
    ```bash
    grep -r 'curated/' scripts/
    grep -r 'lore/' scripts/
    # Update any scripts referencing old paths, e.g. scripts/build_docs.sh, scripts/deploy.sh
    ```
```

> +mv lore/amy/*.md agents/amy/memory-blocks/
+
+# Related content
+mv lore/personas/Amy\ Character\ Profile\ Summary.md agents/amy/
+mv archives/lore/amy_lore_mandate.md agents/amy/
+```

The wildcard `mv lore/amy/*.md agents/amy/memory-blocks/` will fail if `agents/amy/memory-blocks/` doesn't exist. This pattern is repeated throughout the migration plan. Consider documenting that all target directories must be created before executing move commands, or include `mkdir -p` commands for each section.

> +rm -rf curated/home/skogix/skogai/docs/
+rm -rf curated/home/skogix/skogai/data/node_modules/
+
+# Empty directories after moves
+rm -rf archives/profiles/
+rm -rf archives/system/
+rm -rf archives/lore/
+rm -rf archives/tracking/  # after moving relevant files
+rm -rf official/  # after moving all content
+rm -rf profiles/  # after moving to agents/
+
+# Session data (consider gitignoring instead)
+# .claude/data/sessions/ - may want to keep but gitignore
+# .aichat-sessions/ - may want to keep but gitignore
+```

The `rm -rf` commands are destructive and irreversible. Consider adding a warning or suggesting to backup first, or use `git mv` with commits between phases to ensure changes can be rolled back if needed.

> +mv lore/original-skogai-character-card-*.md lore/origin/
+mv lore/original-skogix-cyberpunk-character-card-*.md lore/origin/

The wildcard pattern `original-skogai-character-card-*.md` and similar patterns on line 114 may match multiple files. Consider explicitly listing the files being moved or documenting the expected number of matches to avoid accidentally moving unintended files.
```suggestion
# The following files are expected to match the pattern:
#   - lore/original-skogai-character-card-001.md
#   - lore/original-skogai-character-card-002.md
# (Add or remove files as appropriate)
mv lore/original-skogai-character-card-001.md lore/origin/
mv lore/original-skogai-character-card-002.md lore/origin/
# The following files are expected to match the pattern:
#   - lore/original-skogix-cyberpunk-character-card-001.md
#   - lore/original-skogix-cyberpunk-character-card-002.md
# (Add or remove files as appropriate)
mv lore/original-skogix-cyberpunk-character-card-001.md lore/origin/
mv lore/original-skogix-cyberpunk-character-card-002.md lore/origin/
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/docs/pull/11#pullrequestreview-3497434558
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/docs/pull/11/review/3497434558@github.com>