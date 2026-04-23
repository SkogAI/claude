MIME-Version: 1.0
From: "chatgpt-codex-connector[bot]" <notifications@github.com>
To: "SkogAI/.github" <.github@noreply.github.com>
Date: Thu, 16 Apr 2026 20:07:14 -0700
Subject: Re: [SkogAI/.github] feat: add three Claude Code workflow examples in ./workflows/ (PR #25)
Message-ID: <SkogAI/.github/pull/25/review/4125792671@github.com>
In-Reply-To: <SkogAI/.github/pull/25@github.com>
References: <SkogAI/.github/pull/25@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69e1a3e224262_f5110842811d"; charset="UTF-8"

@chatgpt-codex-connector[bot] commented on this pull request.


### 💡 Codex Review

Here are some automated review suggestions for this pull request.

**Reviewed commit:** `286b14173c`
    

<details> <summary>ℹ️ About Codex in GitHub</summary>
<br/>

[Your team has set up Codex to review pull requests in this repo](https://chatgpt.com/codex/cloud/settings/general). Reviews are triggered when you
- Open a pull request for review
- Mark a draft as ready
- Comment "@codex review".

If Codex has suggestions, it will comment; otherwise it will react with 👍.




Codex can also answer questions or update the PR. Try commenting "@codex address that feedback".
            
</details>

> +      id-token: write
+      actions: read
+    steps:
+      - name: Checkout
+        uses: actions/checkout@v4
+        with:
+          fetch-depth: 1
+
+      - name: Build prompt with context
+        id: build
+        env:
+          USER_PROMPT: ${{ inputs.prompt }}
+          ISSUE_NUMBER: ${{ inputs.issue_number }}
+        run: |
+          {
+            echo 'prompt<<PROMPT_EOF'

**<sub><sub>![P2 Badge](https://img.shields.io/badge/P2-yellow?style=flat)</sub></sub>  Use a unique output delimiter for user-supplied prompt**

The `Build prompt with context` step writes a multiline output with a fixed delimiter (`PROMPT_EOF`) while the content comes directly from `${{ inputs.prompt }}`. If the prompt contains a line equal to `PROMPT_EOF`, the output block closes early and remaining lines are parsed as standalone output commands, which can truncate the prompt or inject unintended outputs and break downstream behavior.

Useful? React with 👍 / 👎.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.github/pull/25#pullrequestreview-4125792671
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/.github/pull/25/review/4125792671@github.com>