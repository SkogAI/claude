# Tools

The following tools are on PATH and available for use.

- `append [file.list] text...` — append a line to a .list file. Defaults to ~/INBOX.list if no target specified.
- `claude-code` — wrapper over `claude` that runs with `--strict-mcp-config` (no cloud-injected MCP servers). Passes all args through.
- `dotfiles <git subcommand>` — bare repo wrapper for dotfile management. Git dir at /mnt/sda1/demodotfiles.git, work tree $HOME.
- `i3-ws [-m] <offset>` — switch workspace by ±offset. With `-m`, moves focused container and follows. **Status: needs debugging.**
