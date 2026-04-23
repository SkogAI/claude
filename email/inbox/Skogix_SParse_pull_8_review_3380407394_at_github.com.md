MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: Skogix/SParse <SParse@noreply.github.com>
Date: Sat, 25 Oct 2025 20:56:24 -0700
Subject: Re: [Skogix/SParse] A (PR #8)
Message-ID: <Skogix/SParse/pull/8/review/3380407394@github.com>
In-Reply-To: <Skogix/SParse/pull/8@github.com>
References: <Skogix/SParse/pull/8@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fd9be890313_134a71100304aa"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR updates the integer parsing logic to handle potential overflow scenarios. Previously, the code had a TODO comment about integer overflow; now it explicitly checks for overflow using `Int32.TryParse` and throws a descriptive error when the parsed value exceeds Int32 bounds.

**Key Changes:**
- Replaced direct integer conversion with `Int32.TryParse` for overflow detection
- Added error handling that throws an exception with a clear message when overflow occurs





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

Comment is written in Swedish. Consider using English for consistency with the rest of the codebase: 'handle int overflow with Int32.TryParse'.
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

Comment is written in Swedish. Consider using English for consistency: 'if the number is too large, throw exception with clear error message'.
```suggestion
      // if the number is too large, throw exception with clear error message
```

> +      // om talet är för stort, kasta exception med tydligt felmeddelande
+      failwith $"Integer overflow: %s{numStr} is too large for Int32"

The error message assumes overflow is the only failure case, but `Int32.TryParse` can fail for other reasons (e.g., invalid format). Consider a more accurate message like 'Failed to parse integer: %s{numStr}' or add separate validation for format vs. overflow.
```suggestion
      // misslyckades att parsa till Int32, kan vara overflow eller ogiltigt format
      failwith $"Failed to parse integer: %s{numStr}"
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/SParse/pull/8#pullrequestreview-3380407394
You are receiving this because you modified the open/close state.

Message ID: <Skogix/SParse/pull/8/review/3380407394@github.com>