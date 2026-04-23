MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Sun, 04 Jan 2026 21:28:15 -0800
Subject: [SkogAI/lore] [WIP] Update API docs to prioritize shell tools over Python examples (PR #47)
Message-ID: <SkogAI/lore/pull/47@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_695b4bef20b79_10310d0110163b"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;docs: Update docs/api/*.md to prioritize shell tools&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Problem
&gt; The API documentation files (`docs/api/entry.md`, `docs/api/book.md`, `docs/api/persona.md`) show Python API examples prominently while shell tools should be canonical.
&gt; 
&gt; ## Files to Update
&gt; - `docs/api/entry.md`
&gt; - `docs/api/book.md`
&gt; - `docs/api/persona.md`
&gt; 
&gt; ## Changes Needed
&gt; 
&gt; ### 1. Reorder Sections
&gt; Move &quot;Using Shell Tools&quot; or &quot;CLI&quot; sections BEFORE Python examples.
&gt; 
&gt; ### 2. Add Deprecation Notices
&gt; Add note to Python sections:
&gt; ```markdown
&gt; &gt; **Note:** The Python API (`lore_api.py`) is deprecated. 
&gt; &gt; Use shell tools for new code. See [DEPRECATION.md](DEPRECATION.md).
&gt; ```
&gt; 
&gt; ### 3. Verify Shell Examples Work
&gt; Test all shell command examples still work with current tools.
&gt; 
&gt; ### 4. Update argc Examples
&gt; Add `argc` CLI examples alongside shell tool examples.
&gt; 
&gt; ## Acceptance Criteria
&gt; - [ ] Shell tools shown first in each file
&gt; - [ ] Deprecation notice on Python sections
&gt; - [ ] All examples tested and working
&gt; - [ ] argc CLI examples added
&gt; 
&gt; ## Blocked By
&gt; - SkogAI/lore#25 (deprecation documentation)
&gt; 
&gt; ## Estimated Effort
&gt; ~1 hour&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/lore#36

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/lore/pull/47

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/lore/pull/47.patch
https://github.com/SkogAI/lore/pull/47.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/47
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/lore/pull/47@github.com&gt;
