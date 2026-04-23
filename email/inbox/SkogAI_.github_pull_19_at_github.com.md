MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.github" <.github@noreply.github.com>
Date: Fri, 31 Oct 2025 10:59:26 -0700
Subject: [SkogAI/.github] [WIP] Refactor secret filtering in setup-claude-secrets.sh (PR #19)
Message-ID: <SkogAI/.github/pull/19@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6904f8fe99c34_44baf1100305c5"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;setup-claude-secrets.sh:93 - Replace grep with --json --jq for secret filtering&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Violation: JSON-First Principle
&gt; 
&gt; **File**: `scripts/setup-claude-secrets.sh`
&gt; **Line**: 93
&gt; 
&gt; ### Current Code (Anti-Pattern)
&gt; ```bash
&gt; gh secret list --org &quot;$ORG&quot; | grep CLAUDE
&gt; ```
&gt; 
&gt; ### Problem
&gt; Using `grep` to filter GitHub CLI output violates the JSON-first principle. This parses unstructured text instead of using structured JSON data with proper filtering.
&gt; 
&gt; ### Recommended Fix
&gt; ```bash
&gt; gh secret list --org &quot;$ORG&quot; --json name --jq &#39;.[] | select(.name | contains(&quot;CLAUDE&quot;))&#39;
&gt; ```
&gt; 
&gt; ### Benefits
&gt; - ✅ Uses structured JSON output with `--json`
&gt; - ✅ Filters with native `--jq` instead of post-processing
&gt; - ✅ More reliable (doesn&#39;t depend on text formatting)
&gt; - ✅ Returns properly formatted data
&gt; 
&gt; ### Reference
&gt; See project gh documentation standards, specifically the anti-patterns section that shows &quot;hundreds of wrong attempts&quot; using grep/cut/awk.
&gt; 
&gt; **Priority**: Medium
&gt; **Type**: Tech Debt
&gt; **Standards**: JSON-First, No Text Parsing&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/.github#14

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/.github/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/.github/pull/19

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/.github/pull/19.patch
https://github.com/SkogAI/.github/pull/19.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.github/pull/19
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/.github/pull/19@github.com&gt;
