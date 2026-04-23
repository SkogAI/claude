MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 20:38:18 -0800
Subject: Re: [aldervall/Quiz-trivia] Clarify Shithead rules with exact card behavior (PR #41)
Message-ID: <aldervall/Quiz-trivia/pull/41/review/3864825890@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/41@github.com>
References: <aldervall/Quiz-trivia/pull/41@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a11fba476ea_ea111015164c"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Updates the public rules page to better describe Shithead’s gameplay, aiming to match the in-app card behavior.

**Changes:**
- Expanded the Shithead rules list with detailed card-by-card behavior (2/3/7/10, four-of-a-kind burn, play order, etc.).
- Tweaked the rules page header styling by adding `background-clip: text`.
- Reworded the “house rules” disclaimer to claim the page reflects exact in-app rules.





> @@ -43,6 +43,7 @@
       font-weight: 900;
       letter-spacing: 0.01em;
       background: linear-gradient(90deg, var(--accent), var(--timer));
+      background-clip: text;
       -webkit-background-clip: text;
       -webkit-text-fill-color: transparent;

`background-clip: text` alone won’t produce the gradient text effect in non-WebKit browsers because `h1` still inherits a non-transparent `color` (and `-webkit-text-fill-color` is ignored). If the intent is cross-browser gradient text, add a non-WebKit fallback like `color: transparent` alongside `background-clip: text` (keeping the existing `-webkit-*` rules for Chrome/Safari).
```suggestion
      -webkit-text-fill-color: transparent;
      color: transparent;
```

> @@ -107,15 +108,24 @@ <h2>Quiz</h2>
     <section class="card">
       <h2>Shithead</h2>
       <ul>
-        <li>Swap phase: arrange your 3 face-up cards before play starts.</li>
-        <li>Play cards of equal or higher rank than the current top card.</li>
-        <li>Special cards can reset or clear the pile based on game rules.</li>
-        <li>If you cannot play, pick up the pile.</li>
-        <li>The first player to get rid of all cards wins.</li>
+        <li><strong>Goal:</strong> get rid of all your cards. Last player left is the “Shithead”.</li>
+        <li><strong>Card order (rank):</strong> 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A (Ace high).</li>
+        <li><strong>What is rank?</strong> rank means only card value (number/letter), not suit.</li>
+        <li><strong>Turn rule:</strong> normally you must play a card with rank <em>equal to or higher</em> than the effective top card on the pile.</li>
+        <li><strong>Pairs / sets:</strong> there is no point value bonus. A pair/triple is only useful because you may play multiple cards of the <em>same rank</em> in one move.</li>
+        <li><strong>4 of a kind burn:</strong> if the top 4 pile cards are the same rank, the pile burns (clears) and that player plays again.</li>
+        <li><strong>2:</strong> wildcard — always legal to play, regardless of top card.</li>
+        <li><strong>7:</strong> activates “low mode” for next play (next player must play rank 7 or lower).</li>

The “low mode” description isn’t exact per the in-app rules: `_canPlay(rank)` allows rank 2 and 10 regardless of `sevenActive`, so after a 7 the next player can still legally play a 2 or 10 even though they’re higher than 7. Update this bullet to mention the exception (or rephrase low mode in terms of the actual legality check).
```suggestion
        <li><strong>7:</strong> activates “low mode” for next play (next player must play rank 7 or lower, except that 2 and 10 are still always legal).</li>
```

> +        <li><strong>Goal:</strong> get rid of all your cards. Last player left is the “Shithead”.</li>
+        <li><strong>Card order (rank):</strong> 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A (Ace high).</li>
+        <li><strong>What is rank?</strong> rank means only card value (number/letter), not suit.</li>
+        <li><strong>Turn rule:</strong> normally you must play a card with rank <em>equal to or higher</em> than the effective top card on the pile.</li>

The rules section no longer mentions the swap/setup phase, but the game logic has an explicit `SWAP` state where players can swap hand cards with face-up cards until everyone confirms. Since the page now claims these are the “exact in-app rules”, it should include a brief bullet about this swap phase to avoid misleading players.

> -        <li>Special cards can reset or clear the pile based on game rules.</li>
-        <li>If you cannot play, pick up the pile.</li>
-        <li>The first player to get rid of all cards wins.</li>
+        <li><strong>Goal:</strong> get rid of all your cards. Last player left is the “Shithead”.</li>
+        <li><strong>Card order (rank):</strong> 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A (Ace high).</li>
+        <li><strong>What is rank?</strong> rank means only card value (number/letter), not suit.</li>
+        <li><strong>Turn rule:</strong> normally you must play a card with rank <em>equal to or higher</em> than the effective top card on the pile.</li>
+        <li><strong>Pairs / sets:</strong> there is no point value bonus. A pair/triple is only useful because you may play multiple cards of the <em>same rank</em> in one move.</li>
+        <li><strong>4 of a kind burn:</strong> if the top 4 pile cards are the same rank, the pile burns (clears) and that player plays again.</li>
+        <li><strong>2:</strong> wildcard — always legal to play, regardless of top card.</li>
+        <li><strong>7:</strong> activates “low mode” for next play (next player must play rank 7 or lower).</li>
+        <li><strong>10:</strong> burns the pile immediately and gives you another turn.</li>
+        <li><strong>3:</strong> transparent — it stays on pile, but top comparison ignores 3s when checking what can be played next.</li>
+        <li><strong>Ace:</strong> highest normal rank; behaves like any other non-special high card.</li>
+        <li><strong>Can’t play?</strong> choose “Pick up pile” and add the entire pile to your hand.</li>
+        <li><strong>Play order:</strong> use hand cards first; when hand is empty use face-up table cards; then face-down blind cards.</li>

The in-app rules include drawing back up to 3 cards from the deck after playing from your hand (until the deck is empty). This is a core rule in the implementation (`_replenish` is called after a hand play), but it’s not documented here despite the “exact in-app rules” claim. Consider adding a bullet that explains the auto-draw-to-3 mechanic.
```suggestion
        <li><strong>Play order:</strong> use hand cards first; when hand is empty use face-up table cards; then face-down blind cards.</li>
        <li><strong>Auto-draw:</strong> after you play from your hand, the game automatically draws from the deck until you have 3 cards in hand, or the deck is empty.</li>
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/41#pullrequestreview-3864825890
You are receiving this because you modified the open/close state.

Message ID: <aldervall/Quiz-trivia/pull/41/review/3864825890@github.com>