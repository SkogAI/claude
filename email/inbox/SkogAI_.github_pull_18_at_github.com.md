MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.github" <.github@noreply.github.com>
Date: Fri, 31 Oct 2025 10:58:08 -0700
Subject: [SkogAI/.github] [WIP] Fix regex parsing in test-setup.sh for issue creation (PR #18)
Message-ID: <SkogAI/.github/pull/18@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6904f8b053bb4_32e5611002990"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;test-setup.sh:118 - Replace regex parsing with --json on gh issue create&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Violation: JSON-First Principle
&gt; 
&gt; **File**: `scripts/test-setup.sh`
&gt; **Line**: 118
&gt; 
&gt; ### Current Code (Anti-Pattern)
&gt; ```bash
&gt; ISSUE_URL=$(gh issue create \
&gt;     --title &quot;Test Issue - Automated Claude Workflow Trigger&quot; \
&gt;     --body &quot;...&quot;)
&gt;     
&gt; ISSUE_NUM=$(echo &quot;$ISSUE_URL&quot; | grep -oP &#39;\d+$&#39;)
&gt; ```
&gt; 
&gt; ### Problem
&gt; Using `grep -oP` with regex to extract the issue number from URL violates the JSON-first principle. This is brittle text parsing when structured data is available.
&gt; 
&gt; ### Recommended Fix
&gt; ```bash
&gt; ISSUE_DATA=$(gh issue create \
&gt;     --title &quot;Test Issue - Automated Claude Workflow Trigger&quot; \
&gt;     --body &quot;...&quot; \
&gt;     --json number,url)
&gt;     
&gt; ISSUE_NUM=$(echo &quot;$ISSUE_DATA&quot; | jq -r &#39;.number&#39;)
&gt; ISSUE_URL=$(echo &quot;$ISSUE_DATA&quot; | jq -r &#39;.url&#39;)
&gt; ```
&gt; 
&gt; ### Benefits
&gt; - ✅ Gets structured JSON output directly from create command
&gt; - ✅ No regex parsing or URL manipulation
&gt; - ✅ More reliable (doesn&#39;t depend on URL format)
&gt; - ✅ Can get multiple fields in one call
&gt; 
&gt; ### Additional Notes
&gt; The `--json` flag works with `gh issue create` and returns the created issue data in structured format. This is the canonical way to capture issue metadata.
&gt; 
&gt; ### Reference
&gt; See `@docs/tools/gh/json.md` for examples of using `--json` flags on create commands and avoiding text parsing anti-patterns.
&gt; 
&gt; **Priority**: High
&gt; **Type**: Tech Debt
&gt; **Standards**: JSON-First, No Regex Parsing&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/.github#17

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/.github/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/.github/pull/18

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/.github/pull/18.patch
https://github.com/SkogAI/.github/pull/18.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.github/pull/18
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/.github/pull/18@github.com&gt;
