MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 15:25:52 -0800
Subject: Re: [aldervall/Quiz-trivia] [WIP] Merge master branch into main branch (PR #10)
Message-ID: <aldervall/Quiz-trivia/pull/10/before/7ca2dfb054436fdf3c04acc3a6bb1d0a2a0f5cbd/after/ab5ce2ed0542c790f266789fea1a363ffa2aa0a3@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/10@github.com>
References: <aldervall/Quiz-trivia/pull/10@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a0d680d883d_c6111028342a"; charset="UTF-8"

@copilot pushed 55 commits.

fc46a0d51ff4519e670beb25dabc99c7e7b84eb3  Redesign reveal overlay as floating glass popup
423e8c3fe0a779e5ce47e738d7f69fce5920011a  Add scan instructions and animated scan line to QR panel
20b909e70771439ca422833c3f2bad5547ee0dcc  Redesign player reveal screen with stat cards
bace586285ec4a84b85a2af5b6b20c24a73797ed  Center reveal overlay on screen instead of anchoring to bottom
b75818800f25d10465b5b0dfe023cef8ccfbdc9a  Make scoreboard more transparent and flashy
8f4588364f6de3752ce7816121a8719eb83d76c1  Add pulsing glow and animated checkmark to correct answer reveal
02ded21a0b21f70cb02f3f42f3bb0b66dcd830db  Show each player's answer on the scoreboard with correct/wrong badge
cdbf21e1ee9d27679f01797ae82e2b53af98d49a  Move answer badge to right side of round rows
5b5921a462629c0d49c9c4292c1da46562fba72c  Add position number next to medal in round rows
0a63de0451212cb7370a0e196aa9bfabe2d51c91  Auto-rejoin lobby on Fresh Start instead of clearing to join screen
8f7f112ede915882b87016796520b1fd3a9229bd  Fix join broken after Fresh Start: pre-fill name, don't auto-send JOIN
636b904e359d85803ac746041a42276d2b154b26  Centralize QR code and resize lobby player section
65c2fa9f33104f5fc4fda796f267406636a96b00  Add emoji avatars to player chips using username hash
d21b6daaca99f7cf43d6e9c5df8460cbf297ca98  Make category items larger and player panel more compact in lobby
b0b323b979a6250d685626be85958703f604ea47  Change category list from 2 to 3 columns
548deca26336441ede36fa7bf8bf310ab976c404  Enlarge category group labels in lobby
8c85c0547cdd5acd26c8b58f83707ced9c1dd2c9  Reorganise lobby: categories left column, QR+players right column
14e375f5833b61d680e348e9f7d73312c3577789  Fix lobby layout: wrap QR+players in flex sidebar, categories full left column
81ac53f723615fd40a7f5e7cdc989974a6b35f1f  Fix QR code invisible: give #qr-frame explicit width 210px
f2296ec825efa35ff069d8de9e31f0017236568f  Add multi-room support with 4-letter room codes
9a7e53b44f58d2018507d011d1e074f3dbf6b631  Show question text, timer bar, and answer text on player phone
438d106f64ef44940250f22abcdd3f8955de4d11  Add live score strip to question screen; use answer colour on reveal badge
ecb70ee7e2ec7c89539341cca63fe675c0d6ee47  Add player category voting, bigger QR, and shareable link
30bc4241f7288899103c209244ce56d40a76e316  Fix URL display: straight single-line link box with gradient colour
17f02f721f79df21024b568c334ca68b1ae93509  Polish player phone UX: screen fade-in, bigger touch targets, timer pulse
3dab6caa451bef19963640d36c87daf6d03f52bd  Redesign live score strip: always visible, 3-col card, shows answer+result+speed
ab1537fa4719507dac70f15622be6aa859d305d6  Add persistent live standings sidebar to host question screen
f5f63adf8c9249b67cc5b0eedb1b5c656141d9e9  Remove reveal overlay popup; merge all reveal data into sidebar
ebe13d1a13d0041d8a6b0915ad333be9d5ab9913  Increase player question text size (clamp 1.5→2.2rem)
0ad62365543ae679454c56a7c2e965da97328b19  Redesign host scoreboard strip: bigger chips, bold colors, gold/silver/bronze glow
3da5932992c3152e95de9cb5dadfe85d7b9872d5  Remove category panel from lobby — categories chosen by player vote instead
4575d114107cd04508a408e92a6dee9569b8d043  Fix JS crash: remove dead category panel references that broke QR and all functions
9165c356e08cbb08cfb5692d8660cdffdb802c23  Redesign: Game Night — unified lobby, TV display, quiz player, landing page
7df61e856153c9be4d66fe768dd4e3d7561409bb  Fix start-game block and landing page layout
c43859242efb26d54b3243f24c75ca4b01132df8  Fix Join button overflowing outside card
1a9fe5accfade09e42d1aa33f98647c040c07f49  Fix title layout: separate emoji above Game Night text
3760c374d40195ee032d915171326ec5abc899a9  Fix subtitle overlap: remove negative margin-top pulling into title
b79c74041e6d81d78c423583e716f69df8a7b8b9  Fix Back to Lobby: only admin sends RETURN_TO_LOBBY
7bd2813a6f2b91e846defcbba5dc1eabdbeefa30  Fix room deleted on back-to-lobby: add 30s cleanup grace period
ca8e2c4ba6cbb853c58869ca9c7074d305a33693  Fix admin persistence across game rounds
f72b52040d38db5fd2bdc271c2f4415f1cd33f38  Fix admin persistence: use _returningFromGame flag
487dff48bba272805b1c7f0bb92261e4fd4305ef  Fix quiz player getting stuck on vote screen when game already running
0d7bc6e8bcf9202c5cd304bbfee4524a45d44973  Add debug logging to quiz page
eaaf169649c628a8b60eddbe94471cfcc5fd1055  Remove debug logging from quiz page
4b826b20cd1716ad9d24b4a54a04a80213f5be55  Hide difficulty/question count settings when non-quiz game selected
5260144a855ec7839ca7216bd8d3280042cdf570  Add end-to-end full game test with correct element IDs
9ef380be77b022f12f2c4a143f6bd46a46e164ca  Add puppeteer-core as dev dependency for e2e tests
93fc86a742bdd8579f9775fa36221e7130473191  Add continue game e2e test
fbd23aace2588c8556fefa8033bd3d3c5634c831  Fix admin handoff race condition on back-to-lobby navigation
fa71c9cb52ad66e62274289f2626c8ba227277a7  Add restart/back-to-lobby e2e test
5102b99268454210ab49057e2f060b5719c16c52  Fix admin loss on back-to-lobby: suppress all deletions during transition
3ea603cfcc19a9063376fa16285eb3a222f02e8b  Fix continue test: poll for lobby URL instead of fixed wait
8c533d25581952aafffedb3d7a31e9217535533b  Add True/False questions from OpenTDB to the quiz game
f6eca9d7801a0093383e93c357ff1d5b6b10eb69  Merge master into main: bring all master features and refactors
ab5ce2ed0542c790f266789fea1a363ffa2aa0a3  Add rate limiting to static file serving routes

-- 
View it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/10/changes/7ca2dfb054436fdf3c04acc3a6bb1d0a2a0f5cbd..ab5ce2ed0542c790f266789fea1a363ffa2aa0a3
You are receiving this because you are subscribed to this thread.

Message ID: <aldervall/Quiz-trivia/pull/10/before/7ca2dfb054436fdf3c04acc3a6bb1d0a2a0f5cbd/after/ab5ce2ed0542c790f266789fea1a363ffa2aa0a3@github.com>
