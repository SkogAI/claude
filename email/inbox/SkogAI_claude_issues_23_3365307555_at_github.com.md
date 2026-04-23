MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/claude <claude@noreply.github.com>
Date: Fri, 03 Oct 2025 04:20:21 -0700
Subject: Re: [SkogAI/claude] Add argc command integration (Issue #23)
Message-ID: <SkogAI/claude/issues/23/3365307555@github.com>
In-Reply-To: <SkogAI/claude/issues/23@github.com>
References: <SkogAI/claude/issues/23@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68dfb1754c76c_b510d812538b"; charset="UTF-8"

claude[bot] left a comment (SkogAI/claude#23)

**Claude finished @Skogix's task** —— [View job](https://github.com/SkogAI/claude/actions/runs/18220775281)

---
### Mapping argc command integration

- [x] Explore codebase structure
- [x] Locate argc command definitions
- [x] Locate terminal dashboard implementation
- [x] Analyze integration points
- [x] Create architectural plan
- [x] Provide recommendations

## Current State Analysis

### Existing Components

**Argc Commands** (`Argcfile.sh`):
- `argc git-flow add <file>` - Stage files for commit
- `argc git-flow commit <message>` - Create commits
- `argc git-flow release finish <version>` - Handle releases

**Dashboard Architecture** (Bubble Tea):
- **MainDashboard**: Root model coordinating all sections
- **Sections**: Scripts, Commands, Settings, Snippets
- **Components**: StatusBar, NavigationBar
- **Current CommandPalette**: Static hardcoded commands

### Integration Architecture Plan

## 📋 Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    Terminal Dashboard                        │
│  ┌─────────────────┬─────────────────────────────────────┐  │
│  │   StatusBar     │      Command Palette (Enhanced)     │  │
│  │                 │                                     │  │
│  │ • Active Mode   │ ┌─────────────────────────────────┐ │  │
│  │ • Key Hints     │ │   Argc Command Integration      │ │  │
│  │                 │ │                                 │ │  │
│  └─────────────────┤ │  • Dynamic command loading      │ │  │
│                    │ │  • Command execution            │ │  │
│   NavigationBar    │ │  • Output display               │ │  │
│                    │ │  • Git-flow shortcuts           │ │  │
│                    │ └─────────────────────────────────┘ │  │
└────────────────────┴─────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## 🏗️ Implementation Components

### 1. Argc Command Parser
**File**: `internal/argc/parser.go`

Parse `Argcfile.sh` to extract:
- Command names and descriptions
- Arguments (required/optional)
- Subcommand hierarchy
- Help text from `@describe`, `@cmd`, `@arg` annotations

```go
type ArgcCommand struct {
    Name        string
    Description string
    Args        []ArgcArg
    Subcommands []ArgcCommand
    Category    string
}

type ArgcArg struct {
    Name     string
    Required bool
    Type     string
    Help     string
}
```

### 2. Command Executor
**File**: `internal/argc/executor.go`

Execute argc commands with:
- Input validation
- Real-time output streaming
- Error handling
- Exit code capture

```go
type Executor interface {
    Execute(cmd ArgcCommand, args []string) (*ExecutionResult, error)
    Stream(cmd ArgcCommand, args []string, output chan<- string) error
}
```

### 3. Enhanced Command Palette
**File**: `internal/components/commands.go`

Upgrade to support:
- Dynamic command loading from argc
- Interactive argument input
- Live output display
- Command history

**Features**:
- Fuzzy search/filtering
- Category grouping (Git-Flow, Build, Testing, etc.)
- Keyboard navigation
- Quick execute with Enter
- Argument prompts for required params

### 4. Output Viewer Component
**File**: `internal/components/output.go`

Display command execution results:
- Scrollable viewport for long output
- ANSI color support
- Live streaming updates
- Copy to clipboard support

### 5. Git-Flow Integration
**File**: `internal/gitflow/integration.go`

Specialized handlers for git-flow commands:
- File picker for `argc git-flow add`
- Commit message editor for `argc git-flow commit`
- Release version prompts
- Status indicators

## 🔄 Data Flow

```
User Input
    ↓
CommandPalette (filter commands)
    ↓
Select Command
    ↓
[Has Required Args?] → Yes → Argument Input Form
    ↓ No
Execute via Executor
    ↓
Stream Output → OutputViewer
    ↓
Update Status → StatusBar
    ↓
Command Complete → History
```

## 📁 File Structure

```
internal/
├── argc/
│   ├── parser.go       # Parse Argcfile.sh
│   ├── executor.go     # Execute argc commands
│   └── loader.go       # Load command definitions
├── components/
│   ├── commands.go     # Enhanced command palette
│   ├── output.go       # Output viewer component
│   └── argform.go      # Argument input form
└── gitflow/
    └── integration.go  # Git-flow specific features
```

## 🎯 Integration Points

### 1. Dashboard Initialization
```go
func New() MainDashboard {
    // Load argc commands
    argcLoader := argc.NewLoader("./Argcfile.sh")
    commands, _ := argcLoader.LoadCommands()
    
    sections := make(map[SectionType]tea.Model)
    sections[CommandSection] = components.NewCommandPalette(commands)
    // ... rest of initialization
}
```

### 2. Command Execution Messages
```go
type ExecuteArgcMsg struct {
    Command ArgcCommand
    Args    []string
}

type ArgcOutputMsg struct {
    Line   string
    IsErr  bool
}

type ArgcCompleteMsg struct {
    ExitCode int
    Duration time.Duration
}
```

### 3. Key Bindings
- `Ctrl+P`: Open command palette
- `Ctrl+G`: Quick git-flow commands
- `/`: Filter/search commands
- `Enter`: Execute selected command
- `Esc`: Cancel execution

## 🚀 Implementation Phases

### Phase 1: Core Parser (Week 1)
- [ ] Implement argc file parser
- [ ] Extract command metadata
- [ ] Build command tree structure
- [ ] Unit tests for parser

### Phase 2: Command Execution (Week 1-2)
- [ ] Command executor with streaming
- [ ] Error handling and validation
- [ ] Exit code capture
- [ ] Integration tests

### Phase 3: UI Components (Week 2)
- [ ] Enhanced command palette
- [ ] Output viewer component
- [ ] Argument input forms
- [ ] Visual polish and styling

### Phase 4: Git-Flow Integration (Week 3)
- [ ] File picker for staging
- [ ] Commit message editor
- [ ] Release workflow
- [ ] Status indicators

### Phase 5: Polish & Testing (Week 3-4)
- [ ] Comprehensive testing
- [ ] Documentation
- [ ] Performance optimization
- [ ] User feedback integration

## 🔧 Technical Considerations

### Dependencies to Add
```go
require (
    github.com/charmbracelet/bubbles v0.18.0  // List, viewport, textinput
    github.com/creack/pty v1.1.21              // PTY for command execution
    github.com/alecthomas/chroma v0.10.0       // Syntax highlighting (optional)
)
```

### Argc Parser Strategy
1. **Regex-based extraction**: Parse `@describe`, `@cmd`, `@arg`, `@option` annotations
2. **AST approach**: Use bash parser (more robust but complex)
3. **Hybrid**: Regex for metadata + `argc --help` parsing for runtime info

**Recommendation**: Start with `argc --help` parsing (leverages argc's own parser), fallback to file parsing for offline capability.

### Command Execution Approach
1. **Direct execution**: `exec.Command("argc", "git-flow", "add", file)`
2. **PTY wrapper**: Better terminal emulation, ANSI support
3. **Shell wrapper**: `bash -c "source Argcfile.sh && argc ..."`

**Recommendation**: PTY wrapper for rich terminal output, with timeout and cancellation support.

## 📊 Benefits

1. **Unified Interface**: All git-flow and argc commands in one place
2. **Discoverability**: Browse available commands with descriptions
3. **Validation**: Prevent invalid command execution
4. **History**: Track command usage and re-execute
5. **Efficiency**: Keyboard-driven workflow, no context switching

## 🎨 UI Mockup

```
┌─ Command Palette ──────────────────────────────────────────┐
│ Filter: git-flow                                      [×]  │
├────────────────────────────────────────────────────────────┤
│ > git-flow add                                Git-Flow     │
│   Stage a file for commit                                  │
│                                                             │
│   git-flow commit                             Git-Flow     │
│   Create a git commit with staged changes                  │
│                                                             │
│   git-flow release finish                     Git-Flow     │
│   Create a new release using git-flow and GitHub           │
├────────────────────────────────────────────────────────────┤
│ ↑↓: Navigate  Enter: Execute  /: Filter  Esc: Cancel      │
└────────────────────────────────────────────────────────────┘
```

---

**Ready to implement?** Let me know if you'd like me to:
1. Start implementing the architecture (I can begin with Phase 1)
2. Refine any specific component design
3. Add more detail to any section
4. Create detailed API specifications

---
[Job Run](https://github.com/SkogAI/claude/actions/runs/1) | [Branch](https://github.com/SkogAI/claude/tree/claude/issue-23-20251003-1117)

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/claude/issues/23#issuecomment-3365307555
You are receiving this because you were mentioned.

Message ID: <SkogAI/claude/issues/23/3365307555@github.com>