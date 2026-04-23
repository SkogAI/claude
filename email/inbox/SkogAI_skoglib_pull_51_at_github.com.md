MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skoglib <skoglib@noreply.github.com>
Date: Sun, 26 Oct 2025 08:12:57 -0700
Subject: [SkogAI/skoglib] [WIP] Implement size checking for max_output_size config (PR #51)
Message-ID: <SkogAI/skoglib/pull/51@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fe3a795ab27_6e6ce1100196ae"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;🟡 HIGH: Unused max_output_size config&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;### Issue Description
&gt; Config defines `max_output_size` but it&#39;s never enforced, creating risk of memory exhaustion.
&gt; 
&gt; ### Location
&gt; `src/skoglib/executable.py:375-382`
&gt; 
&gt; ### Problem
&gt; The configuration system allows setting `max_output_size` to limit subprocess output, but this limit is never actually checked or enforced in the code.
&gt; 
&gt; ### Impact
&gt; - Risk of memory exhaustion from unbounded subprocess output
&gt; - Configuration option misleads users into thinking they&#39;re protected
&gt; - False sense of security
&gt; 
&gt; ### Fix Options
&gt; 1. Implement actual size checking against `max_output_size`
&gt; 2. OR remove the unused configuration option entirely
&gt; 
&gt; ### Required Actions
&gt; 1. Decide whether to implement or remove
&gt; 2. If implementing: Add size enforcement logic
&gt; 3. If removing: Clean up config and documentation
&gt; 4. Add tests for whichever approach is chosen
&gt; 
&gt; ### Priority
&gt; HIGH - Configuration mismatch is a design flaw
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

- Fixes SkogAI/skoglib#39

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/skoglib/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skoglib/pull/51

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skoglib/pull/51.patch
https://github.com/SkogAI/skoglib/pull/51.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skoglib/pull/51
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skoglib/pull/51@github.com&gt;
