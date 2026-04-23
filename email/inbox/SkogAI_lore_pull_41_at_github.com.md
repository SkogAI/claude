MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Sun, 04 Jan 2026 21:28:10 -0800
Subject: [SkogAI/lore] [WIP] Refactor documentation to remove Python API references (PR #41)
Message-ID: <SkogAI/lore/pull/41@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_695b4beaa35fb_ff10d0111848a"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;refactor: Deprecate Python lore_api.py - document shell tools as canonical&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Problem
&gt; The Python API (`agents/api/lore_api.py`) is broken while shell tools work reliably. Documentation incorrectly suggests Python API is preferred.
&gt; 
&gt; ## Current State
&gt; - Shell tools (`manage-lore.sh`, `create-persona.sh`) work correctly
&gt; - Python API has known issues (&quot;broken as fudge&quot; per session memories)
&gt; - Documentation in multiple places suggests migrating TO Python API
&gt; 
&gt; ## Files Referencing Python API (need updates)
&gt; **Python imports to address:**
&gt; - `integration/persona-bridge/persona-manager.py` - Uses LoreAPI
&gt; - `generate-agent-lore.py` - Uses LoreAPI  
&gt; - `tools/lore_tui.py` - Uses LoreAPI
&gt; 
&gt; **Shell script references:**
&gt; - `integration/lore-flow.sh` - References but doesn&#39;t execute directly
&gt; 
&gt; **Documentation to update:**
&gt; - `CLAUDE.md` - Shows Python API as primary
&gt; - `docs/api/persona.md`, `docs/api/book.md`, `docs/api/entry.md` - Show Python examples
&gt; - `PROJECT_INDEX.md` - Lists Python API prominently
&gt; - `tools/AGENTS.md` - Says shell is deprecated, Python preferred (BACKWARDS!)
&gt; - `AGENTS.md` - References Python API
&gt; 
&gt; ## Acceptance Criteria
&gt; - [ ] Add deprecation notice to `agents/api/lore_api.py` header
&gt; - [ ] Add deprecation notice to `agents/api/agent_api.py` header
&gt; - [ ] Update `tools/AGENTS.md` to mark shell tools as PRIMARY (remove &quot;deprecated&quot; label)
&gt; - [ ] Update documentation to show shell tools as canonical, Python as deprecated
&gt; - [ ] Create `docs/api/DEPRECATION.md` explaining the situation
&gt; 
&gt; ## NOT in scope (separate issues)
&gt; - Fixing the Python API itself
&gt; - Migrating Python-dependent tools to shell
&gt; 
&gt; ## Estimated Effort
&gt; ~45 minutes&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/lore#25

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/lore/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/lore/pull/41

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/lore/pull/41.patch
https://github.com/SkogAI/lore/pull/41.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/41
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/lore/pull/41@github.com&gt;
