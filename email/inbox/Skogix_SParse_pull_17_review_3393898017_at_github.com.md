MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: Skogix/SParse <SParse@noreply.github.com>
Date: Wed, 29 Oct 2025 07:34:17 -0700
Subject: Re: [Skogix/SParse] Handle integer overflow with proper error checking- Replace direct int conversion with Int32.TryParse- Provide clear error message when integer exceeds Int32 bounds- Prevents silent overflow and unexpected negative numbers- Resolves TODO comment about int overflowThis fixes the acknowledged issue where parsing very large numbers could cause OverflowException or silent wraparound.

🤖 Generated with [Claude Code](https://claude.com/claude-code)Co-Authored-By: Claude <noreply@anthropic.com> (PR #17)
Message-ID: <Skogix/SParse/pull/17/review/3393898017@github.com>
In-Reply-To: <Skogix/SParse/pull/17@github.com>
References: <Skogix/SParse/pull/17@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690225e9c6f4_e4951110069555"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds integer overflow handling to the `parseInt` parser function, addressing a TODO comment about handling int overflow. The implementation now uses `System.Int32.TryParse` to detect values that exceed Int32 limits and throws a descriptive error message when overflow occurs.

- Replaced manual string-to-int conversion with `System.Int32.TryParse` for safer parsing
- Added explicit overflow detection with a descriptive error message
- Removed the TODO comment as the issue has been addressed





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

[nitpick] Replace `Option.isSome` check with pattern matching for better F# idiomatic style. Use `match sign with | Some _ -> \"-\" | None -> \"\"` instead.
```suggestion
    let signStr = match sign with | Some _ -> "-" | None -> ""
```

> +    // hantera int overflow med Int32.TryParse
+    let signStr = if Option.isSome sign then "-" else ""
+    let numStr = signStr + digits
+    match System.Int32.TryParse(numStr) with
+    | (true, value) -> value
+    | (false, _) ->
+      // om talet är för stort, kasta exception med tydligt felmeddelande
+      failwith $"Integer overflow: %s{numStr} is too large for Int32"

The error message assumes all parse failures are due to overflow, but `Int32.TryParse` can also fail for invalid formats (e.g., \"--123\", \"12abc\"). However, since `digits` is guaranteed to contain only digit characters from `manyChars1 digitChar`, the only failure case is indeed overflow. Consider clarifying this in the comment or adding a note that malformed input is caught earlier in the parser pipeline.
```suggestion
    // Endast overflow kan inträffa här eftersom 'digits' garanteras vara 1+ siffror (via manyChars1 digitChar)
    // och 'sign' är antingen None eller "-". Felaktigt format fångas tidigare i parsern.
    let signStr = if Option.isSome sign then "-" else ""
    let numStr = signStr + digits
    match System.Int32.TryParse(numStr) with
    | (true, value) -> value
      // Om talet är för stort, kasta exception med tydligt felmeddelande
    | (false, _) -> failwith $"Integer overflow: %s{numStr} is too large for Int32"
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

[nitpick] The comment is in Swedish while the error message on line 220 is in English, creating inconsistency. Consider using the same language (Swedish) for both comments and error messages throughout the codebase, or standardizing on English.
```suggestion
    // handle int overflow with Int32.TryParse
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/SParse/pull/17#pullrequestreview-3393898017
You are receiving this because you modified the open/close state.

Message ID: <Skogix/SParse/pull/17/review/3393898017@github.com>