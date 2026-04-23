MIME-Version: 1.0
From: "chatgpt-codex-connector[bot]" <notifications@github.com>
To: SkogAI/claude <claude@noreply.github.com>
Date: Sun, 19 Apr 2026 03:01:44 -0700
Subject: Re: [SkogAI/claude] feat: move home-folder executables into .skogai/tools and add tooling router docs (PR #54)
Message-ID: <SkogAI/claude/pull/54/review/4135800047@github.com>
In-Reply-To: <SkogAI/claude/pull/54@github.com>
References: <SkogAI/claude/pull/54@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69e4a808588e7_af1108166830"; charset="UTF-8"

@chatgpt-codex-connector[bot] commented on this pull request.


### 💡 Codex Review

Here are some automated review suggestions for this pull request.

**Reviewed commit:** `f06bf0d96c`
    

<details> <summary>ℹ️ About Codex in GitHub</summary>
<br/>

[Your team has set up Codex to review pull requests in this repo](https://chatgpt.com/codex/cloud/settings/general). Reviews are triggered when you
- Open a pull request for review
- Mark a draft as ready
- Comment "@codex review".

If Codex has suggestions, it will comment; otherwise it will react with 👍.




Codex can also answer questions or update the PR. Try commenting "@codex address that feedback".
            
</details>

> -    git -C "${1:-$PWD}" rev-parse --show-toplevel 2>/dev/null && return 0
-    return 1
-}
-
-# If executed directly (not sourced), run and output the result
-if [ "${BASH_SOURCE[0]}" = "$0" ]; then
-    result="$(find_agent_root "${1:-}")" || {
-        echo "Error: Could not find agent root from ${1:-$PWD}" >&2
-        exit 1
-    }
-    echo "$result"
-fi
+#!/usr/bin/env bash
+set -euo pipefail
+SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
+exec "$SCRIPT_DIR/../../.skogai/tools/$(basename "$0")" "$@"

**<sub><sub>![P1 Badge](https://img.shields.io/badge/P1-orange?style=flat)</sub></sub>  Preserve source mode in find-agent-root wrapper**

The compatibility wrapper always `exec`s `$(basename "$0")`, which breaks the legacy sourced usage of this path: when callers run `. claude-todo/bin/find-agent-root.sh`, `$0` is the parent shell name (for example `bash`), so the wrapper tries to execute `.skogai/tools/bash`, exits with `127`, and never defines `find_agent_root`. The previous implementation supported sourced mode, so this is a functional regression for any existing scripts/config that import this helper instead of invoking it as a command.

Useful? React with 👍 / 👎.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/claude/pull/54?email_source=notifications&email_token=AAFIQZ4KCET7YIJ2ZXMR55D4WSPYRA5CNFSNUABKM5UWIORPF5TWS5BNNB2WEL2QOVWGYUTFOF2WK43UKJSXM2LFO4XTIMJTGU4DAMBQGQ32M4TFMFZW63VGMF2XI2DPOKSWK5TFNZ2L24DSL5ZGK5TJMV3V63TPORUWM2LDMF2GS33OONPWG3DJMNVQ#pullrequestreview-4135800047
You are receiving this because you authored the thread.

Message ID: <SkogAI/claude/pull/54/review/4135800047@github.com>