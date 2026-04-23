MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: Skogix/SParse <SParse@noreply.github.com>
Date: Sat, 25 Oct 2025 20:56:49 -0700
Subject: Re: [Skogix/SParse] Handle integer overflow with proper error checking (#4)- Replace direct int conversion with Int32.TryParse- Provide clear error message when integer exceeds Int32 bounds- Prevents silent overflow and unexpected negative numbers- Resolves TODO comment about int overflowThis fixes the acknowledged issue where parsing very large numbers could cause OverflowException or silent wraparound.

🤖 Generated with [Claude Code](https://claude.com/claude-code)Co-authored-by: Claude <noreply@anthropic.com> (PR #9)
Message-ID: <Skogix/SParse/pull/9/review/3380407482@github.com>
In-Reply-To: <Skogix/SParse/pull/9@github.com>
References: <Skogix/SParse/pull/9@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fd9c01e58f5_f8e4110090718"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR addresses integer overflow handling in the parsing logic by replacing direct integer conversion with `Int32.TryParse` and providing explicit error messages for values that exceed `Int32` bounds.

**Key changes:**
- Replaces unsafe `digits |> int` conversion with `Int32.TryParse` to prevent overflow exceptions
- Adds clear error message when parsed values exceed Int32 range





---

💡 <a href="/Skogix/SParse/new/master/.github?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -210,11 +210,14 @@ let digitChar =
 let parseInt =
   let label = "int"
   let resultToInt (sign, digits) =
-    // todo int overflow
-    let i = digits |> int
-    match sign with
-    | Some ch -> -i
-    | None -> i
+    // hantera int overflow med Int32.TryParse

Comment is in Swedish. Consider using English for consistency: 'Handle int overflow with Int32.TryParse'.
```suggestion
    // handle int overflow with Int32.TryParse
```

> @@ -210,11 +210,14 @@ let digitChar =
 let parseInt =
   let label = "int"
   let resultToInt (sign, digits) =
-    // todo int overflow
-    let i = digits |> int
-    match sign with
-    | Some ch -> -i
-    | None -> i
+    // hantera int overflow med Int32.TryParse
+    let signStr = if Option.isSome sign then "-" else ""
+    let numStr = signStr + digits
+    match System.Int32.TryParse(numStr) with
+    | (true, value) -> value
+    | (false, _) ->
+      // om talet är för stort, kasta exception med tydligt felmeddelande

Comment is in Swedish. Consider using English for consistency: 'If the number is too large, throw exception with clear error message'.
```suggestion
      // if the number is too large, throw exception with clear error message
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/SParse/pull/9#pullrequestreview-3380407482
You are receiving this because you modified the open/close state.

Message ID: <Skogix/SParse/pull/9/review/3380407482@github.com>