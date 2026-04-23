MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogai <skogai@noreply.github.com>
Date: Fri, 12 Dec 2025 15:53:59 -0800
Subject: Re: [SkogAI/skogai] Document skogix/todo integration in CLAUDE.md (PR #13)
Message-ID: <SkogAI/skogai/pull/13/review/3573939596@github.com>
In-Reply-To: <SkogAI/skogai/pull/13@github.com>
References: <SkogAI/skogai/pull/13@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_693cab177134_e01118141877"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR documents the integration between the `skogix/todo/` submodule and the parent `todo/` directory in CLAUDE.md, clarifying the project lifecycle and organizational structure. The documentation establishes that active projects live in `todo/` and move to `skogix/todo/` upon completion, providing clear guidance on the repository's project organization model.

Key changes:
- Added repository structure diagram entries for three new components: `@skogix/`, `@.plugin/`, and `@todo/`
- Created submodule documentation sections for skogix/ (user workspace) and .plugin/ (marketplace)
- Added comprehensive "Project Organization" section documenting the todo/ directory, project lifecycle, and relationship to the skogix/todo/ submodule





---

💡 <a href="/SkogAI/skogai/new/develop/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +### The skogix/ Submodule
+
+**Contains:** The skogix/ submodule is the user workspace containing completed projects, personal configurations, and archived work. It includes the `todo/` subdirectory where completed projects are moved after finishing active development.
+
+**When to activate:** Initialize this submodule when you need to reference completed projects, access archived project context folders, or understand the history of deployed work. Active development happens in the parent `todo/` directory; this submodule contains the finalized outputs.
+
+- @skogix/todo/ - Completed and archived projects (check directory for current list)

The skogix/ submodule documentation is missing file references that follow the established pattern used by other submodule sections. According to the template at line 113-125, submodule documentation should include specific @-references to key files and directories. Consider adding:
- @skogix/todo/ - reference to the completed projects directory
- @skogix/CLAUDE.md - if it exists as an entrypoint
- Any relevant terminal commands or file structure

This helps maintain consistency with other submodule sections like tools/ (lines 51-53) and docs/ (lines 69-77).

> @@ -73,6 +76,38 @@ Git submodule containing the SkogAI knowledge base - the raw markdown files whic
 - @docs/agents/ - Agent system documentation and prompts
 - @docs/technical/memory-system/ - Memory and knowledge management systems
 
+### The skogix/ Submodule
+
+**Contains:** The skogix/ submodule is the user workspace containing completed projects, personal configurations, and archived work. It includes the `todo/` subdirectory where completed projects are moved after finishing active development.
+
+**When to activate:** Initialize this submodule when you need to reference completed projects, access archived project context folders, or understand the history of deployed work. Active development happens in the parent `todo/` directory; this submodule contains the finalized outputs.
+
+- @skogix/todo/ - Completed and archived projects (check directory for current list)
+
+### The .plugin/ Submodule
+
+**Contains:** The .plugin/ submodule is the SkogAI marketplace - a collection of community plugins, extensions, and integrations for the SkogAI ecosystem.
+
+**When to activate:** Initialize this submodule when you need to work with marketplace plugins, add new integrations, or understand available extensions.
+

The .plugin/ submodule documentation is missing file references that follow the established pattern. According to the template at line 113-125, submodule documentation should include specific @-references to key files and directories. Consider adding:
- @.plugin/ - reference to the marketplace directory
- @.plugin/CLAUDE.md - if it exists as an entrypoint
- Any relevant file structure overview

This maintains consistency with the documentation pattern used throughout CLAUDE.md.
```suggestion

- @.plugin/ - Marketplace plugins directory (see for available plugins and extensions)
- @.plugin/CLAUDE.md - Submodule entrypoint and documentation (if present)
```

> +**When to activate:** Initialize this submodule when you need to reference completed projects, access archived project context folders, or understand the history of deployed work. Active development happens in the parent `todo/` directory; this submodule contains the finalized outputs.
+
+- @skogix/todo/ - Completed and archived projects (check directory for current list)
+
+### The .plugin/ Submodule
+
+**Contains:** The .plugin/ submodule is the SkogAI marketplace - a collection of community plugins, extensions, and integrations for the SkogAI ecosystem.
+
+**When to activate:** Initialize this submodule when you need to work with marketplace plugins, add new integrations, or understand available extensions.
+
+## Project Organization
+
+### The todo/ Directory
+
+The `todo/` directory (not a submodule) contains active development projects. Each project folder includes documentation, implementation files, and context for ongoing work.
+

The todo/ directory documentation would be more consistent with the submodule pattern if it included an @-reference at the start. While the reference to @todo/README.md appears at line 109, consider adding a bullet point list after line 97 that includes:
- @todo/ - The active development projects directory
- @todo/README.md - Detailed project information

This would match the pattern established for other components and make the @-reference system more discoverable.
```suggestion

- @todo/ - The active development projects directory
- @todo/README.md - Detailed project information
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogai/pull/13#pullrequestreview-3573939596
You are receiving this because you were mentioned.

Message ID: <SkogAI/skogai/pull/13/review/3573939596@github.com>