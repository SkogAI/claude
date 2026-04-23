MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skoglib <skoglib@noreply.github.com>
Date: Sun, 26 Oct 2025 08:12:44 -0700
Subject: [SkogAI/skoglib] [WIP] Fix subprocess timeout decoding bug (PR #50)
Message-ID: <SkogAI/skoglib/pull/50@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fe3a6c27f94_31a7311005317"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;🔴 CRITICAL: Fix subprocess timeout decoding bug&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;### Issue Description
&gt; `AttributeError` when stdout/stderr are `None` in `TimeoutExpired` exception
&gt; 
&gt; ### Location
&gt; `src/skoglib/executable.py:422-424`
&gt; 
&gt; ### Current Code (Broken)
&gt; ```python
&gt; stdout=e.stdout.decode(&quot;utf-8&quot;) if e.stdout else None,
&gt; stderr=e.stderr.decode(&quot;utf-8&quot;) if e.stderr else None,
&gt; ```
&gt; 
&gt; ### Problem
&gt; The code attempts to call `.decode()` on `None` values when the subprocess timeout occurs without any output captured.
&gt; 
&gt; ### Fix
&gt; ```python
&gt; stdout=e.stdout.decode(&quot;utf-8&quot;) if e.stdout and isinstance(e.stdout, bytes) else None,
&gt; stderr=e.stderr.decode(&quot;utf-8&quot;) if e.stderr and isinstance(e.stderr, bytes) else None,
&gt; ```
&gt; 
&gt; ### Required Actions
&gt; 1. Fix the timeout decoding logic
&gt; 2. Add test case for timeout with `None` output to prevent regression
&gt; 
&gt; ### Priority
&gt; CRITICAL - Must fix before next release
&gt; 
&gt; ### Source
&gt; Identified in PR SkogAI/skoglib#29 code review&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/skoglib#37

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/skoglib/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skoglib/pull/50

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skoglib/pull/50.patch
https://github.com/SkogAI/skoglib/pull/50.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skoglib/pull/50
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skoglib/pull/50@github.com&gt;
