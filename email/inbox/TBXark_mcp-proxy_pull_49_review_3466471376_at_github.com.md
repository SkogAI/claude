MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: TBXark/mcp-proxy <mcp-proxy@noreply.github.com>
Date: Fri, 14 Nov 2025 11:23:26 -0800
Subject: Re: [TBXark/mcp-proxy] docs: add comprehensive CLAUDE.md for AI assistant guidance (PR #49)
Message-ID: <TBXark/mcp-proxy/pull/49/review/3466471376@github.com>
In-Reply-To: <TBXark/mcp-proxy/pull/49@github.com>
References: <TBXark/mcp-proxy/pull/49@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_691781ae45c43_dd110813621d"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds a comprehensive 1007-line AI assistant documentation guide (CLAUDE.md) to help AI assistants understand and work with the mcp-proxy codebase. The documentation provides detailed architectural insights, file-by-file breakdowns, development workflows, coding conventions, and common tasks.

Key additions:
- Complete architecture overview covering the MCP protocol aggregation server design
- Detailed file-by-file breakdown with line number references and code responsibilities
- Development workflows, testing strategies, and contribution guidelines





---

💡 <a href="/TBXark/mcp-proxy/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +**Configuration Hierarchy**:
+```
+1. Global defaults in OptionsV2
+2. mcpProxy.options (server defaults)
+3. mcpServers[name].options (per-client overrides)
+```
+
+**When to Modify**:
+- Adding new configuration fields
+- Changing validation logic
+- Adding new transport types
+- Modifying default values
+
+---
+
+### config_deprecated.go (110 lines)

The line count for config_deprecated.go is listed as 110 lines, but the actual file has 111 lines. This should be updated to 111 lines for accuracy.
```suggestion
### config_deprecated.go (111 lines)
```

> +### config_deprecated.go (110 lines)
+**Purpose**: V1 configuration backward compatibility
+
+**Key Functions**:
+- `parseMCPClientConfigV1()`: Unmarshal legacy config format
+- `adaptMCPClientConfigV1ToV2()`: Automatic schema migration
+
+**Important**: Don't remove this file unless explicitly deprecating V1 support. Many existing deployments rely on it.
+
+**When to Modify**:
+- Only when V1 migration logic needs fixes
+- Eventually can be removed in a major version bump (2.0+)
+
+---
+
+### client.go (342 lines)

The line count for client.go is listed as 342 lines, but the actual file has 343 lines. This should be updated to 343 lines for accuracy.
```suggestion
### client.go (343 lines)
```

> +LD_FLAGS = -X main.BuildVersion=$(BUILD)
+go build -ldflags="$(LD_FLAGS)" -o build/mcp-proxy main.go

The go build command shown here is incomplete. The actual command in the Makefile (line 5-6) is:
```makefile
LD_FLAGS=-ldflags "-X main.BuildVersion=$(BUILD)"
GO_BUILD=CGO_ENABLED=0 go build $(LD_FLAGS)
```
This should be updated to reflect the actual implementation.
```suggestion
LD_FLAGS = -ldflags "-X main.BuildVersion=$(BUILD)"
GO_BUILD = CGO_ENABLED=0 go build $(LD_FLAGS)
$(GO_BUILD) -o build/mcp-proxy main.go
```

> +### Purpose
+- Aggregates multiple MCP servers (stdio, SSE, HTTP streaming) into a single endpoint
+- Provides flexible tool filtering and authentication per client
+- Simplifies MCP client integration for AI assistants like Claude
+- Supports concurrent client initialization with graceful error handling
+
+### Key Features
+- **Multi-transport Support**: stdio (subprocess), SSE (Server-Sent Events), HTTP streaming
+- **Flexible Authentication**: Per-client bearer token validation with inheritance from global defaults
+- **Tool Filtering**: Allow/block lists for controlling which tools are exposed
+- **Health Monitoring**: Automatic ping tasks for remote clients (SSE/HTTP)
+- **Graceful Degradation**: Individual client failures don't crash the entire proxy
+- **Config Backward Compatibility**: Automatic V1 → V2 schema migration
+
+### Metrics
+- **Total Lines of Code**: ~837 lines (main package only)

The total lines of code are listed as "~837 lines (main package only)" but based on the actual file line counts (main.go: 34, client.go: 343, config.go: 181, config_deprecated.go: 111, http.go: 173), the total is 842 lines. This should be updated to "~842 lines" for accuracy.
```suggestion
- **Total Lines of Code**: ~842 lines (main package only)
```

> +├── config.json              # Example configuration
+├── go.mod / go.sum          # Dependencies (mcp-go v0.37.0 primary)
+├── LICENSE                  # MIT License
+├── README.md                # User-facing documentation
+└── Source Files:
+    ├── main.go              # Entry point, CLI flags, version handling
+    ├── client.go            # MCP client lifecycle, tool aggregation, health checks
+    ├── config.go            # V2 configuration structs and loading
+    ├── config_deprecated.go # V1 config support with auto-migration
+    └── http.go              # HTTP server, middleware, routing, shutdown
+```
+
+### Important Files to Check First
+1. **config.json**: Example configuration showing all features
+2. **README.md**: User documentation, configuration reference
+3. **client.go**: Core client management logic (342 lines)

The line count for client.go is listed as 342 lines, but the actual file has 343 lines. This should be updated to 343 lines for consistency.
```suggestion
3. **client.go**: Core client management logic (343 lines)
```

> +- First error cancels remaining initializations
+- All clients must succeed for server to start (unless `panicIfInvalid=false`)
+
+**Gotcha**: One slow client delays all others
+
+**Reference**: `http.go:startHTTPServer()`, line ~90-110
+
+---
+
+### 7. Build Version Injection
+
+**Issue**: Version is injected at build time via ldflags
+
+**Build Command**:
+```makefile
+BUILD = $(shell git log -1 --format="%h @ %cd" --date=unix)

The BUILD command shown here doesn't match the actual Makefile. The actual command in the Makefile (line 2) is:
```makefile
BUILD=$(shell git rev-parse --short HEAD)@$(shell date +%s)
```
This uses `git rev-parse --short HEAD` instead of `git log -1 --format="%h @ %cd" --date=unix)`.
```suggestion
BUILD=$(shell git rev-parse --short HEAD)@$(shell date +%s)
```

> +    ├── config.go            # V2 configuration structs and loading
+    ├── config_deprecated.go # V1 config support with auto-migration
+    └── http.go              # HTTP server, middleware, routing, shutdown
+```
+
+### Important Files to Check First
+1. **config.json**: Example configuration showing all features
+2. **README.md**: User documentation, configuration reference
+3. **client.go**: Core client management logic (342 lines)
+4. **http.go**: HTTP server setup and middleware stack (172 lines)
+
+---
+
+## Key Files and Their Responsibilities
+
+### main.go (33 lines)

The line count for main.go is listed as 33 lines, but the actual file has 34 lines (including the final blank line). This should be updated to 34 lines for accuracy.
```suggestion
### main.go (34 lines)
```

> +**Purpose**: Application entry point and CLI interface
+
+**Key Components**:
+- CLI flags: `-config`, `-insecure`, `-version`, `-help`
+- `BuildVersion` variable (injected via ldflags during build)
+- Configuration loading with optional insecure TLS (`-insecure` flag)
+- HTTP server startup orchestration
+
+**When to Modify**:
+- Adding new CLI flags
+- Changing startup behavior
+- Version display logic
+
+---
+
+### config.go (180 lines)

The line count for config.go is listed as 180 lines, but the actual file has 181 lines. This should be updated to 181 lines for accuracy.
```suggestion
### config.go (181 lines)
```

> +
+**When to Modify**:
+- Adding support for new MCP capabilities (sampling, subscriptions)
+- Changing health check intervals/logic
+- Modifying tool filter behavior
+- Adding client lifecycle hooks
+
+**Important Code Locations**:
+- Line ~60: stdio client creation with subprocess management
+- Line ~80: SSE/HTTP client creation with headers/timeout
+- Line ~150: Tool filter application (allow vs block logic)
+- Line ~220: Ping task failure handling
+
+---
+
+### http.go (172 lines)

The line count for http.go is listed as 172 lines, but the actual file has 173 lines. This should be updated to 173 lines for accuracy.
```suggestion
### http.go (173 lines)
```

> +- All clients must succeed for server to start (unless `panicIfInvalid=false`)
+
+**Gotcha**: One slow client delays all others
+
+**Reference**: `http.go:startHTTPServer()`, line ~90-110
+
+---
+
+### 7. Build Version Injection
+
+**Issue**: Version is injected at build time via ldflags
+
+**Build Command**:
+```makefile
+BUILD = $(shell git log -1 --format="%h @ %cd" --date=unix)
+LD_FLAGS = -X main.BuildVersion=$(BUILD)

The LD_FLAGS shown here is incomplete. The actual command in the Makefile (line 5) is:
```makefile
LD_FLAGS=-ldflags "-X main.BuildVersion=$(BUILD)"
```
The example should show the complete ldflags format with quotes.
```suggestion
LD_FLAGS = -ldflags "-X main.BuildVersion=$(BUILD)"
```

> +├── go.mod / go.sum          # Dependencies (mcp-go v0.37.0 primary)
+├── LICENSE                  # MIT License
+├── README.md                # User-facing documentation
+└── Source Files:
+    ├── main.go              # Entry point, CLI flags, version handling
+    ├── client.go            # MCP client lifecycle, tool aggregation, health checks
+    ├── config.go            # V2 configuration structs and loading
+    ├── config_deprecated.go # V1 config support with auto-migration
+    └── http.go              # HTTP server, middleware, routing, shutdown
+```
+
+### Important Files to Check First
+1. **config.json**: Example configuration showing all features
+2. **README.md**: User documentation, configuration reference
+3. **client.go**: Core client management logic (342 lines)
+4. **http.go**: HTTP server setup and middleware stack (172 lines)

The line count for http.go is listed as 172 lines, but the actual file has 173 lines. This should be updated to 173 lines for consistency.
```suggestion
4. **http.go**: HTTP server setup and middleware stack (173 lines)
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/TBXark/mcp-proxy/pull/49#pullrequestreview-3466471376
You are receiving this because you were mentioned.

Message ID: <TBXark/mcp-proxy/pull/49/review/3466471376@github.com>