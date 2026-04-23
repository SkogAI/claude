MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/llm-chat <llm-chat@noreply.github.com>
Date: Wed, 19 Nov 2025 05:01:43 -0800
Subject: Re: [SkogAI/llm-chat] Address remaining PR review comments: remove silent security failures and capture dynamic deployment URLs (PR #45)
Message-ID: <SkogAI/llm-chat/pull/45/review/3482553429@github.com>
In-Reply-To: <SkogAI/llm-chat/pull/45@github.com>
References: <SkogAI/llm-chat/pull/45@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_691dbfb7e30fc_fd1100260266"; charset="UTF-8"

@Copilot commented on this pull request.



> +        uses: actions/setup-node@v4
+        with:
+          node-version: '20'
+          cache: 'npm'
+
+      - name: Install dependencies
+        run: npm ci
+
+      - name: Run TypeScript check
+        run: npx tsc --noEmit
+
+      - name: Run tests
+        run: npm test
+
+      - name: Validate wrangler config
+        if: ${{ secrets.CLOUDFLARE_API_TOKEN != '' }}

Fixed in commit 64a96f9. Changed from `if: ${{ secrets.CLOUDFLARE_API_TOKEN != '' }}` to `if: secrets.CLOUDFLARE_API_TOKEN` as the outer wrapper is not needed in if conditions.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/llm-chat/pull/45#discussion_r2541885908
You are receiving this because you were assigned.

Message ID: <SkogAI/llm-chat/pull/45/review/3482553429@github.com>