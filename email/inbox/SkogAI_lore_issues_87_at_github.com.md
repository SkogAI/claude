MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Fri, 03 Oct 2025 10:38:33 -0700
Subject: [SkogAI/lore] Build CLI tool that consumes REST API endpoints (Issue #87)
Message-ID: <SkogAI/lore/issues/87@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e00a195a5fb_945610d817965b"; charset="UTF-8"

claude[bot] created an issue (SkogAI/lore#87)

## Summary

Create a clean CLI tool that consumes the REST API service (#86) instead of directly manipulating files. This provides proper separation between the API layer and CLI interface.

## Architecture

### CLI Tool (Python Click/Typer)

```
lore-cli/
├── cli.py               # Click/Typer CLI commands
├── client.py            # HTTP client for API
├── config.py            # CLI configuration
└── requirements.txt     # Dependencies (requests, click)
```

### Commands

```bash
# Entry management
lore entry list
lore entry show <id>
lore entry create --title "..." --content "..." --category "..."
lore entry update <id> --title "..."
lore entry delete <id>
lore entry search <query>

# Book management
lore book list
lore book show <id>
lore book create --title "..." --description "..."
lore book add-entry <book-id> <entry-id>

# Configuration
lore config show          # Show API endpoint, settings
lore config set-api <url> # Configure API endpoint
```

## Implementation

### 1. API Client
```python
import requests
from typing import List, Optional

class LoreClient:
    def __init__(self, base_url: str = "http://localhost:8000"):
        self.base_url = base_url
        self.session = requests.Session()
    
    def list_entries(self) -> List[dict]:
        response = self.session.get(f"{self.base_url}/api/v1/entries")
        response.raise_for_status()
        return response.json()
    
    def create_entry(self, data: dict) -> dict:
        response = self.session.post(
            f"{self.base_url}/api/v1/entries",
            json=data
        )
        response.raise_for_status()
        return response.json()
```

### 2. Click CLI
```python
import click
from rich.console import Console
from rich.table import Table

console = Console()

@click.group()
@click.pass_context
def cli(ctx):
    """Lore Management CLI"""
    ctx.obj = LoreClient()

@cli.group()
def entry():
    """Manage lore entries"""
    pass

@entry.command('list')
@click.pass_obj
def list_entries(client: LoreClient):
    """List all lore entries"""
    entries = client.list_entries()
    
    table = Table(title="Lore Entries")
    table.add_column("ID")
    table.add_column("Title")
    table.add_column("Category")
    
    for entry in entries:
        table.add_row(entry['id'], entry['title'], entry['category'])
    
    console.print(table)
```

### 3. Configuration File
```yaml
# ~/.config/lore/config.yaml
api:
  endpoint: http://localhost:8000
  timeout: 30

output:
  format: table  # or json, yaml
  color: true
```

## Real Separation of Concerns

```
User
  ↓
lore CLI (this tool)
  ↓ (HTTP requests)
REST API Service (#86)
  ↓
Repository Layer
  ↓
JSON Files
```

**No direct file access from CLI** - all operations go through API endpoints.

## Success Criteria

- [ ] Click/Typer CLI with subcommands
- [ ] HTTP client that calls REST API
- [ ] Configuration file support
- [ ] Rich terminal output (tables, colors)
- [ ] Proper error handling from API responses
- [ ] No direct file I/O (everything via API)
- [ ] Can work with remote API server

## Usage Example

```bash
# Start API service (terminal 1)
cd lore-api-service
uvicorn main:app --port 8000

# Use CLI (terminal 2)
export LORE_API_URL=http://localhost:8000
lore entry list
lore entry create --title "New Entry" --category "world"
lore entry search "magic system"
```

## Non-Goals

- Don't add file operations to CLI
- Don't duplicate bash tool functionality
- Don't bundle API server with CLI
- Don't hardcode API endpoint (use config)

## Dependencies

- **requests** - HTTP client
- **click** or **typer** - CLI framework
- **rich** - Terminal formatting
- **pyyaml** - Config file parsing

---

Part of architectural cleanup from #84  
Depends on: #86 (REST API service)

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/issues/87
You are receiving this because you are subscribed to this thread.

Message ID: <SkogAI/lore/issues/87@github.com>