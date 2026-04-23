MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 23:55:08 -0800
Subject: Re: [aldervall/Quiz-trivia] Improve shithead player page visuals to match quiz design quality (PR #51)
Message-ID: <aldervall/Quiz-trivia/pull/51/review/3865532667@github.com>
In-Reply-To: <aldervall/Quiz-trivia/pull/51@github.com>
References: <aldervall/Quiz-trivia/pull/51@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a14ddc8eeb6_1021110651911"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR significantly improves the visual quality of the Shithead player page by adopting the shared design system used in the quiz game. The changes transform a page with ad-hoc CSS and basic visuals into a polished, cohesive experience that matches the design quality of the rest of the application.

**Changes:**
- Integrated shared design system (`/shared/theme.css` and `/shared/utils.js`) for consistent styling, CSS tokens, animations, and utilities
- Implemented professional corner-pip card layout with top-left and bottom-right rank/suit indicators
- Created CSS-only card backs with gradient, borders, crosshatch patterns, and center pips to replace emoji
- Redesigned opponent view with avatar emojis, pill badges, glass-card styling, and accent-highlighted active player
- Enhanced UI elements with proper backdrop-blur effects, consistent border radii, improved shadows, and smooth animations





>        const classes = ['opponent-row', isCurrent && 'is-current', p.hasFinished && 'finished'].filter(Boolean).join(' ');
       return `<div class="${classes}">
-        <div class="opponent-name">${p.username}${isCurrent ? ' 🎯' : ''}${p.hasFinished ? ' ✅' : ''}</div>
+        <div class="opp-header">
+          <span class="opp-avatar">${avatar}</span>

For consistency with the quiz player page (public/games/quiz/index.html:743) and the display page (public/group/display.html:606), avatar emojis should be escaped using GN.esc() even though they come from a safe predefined array. This maintains defensive coding practices and consistency across the codebase.
```suggestion
          <span class="opp-avatar">${GN.esc(avatar)}</span>
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/pull/51#pullrequestreview-3865532667
You are receiving this because you modified the open/close state.

Message ID: <aldervall/Quiz-trivia/pull/51/review/3865532667@github.com>