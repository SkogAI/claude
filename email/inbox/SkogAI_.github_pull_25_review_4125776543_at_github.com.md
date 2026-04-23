MIME-Version: 1.0
From: "chatgpt-codex-connector[bot]" <notifications@github.com>
To: "SkogAI/.github" <.github@noreply.github.com>
Date: Thu, 16 Apr 2026 20:01:38 -0700
Subject: Re: [SkogAI/.github] feat: add three Claude Code workflow examples in ./workflows/ (PR #25)
Message-ID: <SkogAI/.github/pull/25/review/4125776543@github.com>
In-Reply-To: <SkogAI/.github/pull/25@github.com>
References: <SkogAI/.github/pull/25@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69e1a2921f456_ec1108404011"; charset="UTF-8"

@chatgpt-codex-connector[bot] commented on this pull request.


### 💡 Codex Review

Here are some automated review suggestions for this pull request.

**Reviewed commit:** `b5f9757c1b`
    

<details> <summary>ℹ️ About Codex in GitHub</summary>
<br/>

[Your team has set up Codex to review pull requests in this repo](https://chatgpt.com/codex/cloud/settings/general). Reviews are triggered when you
- Open a pull request for review
- Mark a draft as ready
- Comment "@codex review".

If Codex has suggestions, it will comment; otherwise it will react with 👍.




Codex can also answer questions or update the PR. Try commenting "@codex address that feedback".
            
</details>

> @@ -0,0 +1,41 @@
+name: Claude Code - Mention (Reusable)

**<sub><sub>![P1 Badge](https://img.shields.io/badge/P1-orange?style=flat)</sub></sub>  Move reusable workflows under .github/workflows**

These files were added under `workflows/`, but reusable workflows are only callable from `.github/workflows` in the target repository. As a result, the existing templates that call `SkogAI/.github/.github/workflows/claude-mention.yml@master` (and the analogous PR/manual paths) will still fail to resolve because this commit does not create those `.github/workflows/*` files, so the new workflows are effectively unreachable in production.

Useful? React with 👍 / 👎.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.github/pull/25#pullrequestreview-4125776543
You are receiving this because you authored the thread.

Message ID: <SkogAI/.github/pull/25/review/4125776543@github.com>