MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Fri, 03 Oct 2025 07:11:06 -0700
Subject: [SkogAI/lore] Complete architectural rework of lore management system (Issue #84)
Message-ID: <SkogAI/lore/issues/84@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68dfd97a14c82_9f4f10d876047"; charset="UTF-8"

claude[bot] created an issue (SkogAI/lore#84)

## Summary

The current lore management system has evolved into an unmaintainable mess of competing implementations, redundant tools, and architectural inconsistencies. This issue documents a comprehensive rework to create a proper, production-quality system using modern tooling and clean architecture.

## Current State Assessment

### Tool Inventory (The Mess)

The codebase currently contains **66+ lore-related files** implementing overlapping functionality:

**Python Tools:**
- `lore_cli.py` (692 lines) - Typer-based CLI wrapper
- `lore_tui.py` (532 lines) - Textual TUI browser  
- `agents/api/lore_api.py` (538 lines) - "API" layer (actually just file I/O)
- `generate-agent-lore.py` (315 lines) - AI-powered generation using Ollama
- `st-lore-export.py` (305 lines) - SillyTavern format export

**Bash Scripts:**
- `tools/manage-lore.sh` (420 lines) - Original CRUD interface
- `tools/create-persona.sh` - Persona creation
- `tools/llama-lore-creator.sh` - AI content generation
- `tools/llama-lore-integrator.sh` - Import/analysis tool
- `lore_browse.sh` - TUI launcher
- `lore` - CLI launcher wrapper

**Support Files:**
- `LORE_CLI_README.md` - 320 line CLI documentation
- `LORE_TUI_README.md` - 298 line TUI documentation  
- `demo/` - 50 demo directories
- Various configs, services, and integration scripts

### Critical Problems

#### 1. Architectural Chaos

**No Single Source of Truth:**
- Bash implementation uses `jq` + JSON manipulation
- Python "API" just wraps file I/O operations
- CLI and TUI duplicate logic independently
- No actual API - just scattered file operations

**Inconsistent Data Access:**
```python
# lore_api.py has hardcoded path:
def __init__(self, base_dir: str = "/home/skogix/lore"):
```

**Wrapper Madness:**
```
User → ./lore (bash) → lore_cli.py (Python) → lore_api.py → JSON files
```

#### 2. Tool Proliferation Disease

The `lore tools` command is peak absurdity - it literally just **lists other tools** instead of integrating them:

```python
@app.command()
def tools():
    """Show available lore management tools and how to use them."""
    tools_text = """
    📚 **Unified CLI** (this tool)
      • `./lore browse` - Navigate lore like a book
      
    🔧 **Classic Interface**
      • `tools/manage-lore.sh` - Original bash tool
      
    🖥️ **Terminal UI**
      • `python lore_tui.py` - Interactive TUI browser
      
    🤖 **AI-Powered Tools**
      • `tools/llama-lore-creator.sh` - Generate lore with AI
    """
```

This is not "unified" - this is **giving up on unification** and documenting the chaos.

#### 3. Documentation Fragmentation

- Two separate READMEs (CLI vs TUI) with overlapping content
- Both claim to be "the solution"  
- Neither acknowledges architectural problems
- Feature lists describe what "will be" not what exists

#### 4. Fake Abstractions

**The "API" That Isn't:**
```python
class LoreAPI:
    def create_lore_entry(self, title, content, ...):
        entry_id = self.generate_id("entry_")
        # ... build JSON dict ...
        with open(entry_path, "w") as f:
            json.dump(entry, f, indent=2)
```

This is not an API - it's a glorified file writer. No:
- Validation layer
- Transaction support
- Index management  
- Query optimization
- Caching
- Error recovery

#### 5. Implementation Quality Issues

**Hardcoded Paths Everywhere:**
```python
# In supposedly "reusable" API:
self.base_dir = "/home/skogix/lore"
self.lore_entries_dir = os.path.join(base_dir, "knowledge/expanded/lore/entries")
```

**No Schema Validation:**
```python
def load_schemas(self):
    # Loads schemas but doesn't validate against them!
    try:
        with open(path, "r") as f:
            self.schemas[schema_type] = json.load(f)
    except Exception as e:
        logger.error(f"Failed to load schema: {e}")
        self.schemas[schema_type] = {}  # Just... give up?
```

**Session Management Theater:**
```python
SESSION_DIR = Path.home() / ".skogai-lore"
SESSION_FILE = SESSION_DIR / "session.json"
# Stores last_viewed, bookmarks, recent - but half-implemented
```

## What This Should Be Instead

### Proper Architecture

#### 1. Real Database Layer

Replace JSON file I/O with **SQLite** (or similar):
- Proper schema enforcement
- Transactions and ACID compliance
- Efficient querying and indexing
- Full-text search built-in
- Migration support

#### 2. Clean Separation of Concerns

```
┌─────────────────────────────────────┐
│  CLI Tools (click/typer)            │
│  - lore (main CLI)                  │
│  - lore-tui (TUI if needed)         │
└─────────────────┬───────────────────┘
                  │
┌─────────────────▼───────────────────┐
│  Core Library (lorelib)             │
│  - LoreRepository (data access)     │
│  - Models (Entry, Book, Persona)    │  
│  - Services (search, export, etc)   │
└─────────────────┬───────────────────┘
                  │
┌─────────────────▼───────────────────┐
│  Storage Layer                      │
│  - SQLite database                  │
│  - Schema migrations                │
│  - Proper indexes                   │
└─────────────────────────────────────┘
```

#### 3. Modern Python Tooling

**Use Real Tools:**
- **Poetry** or **uv** for dependency management (not half-broken venv)
- **Click** or **Typer** for CLI (already using Typer badly)
- **SQLAlchemy** or **Peewee** for ORM
- **Pydantic** for validation (not unused schemas)
- **Rich** for terminal output (already using)
- **pytest** for testing (currently: none)

#### 4. Single Source of Truth

**One CLI to rule them all:**
```bash
lore init                    # Setup/migration
lore entry create           # Create entry
lore entry list             # List entries
lore entry show <id/title>  # Show entry
lore book create            # Create book
lore book add-entry         # Link entry to book
lore search <query>         # Full-text search
lore export <format>        # Export (ST, JSON, etc)
lore import <file>          # Import various formats
lore tui                    # Launch TUI if installed
```

All functionality in **one tool**, not seven competing tools.

### Concrete Implementation Plan

#### Phase 1: Data Model & Storage

1. **Define proper data models** with Pydantic:
   ```python
   from pydantic import BaseModel
   from datetime import datetime
   
   class LoreEntry(BaseModel):
       id: str
       title: str
       content: str
       category: str
       tags: list[str]
       created_at: datetime
       # ... etc with validation
   ```

2. **Create SQLite schema** with migrations:
   ```sql
   CREATE TABLE entries (
       id TEXT PRIMARY KEY,
       title TEXT NOT NULL,
       content TEXT,
       category TEXT,
       created_at TIMESTAMP,
       -- ...
       UNIQUE(title)
   );
   
   CREATE INDEX idx_category ON entries(category);
   CREATE INDEX idx_tags ON entry_tags(tag);
   ```

3. **Build repository layer** for data access:
   ```python
   class LoreRepository:
       def create_entry(self, entry: LoreEntry) -> LoreEntry: ...
       def get_entry(self, id: str) -> Optional[LoreEntry]: ...
       def search(self, query: str) -> list[LoreEntry]: ...
   ```

#### Phase 2: Core Library

1. **Create `lorelib` package** with proper structure:
   ```
   lorelib/
   ├── __init__.py
   ├── models.py       # Pydantic models
   ├── repository.py   # Data access layer
   ├── services.py     # Business logic
   └── utils.py        # Helpers
   ```

2. **Implement services** for high-level operations:
   - Search service with ranking
   - Export service (SillyTavern, JSON, Markdown)
   - Import service (various formats)
   - AI integration service (Ollama wrapper)

#### Phase 3: CLI Consolidation

1. **Single `lore` CLI** using Click/Typer properly
2. **Remove all redundant bash scripts**
3. **Integrate TUI as subcommand** (not separate tool)
4. **Proper help text** and documentation
5. **Configuration file** support (~/.config/lore/config.toml)

#### Phase 4: Migration & Cleanup

1. **Migration tool** to convert JSON files to SQLite
2. **Deprecate old tools** with clear migration guide
3. **Remove redundant files** and documentation
4. **Update all references** to use new CLI

### Success Criteria

**Before:**
- 66+ files implementing lore functionality
- 7 different tools with overlapping features
- 2,182+ lines of redundant code
- No tests, no validation, hardcoded paths
- Users confused about which tool to use

**After:**
- Single `lore` CLI tool
- Proper library (`lorelib`) with clean API
- SQLite database with schema enforcement
- Full test coverage
- Clear documentation
- Migration path for existing data

### What To Delete

**Files to remove:**
- `lore` (bash wrapper)
- `lore_browse.sh`
- `tools/manage-lore.sh` (replace with CLI)
- `tools/llama-lore-*.sh` (integrate into CLI)
- `LORE_CLI_README.md` (consolidate)
- `LORE_TUI_README.md` (consolidate)
- Demo directories (move to tests)

**Files to keep/refactor:**
- `lore_cli.py` → Rewrite as proper Click CLI
- `lore_tui.py` → Integrate as `lore tui` subcommand
- `agents/api/lore_api.py` → Replace with proper `lorelib`
- `generate-agent-lore.py` → Integrate as `lore generate`
- `st-lore-export.py` → Integrate as `lore export sillytavern`

## Anti-Goals

**Do NOT:**
- Keep compatibility with all existing tools (break things properly)
- Preserve the JSON file structure (migrate to DB)
- Maintain bash script implementations (Python only)
- Support the hardcoded paths (use proper config)

## Implementation Priority

1. **Design & Spec** - Finalize data models and architecture
2. **Core Library** - Build `lorelib` with repository pattern  
3. **Storage Migration** - Implement SQLite backend with migration
4. **CLI Consolidation** - Single `lore` tool replacing all scripts
5. **Testing** - Comprehensive test suite
6. **Documentation** - Single, accurate README
7. **Cleanup** - Remove deprecated files and code

## Estimated Effort

- **High complexity** - Complete architectural redesign
- **Medium risk** - Requires data migration  
- **~2-3 weeks** for experienced developer

## Questions to Answer

1. Should we use SQLite or stay with JSON? (Recommendation: SQLite)
2. Keep TUI or focus on CLI? (Recommendation: Keep as optional subcommand)
3. Support AI generation? (Recommendation: Yes, but as optional feature)
4. Maintain SillyTavern export? (Recommendation: Yes, popular format)

---

**This is the real work.** Not creating a `tools()` command that just lists other tools. Let's build something proper.

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/issues/84
You are receiving this because you are subscribed to this thread.

Message ID: <SkogAI/lore/issues/84@github.com>