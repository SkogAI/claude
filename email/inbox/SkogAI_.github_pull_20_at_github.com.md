MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.github" <.github@noreply.github.com>
Date: Fri, 31 Oct 2025 10:59:24 -0700
Subject: [SkogAI/.github] [WIP] Replace grep with --jq for secret existence check (PR #20)
Message-ID: <SkogAI/.github/pull/20@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6904f8fc986a2_de1100551f3"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;setup-claude-secrets.sh:68 - Replace grep with --jq for secret existence check&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Violation: JSON-First Principle
&gt; 
&gt; **File**: `scripts/setup-claude-secrets.sh`
&gt; **Line**: 68
&gt; 
&gt; ### Current Code (Anti-Pattern)
&gt; ```bash
&gt; EXISTING_SECRETS=$(gh secret list --org &quot;$ORG&quot; --json name -q &#39;.[].name&#39; 2&gt;/dev/null || echo &quot;&quot;)
&gt; if echo &quot;$EXISTING_SECRETS&quot; | grep -q &quot;CLAUDE_CODE_OAUTH_TOKEN&quot;; then
&gt; ```
&gt; 
&gt; ### Problem
&gt; Using `grep -q` to search through JSON output violates the JSON-first principle. This is a text-parsing anti-pattern that&#39;s inefficient and brittle.
&gt; 
&gt; ### Recommended Fix
&gt; ```bash
&gt; if gh secret list --org &quot;$ORG&quot; --json name --jq &#39;any(.name == &quot;CLAUDE_CODE_OAUTH_TOKEN&quot;)&#39; 2&gt;/dev/null; then
&gt; ```
&gt; 
&gt; ### Benefits
&gt; - ✅ Uses native `--jq` filtering instead of post-processing
&gt; - ✅ Single command instead of multiple operations
&gt; - ✅ More efficient (filters at query time)
&gt; - ✅ Returns proper exit code for conditional
&gt; 
&gt; ### Reference
&gt; See project gh documentation standards for JSON-first approach.
&gt; 
&gt; **Priority**: High
&gt; **Type**: Tech Debt
&gt; **Standards**: JSON-First, Efficiency-First&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/.github#13

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/.github/pull/20

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/.github/pull/20.patch
https://github.com/SkogAI/.github/pull/20.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.github/pull/20
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/.github/pull/20@github.com&gt;
