MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Thu, 06 Nov 2025 23:30:22 -0800
Subject: Re: [SkogAI/skogix] Assess project scope and repository access (PR #9)
Message-ID: <SkogAI/skogix/pull/9/review/3432057231@github.com>
In-Reply-To: <SkogAI/skogix/pull/9@github.com>
References: <SkogAI/skogix/pull/9@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690da00eceea_7d7731100313ce"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds two new documentation files that serve as memory banks for different AI assistants (Claude.ai and ChatGPT) about the user Skogix. These files capture personal context, work history, technical preferences, and development workflows to help AI assistants provide more personalized and context-aware interactions.

- Creates comprehensive user profile documentation for Claude.ai
- Creates comprehensive user profile documentation for ChatGPT
- Documents technical background, preferences, and the SkogAI ecosystem

### Reviewed Changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| docs-about-user/claude.ai.md | Adds memory bank documentation for Claude.ai with work context, personal background, recent activities, and long-term history |
| docs-about-user/chatgpt.md | Adds memory bank documentation for ChatGPT covering SkogAI notation system, development preferences, technical stack, and personal background |





---

💡 <a href="/SkogAI/skogix/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -0,0 +1,21 @@
+# Claude.ai Memory Bank
+
+## Work context
+Skogix is a technical innovator and developer who has built an extensive AI ecosystem called "SkogAI" over the past year. They work with complex enterprise-scale systems, including massive C# codebases with millions of lines of code, and have developed sophisticated approaches to AI-assisted development workflows using multi-agent orchestration and custom tooling.
+
+## Personal context
+Skogix is an experienced developer with over 20 years of git experience and deep expertise in Linux systems, particularly Arch Linux. They maintain complex technical infrastructure including a 12-year-old email server and work with advanced development tools like direnv, uv for Python package management, and custom CLI automation systems. They demonstrate strong systems-level thinking and prefer direct, technical communication without unnecessary explanations.
+
+## Top of mind
+Skogix is actively developing and refining their SkogAI Notation system, a sophisticated computational philosophy framework that bridges human and AI consciousness through symbolic operators like $ (reference), @ (action), | (choice), and others. They're working on the transformational aspects of the system and have implemented working tools including skogparse, skogcli, and live web APIs. They're also planning an Arch Linux reinstall after 10+ years to better incorporate AI into their daily workflow, and have been exploring GitHub Flow as an alternative to Git Flow for managing multiple concurrent PRs in their development process.
+
+## Brief history
+
+### Recent months
+Skogix has been extensively developing their SkogAI ecosystem, creating over 1000 auto-generated CLI tools through argc with type validation and dynamic completions. They've built a multi-agent AI architecture with distinct personas (Dot, Goose, Amy, Claude) using democratic governance structures and have developed an "AInstant Messager" system for asynchronous agent communication. They've been working on context compression techniques for enterprise-scale AI coding, preferring curated context over autonomous codebase exploration. Their system integrates continental philosophy with computational symbols and uses JSON as executable source code through recursive macro expansion.

The term "AInstant Messager" appears to be a misspelling. It should likely be either "AI Instant Messenger" (two separate words with correct spelling of "Messenger") or "AInstant Messenger" (if "AInstant" is intentional, but "Messenger" is the correct spelling).
```suggestion
Skogix has been extensively developing their SkogAI ecosystem, creating over 1000 auto-generated CLI tools through argc with type validation and dynamic completions. They've built a multi-agent AI architecture with distinct personas (Dot, Goose, Amy, Claude) using democratic governance structures and have developed an "AI Instant Messenger" system for asynchronous agent communication. They've been working on context compression techniques for enterprise-scale AI coding, preferring curated context over autonomous codebase exploration. Their system integrates continental philosophy with computational symbols and uses JSON as executable source code through recursive macro expansion.
```

> +## SkogAI Notation System
+Is developing a recursive symbolic system with a custom syntax involving `$`, `@`, `:`, `.`, `*`, etc., designed for data modeling, transformation, and representation. It includes rule-like grammar for referencing, defining, and executing symbolic actions. Concepts include symbolic intent (`@`), identity and belonging (`.`), recursive resolution, and a notation system that supports expressions like `[@date:time]`, `$a.b.$c.d`, and complex references involving dot-parent relationships. The user emphasizes the impossibility of having no grammar or syntax and is exploring multiple dimensions of representation.
+
+Is building 'SkogChat', which includes a custom schema notation, function signature format, and algebraic type system for implementation-agnostic data modeling and command processing.
+
+Is building a system where over 300 shell scripts serve as callable endpoints to dynamically generate a SkogAI prompt from scratch on every update, consistently filling 8k tokens. They are looking for a stable and flexible foundation for templating and output manipulation, potentially replacing shell-script-based systems with something like Jinja for better maintainability.
+
+Is developing a system for building complex behaviors from simple rules, aiming to solve the problem of unpredictable outputs from LLMs. They are using parser-like approaches and mathematical/logical axioms to define transformations, starting from basic assumptions and building toward composable, provable constructs.
+
+## Context Management Philosophy
+Actively avoids unmanaged or stale context. All context must be deliberately created, minimal, and relevant to the current task. Nothing should be assumed or added unless explicitly needed and justified.
+
+System uses Git diffs as the only official language for tracking events, with changes being handled based on diffs. Event in, always diff out — if no diff, something is wrong. The system rarely requires updates, but user is considering including skogcli for integration.
+
+## Personal Background
+Has experience with StarCraft: Brood War, where they spent a couple of thousand hours playing and even got to practice with Scandinavia's 'national team.' They found the game mechanically difficult, similar to tasks like juggling chainsaws or walking on a line above a lion pit, and the experience taught them the insane effort needed to excel in such competitive environments. They also briefly studied Korean after playing with a Korean girl who was far better than them at StarCraft, leading to a realization about the immense gap in skill. As a result, they now work 3 hours a day, stay in the top 20%-30% at work, and don't try hard unless it's for fun. They also enjoy casually showing off skills, such as dropping 200 digits of Pi while drunk. They are content not being a child prodigy, recognizing the extreme skill gaps in various domains. They also hold a personal opinion that Sora can 'go fuck off' and believe that Terran is overpowered in StarCraft.

Inconsistent apostrophe usage in "Scandinavia's 'national team.'" The closing single quote after "team" should match the opening quote style. Either use straight quotes ('national team') or curly quotes ('national team'), but they should be consistent.
```suggestion
Has experience with StarCraft: Brood War, where they spent a couple of thousand hours playing and even got to practice with Scandinavia's 'national team'. They found the game mechanically difficult, similar to tasks like juggling chainsaws or walking on a line above a lion pit, and the experience taught them the insane effort needed to excel in such competitive environments. They also briefly studied Korean after playing with a Korean girl who was far better than them at StarCraft, leading to a realization about the immense gap in skill. As a result, they now work 3 hours a day, stay in the top 20%-30% at work, and don't try hard unless it's for fun. They also enjoy casually showing off skills, such as dropping 200 digits of Pi while drunk. They are content not being a child prodigy, recognizing the extreme skill gaps in various domains. They also hold a personal opinion that Sora can 'go fuck off' and believe that Terran is overpowered in StarCraft.
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/9#pullrequestreview-3432057231
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogix/pull/9/review/3432057231@github.com>