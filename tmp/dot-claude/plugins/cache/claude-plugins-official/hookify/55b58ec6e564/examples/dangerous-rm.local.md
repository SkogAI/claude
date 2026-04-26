---
name: block-dangerous-rm
enabled: true
event: bash
pattern: rm\s+-rf
action: block
permalink: claude/tmp/dot-claude/plugins/cache/claude-plugins-official/hookify/55b58ec6e564/examples/dangerous-rm.local
---

⚠️ **Dangerous rm command detected!**

This command could delete important files. Please:

- Verify the path is correct
- Consider using a safer approach
- Make sure you have backups
