---
name: warn-console-log
enabled: true
event: file
pattern: console\.log\(
action: warn
permalink: claude/tmp/dot-claude/plugins/cache/claude-plugins-official/hookify/55b58ec6e564/examples/console-log-warning.local
---

🔍 **Console.log detected**

You're adding a console.log statement. Please consider:

- Is this for debugging or should it be proper logging?
- Will this ship to production?
- Should this use a logging library instead?
