MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/SkogAPI <SkogAPI@noreply.github.com>
Date: Sat, 31 Jan 2026 02:19:16 -0800
Subject: Re: [SkogAI/SkogAPI] Upgrade to Pydantic v2 and FastAPI lifespan events (PR #1)
Message-ID: <SkogAI/SkogAPI/pull/1/review/3732215458@github.com>
In-Reply-To: <SkogAI/SkogAPI/pull/1@github.com>
References: <SkogAI/SkogAPI/pull/1@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_697dd724ce91b_f61118373679"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR modernizes the codebase by upgrading from Pydantic v1 to v2 and adopting FastAPI's new lifespan context manager pattern. The upgrade replaces deprecated patterns with their modern equivalents while adding explicit version constraints to dependencies.

**Changes:**
- Migrated from Pydantic v1 validation patterns (`__init__` overrides, `Config` class) to v2 decorators (`@field_validator`, `@model_validator`, `ConfigDict`)
- Replaced deprecated FastAPI `@app.on_event("startup")` with the `@asynccontextmanager` lifespan pattern
- Updated SQLAlchemy/SQLModel query patterns from `session.query()` to `session.exec(select())`
- Replaced `datetime.utcnow()` with `datetime.now(timezone.utc)` following modern best practices
- Added explicit version constraints to all dependencies

### Reviewed changes

Copilot reviewed 5 out of 6 changed files in this pull request and generated 3 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| requirements.txt | Added explicit version constraints for all dependencies (fastapi, uvicorn, sqlmodel, typer, etc.) and explicit bcrypt dependency |
| skogapi/security.py | Removed `HashedPassword` class, implemented password hashing in `User.__init__()`, updated datetime calls, migrated to SQLModel select pattern with selectinload |
| skogapi/models/content.py | Updated to Pydantic v2 validators (`@field_validator`, `@model_validator`), replaced `Config` class with `ConfigDict`, added explicit slug field, updated datetime to use UTC timezone |
| skogapi/routes/user.py | Changed `from_orm()` to `model_dump()`, migrated queries to `session.exec(select())`, fixed error message in delete endpoint |
| skogapi/routes/content.py | Changed `from_orm()` to `model_dump()`, replaced `.dict()` with `.model_dump()`, migrated queries to `session.exec(select())` |
| skogapi/app.py | Replaced `@app.on_event("startup")` with `@asynccontextmanager` lifespan pattern |
</details>






---

💡 <a href="/SkogAI/SkogAPI/new/main/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

>      superuser: bool = False
     disabled: bool = False
 
     # it populates the .user attribute on the Content Model
     contents: List["Content"] = Relationship(back_populates="user")
 
+    def __init__(self, **kwargs):
+        if "password" in kwargs:
+            pw = kwargs["password"]
+            if isinstance(pw, str) and not pw.startswith("$2"):
+                kwargs["password"] = get_password_hash(pw)

The `User.__init__()` method references `get_password_hash()` which is defined later in the same file (line 88). While this works at runtime since the function is defined before the class is instantiated, it makes the code fragile and harder to understand. Consider moving the `get_password_hash()` function definition before the `User` class, or using a different approach such as a Pydantic field validator (though this would require making User a Pydantic model rather than a SQLModel table model). Alternatively, you could extract password hashing logic into a separate module.
```suggestion
                kwargs["password"] = pwd_context.hash(pw)
```

>      superuser: bool = False
     disabled: bool = False
 
     # it populates the .user attribute on the Content Model
     contents: List["Content"] = Relationship(back_populates="user")
 
+    def __init__(self, **kwargs):
+        if "password" in kwargs:
+            pw = kwargs["password"]
+            if isinstance(pw, str) and not pw.startswith("$2"):

The password hashing check `not pw.startswith("$2")` assumes that all bcrypt hashes start with "$2", but bcrypt hashes can have different prefixes depending on the version: "$2a$", "$2b$", "$2x$", "$2y$". The current check would fail to recognize valid hashes that start with "$2a", "$2b", "$2x", or "$2y$" as already-hashed passwords, causing them to be double-hashed. Consider using a more robust check like `not pwd_context.identify(pw)` or checking for the full bcrypt prefix pattern.
```suggestion
            if isinstance(pw, str) and not pwd_context.identify(pw):
```

>          """Generate a slug from the title."""
         if self.title:
             self.slug = self.title.lower().replace(" ", "-")

The `generate_slug` model validator only sets `self.slug` if `self.title` is provided. For PATCH requests where title might not be included, or for POST requests where title might be None, the slug will remain None. When this data is used to create or update a Content object, it could cause issues if the Content model's slug field is not nullable. Consider either ensuring slug is always set to a valid value (possibly preserving the existing slug on updates), or handling the None case explicitly.
```suggestion
        """Generate a slug from the title when needed and validate input."""
        # If a slug is already provided, do not override it.
        if self.title and not self.slug:
            self.slug = self.title.lower().replace(" ", "-")

        # For create requests, require at least one of title or slug.
        # This prevents persisting a None slug when the database/schema
        # expects a non-null value.
        if not self.slug and not self.title:
            raise ValueError("Either 'title' or 'slug' must be provided.")
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/SkogAPI/pull/1#pullrequestreview-3732215458
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/SkogAPI/pull/1/review/3732215458@github.com>