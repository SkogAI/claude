MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Sun, 04 Jan 2026 21:28:15 -0800
Subject: [SkogAI/lore] [WIP] Refactor lore_tui.py to use subprocess calls or JSON parsing (PR #51)
Message-ID: <SkogAI/lore/pull/51@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_695b4bef5c52_fc10d0125313"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;refactor: Migrate lore_tui.py from LoreAPI to shell tools&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Problem
&gt; `tools/lore_tui.py` imports from `agents/api/lore_api.py` which is being deprecated (see SkogAI/lore#25).
&gt; 
&gt; ## Current Dependencies
&gt; ```python
&gt; from agents.api.lore_api import LoreAPI
&gt; self.api = LoreAPI(base_dir=base_dir)
&gt; # Uses: list_lore_books(), get_lore_book(), list_lore_entries(), get_lore_entry(), search functions
&gt; ```
&gt; 
&gt; ## Acceptance Criteria
&gt; - [ ] Replace LoreAPI calls with subprocess calls to shell tools
&gt; - [ ] Or parse JSON files directly (simpler for read-only TUI)
&gt; - [ ] Maintain same TUI interface and navigation
&gt; - [ ] Test browsing and search still works
&gt; 
&gt; ## Options
&gt; 1. **Subprocess to shell tools** - Most consistent with deprecation direction
&gt; 2. **Direct JSON parsing** - Simpler for read-only TUI, no subprocess overhead
&gt; 3. **Keep as-is** - TUI is read-only, could tolerate deprecated API longer
&gt; 
&gt; ## Shell Tool Equivalents
&gt; | LoreAPI Method | Shell Tool |
&gt; |----------------|------------|
&gt; | `list_lore_books()` | `manage-lore.sh list-books` |
&gt; | `get_lore_book(id)` | `manage-lore.sh show-book &lt;id&gt;` |
&gt; | `list_lore_entries()` | `manage-lore.sh list-entries` |
&gt; | `get_lore_entry(id)` | `manage-lore.sh show-entry &lt;id&gt;` |
&gt; | `search()` | `manage-lore.sh search` |
&gt; 
&gt; ## Files to Update
&gt; - `tools/lore_tui.py`
&gt; 
&gt; ## Blocked By
&gt; - SkogAI/lore#25 (deprecation documentation)
&gt; 
&gt; ## Estimated Effort
&gt; ~2 hours
&gt; 
&gt; ## Priority
&gt; Lower than SkogAI/lore#26 and SkogAI/lore#27 since TUI is read-only and less critical path.&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/lore#28

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/lore/pull/51

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/lore/pull/51.patch
https://github.com/SkogAI/lore/pull/51.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/51
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/lore/pull/51@github.com&gt;
