MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/Agent-Skills-for-Context-Engineering <Agent-Skills-for-Context-Engineering@noreply.github.com>
Date: Thu, 26 Feb 2026 23:56:15 -0800
Subject: Re: [SkogAI/Agent-Skills-for-Context-Engineering] docs: add comprehensive CLAUDE.md for AI assistant guidance (PR #1)
Message-ID: <SkogAI/Agent-Skills-for-Context-Engineering/pull/1/review/3865536325@github.com>
In-Reply-To: <SkogAI/Agent-Skills-for-Context-Engineering/pull/1@github.com>
References: <SkogAI/Agent-Skills-for-Context-Engineering/pull/1@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a14e1f898ae_ef11107090d1"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Adds a repository-level `CLAUDE.md` agent guide to help AI assistants and contributors navigate the project structure, skill authoring conventions, example project workflows, and plugin marketplace organization.

**Changes:**
- Introduces `CLAUDE.md` describing repo structure, skill format rules, and progressive disclosure guidance.
- Documents build/test/lint commands for the TypeScript and Python example projects.
- Summarizes Claude Code plugin marketplace bundles and contribution workflow.





---

💡 <a href="/SkogAI/Agent-Skills-for-Context-Engineering/new/main?filename=.github/instructions/*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +Refer to `.gitignore` — notably:
+- `Private/` — private folder, never push to public repo
+- `dashboard/` — separate private repo
+- `.env` files, credentials, secrets
+- IDE-specific folders (`.vscode/`, `.idea/`, `.cursor/`)
+- Python build artifacts (`__pycache__/`, `*.egg-info/`, `dist/`)
+- Node build artifacts (`node_modules/`, `dist/` within examples)

The section says "Refer to .gitignore — notably" but lists patterns that are not currently in `.gitignore` (e.g., `.env` files and `node_modules/`). Either update this list to match the actual `.gitignore`, or add the missing ignore patterns to `.gitignore` so contributors/agents don’t assume these files are already excluded from commits.
```suggestion
In addition to patterns in `.gitignore`, ensure you never commit:
- `Private/` — private folder, never push to public repo
- `dashboard/` — separate private repo
- `.env` files, credentials, secrets
- IDE-specific folders (`.vscode/`, `.idea/`, `.cursor/`)
- Python build artifacts (`__pycache__/`, `*.egg-info/`, `dist/`)
- Node build artifacts (`node_modules/`, `dist` within examples)
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/Agent-Skills-for-Context-Engineering/pull/1#pullrequestreview-3865536325
You are receiving this because you authored the thread.

Message ID: <SkogAI/Agent-Skills-for-Context-Engineering/pull/1/review/3865536325@github.com>