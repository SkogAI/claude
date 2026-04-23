MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Sat, 04 Oct 2025 02:51:30 -0700
Subject: Re: [SkogAI/skogansible] Copilot/fix fd5397f3 c408 49ae 84cf 4301a9cea411 (PR #44)
Message-ID: <SkogAI/skogansible/pull/44/review/3301720760@github.com>
In-Reply-To: <SkogAI/skogansible/pull/44@github.com>
References: <SkogAI/skogansible/pull/44@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e0ee2245416_1905310d820244e"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds Molecule testing support to enable isolated role testing in Docker containers. The changes introduce the `--molecule` flag to the test script and configure Molecule testing for the `01_host_info` role.

**Key changes:**
- Enhanced test.sh script with `--molecule` flag to run Molecule tests for roles
- Added complete Molecule configuration for the `01_host_info` role with Docker-based testing
- Updated role to be test-friendly by making file paths configurable and skipping OS checks during testing

### Reviewed Changes

Copilot reviewed 11 out of 12 changed files in this pull request and generated 2 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| test.sh | Added `--molecule` flag and Molecule test execution logic |
| roles/01_host_info/tasks/main.yml | Made ansible_facts_file configurable and skip OS check during Molecule testing |
| roles/01_host_info/molecule/default/*.yml | Complete Molecule test scenario configuration files |
| roles/01_host_info/molecule/default/README.md | Comprehensive documentation for Molecule testing setup |
| MOLECULE.md | Repository-wide Molecule testing guide and best practices |
| CLAUDE.md | Updated with Molecule testing information |
| .github/workflows/molecule-test.yml.example | Example CI workflow for Molecule testing |
</details>






> +  if ! command_exists molecule; then
+    echo -e "${YELLOW}molecule is not installed. Install with: pip install molecule molecule-plugins[docker]${NC}"
+    print_test_result "Molecule Tests" "SKIP"
+  else
+    echo -e "${BLUE}Testing roles with Molecule...${NC}"
+    MOLECULE_FAILED=0
+    
+    # Find all roles with molecule scenarios
+    for role_dir in roles/*/molecule/default; do
+      if [ -d "$role_dir" ]; then
+        role_name=$(basename $(dirname $(dirname "$role_dir")))
+        echo ""
+        echo -e "${BLUE}Testing role: $role_name${NC}"
+        
+        cd "$(dirname $(dirname "$role_dir"))"
+        if molecule test --destroy=never 2>&1; then

The `--destroy=never` flag prevents cleanup of test containers, which could lead to accumulating containers over time. Consider using the default behavior or adding explicit cleanup logic.
```suggestion
        if molecule test 2>&1; then
```

> +        # Mock become password file for testing
+        ansible_become_password_file: ""

Setting `ansible_become_password_file` to an empty string may cause issues if the role checks for file existence. Consider using a more explicit test value or documenting this override behavior.
```suggestion
        # Mock become password file for testing; use explicit dummy file path to avoid issues with file existence checks
        ansible_become_password_file: "/tmp/dummy_become_password_file"
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/44#pullrequestreview-3301720760
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogansible/pull/44/review/3301720760@github.com>