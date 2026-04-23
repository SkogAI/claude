MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "verificay/Verificay.com" <Verificay.com@noreply.github.com>
Date: Mon, 25 Aug 2025 13:59:24 -0700
Subject: Re: [verificay/Verificay.com] Add PR template for consistent pull requests (PR #3)
Message-ID: <verificay/Verificay.com/pull/3/review/3153012579@github.com>
In-Reply-To: <verificay/Verificay.com/pull/3@github.com>
References: <verificay/Verificay.com/pull/3@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68acceac618fa_6bce10b8192861"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds a GitHub pull request template to standardize the format and content of pull requests across the project. The template ensures consistent information is provided for each PR submission.

- Introduces a structured PR template with sections for description, change type classification, testing verification, and quality checklist
- Uses GitHub's standard template location and format for automatic integration





---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/verificay/Verificay.com/new/master/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> @@ -0,0 +1,20 @@
+## Description
+Brief description of changes
+
+## Type of Change
+- [ ] Bug fix
+- [ ] New feature
+- [ ] Breaking change
+- [ ] Documentation update
+
+## Testing
+- [ ] Lint passes (`npm run lint`)

[nitpick] The template assumes npm as the package manager. Consider making this more generic (e.g., 'Linting passes') or adding alternatives for projects that might use yarn, pnpm, or other build tools.
```suggestion
- [ ] Lint passes (`npm run lint`, `yarn lint`, or `pnpm lint`)
```

> @@ -0,0 +1,20 @@
+## Description
+Brief description of changes
+
+## Type of Change
+- [ ] Bug fix
+- [ ] New feature
+- [ ] Breaking change
+- [ ] Documentation update
+
+## Testing
+- [ ] Lint passes (`npm run lint`)
+- [ ] Build succeeds (`npm run build`)

[nitpick] Similar to the lint command, this assumes npm and a specific build script name. Consider making this more generic to accommodate different project setups.
```suggestion
- [ ] Build succeeds (run your project's build command, e.g., `npm run build`, `yarn build`, etc.)
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/verificay/Verificay.com/pull/3#pullrequestreview-3153012579
You are receiving this because you were mentioned.

Message ID: <verificay/Verificay.com/pull/3/review/3153012579@github.com>