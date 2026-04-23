MIME-Version: 1.0
From: "github-advanced-security[bot]" <notifications@github.com>
To: small-hours-games/small-hours <small-hours@noreply.github.com>
Date: Sat, 11 Apr 2026 05:03:49 -0700
Subject: Re: [small-hours-games/small-hours] refactor: split ws-adapter.js into focused handler modules (closes #88)=0A=0AExtract lobby, game, chat, and vote message handlers into=0Asrc/transport/handlers/ so each module handles a single concern.=0Aws-adapter.js is now a thin orchestrator covering only connection=0Alifecycle, rate limiting, heartbeat, and phase timer infrastructure.=0A=0Ahttps://claude.ai/code/session_018q86BGbWM4rN3iYGcP5rq4 (PR #94)
Message-ID: <small-hours-games/small-hours/pull/94/review/4093703153@github.com>
In-Reply-To: <small-hours-games/small-hours/pull/94@github.com>
References: <small-hours-games/small-hours/pull/94@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69da38a583d82_9b11081730bc"; charset="UTF-8"

@github-advanced-security[bot] commented on this pull request.



> + * @param {object} ctx
+ */
+export function handleChatMessage(ws, meta, room, msg, ctx) {
+  const { send, broadcastToRoom } = ctx;
+
+  if (!meta.playerId) {
+    send(ws, { type: 'ERROR', message: 'Not joined yet' });
+    return;
+  }
+
+  if (!ctx.checkChatRateLimit(meta)) {
+    send(ws, { type: 'ERROR', message: 'Chat rate limit exceeded' });
+    return;
+  }
+
+  const text = String(msg.text || '').replace(/<[^>]*>/g, '').trim().slice(0, 200);

## CodeQL / Incomplete multi-character sanitization

This string may still contain [<script](1), which may cause an HTML element injection vulnerability.

[Show more details](https://github.com/small-hours-games/small-hours/security/code-scanning/82)

-- 
Reply to this email directly or view it on GitHub:
https://github.com/small-hours-games/small-hours/pull/94#pullrequestreview-4093703153
You are receiving this because you authored the thread.

Message ID: <small-hours-games/small-hours/pull/94/review/4093703153@github.com>