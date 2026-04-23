MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Fri, 28 Nov 2025 20:41:48 -0800
Subject: [SkogAI/lore] [WIP] Create REST API service layer for lore management (PR #119)
Message-ID: <SkogAI/lore/pull/119@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692a798c62178_f711006448b7"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Create proper REST API service layer for lore management&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; 
&gt; Build a proper HTTP REST API service that provides endpoints for lore management operations. This service will be separate from CLI tools and provide a real API layer (not just file I/O wrappers).
&gt; 
&gt; ## Architecture
&gt; 
&gt; ### Service Layer (Python FastAPI/Flask)
&gt; 
&gt; ```
&gt; lore-api-service/
&gt; ├── main.py              # API server entry point
&gt; ├── models.py            # Pydantic models for validation
&gt; ├── repository.py        # Data access layer (reads/writes JSON)
&gt; ├── config.py            # Load SKOGAI_LORE from environment
&gt; └── requirements.txt     # Dependencies
&gt; ```
&gt; 
&gt; ### Endpoints
&gt; 
&gt; **Entries:**
&gt; - `GET /api/v1/entries` - List all entries
&gt; - `GET /api/v1/entries/{id}` - Get specific entry
&gt; - `POST /api/v1/entries` - Create new entry
&gt; - `PUT /api/v1/entries/{id}` - Update entry
&gt; - `DELETE /api/v1/entries/{id}` - Delete entry
&gt; - `GET /api/v1/entries/search?q={query}` - Search entries
&gt; 
&gt; **Books:**
&gt; - `GET /api/v1/books` - List all books
&gt; - `GET /api/v1/books/{id}` - Get specific book
&gt; - `POST /api/v1/books` - Create new book
&gt; - `POST /api/v1/books/{id}/entries/{entry_id}` - Add entry to book
&gt; 
&gt; **Personas:**
&gt; - `GET /api/v1/personas/{id}/books` - Get persona&#39;s lore books
&gt; 
&gt; ## Implementation Details
&gt; 
&gt; ### 1. Pydantic Models for Validation
&gt; ```python
&gt; from pydantic import BaseModel, Field
&gt; from typing import List, Optional
&gt; from datetime import datetime
&gt; 
&gt; class LoreEntry(BaseModel):
&gt;     id: str
&gt;     title: str
&gt;     content: str
&gt;     category: str
&gt;     tags: List[str] = []
&gt;     created_at: datetime
&gt;     updated_at: datetime
&gt; ```
&gt; 
&gt; ### 2. Repository Pattern (File-based)
&gt; ```python
&gt; class LoreRepository:
&gt;     def __init__(self, base_dir: str):
&gt;         self.base_dir = os.environ.get(&#39;SKOGAI_LORE&#39;, base_dir)
&gt;         self.entries_dir = f&quot;{self.base_dir}/knowledge/expanded/lore/entries&quot;
&gt;     
&gt;     def get_entry(self, entry_id: str) -&gt; Optional[LoreEntry]:
&gt;         # Read JSON file, validate, return model
&gt;         
&gt;     def create_entry(self, entry: LoreEntry) -&gt; LoreEntry:
&gt;         # Validate, write JSON atomically
&gt; ```
&gt; 
&gt; ### 3. FastAPI Service
&gt; ```python
&gt; from fastapi import FastAPI, HTTPException
&gt; from pydantic import BaseModel
&gt; 
&gt; app = FastAPI(title=&quot;Lore Management API&quot;)
&gt; 
&gt; @app.get(&quot;/api/v1/entries&quot;)
&gt; def list_entries(skip: int = 0, limit: int = 100):
&gt;     return repository.list_entries(skip, limit)
&gt; 
&gt; @app.post(&quot;/api/v1/entries&quot;)
&gt; def create_entry(entry: LoreEntry):
&gt;     return repository.create_entry(entry)
&gt; ```
&gt; 
&gt; ## Configuration
&gt; 
&gt; **Use existing config system:**
&gt; ```python
&gt; import os
&gt; 
&gt; LORE_BASE_DIR = os.environ.get(&#39;SKOGAI_LORE&#39;)
&gt; if not LORE_BASE_DIR:
&gt;     raise ValueError(&quot;SKOGAI_LORE environment variable not set&quot;)
&gt; ```
&gt; 
&gt; ## Success Criteria
&gt; 
&gt; - [ ] FastAPI or Flask service with REST endpoints
&gt; - [ ] Pydantic models for validation
&gt; - [ ] Repository pattern for data access
&gt; - [ ] Respects `SKOGAI_LORE` environment variable
&gt; - [ ] JSON file storage (no database yet)
&gt; - [ ] OpenAPI/Swagger documentation
&gt; - [ ] Proper error handling and HTTP status codes
&gt; - [ ] Can run as: `uvicorn main:app --port 8000`
&gt; 
&gt; ## Non-Goals
&gt; 
&gt; - Don&#39;t replace file storage with database (keep JSON files)
&gt; - Don&#39;t modify bash tools (they can coexist)
&gt; - Don&#39;t hardcode paths (use environment variables)
&gt; - Don&#39;t bundle with CLI (separate service)
&gt; 
&gt; ## Testing
&gt; 
&gt; ```bash
&gt; # Start service
&gt; uvicorn main:app --port 8000
&gt; 
&gt; # Test endpoints
&gt; curl http://localhost:8000/api/v1/entries
&gt; curl -X POST http://localhost:8000/api/v1/entries -d &#39;{&quot;title&quot;:&quot;Test&quot;,...}&#39;
&gt; ```
&gt; 
&gt; ---
&gt; 
&gt; Part of architectural cleanup from SkogAI/lore#84&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/lore#86

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/lore/pull/119

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/lore/pull/119.patch
https://github.com/SkogAI/lore/pull/119.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/119
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/lore/pull/119@github.com&gt;
