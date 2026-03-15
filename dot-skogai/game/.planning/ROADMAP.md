# Roadmap: Small Hours Games

**Created:** 2026-03-15
**Granularity:** Fine (12 phases)
**Coverage:** 83/83 v1 requirements mapped

## Phases

- [ ] **Phase 1: Infrastructure Foundation** - Running Node.js server in Docker with HTTPS, Helmet, rate limiting, and static serving
- [ ] **Phase 2: WebSocket Transport** - WS server on same port with message dispatch, heartbeat, rate limiting, and socket registry
- [ ] **Phase 3: Room Manager** - Room lifecycle, player identity, admin logic, reconnection grace periods, and bot system
- [ ] **Phase 4: Lobby** - Player list, ready state, chat, QR code, game suggestions, and language selection
- [ ] **Phase 5: Persistence Layer** - Question cache, game history, player stats, and REST API endpoints
- [ ] **Phase 6: Game Engine** - GameController base class, 100ms tick loop, broadcast pattern, and Number Guess reference
- [ ] **Phase 7: Quiz Game** - Category voting, question phases, power-ups, speed scoring, and streak tracking
- [ ] **Phase 8: Spy Game** - Role assignment, clue-giving, word guessing, round management, and scoring
- [ ] **Phase 9: Cards Against Humanity** - Czar rotation, black/white card flow, blind judging, and scoring
- [ ] **Phase 10: Shithead Card Game** - Full 52-card ruleset, private hands, swap phase, pile burns, and bot heuristics
- [ ] **Phase 11: Lyrics Guessing** - Lyrics display, guess input, configurable rounds, and speed scoring
- [ ] **Phase 12: Frontend Polish** - Neon/glass theme, animations, sound effects, offline detection, and safe areas

## Phase Details

### Phase 1: Infrastructure Foundation
**Goal**: The server runs in Docker, serves HTTPS correctly on iOS, and applies all security middleware before a single WebSocket connection is made
**Depends on**: Nothing (first phase)
**Requirements**: INFRA-01, INFRA-02, INFRA-03, INFRA-04, INFRA-05, INFRA-06, INFRA-07, INFRA-08
**Success Criteria** (what must be TRUE):
  1. `docker compose up` brings the server up and `GET /health` returns 200 with uptime
  2. Server accepts HTTPS connections — iPhone Safari loads the page without a cert warning or silent failure
  3. Curl to any page route more than 120 times/min from the same IP gets 429 responses
  4. Server sends `SERVER_RESTARTING` to any open WebSocket before shutting down on `SIGTERM`
  5. Node.js process reports `--max-old-space-size=400` in its startup flags (OOM guard in place)
**Plans**: TBD

### Phase 2: WebSocket Transport
**Goal**: Any client that opens a WebSocket gets a working connection with heartbeat, message dispatch, and rate limiting — no game logic yet
**Depends on**: Phase 1
**Requirements**: WS-01, WS-02, WS-03, WS-04, WS-05, WS-06
**Success Criteria** (what must be TRUE):
  1. Browser opens a WebSocket to the server and immediately receives a `CONNECTED` message with language info
  2. Sending more than 30 WebSocket messages per second from one socket results in dropped messages (not crash)
  3. Closing a browser tab causes the server to detect the dead socket within 30 seconds via heartbeat
  4. Sending a JSON payload over 16KB is rejected without terminating the server
**Plans**: TBD

### Phase 3: Room Manager
**Goal**: Players can create rooms, join them by code, see each other in the room, and reconnect without losing their place — with bots filling in for solo play
**Depends on**: Phase 2
**Requirements**: ROOM-01, ROOM-02, ROOM-03, ROOM-04, ROOM-05, ROOM-06, ROOM-07, ROOM-08, ADMIN-01, ADMIN-02, ADMIN-03, ADMIN-04, ADMIN-05, ADMIN-06, BOT-01, BOT-02, BOT-03, BOT-04
**Success Criteria** (what must be TRUE):
  1. Display browser navigates to `/host/ABCD` and receives `DISPLAY_OK`; phone navigates to `/player/ABCD` and receives `JOIN_OK` with a session token
  2. First player to join sees themselves marked as admin; a second player does not
  3. Player closes their phone browser tab and reopens it within 30 seconds — they rejoin as the same player without creating a duplicate
  4. Admin disconnects; after the grace period the next player receives `ADMIN_CHANGED` and can start a game
  5. Single human in a room sees a bot named "🤖 Bot"; a second human joins and the bot disappears
**Plans**: TBD

### Phase 4: Lobby
**Goal**: Players in a room can see each other, mark themselves ready, chat, vote on what to play next, and start a game — the complete pre-game experience
**Depends on**: Phase 3
**Requirements**: LOBBY-01, LOBBY-02, LOBBY-03, LOBBY-04, LOBBY-05, LOBBY-06, LOBBY-07
**Success Criteria** (what must be TRUE):
  1. Player joins and the display immediately shows their username, avatar, and "not ready" status in the player list
  2. Player scans the QR code displayed on screen from across the room and is taken to the join URL
  3. Player sends more than 3 chat messages within 5 seconds — the 4th message is rejected
  4. Admin selects a game and taps Start — all clients (display and all phones) receive `MINI_GAME_STARTING` and navigate to the game
  5. Game ends and all clients return to the lobby without needing to re-enter the room code
**Plans**: TBD

### Phase 5: Persistence Layer
**Goal**: Questions are cached locally from OpenTrivia DB, game results are logged, player stats are queryable, and the REST API exposes all of it
**Depends on**: Phase 3
**Requirements**: PERS-01, PERS-02, PERS-03, PERS-04, PERS-05, PERS-06, API-01, API-02, API-03, API-04, API-05, API-06, API-07, API-08
**Success Criteria** (what must be TRUE):
  1. `POST /api/db/download` triggers a background fetch; `GET /api/db/status` shows download progress and per-category question counts
  2. Quiz game runs when OpenTrivia DB is unreachable — questions load from local JSON cache
  3. A completed game appears in `GET /api/history` within one request after the game ends
  4. `GET /api/stats/:username` returns cumulative stats for a player who has completed at least two games
  5. Questions already answered in a quiz session do not repeat within that session (session token prevents repeats)
**Plans**: TBD

### Phase 6: Game Engine
**Goal**: The GameController pattern is implemented, the 100ms tick loop broadcasts state correctly, and Number Guess proves the extension pattern works end to end
**Depends on**: Phase 4, Phase 5
**Requirements**: ENG-01, ENG-02, ENG-03, ENG-04, ENG-05, ENG-06
**Success Criteria** (what must be TRUE):
  1. Number Guess game starts, ticks, accepts player input, transitions through phases, and ends — all via the extension pattern without touching WebSocket directly
  2. Server broadcasts `GAME_STATE` exactly once per 100ms tick; JSON.stringify is called once per tick regardless of connected player count
  3. A game phase timer set to 10 seconds transitions at 10 seconds wall-clock time under server load (not drift from counter increments)
  4. Individual player state (e.g., per-player guess) is sent only to that player's socket, not in the shared broadcast
**Plans**: TBD

### Phase 7: Quiz Game
**Goal**: Players can play a complete quiz round — voting on categories, answering timed questions with power-ups, and seeing a final leaderboard with speed-weighted scores
**Depends on**: Phase 6
**Requirements**: QUIZ-01, QUIZ-02, QUIZ-03, QUIZ-04, QUIZ-05, QUIZ-06, QUIZ-07, QUIZ-08
**Success Criteria** (what must be TRUE):
  1. Players vote on a category before the game starts and questions are drawn from that category
  2. Question timer counts down visibly; a player who answers in 2 seconds scores more than one who answers in 10 seconds
  3. Player uses a Double Points power-up on a correct answer and receives exactly double the base score for that question
  4. Fifty-Fifty power-up eliminates exactly two wrong answers from the displayed choices
  5. Bot answers after a random delay and is correct roughly half the time across a full game
**Plans**: TBD

### Phase 8: Spy Game
**Goal**: Players can play a complete Spy Game session — one spy gets no word, non-spies give clues, the spy guesses, and points are awarded correctly each round
**Depends on**: Phase 6
**Requirements**: SPY-01, SPY-02, SPY-03, SPY-04, SPY-05, SPY-06
**Success Criteria** (what must be TRUE):
  1. Each round exactly one player receives no secret word (the spy); all others see the same word
  2. Non-spies have 30 seconds to submit a one-word clue; clues appear on the display in submission order
  3. Spy has 20 seconds to guess the word after clues are revealed
  4. Spy guesses correctly — spy earns +3 and non-spies earn nothing; spy guesses wrong — each non-spy earns +1
  5. Game runs for the configured number of rounds and shows a final leaderboard
**Plans**: TBD

### Phase 9: Cards Against Humanity
**Goal**: Players can play a complete CAH session — czar draws a prompt, others submit answers, czar judges blind, and the winner gets a point each round
**Depends on**: Phase 6
**Requirements**: CAH-01, CAH-02, CAH-03, CAH-04, CAH-05, CAH-06
**Success Criteria** (what must be TRUE):
  1. Each round a different player is card czar; after one full rotation every player has been czar once
  2. Non-czar players see a hand of white cards and can submit one (or more for blanks); czar sees only the black card prompt during submission
  3. Czar sees submitted answers in shuffled order with no player attribution
  4. Czar picks a winner — that player receives exactly +1 point and a win notification
  5. Game ends after the configured number of rounds and shows the final scores
**Plans**: TBD

### Phase 10: Shithead Card Game
**Goal**: Players can play a complete Shithead game — deal, swap phase, turn-by-turn play through hand/face-up/face-down, pile burns, and a declared shithead at the end
**Depends on**: Phase 6
**Requirements**: SH-01, SH-02, SH-03, SH-04, SH-05, SH-06, SH-07, SH-08, SH-09, SH-10, SH-11
**Success Criteria** (what must be TRUE):
  1. At deal time all 52 cards are distributed with no duplicates — 9 cards per player (3 hand, 3 face-up, 3 face-down), deck has the remainder
  2. Each player can swap their hand cards with their face-up cards during the 30-second swap phase; cards appear only on their own phone screen
  3. Playing four matching ranks onto the pile causes the pile to disappear (burn) and the player takes another turn
  4. Player empties their hand and face-up cards, then plays face-down cards blind — if a blind card is invalid they must pick up the pile
  5. Last player with cards is declared "shithead" on the display; all other players see a finish-order leaderboard
**Plans**: TBD

### Phase 11: Lyrics Guessing
**Goal**: Players can play a complete Lyrics Guessing session — lyrics are displayed progressively, players guess, and scores reflect accuracy and speed
**Depends on**: Phase 6
**Requirements**: LYR-01, LYR-02, LYR-03, LYR-04
**Success Criteria** (what must be TRUE):
  1. Partial lyrics appear on the display and players can submit a guess from their phone
  2. Player who guesses correctly faster than others scores more than a slower correct guesser
  3. Game runs for the configured number of rounds and shows a final leaderboard
  4. Solo player (1 human) can complete a full game (bot fills if minimum players needed)
**Plans**: TBD

### Phase 12: Frontend Polish
**Goal**: Every screen has the neon/glass visual theme, transitions are animated, sound plays on game events (with iOS mute handling), and phones handle notch safe areas correctly
**Depends on**: Phase 11
**Requirements**: UI-01, UI-02, UI-03, UI-04, UI-05, UI-06, UI-07, UI-08, UI-09
**Success Criteria** (what must be TRUE):
  1. Phone controller UI renders without horizontal scrolling or button clipping on iPhone 12, 14 Pro (notch), and 15 (Dynamic Island)
  2. Winning a game triggers a confetti animation on both the display and the winner's phone
  3. Sound effect plays on correct answer — iOS Safari plays audio without requiring a second tap (AudioContext unlocked on first gesture)
  4. Player's phone loses Wi-Fi for 5 seconds and reconnects — the UI shows a reconnecting indicator then returns to the game state
  5. Display screen is legible from 3 meters — font sizes, contrast, and layout pass a casual readability check at TV viewing distance

## Progress

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Infrastructure Foundation | 0/? | Not started | - |
| 2. WebSocket Transport | 0/? | Not started | - |
| 3. Room Manager | 0/? | Not started | - |
| 4. Lobby | 0/? | Not started | - |
| 5. Persistence Layer | 0/? | Not started | - |
| 6. Game Engine | 0/? | Not started | - |
| 7. Quiz Game | 0/? | Not started | - |
| 8. Spy Game | 0/? | Not started | - |
| 9. Cards Against Humanity | 0/? | Not started | - |
| 10. Shithead Card Game | 0/? | Not started | - |
| 11. Lyrics Guessing | 0/? | Not started | - |
| 12. Frontend Polish | 0/? | Not started | - |

---
*Roadmap created: 2026-03-15*
*Requirements coverage: 83/83 v1 requirements*
