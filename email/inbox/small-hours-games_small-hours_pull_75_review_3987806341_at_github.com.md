MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: small-hours-games/small-hours <small-hours@noreply.github.com>
Date: Sat, 21 Mar 2026 23:35:48 -0700
Subject: Re: [small-hours-games/small-hours] Add gamified question form game for dev workflow (PR #75)
Message-ID: <small-hours-games/small-hours/pull/75/review/3987806341@github.com>
In-Reply-To: <small-hours-games/small-hours/pull/75@github.com>
References: <small-hours-games/small-hours/pull/75@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69bf8dc49afc4_c711186032b3"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Adds a new “question-form” mini-game intended to turn dev questions into a structured, phone-based polling flow with aggregated results on the shared host display.

**Changes:**
- Introduces a new `question-form` game engine (setup/actions/view/endIf) plus unit tests.
- Registers the new game type in the room game registry and engine exports.
- Adds player + host UI rendering for answering and results display, plus a lobby “Questions” suggestion button.

### Reviewed changes

Copilot reviewed 6 out of 6 changed files in this pull request and generated 7 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `tests/engine/question-form.test.js` | Adds engine-level tests for answering, submission, review, view aggregation, and end conditions. |
| `src/session/room.js` | Registers `question-form` so rooms can start it. |
| `src/engine/games/question-form.js` | Implements the new question-form game engine (answering → review → finished). |
| `src/engine/games/index.js` | Exports `questionForm` from the engine games index. |
| `public/player.html` | Adds lobby suggest button + player UI rendering and answering interactions for question-form. |
| `public/host.html` | Adds host display rendering for question-form results (tallies/averages/text responses). |
</details>






---

💡 <a href="/small-hours-games/small-hours/new/main?filename=.github/instructions/*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +      // Show question + aggregated responses
+      const q = state.questions[state.currentQuestion];
+      base.reviewQuestion = {
+        index: state.currentQuestion,
+        text: q.text,

In review/finished phases this assumes `state.questions[state.currentQuestion]` exists. If the game is started with no questions (or `currentQuestion` gets out of bounds), `q` will be undefined and `q.text`/`q.type` will throw, breaking GAME_STATE rendering for everyone. Add a guard (e.g., handle empty question list by staying in answering, auto-finishing, or returning a minimal review view) and/or clamp `currentQuestion` to a valid index.

> +        };
+      }
+
+      const question = state.questions[questionIndex];
+      const validated = validateAnswer(question, value);
+      if (validated.error) {
+        return {
+          state,
+          events: [{ type: 'error', playerId, message: validated.error }],
+        };
+      }
+
+      const newResponses = {
+        ...state.responses,
+        [playerId]: {
+          ...state.responses[playerId],

`...state.responses[playerId]` will throw if `playerId` is not present in `state.responses` (e.g., if an action arrives for a player not included in the started game). Other engines defensively default to an empty structure. Consider validating `playerId` up front or using `...(state.responses[playerId] || {})` to avoid a hard crash.
```suggestion
          ...(state.responses[playerId] || {}),
```

>        const suggestions = Object.values(state.gameSuggestions || {});
       const topGame = suggestions.length > 0 ? suggestions[suggestions.length - 1] : 'number-guess';
       state.gameToStart = topGame;
-      const names = { 'number-guess': 'Number Guess', 'quiz': 'Quiz', 'spy': 'Spy Game', 'shithead': 'Shithead' };
+      const names = { 'number-guess': 'Number Guess', 'quiz': 'Quiz', 'spy': 'Spy Game', 'shithead': 'Shithead', 'question-form': 'Questions' };
 

The lobby UI now allows selecting/starting `question-form`, but there is no way to provide `config.questions` from the client. As a result the game will start with an empty question list (see `question-form` setup), which currently leads to a non-functional session ("No questions") and can later crash in review. Add an admin UI/flow to submit questions or have the server provide/validate a non-empty default question set before allowing start.

> +        html += '</div>';
+        content.innerHTML = html;
+        nav.innerHTML = '';
+      }

In review/finished you clear `nav.innerHTML` and render results, but there are no controls anywhere to send `reviewQuestion` (next/prev) or `finishReview`. Since the engine only ends when `finishReview` runs, the room can get stuck in the review phase and never return to the lobby. Provide admin-only navigation + "Finish" controls (phone or host) that dispatch the relevant GAME_ACTIONs, or make the engine auto-advance and auto-finish.

> +    function qfSaveText() {
+      const input = document.getElementById('qfTextInput');
+      if (input) {
+        send({ type: 'GAME_ACTION', action: { type: 'answer', questionIndex: state.qfIndex, value: input.value } });
+      }

`qfSaveText()` sends a GAME_ACTION on every input event. This can easily hit the WebSocket rate limit (30 msgs/sec) and degrade the typing experience. Debounce/throttle these sends (e.g., 200–400ms), or send only on blur / Next / Submit (and keep local state while typing).

> +
+        let html = '<div class="qf-question-card card">' +
+          '<div class="qf-label">' + escapeHtml(q.label || ('Question ' + (state.qfIndex + 1))) + '</div>' +
+          '<div class="qf-text">' + escapeHtml(q.text) + '</div>';
+
+        const currentVal = myResponses[state.qfIndex];
+        const type = q.type || 'text';
+
+        if (type === 'text') {
+          html += '<textarea class="qf-input-text" id="qfTextInput" placeholder="Type your answer..." ' +
+            'oninput="qfSaveText()">' + escapeHtml(currentVal || '') + '</textarea>';
+        } else if (type === 'choice') {
+          html += '<div class="qf-choices">';
+          (q.options || []).forEach(function(opt) {
+            const sel = currentVal === opt ? ' selected' : '';
+            html += '<button class="qf-choice-btn' + sel + '" onclick="qfSelectChoice(' + state.qfIndex + ', \'' + escapeHtml(opt).replace(/'/g, "\\'") + '\')">' +

Choice buttons are built with an inline `onclick` string that interpolates `opt` after HTML-escaping. HTML escaping is not sufficient for a JavaScript string context (e.g., backslashes/newlines can break the handler), and inline handlers are harder to reason about. Prefer creating the buttons and attaching `addEventListener` with the raw value stored in a data attribute.
```suggestion
            html += '<button class="qf-choice-btn' + sel + '" onclick="qfSelectChoice(' + state.qfIndex + ', ' + JSON.stringify(opt) + ')">' +
```

> +    function qfNext() {
+      state.qfIndex++;
+      renderQuestionFormState(state._lastQfMsg || { phase: 'answering', questions: [], myResponses: {}, submittedCount: 0, totalPlayers: 0 });
+    }

`qfNext()` increments `state.qfIndex` without clamping to the available question count. If the cached `questions` list changes (or a user taps quickly), this can push the index out of range and leave the UI in a "No questions" state with no navigation. Clamp `qfIndex` to `[0, questions.length - 1]` when changing it and/or when rendering.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/small-hours-games/small-hours/pull/75#pullrequestreview-3987806341
You are receiving this because you authored the thread.

Message ID: <small-hours-games/small-hours/pull/75/review/3987806341@github.com>