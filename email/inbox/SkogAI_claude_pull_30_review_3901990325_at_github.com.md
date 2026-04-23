MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/claude <claude@noreply.github.com>
Date: Thu, 05 Mar 2026 23:37:56 -0800
Subject: Re: [SkogAI/claude] fix(skogai-routing): add missing routing entry for option 5 (PR #30)
Message-ID: <SkogAI/claude/pull/30/review/3901990325@github.com>
In-Reply-To: <SkogAI/claude/pull/30@github.com>
References: <SkogAI/claude/pull/30@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69aa845460220_cd1110231071"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Adds the missing routing entry for intake option 5 in the `skogai-routing` skill so that “Use the routing patterns in your general workflow” no longer dead-ends and instead points to the core reference material.

**Changes:**
- Add `<routing>` table row for option 5.
- Route option 5 to the recommended structure + core principles references.





---

💡 <a href="/SkogAI/claude/new/master?filename=.github/instructions/*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -82,6 +82,7 @@ If intent is clear from context, route directly. Otherwise, ask.
 | 2, "audit", "modify", "existing" | Ask: "Path to skill?" | Route to appropriate workflow |
 | 3, "add", "component" | Ask: "Add what? (workflow/reference/template/script)" | workflows/add-{type}.md |
 | 4, "guidance", "help" | General guidance | workflows/get-guidance.md |
+| 5, "use routing", "apply patterns" | Read core routing references | references/recommended-structure.md + references/core-principles.md |

In the routing table, using `+` between two file paths can be misread as path concatenation or a single token by readers/tools. Consider listing multiple targets with a clearer delimiter (e.g., comma / “and”), or routing to a small workflow file that in turn instructs the agent to read both references.
```suggestion
| 5, "use routing", "apply patterns" | Read core routing references | references/recommended-structure.md, references/core-principles.md |
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/claude/pull/30#pullrequestreview-3901990325
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/claude/pull/30/review/3901990325@github.com>