MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Wed, 18 Feb 2026 13:54:26 -0800
Subject: Re: [SkogAI/lore] Audit and trim CLAUDE.md (-32%) (PR #58)
Message-ID: <SkogAI/lore/pull/58/review/3822421819@github.com>
In-Reply-To: <SkogAI/lore/pull/58@github.com>
References: <SkogAI/lore/pull/58@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69963512b47d6_e41128323061"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR audits and trims CLAUDE.md, reducing it from 383 to 259 lines (-32%) by removing stale, redundant, and auto-generated content while fixing inaccurate data claims and path conventions.

**Changes:**
- Removed stale sections: Session Memories (internal logs), Plugin Garden verbose details (still referenced in directory structure), Current State/Verified Working (redundant), and Appendix/Orchestrator Purpose (duplicated Integration Pipeline content)
- Deleted auto-generated claude-mem activity log files from `.skogai/plan/` and `.skogai/plan/phases/` directories
- Fixed data accuracy: removed inflated counts (claimed 1202 entries/107 books/92 personas, actual ~377/89/54) by removing specific numbers entirely
- Corrected directory structure: removed nonexistent `scripts/jq/` reference (jq transforms belong in skogai-jq skill)
- Updated LLM provider section: shifted from "All 3 providers supported" to "Claude Code (~80% of generation)" to reflect actual usage patterns
- Standardized paths by removing non-standard `@` prefixes throughout (e.g., `@knowledge/core/` → `knowledge/core/`)
- Condensed verbose sections: Context Management, Numbered Knowledge System

### Reviewed changes

Copilot reviewed 3 out of 3 changed files in this pull request and generated 1 comment.

| File | Description |
| ---- | ----------- |
| CLAUDE.md | Main documentation file trimmed from 383→259 lines with accuracy fixes and improved conciseness |
| .skogai/plan/CLAUDE.md | Deleted auto-generated claude-mem activity log (20 lines) |
| .skogai/plan/phases/CLAUDE.md | Deleted auto-generated claude-mem activity log (12 lines) |





> +## Code Style
 
-**Current State**: Seed plugins (core, docs) | Trial: 0 | Permanent: 0
+- **Imports**: stdlib → third-party → local
+- **Type Annotations**: Use `Dict`, `List`, `Optional`, `Any` from typing
+- **Error Handling**: Try/except with specific exceptions and informative logging
+- **Naming**: snake_case for functions/variables, PascalCase for classes
+- **Logging**: `logger = logging.getLogger("module_name")`
+- **Configuration**: Config files with environment variable fallbacks

The Code Style section previously included a guideline about docstrings: "Documentation: Docstrings with triple quotes for all classes/functions". This guidance has been removed, but the codebase (especially in agents/api/*.py) consistently uses docstrings for all classes and functions. Consider restoring this line to maintain consistency, even though the Python APIs are deprecated, as Python code still exists in the repository (orchestrator/, tools/, etc.).

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/58#pullrequestreview-3822421819
You are receiving this because you authored the thread.

Message ID: <SkogAI/lore/pull/58/review/3822421819@github.com>