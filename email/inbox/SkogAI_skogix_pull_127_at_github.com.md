MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Fri, 12 Dec 2025 14:59:24 -0800
Subject: [SkogAI/skogix] [WIP] Clarify instruction for adding allowed_bots (PR #127)
Message-ID: <SkogAI/skogix/pull/127@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_693c9e4c6cd4b_c81118361229"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;The instruction to add bots &quot;without the `[bot]` suffix if it has one&quot; is unclear and potentially confusing. The actual implementation shows that `allowed_bots` uses the base name without the suffix (e.g., &quot;dependabot&quot; not &quot;dependabot[bot]&quot;), but the phrasing makes it sound conditional. Consider rephrasing to: &quot;Add the bot to the `allowed_bots` parameter using only its base name without any `[bot]` suffix&quot;.&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;The instruction to add bots &quot;without the `[bot]` suffix if it has one&quot; is unclear and potentially confusing. The actual implementation shows that `allowed_bots` uses the base name without the suffix (e.g., &quot;dependabot&quot; not &quot;dependabot[bot]&quot;), but the phrasing makes it sound conditional. Consider rephrasing to: &quot;Add the bot to the `allowed_bots` parameter using only its base name without any `[bot]` suffix&quot;.
&gt; ```suggestion
&gt; 2. Add the bot to the `allowed_bots` parameter using only its base name without any `[bot]` suffix
&gt; ```
&gt; 
&gt; _Originally posted by @Copilot in https://github.com/SkogAI/skogix/pull/122#discussion_r2615778714_
&gt;             &lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/skogix#126

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogix/pull/127

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogix/pull/127.patch
https://github.com/SkogAI/skogix/pull/127.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/127
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogix/pull/127@github.com&gt;
