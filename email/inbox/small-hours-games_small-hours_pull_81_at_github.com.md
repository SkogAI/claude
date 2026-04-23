MIME-Version: 1.0
From: Ic0n <notifications@github.com>
To: small-hours-games/small-hours <small-hours@noreply.github.com>
Date: Sat, 04 Apr 2026 13:09:33 -0700
Subject: [small-hours-games/small-hours] test: add comprehensive coverage for 6 untested modules (PR #81)
Message-ID: <small-hours-games/small-hours/pull/81@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69d16ffd5b9f8_de11081278441"; charset="UTF-8"

- tests/engine/engine.test.js: createGame, processAction, getView, checkEnd incl. error paths (20 tests)
- tests/engine/spy.test.js: setup, clue submission, guess scoring, timer transitions, view filtering (38 tests)
- tests/engine/quiz.test.js: answer/powerup submission, scoring, all 4 timer transitions, view filtering (39 tests)
- tests/session/room.test.js: player lifecycle, admin promotion, ready state, game registry (52 tests)
- tests/session/manager.test.js: room creation, lookup, cleanup w/ fake timers, player mapping (25 tests)
- tests/transport/ws-adapter.test.js: message dispatch, rate limiting, reconnect grace period (32 tests)

All 456 tests pass (was 250).
You can view, comment on, or merge this pull request online at:

  https://github.com/small-hours-games/small-hours/pull/81

-- Commit Summary --

  * test: add comprehensive coverage for 6 untested modules

-- File Changes --

    A tests/engine/engine.test.js (216)
    A tests/engine/quiz.test.js (485)
    A tests/engine/spy.test.js (420)
    A tests/session/manager.test.js (266)
    A tests/session/room.test.js (435)
    A tests/transport/ws-adapter.test.js (546)

-- Patch Links --

https://github.com/small-hours-games/small-hours/pull/81.patchhttps://github.com/small-hours-games/small-hours/pull/81.diff
-- 
Reply to this email directly or view it on GitHub:
https://github.com/small-hours-games/small-hours/pull/81
You are receiving this because you are subscribed to this thread.

Message ID: &lt;small-hours-games/small-hours/pull/81@github.com&gt;
