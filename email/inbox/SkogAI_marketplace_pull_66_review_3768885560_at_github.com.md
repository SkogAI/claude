MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/marketplace <marketplace@noreply.github.com>
Date: Sat, 07 Feb 2026 21:05:48 -0800
Subject: Re: [SkogAI/marketplace] Claude/claude md mlcxdlndz8c6umb0 hd zoe (PR #66)
Message-ID: <SkogAI/marketplace/pull/66/review/3768885560@github.com>
In-Reply-To: <SkogAI/marketplace/pull/66@github.com>
References: <SkogAI/marketplace/pull/66@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_698819accec19_e3113814975d2"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Adds a new core slash command for generating reusable prompts and significantly expands/restructures the repository’s `CLAUDE.md` to document the plugin marketplace architecture, conventions, and plugin inventory.

**Changes:**
- Added a new core command (`save-prompt`) intended to generalize a conversation into a reusable prompt file.
- Rewrote/expanded `CLAUDE.md` with repository structure, plugin system mechanics, hook formats, and per-plugin reference docs.

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 5 comments.

| File | Description |
| ---- | ----------- |
| plugins/core/commands/save-prompt.md | Introduces a new core slash command to generate and save generalized prompts. |
| CLAUDE.md | Large documentation rewrite describing repo layout, plugin system rules, hooks, and plugin reference info. |





---

💡 <a href="/SkogAI/marketplace/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +name: savePrompt
+description: Generalize the current discussion into a reusable prompt and save it as a file
+tools: ["edit", "search"]

This command frontmatter doesn't match the slash-command schema used elsewhere in this repo: `name:` is not used, and `tools:` should be `allowed-tools:` (see other core commands). As written, tool allowlisting likely won't apply and the `name` field may be ignored. Align the frontmatter with the existing convention (keep filename as the command name; use `description`, optional `argument-hint`, and `allowed-tools`).
```suggestion
description: Generalize the current discussion into a reusable prompt and save it as a file
allowed-tools: ["edit", "search"]
```

> +tools: ["edit", "search"]
+---
+
+Generalize the current discussion into a reusable prompt that can be applied in similar contexts.
+
+Think step by step:
+
+1. Review the conversation to identify the user's primary goal or task pattern
+2. If there is no conversation present, reply to the user that the `/savePrompt` prompt expects an active discussion to generalize. Keep the reply concise.
+3. Generalize the task into a reusable prompt that could apply to similar scenarios
+4. Extract the core intent, removing conversation-specific details (e.g., specific file names, variable names, or project-specific context)
+5. Craft the generalized multi-line markdown text prompt, using placeholders where appropriate (e.g., "the selected code", "the current file", "the specified functionality")
+6. Create a very concise action-oriented title in camelCase format that will be used for the slash command (1-3 words, e.g., "generateUnitTests", "refactorForPerformance", "explainApiDesign", etc)
+7. Write a brief description (1 sentence, max 15 words) explaining the goal of the prompt
+8. If applicable, define an argument-hint that describes the expected inputs for the prompt
+9. Save the resulting prompt in an untitled file with URI `untitled:${promptFileName}.prompt.md`, where `${promptFileName}` is the concise action-oriented title from step 6
+

The tool names in `tools: ["edit", "search"]` don't match the tool identifiers used in the rest of the repo/docs (e.g., `Edit`, `Write`, `Grep`). Also, this command instructs saving to a new file (step 9) but doesn't allow `Write`, so it may not be able to create the output prompt file when tool restrictions apply.

> +1. Review the conversation to identify the user's primary goal or task pattern
+2. If there is no conversation present, reply to the user that the `/savePrompt` prompt expects an active discussion to generalize. Keep the reply concise.
+3. Generalize the task into a reusable prompt that could apply to similar scenarios

The prompt text references `/savePrompt`, but this command file is `save-prompt.md` and the rest of core commands use kebab-case names (e.g., `/write-plan`). Update the text to reference the actual slash command name to avoid confusing users.

>  
-The core plugin's hooks are particularly educational - they log all input/output to `/tmp/<session-id>-<hookname>.json`, making it easy to:
-- See what data each hook receives
-- Understand hook execution flow
-- Debug hook behavior
-- Learn by example when building your own hooks
+**Contents:**
+- **5 commands:** `/argc` (version management), `/write-plan`, `/execute-plan`, `/brainstorm`, `/create-agent-skill`

This section says the core plugin has “5 commands”, but this PR adds another core command (`save-prompt.md`). Update the count and list so the documentation stays accurate.
```suggestion
- **6 commands:** `/argc` (version management), `/write-plan`, `/execute-plan`, `/brainstorm`, `/create-agent-skill`, `/save-prompt`
```

> +### Version Management
+
+Versions are declared in `marketplace.json`. Bumping uses:
+```bash
+/argc bump <plugin-name> [patch|minor|major]
+```
+This updates the version, generates changelog from commits since last tag, creates a git tag (`<plugin>/vX.Y.Z`), pushes, and refreshes the cache.
 

This doc claims `/argc bump <plugin-name> ...` exists and performs version/changelog/tag automation, but the root `Argcfile.sh` currently does not define a `bump` command (so `/argc bump ...` would fail). Either implement the bump workflow in `Argcfile.sh` (and ensure `/argc` invokes it), or adjust this documentation to match the commands that actually exist.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/marketplace/pull/66#pullrequestreview-3768885560
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/marketplace/pull/66/review/3768885560@github.com>