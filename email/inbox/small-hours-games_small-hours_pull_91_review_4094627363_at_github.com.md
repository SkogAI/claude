MIME-Version: 1.0
From: "github-advanced-security[bot]" <notifications@github.com>
To: small-hours-games/small-hours <small-hours@noreply.github.com>
Date: Sat, 11 Apr 2026 23:02:23 -0700
Subject: Re: [small-hours-games/small-hours] feat: add formal observer/spectator role to Room and ws-adapter (closes #85)=0A=0Ahttps://claude.ai/code/session_018q86BGbWM4rN3iYGcP5rq4 (PR #91)
Message-ID: <small-hours-games/small-hours/pull/91/review/4094627363@github.com>
In-Reply-To: <small-hours-games/small-hours/pull/91@github.com>
References: <small-hours-games/small-hours/pull/91@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69db356f53a2f_a21108992722"; charset="UTF-8"

@github-advanced-security[bot] commented on this pull request.



> +      return;
+    }
+
+    const action = { ...msg.action, playerId: meta.playerId };
+    const { game: updatedGame, events } = processAction(room.game, action);
+    room.game = updatedGame;
+    room.lastActivity = Date.now();
+
+    const playerNames = getPlayerNames(room);
+
+    // Send per-player views (flattened into GAME_STATE)
+    for (const [id] of room.players) {
+      const view = getView(room.game, id);
+      sendToPlayer(id, { type: 'GAME_STATE', ...view, playerNames });
+    }
+

## CodeQL / Incomplete multi-character sanitization

This string may still contain [<script](1), which may cause an HTML element injection vulnerability.

[Show more details](https://github.com/small-hours-games/small-hours/security/code-scanning/44)

-- 
Reply to this email directly or view it on GitHub:
https://github.com/small-hours-games/small-hours/pull/91#pullrequestreview-4094627363
You are receiving this because you modified the open/close state.

Message ID: <small-hours-games/small-hours/pull/91/review/4094627363@github.com>