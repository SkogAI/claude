MIME-Version: 1.0
From: "chatgpt-codex-connector[bot]" <notifications@github.com>
To: SkogAI/memory <memory@noreply.github.com>
Date: Thu, 16 Apr 2026 18:30:29 -0700
Subject: Re: [SkogAI/memory] docs(core): refresh CLAUDE.md with current codebase state (PR #2)
Message-ID: <SkogAI/memory/pull/2/review/4125529841@github.com>
In-Reply-To: <SkogAI/memory/pull/2@github.com>
References: <SkogAI/memory/pull/2@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69e18d3571576_a811081260c3"; charset="UTF-8"

@chatgpt-codex-connector[bot] commented on this pull request.


### 💡 Codex Review

https://github.com/SkogAI/memory/blob/ed1183e661dc86f7d092e2b77061bcb0dc278261/src/basic_memory/mcp/tools/move_note.py#L45-L46
**<sub><sub>![P1 Badge](https://img.shields.io/badge/P1-orange?style=flat)</sub></sub>  Stop blocking moves based on project-like folder names**

The cross-project guard rejects any destination path segment that matches another project name, which creates false positives for normal in-project moves. For example, if projects `research` and `archive` both exist, moving a note within `research` to `archive/notes/foo.md` is blocked even though the operation stays in the same project tree; this unnecessarily breaks valid move workflows in multi-project setups.
    

<details> <summary>ℹ️ About Codex in GitHub</summary>
<br/>

[Your team has set up Codex to review pull requests in this repo](https://chatgpt.com/codex/cloud/settings/general). Reviews are triggered when you
- Open a pull request for review
- Mark a draft as ready
- Comment "@codex review".

If Codex has suggestions, it will comment; otherwise it will react with 👍.




Codex can also answer questions or update the PR. Try commenting "@codex address that feedback".
            
</details>

>          """
         return self.config_manager.default_project
 
+    async def get_default_project_name(self) -> str:
+        """Get the default project name, falling back to the database.
+
+        ConfigManager reads from the local config file, which doesn't exist
+        in cloud mode. When it returns None, fall back to the is_default
+        flag stored in the database.
+        """
+        default = self.config_manager.default_project
+        if default is not None:
+            return default
+        db_default = await self.repository.get_default_project()
+        if db_default is not None:
+            return db_default.name
+        raise ValueError("No default project configured")

**<sub><sub>![P2 Badge](https://img.shields.io/badge/P2-yellow?style=flat)</sub></sub>  Return null default project instead of raising on list**

`get_default_project_name()` raises when no default exists in config or DB, but `/v2/projects/` always calls it during listing. In tenants where projects exist but none is marked default (a valid intermediate/migrated state), project listing fails with a 500 instead of returning `default_project: null`, which breaks basic project discovery for API/MCP clients.

Useful? React with 👍 / 👎.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/memory/pull/2#pullrequestreview-4125529841
You are receiving this because you authored the thread.

Message ID: <SkogAI/memory/pull/2/review/4125529841@github.com>