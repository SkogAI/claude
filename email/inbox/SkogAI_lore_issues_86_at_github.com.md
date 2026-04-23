MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Fri, 03 Oct 2025 10:38:11 -0700
Subject: [SkogAI/lore] Create proper REST API service layer for lore management (Issue #86)
Message-ID: <SkogAI/lore/issues/86@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e00a034423f_c7ea10d838065"; charset="UTF-8"

claude[bot] created an issue (SkogAI/lore#86)

## Summary

Build a proper HTTP REST API service that provides endpoints for lore management operations. This service will be separate from CLI tools and provide a real API layer (not just file I/O wrappers).

## Architecture

### Service Layer (Python FastAPI/Flask)

```
lore-api-service/
├── main.py              # API server entry point
├── models.py            # Pydantic models for validation
├── repository.py        # Data access layer (reads/writes JSON)
├── config.py            # Load SKOGAI_LORE from environment
└── requirements.txt     # Dependencies
```

### Endpoints

**Entries:**
- `GET /api/v1/entries` - List all entries
- `GET /api/v1/entries/{id}` - Get specific entry
- `POST /api/v1/entries` - Create new entry
- `PUT /api/v1/entries/{id}` - Update entry
- `DELETE /api/v1/entries/{id}` - Delete entry
- `GET /api/v1/entries/search?q={query}` - Search entries

**Books:**
- `GET /api/v1/books` - List all books
- `GET /api/v1/books/{id}` - Get specific book
- `POST /api/v1/books` - Create new book
- `POST /api/v1/books/{id}/entries/{entry_id}` - Add entry to book

**Personas:**
- `GET /api/v1/personas/{id}/books` - Get persona's lore books

## Implementation Details

### 1. Pydantic Models for Validation
```python
from pydantic import BaseModel, Field
from typing import List, Optional
from datetime import datetime

class LoreEntry(BaseModel):
    id: str
    title: str
    content: str
    category: str
    tags: List[str] = []
    created_at: datetime
    updated_at: datetime
```

### 2. Repository Pattern (File-based)
```python
class LoreRepository:
    def __init__(self, base_dir: str):
        self.base_dir = os.environ.get('SKOGAI_LORE', base_dir)
        self.entries_dir = f"{self.base_dir}/knowledge/expanded/lore/entries"
    
    def get_entry(self, entry_id: str) -> Optional[LoreEntry]:
        # Read JSON file, validate, return model
        
    def create_entry(self, entry: LoreEntry) -> LoreEntry:
        # Validate, write JSON atomically
```

### 3. FastAPI Service
```python
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI(title="Lore Management API")

@app.get("/api/v1/entries")
def list_entries(skip: int = 0, limit: int = 100):
    return repository.list_entries(skip, limit)

@app.post("/api/v1/entries")
def create_entry(entry: LoreEntry):
    return repository.create_entry(entry)
```

## Configuration

**Use existing config system:**
```python
import os

LORE_BASE_DIR = os.environ.get('SKOGAI_LORE')
if not LORE_BASE_DIR:
    raise ValueError("SKOGAI_LORE environment variable not set")
```

## Success Criteria

- [ ] FastAPI or Flask service with REST endpoints
- [ ] Pydantic models for validation
- [ ] Repository pattern for data access
- [ ] Respects `SKOGAI_LORE` environment variable
- [ ] JSON file storage (no database yet)
- [ ] OpenAPI/Swagger documentation
- [ ] Proper error handling and HTTP status codes
- [ ] Can run as: `uvicorn main:app --port 8000`

## Non-Goals

- Don't replace file storage with database (keep JSON files)
- Don't modify bash tools (they can coexist)
- Don't hardcode paths (use environment variables)
- Don't bundle with CLI (separate service)

## Testing

```bash
# Start service
uvicorn main:app --port 8000

# Test endpoints
curl http://localhost:8000/api/v1/entries
curl -X POST http://localhost:8000/api/v1/entries -d '{"title":"Test",...}'
```

---

Part of architectural cleanup from #84

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/issues/86
You are receiving this because you are subscribed to this thread.

Message ID: <SkogAI/lore/issues/86@github.com>