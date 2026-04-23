MIME-Version: 1.0
From: Ic0n <notifications@github.com>
To: small-hours-games/small-hours <small-hours@noreply.github.com>
Date: Fri, 27 Mar 2026 23:38:46 -0700
Subject: [small-hours-games/small-hours] refactor: make room.js game-agnostic via prepare hooks (PR #78)
Message-ID: <small-hours-games/small-hours/pull/78@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69c77776257b7_ce110818073a"; charset="UTF-8"

## Summary

- `room.js` no longer contains any game-specific logic — `startGame()` is now a generic dispatcher
- Quiz question fetching + session deduplication moved into `quiz.prepare()`
- Question-form file loading moved into `questionForm.prepare()`
- `prewarmCache()` added to `cached-fetcher.js` and called at server startup, so all game-time question fetches are instant disk reads rather than live API calls
- Game definition contract gains optional `async prepare(config, ctx) =&gt; { config, trackIds }` hook

## Why

`room.js` had two `if (gameType === ...)` branches that meant adding any new async game required editing the session layer. The `prepare` hook moves each game&#39;s pre-start data concern back into the game definition, keeping the session layer transport-agnostic.

## Test plan
- [ ] All existing tests pass
- [ ] `npm test` clean in the worktree
- [ ] Quiz game starts correctly with pre-cached questions
- [ ] Question-form game loads questions from file via prepare hook

Generated with [Claude Code](https://claude.ai/code)
You can view, comment on, or merge this pull request online at:

  https://github.com/small-hours-games/small-hours/pull/78?email_source=notifications&amp;email_token=AAFIQZ5BIQAODNQN4VU3OYT4S5XPNA5CNFSNUABEM5UWIORPF5TWS5BNNB2WEL2QOVWGYUTFOF2WK43UF4ZTINRQGA3DSNZWHCTHEZLBONXW5KTTOVRHGY3SNFRGKZFFMV3GK3TUVVYHEX3POBSW4X3DNRUWG2Y

-- Commit Summary --

  * refactor: make room.js game-agnostic via prepare hooks

-- File Changes --

    M src/engine/games/question-form.js (15)
    M src/engine/games/quiz.js (33)
    M src/fetcher/cached-fetcher.js (32)
    M src/server.js (3)
    M src/session/room.js (50)

-- Patch Links --

https://github.com/small-hours-games/small-hours/pull/78.patch?email_source=notifications&amp;email_token=AAFIQZ3EME7RQLB3I544QK34S5XPNA5CNFSNUABEM5UWIORPF5TWS5BNNB2WEL2QOVWGYUTFOF2WK43UF4ZTINRQGA3DSNZWHCTHEZLBONXW5KTTOVRHGY3SNFRGKZFFMV3GK3TUVZYHEX3QMF2GG2C7MNWGSY3Lhttps://github.com/small-hours-games/small-hours/pull/78.diff?email_source=notifications&amp;email_token=AAFIQZ25NHH7B767YV7CBXD4S5XPNA5CNFSNUABEM5UWIORPF5TWS5BNNB2WEL2QOVWGYUTFOF2WK43UF4ZTINRQGA3DSNZWHCTHEZLBONXW5KTTOVRHGY3SNFRGKZFFMV3GK3TUVVYHEX3ENFTGMX3DNRUWG2Y
-- 
Reply to this email directly or view it on GitHub:
https://github.com/small-hours-games/small-hours/pull/78
You are receiving this because you are subscribed to this thread.

Message ID: &lt;small-hours-games/small-hours/pull/78@github.com&gt;
