MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Fri, 03 Oct 2025 01:08:58 -0700
Subject: Re: [SkogAI/lore] Simplify configuration to use skogcli config as source of truth=0A=0A- Require SKOGAI_LORE env var (from skogcli config)=0A- Remove git-aware detection and hardcoded fallbacks=0A- Remove SKOGAI_LOGS_DIR and SKOGAI_TOOLS_DIR (managed externally)=0A- Add SKOGAI_CONTEXT_DIR and SKOGAI_KNOWLEDGE_DIR=0A- Update .envrc to source config/paths.sh after loading env=0A- Rewrite README.md with simplified architecture docs=0A=0AThis aligns with the principle that:=0A- Base vars come from skogcli config (SKOGAI, SKOGAI_LORE, SKOGAI_LOGS_DIR)=0A- Lore-specific dirs come from config/paths.sh/py=0A- Tools come from skogcli scripts (not env vars)=0A=0ACo-authored-by: Skogix <Skogix@users.noreply.github.com> (PR #71)
Message-ID: <SkogAI/lore/pull/71/review/3297917903@github.com>
In-Reply-To: <SkogAI/lore/pull/71@github.com>
References: <SkogAI/lore/pull/71@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68df849a5b1e5_78f510d89965e"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR refactors the configuration system to rely on `skogcli config` as the authoritative source for environment variables. It eliminates git-aware path detection and hardcoded fallbacks in favor of requiring `SKOGAI_LORE` to be set externally, simplifies the architecture by removing logs/tools management from the lore repository, and adds new context and knowledge directory support.

Key changes:
- Replace complex git-aware path resolution with simple `SKOGAI_LORE` requirement
- Remove `SKOGAI_LOGS_DIR` and `SKOGAI_TOOLS_DIR` management (deferred to external systems)
- Add `SKOGAI_CONTEXT_DIR` and `SKOGAI_KNOWLEDGE_DIR` for new functionality
- Update `.envrc` to properly load configuration in sequence

### Reviewed Changes

Copilot reviewed 4 out of 4 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| `config/paths.sh` | Simplified to require SKOGAI_LORE env var, removed git detection and logs/tools management |
| `config/paths.py` | Removed git-aware resolution functions, added context/knowledge directory support |
| `config/README.md` | Comprehensive rewrite documenting the simplified architecture and new requirements |
| `.envrc` | Updated to load skogcli config first, then paths.sh, then activate venv |





>  #
 
-# Get the repository root using git
-skogai_get_repo_root() {
-    if command -v git >/dev/null 2>&1; then
-        git rev-parse --show-toplevel 2>/dev/null
-    fi
-}
+# Verify SKOGAI_LORE is set
+if [ -z "$SKOGAI_LORE" ]; then
+    echo "ERROR: SKOGAI_LORE environment variable not set" >&2
+    echo "Please ensure 'skogcli config export-env --namespace skogai' is sourced" >&2
+    return 1 2>/dev/null || exit 1

The error handling pattern `return 1 2>/dev/null || exit 1` is a shell idiom that attempts to return if the script is sourced, otherwise exits. However, this can be fragile and may not work reliably across all shell environments. Consider using a more explicit check like `if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then exit 1; else return 1; fi` to distinguish between sourcing and execution.
```suggestion
    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        exit 1
    else
        return 1
    fi
```

> +            "SKOGAI_LORE environment variable not set. "
+            "Please ensure 'skogcli config export-env --namespace skogai' is sourced"

The error message suggests sourcing a command in shell context, but this is Python code that could be imported in various environments (Docker, CI/CD, etc.). Consider making the error message more generic: 'SKOGAI_LORE environment variable not set. Please set this variable to point to the lore repository path.'
```suggestion
            "SKOGAI_LORE environment variable not set. Please set this variable to point to the lore repository path."
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/71#pullrequestreview-3297917903
You are receiving this because you authored the thread.

Message ID: <SkogAI/lore/pull/71/review/3297917903@github.com>