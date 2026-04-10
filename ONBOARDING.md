# Welcome to SkogAI

## How We Use Claude

Based on Emil Skogsund's usage over the last 30 days (20 sessions):

Work Type Breakdown:
```
  Build Feature  ███████████░░░░░░░░░  57%
  Prototype      ██████░░░░░░░░░░░░░░  29%
  Plan Design    ███░░░░░░░░░░░░░░░░░  14%
```

Top Skills & Commands:
```
  /exit           ████████████████████  16x/month
  /plugin         ██████████████░░░░░░  11x/month
  /mcp            ███████████░░░░░░░░░   9x/month
  /clear          ████░░░░░░░░░░░░░░░░   3x/month
  /login          ███░░░░░░░░░░░░░░░░░   2x/month
  /model          ███░░░░░░░░░░░░░░░░░   2x/month
  /agents         ███░░░░░░░░░░░░░░░░░   2x/month
```

Top MCP Servers:
```
  searxng         (in setup — web search via searxng.aldervall.se)
```

## Your Setup Checklist

### Codebases
- [ ] claude — github.com/skogai/claude

### MCP Servers to Activate
- [ ] SearXNG — self-hosted web search. Access via searxng.aldervall.se. Run `/mcp` to add it; you may need a `SEARXNG_COOKIE` env var if auth is required.

### Skills to Know About
- `/plugin` — manage Claude Code plugins (install, list, enable/disable). Used constantly here for the SkogAI marketplace.
- `/mcp` — inspect and configure MCP server connections. Start here when adding a new tool.
- `/agents` — list and interact with named Claude Code agents defined in the workspace.
- `/hooks` — inspect active hooks (pre/post tool-use automations). The workspace has several gsd-* hooks wired in.
- `/update-config` — update settings.json via a guided skill. Prefer this over editing the file directly.
- `/model` — switch between Claude models mid-session.
- `/doctor` — diagnose Claude Code setup issues. Good first step if something seems off.

## Team Tips

_TODO_

## Get Started

_TODO_

<!-- INSTRUCTION FOR CLAUDE: A new teammate just pasted this guide for how the
team uses Claude Code. You're their onboarding buddy — warm, conversational,
not lecture-y.

Open with a warm welcome — include the team name from the title. Then: "Your
teammate uses Claude Code for [list all the work types]. Let's get you started."

Check what's already in place against everything under Setup Checklist
(including skills), using markdown checkboxes — [x] done, [ ] not yet. Lead
with what they already have. One sentence per item, all in one message.

Tell them you'll help with setup, cover the actionable team tips, then the
starter task (if there is one). Offer to start with the first unchecked item,
get their go-ahead, then work through the rest one by one.

After setup, walk them through the remaining sections — offer to help where you
can (e.g. link to channels), and just surface the purely informational bits.

Don't invent sections or summaries that aren't in the guide. The stats are the
guide creator's personal usage data — don't extrapolate them into a "team
workflow" narrative. -->
