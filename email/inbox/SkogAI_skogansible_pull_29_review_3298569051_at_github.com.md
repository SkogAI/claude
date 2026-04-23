MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Fri, 03 Oct 2025 04:42:32 -0700
Subject: Re: [SkogAI/skogansible] [WIP] Add pre-commit hooks for automated testing (PR #29)
Message-ID: <SkogAI/skogansible/pull/29/review/3298569051@github.com>
In-Reply-To: <SkogAI/skogansible/pull/29@github.com>
References: <SkogAI/skogansible/pull/29@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68dfb6a87f614_1bd010d8200018"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR implements automated pre-commit hooks to catch issues before commits, providing instant feedback to developers and preventing broken code from reaching CI.

- Added comprehensive pre-commit configuration with 7 hooks covering Ansible testing and code quality
- Implemented both validation hooks (yamllint, ansible-lint, syntax checks) and auto-fix hooks (whitespace, line endings)
- Added detailed installation and usage documentation to CLAUDE.md

### Reviewed Changes

Copilot reviewed 2 out of 5 changed files in this pull request and generated 3 comments.

| File | Description |
| ---- | ----------- |
| .pre-commit-config.yaml | Complete pre-commit configuration with Ansible testing and code quality hooks |
| CLAUDE.md | Added comprehensive documentation for pre-commit hooks installation and usage |





---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/SkogAI/skogansible/new/master/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> +        entry: >-
+          bash -c 'ansible-playbook playbooks/all.yml --syntax-check 2>&1 |
+          grep -v "^\[WARNING\].*Error loading plugin\|^\[WARNING\].*Unable to load the cache plugin" || true'

The complex bash command with grep filtering warnings is hard to maintain and may miss other important warnings. Consider creating a separate script file for this logic or using a simpler approach that doesn't filter warnings.
```suggestion
        entry: ansible-playbook playbooks/all.yml --syntax-check
```

> +        types: [text]
+        exclude: ^\.env$
+
+      # check-merge-conflict
+      - id: check-merge-conflict
+        name: Check for Merge Conflicts
+        entry: >-
+          bash -c 'for file in "$@"; do if grep -q "^<<<<<<< " "$file";
+          then echo "Merge conflict markers found in $file"; exit 1; fi; done' --
+        language: system
+        types: [text]
+
+      # mixed-line-ending
+      - id: mixed-line-ending
+        name: Fix Mixed Line Endings
+        entry: bash -c 'for file in "$@"; do dos2unix "$file" 2>/dev/null || sed -i "s/\r$//" "$file"; done' --

The fallback from dos2unix to sed assumes dos2unix may not be available, but this creates inconsistent behavior. Consider using only sed for cross-platform compatibility or documenting the dos2unix dependency.
```suggestion
        entry: bash -c 'for file in "$@"; do sed -i "s/\r$//" "$file"; done' --
```

> +        entry: >-
+          bash -c 'for file in "$@"; do if [ -s "$file" ] && [ -z "$(tail -c 1 "$file")" ];
+          then :; else echo >> "$file"; fi; done' --

The inline bash logic for checking and fixing end-of-file newlines is complex and hard to read. Consider using the standard pre-commit-hooks repository's end-of-file-fixer hook instead of implementing custom logic.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/29#pullrequestreview-3298569051
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogansible/pull/29/review/3298569051@github.com>