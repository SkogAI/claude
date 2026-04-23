MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: Skogix/SParse <SParse@noreply.github.com>
Date: Wed, 29 Oct 2025 07:37:58 -0700
Subject: Re: [Skogix/SParse] Handle integer overflow with proper error checking (#4)- Replace direct int conversion with Int32.TryParse- Provide clear error message when integer exceeds Int32 bounds- Prevents silent overflow and unexpected negative numbers- Resolves TODO comment about int overflowThis fixes the acknowledged issue where parsing very large numbers could cause OverflowException or silent wraparound.

🤖 Generated with [Claude Code](https://claude.com/claude-code)Co-authored-by: Claude <noreply@anthropic.com> (PR #15)
Message-ID: <Skogix/SParse/pull/15/review/3393892149@github.com>
In-Reply-To: <Skogix/SParse/pull/15@github.com>
References: <Skogix/SParse/pull/15@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690226c6a8ff4_267759110086671"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR improves the `parseInt` parser function by adding proper integer overflow handling. Previously, the function had a TODO comment about overflow and would crash with unclear errors when parsing integers outside the Int32 range.

**Key changes:**
- Replaces direct string-to-int conversion with `Int32.TryParse` to safely handle overflow
- Adds explicit error handling that throws a descriptive exception when integers exceed Int32 bounds
- Updates comments to Swedish to match the codebase's documentation style





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
+    let signStr = if Option.isSome sign then "-" else ""
+    let numStr = signStr + digits
+    match System.Int32.TryParse(numStr) with
+    | (true, value) -> value
+    | (false, _) ->
+      // om talet är för stort, kasta exception med tydligt felmeddelande
+      failwith $"Integer overflow: %s{numStr} is too large for Int32"

The error message only mentions 'too large' but the overflow could also occur with numbers that are too small (less than Int32.MinValue). Consider: `failwith $\"Integer overflow: %s{numStr} is out of range for Int32\"` to accurately cover both positive and negative overflow cases.
```suggestion
      failwith $"Integer overflow: %s{numStr} is out of range for Int32"
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

[nitpick] Use pattern matching instead of `Option.isSome` for more idiomatic F# code. Replace with: `let signStr = match sign with | Some _ -> \"-\" | None -> \"\"`
```suggestion
    let signStr = match sign with | Some _ -> "-" | None -> ""
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/SParse/pull/15#pullrequestreview-3393892149
You are receiving this because you modified the open/close state.

Message ID: <Skogix/SParse/pull/15/review/3393892149@github.com>