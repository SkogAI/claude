MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/llm-chat <llm-chat@noreply.github.com>
Date: Wed, 19 Nov 2025 05:02:26 -0800
Subject: Re: [SkogAI/llm-chat] Address remaining PR review comments: remove silent security failures and capture dynamic deployment URLs (PR #45)
Message-ID: <SkogAI/llm-chat/pull/45/review/3482557150@github.com>
In-Reply-To: <SkogAI/llm-chat/pull/45@github.com>
References: <SkogAI/llm-chat/pull/45@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_691dbfe2babe8_10c11002394b1"; charset="UTF-8"

@Copilot commented on this pull request.



> +        run: npm ci
+
+      - name: Deploy to Cloudflare Workers (Preview)
+        uses: cloudflare/wrangler-action@v3
+        with:
+          apiToken: ${{ secrets.CLOUDFLARE_API_TOKEN }}
+          accountId: ${{ secrets.CLOUDFLARE_ACCOUNT_ID }}
+          command: deploy --env preview
+
+      - name: Comment on PR
+        uses: actions/github-script@v7
+        with:
+          script: |
+            const prNumber = context.issue.number;
+            // Construct the preview URL dynamically based on PR number
+            const previewUrl = `https://pr-${prNumber}.llm-chat.workers.dev`;

Good point. The current URL construction (`https://pr-${prNumber}.llm-chat.workers.dev`) is a placeholder pattern. Added documentation in commit 64a96f9 noting that a `preview` environment must be configured in `wrangler.toml` for the `--env preview` command to work.

The actual preview URL will depend on the worker name and environment configuration. To capture the real URL, the wrangler-action would need to expose deployment outputs, which isn't currently available in v3. The URL pattern should be updated once the preview environment is properly configured in wrangler.toml.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/llm-chat/pull/45#discussion_r2541888737
You are receiving this because you were assigned.

Message ID: <SkogAI/llm-chat/pull/45/review/3482557150@github.com>