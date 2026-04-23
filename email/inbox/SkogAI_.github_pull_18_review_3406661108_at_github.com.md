MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.github" <.github@noreply.github.com>
Date: Fri, 31 Oct 2025 17:15:06 -0700
Subject: Re: [SkogAI/.github] Replace regex parsing with JSON-first approach in test-setup.sh (PR #18)
Message-ID: <SkogAI/.github/pull/18/review/3406661108@github.com>
In-Reply-To: <SkogAI/.github/pull/18@github.com>
References: <SkogAI/.github/pull/18@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6905510ab5bd8_1e1b110075175"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR improves the robustness of issue number extraction in the test setup script by adding dependency checking for `jq` and implementing a fallback mechanism when issue number extraction fails.

- Adds a prerequisite check to ensure `jq` is installed before attempting to use it
- Replaces regex-based issue number extraction with structured JSON parsing using `jq`
- Implements graceful degradation with a warning message when issue number extraction fails





---

💡 <a href="/SkogAI/.github/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +        echo "❌ jq is required but not installed."
+        echo "   Install: brew install jq (macOS) or sudo apt-get install jq (Ubuntu/Debian)"
+        echo "   Alternatively, skip this test."
+        exit 1
+    fi
+    
     echo "Creating test issue with @claude mention..."

The script calls `exit 1` when jq is not installed, but the user has already confirmed they want to run the test (via the prompt). This prevents running any subsequent tests in the script (Test 7 summary, final success message). Consider allowing the user to skip this specific test instead of exiting the entire script, similar to the message on line 110 which mentions skipping as an option but then exits anyway. A better approach would be to skip Test 7 with a warning message and continue to the summary section.
```suggestion
        echo "⚠️  jq is required but not installed."
        echo "   Install: brew install jq (macOS) or sudo apt-get install jq (Ubuntu/Debian)"
        echo "   Skipping Test 7: Create Test Issue."
        echo ""
        # Skip this test and continue
    else
        echo "Creating test issue with @claude mention..."
```

>  read -p "Do you want to create a test issue to trigger workflows? (y/n): " RUN_TEST
 if [[ "$RUN_TEST" =~ ^[Yy]$ ]]; then
+    # Check if jq is available
+    if ! command -v jq &> /dev/null; then
+        echo "❌ jq is required but not installed."
+        echo "   Install: brew install jq (macOS) or sudo apt-get install jq (Ubuntu/Debian)"
+        echo "   Alternatively, skip this test."
+        exit 1
+    fi

The jq dependency check occurs after the user confirms they want to run the test. This means users will be prompted to run the test, answer 'yes', and only then discover jq is not installed. Consider checking for jq availability before prompting the user, or include a note in the prompt that jq is required. This would provide a better user experience by failing fast before user interaction.
```suggestion
# Check if jq is available
if ! command -v jq &> /dev/null; then
    echo "❌ jq is required but not installed."
    echo "   Install: brew install jq (macOS) or sudo apt-get install jq (Ubuntu/Debian)"
    echo "   Alternatively, skip this test."
    exit 1
fi
read -p "Do you want to create a test issue to trigger workflows? (y/n): " RUN_TEST
if [[ "$RUN_TEST" =~ ^[Yy]$ ]]; then
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.github/pull/18#pullrequestreview-3406661108
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/.github/pull/18/review/3406661108@github.com>