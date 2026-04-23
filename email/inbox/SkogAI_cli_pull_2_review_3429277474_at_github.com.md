MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/cli <cli@noreply.github.com>
Date: Thu, 06 Nov 2025 08:40:26 -0800
Subject: Re: [SkogAI/cli] Map existing functionality before refactor (PR #2)
Message-ID: <SkogAI/cli/pull/2/review/3429277474@github.com>
In-Reply-To: <SkogAI/cli/pull/2@github.com>
References: <SkogAI/cli/pull/2@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690ccf7aa1529_4d0af110051253"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds a comprehensive functional map document that provides a high-level overview of SkogCLI's core functionality. The document distills the ~8200 lines of code into two main systems: Script Manager/Executor and JSON Key-Value Manipulation.

Key changes:
- Documents the Script Manager/Executor system with core types, functions, and operations
- Documents the JSON Key-Value Manipulation system with configuration management
- Includes additional subsystems (Memory and Agent systems) and core functional patterns





---

💡 <a href="/SkogAI/cli/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +    env_pairs = env_dict.items()
+
+  export_lines = [f'export {name}="{escape(value)}"' for name, value in env_pairs]
+
+  if output:
+    write(output, "\n".join(export_lines))
+  else:
+    print("\n".join(export_lines))
+
+extract_env_pairs(data: dict, prefix: str = "") -> [(str, Any)]
+  pairs = []
+  for key, value in data.items():
+    full_key = prefix + key
+    if isinstance(value, dict):
+      pairs.extend(extract_env_pairs(value, full_key + "."))
+    elif ".env." in full_key && value != None:

The comparison `value != None` should use `value is not None` to follow Python's PEP 8 style guide for None comparisons. The identity operator `is` should be used when comparing to None.
```suggestion
    elif ".env." in full_key && value is not None:
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/cli/pull/2#pullrequestreview-3429277474
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/cli/pull/2/review/3429277474@github.com>