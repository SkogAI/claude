MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: Skogix/SParse <SParse@noreply.github.com>
Date: Sat, 25 Oct 2025 20:57:03 -0700
Subject: Re: [Skogix/SParse] Make parseZeroOrMore tail-recursive to prevent stack overflow- Refactor to use accumulator pattern for tail recursion- Build list in accumulator and reverse at end- Recursive call now in tail position- Prevents stack overflow on very long input sequencesThis fixes the critical issue where parsing large arrays or long strings could cause stack overflow crashes.

🤖 Generated with [Claude Code](https://claude.com/claude-code)Co-Authored-By: Claude <noreply@anthropic.com> (PR #10)
Message-ID: <Skogix/SParse/pull/10/review/3380407529@github.com>
In-Reply-To: <Skogix/SParse/pull/10@github.com>
References: <Skogix/SParse/pull/10@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fd9c0fc9268_2ff8e110074519"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR refactors the `parseZeroOrMore` function to use tail recursion, preventing stack overflow issues when parsing large input sequences. The implementation now uses an accumulator pattern where results are collected in reverse order and then reversed at the end, ensuring the recursive call is in tail position.

**Key Changes:**
- Introduced an inner `parseAcc` function that uses an accumulator to build results iteratively
- Replaced direct recursion with tail-recursive calls by passing accumulated results forward
- Added `List.rev` to restore original element order after accumulation





---

💡 <a href="/Skogix/SParse/new/master/.github?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> -let rec parseZeroOrMore p input =
-  let result1 = run p input
-  match result1 with
-  | ParseFailure _ -> ([], input)
-  // (valuen som parseas, resten av input 1)
-  | ParseSuccess (x, restIn) ->
-    // (resten av alla values från innan, resten av input 2)
-    let (xs, restOut) =
-      // kör så länge det är success
-      parseZeroOrMore p restIn
-    // skicka ut nya values när det kommer hit
-    let values = x::xs
-    // (alla values som hittades, resten efter fail)
-    (values, restOut)
+let parseZeroOrMore p input =
+  // använd accumulator för tail-recursion

Corrected spelling of 'använd' (Swedish) to English 'use' for consistency with codebase language standards.
```suggestion
  // use accumulator for tail-recursion
```

> -    // (resten av alla values från innan, resten av input 2)
-    let (xs, restOut) =
-      // kör så länge det är success
-      parseZeroOrMore p restIn
-    // skicka ut nya values när det kommer hit
-    let values = x::xs
-    // (alla values som hittades, resten efter fail)
-    (values, restOut)
+let parseZeroOrMore p input =
+  // använd accumulator för tail-recursion
+  let rec parseAcc acc input =
+    let result1 = run p input
+    match result1 with
+    | ParseFailure _ -> (List.rev acc, input)
+    | ParseSuccess (x, restIn) ->
+      // tail-recursive call med uppdaterad accumulator

The comment mixes Swedish ('med') with English. Consider using fully English comment: 'tail-recursive call with updated accumulator'.
```suggestion
      // tail-recursive call with updated accumulator
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/SParse/pull/10#pullrequestreview-3380407529
You are receiving this because you modified the open/close state.

Message ID: <Skogix/SParse/pull/10/review/3380407529@github.com>