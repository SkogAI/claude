MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 02 Oct 2025 20:52:07 -0700
Subject: Re: [SkogAI/lore] create issues to remake the shell scripts  (Issue #41)
Message-ID: <SkogAI/lore/issues/41/3364149933@github.com>
In-Reply-To: <SkogAI/lore/issues/41@github.com>
References: <SkogAI/lore/issues/41@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68df4867d414b_3ca410d88626e"; charset="UTF-8"

claude[bot] left a comment (SkogAI/lore#41)

**Claude finished @Skogix's task** —— [View job](https://github.com/SkogAI/lore/actions/runs/18212286998) • [`claude/issue-41-20251003-0347`](https://github.com/SkogAI/lore/tree/claude/issue-41-20251003-0347) • [Create PR ➔](https://github.com/SkogAI/lore/compare/master...claude/issue-41-20251003-0347?quick_pull=1&title=Add%20script%20to%20create%20shell%20script%20refactoring%20issues&body=This%20PR%20adds%20a%20helper%20script%20that%20creates%2010%20individual%20GitHub%20issues%20for%20refactoring%20shell%20scripts%20to%20remove%20sed%2Fawk%20and%20use%20SKOGAI_*%20environment%20variables.%0A%0AThe%20script%20creates%20issues%20for%3A%0A-%20tools%2Fcontext-manager.sh%0A-%20tools%2Findex-knowledge.sh%0A-%20tools%2Fllama-lore-creator.sh%0A-%20tools%2Fllama-lore-integrator.sh%0A-%20docs%2Fgenerators%2Fknowledge-docs.sh%0A-%20metrics%2Fcollect-metrics.sh%0A-%20openrouter%2Fopenrouter-models-new.sh%0A-%20integration%2Forchestrator-flow.sh%0A-%20integration%2Fworkflows%2Ftest-workflow.sh%0A-%20demo%2Fcontent-workflow.sh%0A%0ACloses%20%2341%0A%0AGenerated%20with%20%5BClaude%20Code%5D%28https%3A%2F%2Fclaude.ai%2Fcode%29)

---
### Task Complete: Shell Script Refactoring Analysis

I've analyzed all 21 shell scripts in the repository and identified **10 scripts** that need refactoring.

#### Analysis Results

**High Priority (sed/awk + hardcoded paths):**
1. ✅ `tools/context-manager.sh` - Heavy sed usage for JSON manipulation, hardcoded `/home/skogix/skogai/` paths
2. ✅ `tools/index-knowledge.sh` - Uses sed for metadata extraction, hardcoded paths
3. ✅ `tools/llama-lore-creator.sh` - Uses sed for parsing and JSON manipulation
4. ✅ `tools/llama-lore-integrator.sh` - Uses sed and awk for text processing
5. ✅ `docs/generators/knowledge-docs.sh` - Uses sed for metadata extraction, hardcoded paths

**Medium Priority (hardcoded paths only):**
6. ✅ `metrics/collect-metrics.sh` - Hardcoded `/home/skogix/skogai/` paths
7. ✅ `openrouter/openrouter-models-new.sh` - Hardcoded `/home/skogix/skogai/.venv` path
8. ✅ `integration/orchestrator-flow.sh` - Hardcoded paths
9. ✅ `integration/workflows/test-workflow.sh` - Hardcoded paths
10. ✅ `demo/content-workflow.sh` - Hardcoded paths

**Already Good ✓** (use relative paths or SKOGAI_DIR):
- `tools/create-persona.sh` - Uses jq, derives SKOGAI_DIR from script location
- `tools/manage-lore.sh` - Uses jq, derives SKOGAI_DIR from script location
- `skogai-lore-service.sh` - Derives SKOGAI_DIR from script location

#### What I Created

Since `gh issue create` requires approval, I've created a helper script that you can run:

**File:** `create-script-refactor-issues.sh`

This script will create all 10 issues with detailed descriptions including:
- Current problems with each script
- Specific requirements for refactoring
- Example code transformations
- Environment variables to use (SKOGAI_HOME, SKOGAI_CONTEXT_DIR, etc.)
- Testing requirements

#### How to Use

1. Make the script executable and run it:
```bash
chmod +x create-script-refactor-issues.sh
./create-script-refactor-issues.sh
```

This will create 10 individual GitHub issues, one for each script that needs refactoring.

#### Recommended Environment Variables

Based on my analysis, these are the suggested SKOGAI_* environment variables:
- `SKOGAI_HOME` - Base directory (default: `$HOME/skogai` or `$(pwd)`)
- `SKOGAI_CONTEXT_DIR` - Context directory (default: `$SKOGAI_HOME/context`)
- `SKOGAI_KNOWLEDGE_DIR` - Knowledge directory (default: `$SKOGAI_HOME/knowledge`)
- `SKOGAI_DOCS_DIR` - Docs directory (default: `$SKOGAI_HOME/docs/generated`)
- `SKOGAI_METRICS_DIR` - Metrics directory (default: `$SKOGAI_HOME/metrics`)
- `SKOGAI_AGENTS_DIR` - Agents directory (default: `$SKOGAI_HOME/agents`)
- `SKOGAI_VENV` - Virtual environment path (default: `$SKOGAI_HOME/.venv`)



--- |

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/issues/41#issuecomment-3364149933
You are receiving this because you were mentioned.

Message ID: <SkogAI/lore/issues/41/3364149933@github.com>