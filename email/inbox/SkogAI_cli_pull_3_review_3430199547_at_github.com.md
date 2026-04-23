MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/cli <cli@noreply.github.com>
Date: Thu, 06 Nov 2025 11:44:16 -0800
Subject: Re: [SkogAI/cli] . (PR #3)
Message-ID: <SkogAI/cli/pull/3/review/3430199547@github.com>
In-Reply-To: <SkogAI/cli/pull/3@github.com>
References: <SkogAI/cli/pull/3@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690cfa90326a0_47a2011008972a"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This pull request upgrades the project's Python version requirement from 3.12 to 3.13 and includes several configuration and cleanup changes. The main changes involve updating lock files to remove Python 3.12-specific wheel references, replacing hardcoded paths with environment variables, and adjusting default configurations.

### Key Changes:
- Python version upgraded from 3.12 to 3.13 across configuration files
- Lock file updated to remove ~300 Python 3.12-specific wheel references
- Hardcoded absolute paths replaced with `$SKOGAI` environment variable
- Default script type changed from "python" to "shell" in script commands
- Added `tdd-guard-pytest` dependency
- Removed obsolete CLI entry point `skog` (keeping only `skogcli`)
- Extensive cleanup of temporary files and documentation

### Reviewed Changes

Copilot reviewed 31 out of 33 changed files in this pull request and generated 4 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| pyproject.toml | Updated Python requirement to >=3.13, removed `skog` entry point, added tdd-guard-pytest dependency with hardcoded project root |
| uv.lock | Removed ~300 Python 3.12 wheel entries, updated to Python 3.13 requirements |
| src/skogcli/data/default_settings.json | Replaced hardcoded `/home/skogix/skogai` paths with `$SKOGAI` environment variable |
| src/skogcli/script.py | Changed default script type from "python" to "shell" for create and generate commands |
| .python-version | Updated from 3.12 to 3.13 |
| .gitignore | Simplified patterns to catch more temporary files |
| tests/* | Removed duplicate imports, added missing imports, deleted obsolete test files |
| Various .md files | Removed extensive documentation files (CONDUCTOR.md, DESIGN.md, etc.) |
| Makefile | Deleted entire Makefile in favor of Argcfile.sh |
</details>






---

💡 <a href="/SkogAI/cli/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -34,3 +34,6 @@ dev = [
   "pytest-cov>=6.2.1",
   "ruff>=0.12.4",
 ]
+
+[tool.pytest.ini_options]
+tdd_guard_project_root = "/home/skogix/dev/cli-script-upgrade"

The `tdd_guard_project_root` configuration contains an absolute path specific to the developer's local machine (`/home/skogix/dev/cli-script-upgrade`). This should be a relative path or use project root detection to ensure it works across different development environments and CI/CD systems.
```suggestion
tdd_guard_project_root = "."
```

>  [project.scripts]
-skog = "skogcli:main"
 skogcli = "skogcli:main"

The `skog` entry point was removed. If this was intentionally deprecated in favor of `skogcli`, ensure all documentation and scripts have been updated to use the new entry point name.

> @@ -1532,7 +1532,7 @@ def generate_script(
         ..., help="Description of what the script should do"
     ),
     type: str = typer.Option(
-        "python",
+        "shell",

The default script type changed from "python" to "shell" for both `create_script` and `generate_script` commands. This is a breaking change that should be documented in a changelog or migration guide, as existing scripts or automation may expect Python scripts by default.
```suggestion
        "python",
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/cli/pull/3#pullrequestreview-3430199547
You are receiving this because you authored the thread.

Message ID: <SkogAI/cli/pull/3/review/3430199547@github.com>