MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: Skogix/SParse <SParse@noreply.github.com>
Date: Wed, 29 Oct 2025 07:34:27 -0700
Subject: Re: [Skogix/SParse] Make parseZeroOrMore tail-recursive to prevent stack overflow- Refactor to use accumulator pattern for tail recursion- Build list in accumulator and reverse at end- Recursive call now in tail position- Prevents stack overflow on very long input sequencesThis fixes the critical issue where parsing large arrays or long strings could cause stack overflow crashes.

🤖 Generated with [Claude Code](https://claude.com/claude-code)Co-Authored-By: Claude <noreply@anthropic.com> (PR #16)
Message-ID: <Skogix/SParse/pull/16/review/3393893820@github.com>
In-Reply-To: <Skogix/SParse/pull/16@github.com>
References: <Skogix/SParse/pull/16@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690225f379141_aa9ba11004293d"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR refactors the `parseZeroOrMore` function to use tail recursion with an accumulator pattern instead of simple recursion. This optimization prevents potential stack overflow issues when parsing long sequences by allowing the compiler to optimize the recursive calls.

### Key Changes
- Converted `parseZeroOrMore` from simple recursion to tail recursion using an accumulator
- Added a helper function `parseAcc` that accumulates results and reverses them at the end
- Updated Swedish comments to reflect the new implementation approach





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

The helper function `parseAcc` is defined inside `parseZeroOrMore` but lacks documentation. Consider adding a comment explaining that it accumulates results in reverse order for tail-recursion optimization, similar to the detail provided in the original implementation comments.
```suggestion
  // använd accumulator för tail-recursion
  // Helper function that accumulates results in reverse order for tail-recursion optimization.
  // The list is reversed at the end to restore the original order.
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/SParse/pull/16#pullrequestreview-3393893820
You are receiving this because you modified the open/close state.

Message ID: <Skogix/SParse/pull/16/review/3393893820@github.com>