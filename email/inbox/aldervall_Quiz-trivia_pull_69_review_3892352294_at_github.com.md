MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Wed, 04 Mar 2026 14:15:48 -0800
Subject: Re: [aldervall/Quiz-trivia] Fix competitor cards obscuring deck/pile in Shithead player view (PR #69)
Message-ID: <aldervall/Quiz-trivia/pull/69/review/3892352294@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/69@github.com>
References: <aldervall/Quiz-trivia/pull/69@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a8af148219c_bd11101001e1"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adjusts the Shithead player-view layout so opponent cards no longer overlay the deck/pile area. It does this by moving the opponents container from a fixed, viewport-corner grid to a normal document-flow flex layout beneath the turn banner.

**Changes:**
- Replace `#opponents-list` fixed 2×2 grid positioning with an in-flow flex-wrap layout.
- Update `.opponent-row` sizing rules to flex within the row and remove the old corner-alignment `nth-child` rules.





> @@ -329,14 +323,10 @@
       gap: 0.4rem;
       box-shadow: var(--shadow-card);
       transition: border-color 0.2s, background-color 0.2s;
-      pointer-events: auto;
-      width: fit-content;
-      max-width: 150px;
+      flex: 1 1 auto;

`flex: 1 1 auto` uses `flex-basis: auto` (content-sized), so opponent rows may not size evenly (e.g., long names get wider) and can leave unused space due to the `max-width: 180px` cap. If the intent is “even fill”, consider setting an explicit `flex-basis` (e.g., to the min width) or using `flex: 1 1 120px` / `flex: 1 1 0` and adjusting/removing `max-width` so items distribute consistently.
```suggestion
      flex: 1 1 120px;
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/69#pullrequestreview-3892352294
You are receiving this because you modified the open/close state.

Message ID: <aldervall/Quiz-trivia/pull/69/review/3892352294@github.com>