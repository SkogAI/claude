MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Sun, 26 Oct 2025 03:20:44 -0700
Subject: Re: [SkogAI/skogansible] Enable Molecule testing in CI (PR #59)
Message-ID: <SkogAI/skogansible/pull/59/review/3380926418@github.com>
In-Reply-To: <SkogAI/skogansible/pull/59@github.com>
References: <SkogAI/skogansible/pull/59@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fdf5fca7018_229df110087774"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR activates Molecule testing in CI by converting the previously disabled workflow example file into an active workflow. The workflow tests Ansible roles using Docker containers running Arch Linux with systemd, currently configured to test the `01_host_info` role on push/PR to master/main branches.

**Key Changes:**
- Activated the Molecule testing workflow by renaming from `.example` to active `.yml` file
- Added version pinning for Molecule dependencies (`>=25.0,<26.0`) and collection caching
- Configured explicit permissions and added workflow comments documenting network requirements





> +      fail-fast: false
+
+    steps:
+      - name: Checkout code
+        uses: actions/checkout@v4
+
+      - name: Set up Python
+        uses: actions/setup-python@v5
+        with:
+          python-version: '3.11'
+
+      - name: Cache Ansible collections
+        uses: actions/cache@v4
+        with:
+          path: ~/.ansible/collections
+          key: ansible-collections-${{ hashFiles('roles/*/molecule/default/requirements.yml') }}

The cache key uses a glob pattern that may not match the actual file path. Since the workflow only tests roles from the matrix (currently only '01_host_info'), the hash should use 'roles/${{ matrix.role }}/molecule/default/requirements.yml' or 'molecule/default/requirements.yml' to ensure the cache key correctly reflects the requirements file being used.
```suggestion
          key: ansible-collections-${{ hashFiles('roles/${{ matrix.role }}/molecule/default/requirements.yml') }}
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/59#pullrequestreview-3380926418
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogansible/pull/59/review/3380926418@github.com>