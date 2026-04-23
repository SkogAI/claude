MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Fri, 12 Dec 2025 07:57:00 -0800
Subject: [SkogAI/skogix] [WIP] Convert 8 helper shell scripts to unified argc CLI (PR #114)
Message-ID: <SkogAI/skogix/pull/114@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_693c3b4cb87c2_f51118483824"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;argc-helper-scripts: 71 argc commands for unified CLI tooling&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; 
&gt; Convert 8 helper shell scripts into a unified argc-powered CLI with structured validation, dynamic completion, and multi-interface access.
&gt; 
&gt; ## Current Status: ✅ Complete
&gt; 
&gt; All conversions finished with 71 commands across 8 namespaces in `Argcfile.sh`:
&gt; 
&gt; | Namespace | Commands | Source Script |
&gt; |-----------|----------|---------------|
&gt; | `check::*` | 8 | env-check.sh |
&gt; | `docker::*` | 17 | docker-quick.sh |
&gt; | `search::*` | 10 | search-tools.sh |
&gt; | `api::*` | 5 | api-helper.sh |
&gt; | `quality::*` | 5 | code-quality.sh |
&gt; | `python::*` | 8 | python-helper.sh |
&gt; | `go::*` | 16 | go-helper.sh |
&gt; | `mcp::*` | 2 | mcp-helper.sh |
&gt; 
&gt; ## Key Features
&gt; 
&gt; - **Dynamic completion**: `_choice_containers()`, `_choice_tools()`, `_choice_mcp_servers()`
&gt; - **Safe execution**: No `chmod +x`, uses `argc --argc-run`
&gt; - **Graceful degradation**: Helpful messages when optional deps missing
&gt; - **Runtime introspection**: Validates against actual system state
&gt; 
&gt; ## Next Steps
&gt; 
&gt; 1. Deploy to `/tmp/fakebin/skogix`
&gt; 2. Create MCP tool wrappers for common commands
&gt; 3. Integrate with skogparse (`[@argc:skogix:docker:ps]`)
&gt; 4. Archive original scripts after validation
&gt; 
&gt; ## Files
&gt; 
&gt; - `todo/argc-helper-scripts/Argcfile.sh` - Main implementation
&gt; - `todo/argc-helper-scripts/CLAUDE.md` - argc patterns &amp; guidance
&gt; - `todo/argc-helper-scripts/handover.md` - Complete technical deep dive
&gt; - `todo/argc-helper-scripts/DEPLOYMENT.md` - Usage guide&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/skogix#69

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogix/pull/114

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogix/pull/114.patch
https://github.com/SkogAI/skogix/pull/114.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/114
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogix/pull/114@github.com&gt;
