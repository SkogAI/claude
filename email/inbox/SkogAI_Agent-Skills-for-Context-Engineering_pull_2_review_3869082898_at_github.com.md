MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/Agent-Skills-for-Context-Engineering <Agent-Skills-for-Context-Engineering@noreply.github.com>
Date: Fri, 27 Feb 2026 13:05:19 -0800
Subject: Re: [SkogAI/Agent-Skills-for-Context-Engineering] docs: document context-harness example and new directories (PR #2)
Message-ID: <SkogAI/Agent-Skills-for-Context-Engineering/pull/2/review/3869082898@github.com>
In-Reply-To: <SkogAI/Agent-Skills-for-Context-Engineering/pull/2@github.com>
References: <SkogAI/Agent-Skills-for-Context-Engineering/pull/2@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a2070f820fc_d7111039249"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Updates repository documentation to include the new `examples/context-harness` project and to make the `journal/` and `paths/` directories discoverable to contributors.

**Changes:**
- Add `context-harness` to the README examples table.
- Update `CLAUDE.md` repo structure (examples + `journal/` + `paths/`) and add context-harness Python runtime/test instructions.
- Add a combined “Python examples” quick test command snippet including `context-harness`.

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 1 comment.

| File | Description |
| ---- | ----------- |
| README.md | Adds `examples/context-harness` to the examples table with a short description and skill tags. |
| CLAUDE.md | Expands repo structure tree and documents context-harness environment/testing commands. |





---

💡 <a href="/SkogAI/Agent-Skills-for-Context-Engineering/new/main?filename=.github/instructions/*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +- **Build system**: setuptools via pyproject.toml
+- **Dependencies**: anthropic
+- **Testing**: pytest with pytest-asyncio (45 tests)
+
+```bash
+cd examples/context-harness
+pip install -e ".[dev]"

The context-harness section says the build system is “setuptools via pyproject.toml” and the install command uses `pip install -e "[dev]"`, but `examples/context-harness/pyproject.toml` currently has no `[build-system]` table (unlike `examples/interleaved_thinking`). Without a build backend (or a `setup.py`), editable installs may fail. Either add a `[build-system]` section for setuptools (mirroring interleaved_thinking) or adjust this doc to describe the actual way to run tests (e.g., direct deps install without `-e`).
```suggestion
- **Build system**: None (plain Python module; no build backend)
- **Dependencies**: anthropic (runtime); pytest, pytest-asyncio (testing)
- **Testing**: pytest with pytest-asyncio (45 tests)

```bash
cd examples/context-harness
pip install anthropic pytest pytest-asyncio
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/Agent-Skills-for-Context-Engineering/pull/2#pullrequestreview-3869082898
You are receiving this because you authored the thread.

Message ID: <SkogAI/Agent-Skills-for-Context-Engineering/pull/2/review/3869082898@github.com>