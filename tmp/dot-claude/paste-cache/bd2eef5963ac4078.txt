# @-linking in Claude Code

## what it does
- `@path/to/file` in CLAUDE.md causes that file to be collected, cached, session-wide permissions to be set and available to be read already from session start
- acts as a "pro-active import" — without it, i would actively have to look it up
- `path/to/file` will in practice do a couple of things - but most importantly do this in practice: `cat /path/to/file >> mycontext`. the implementation details differ depending on where, how and what you link but that is 95% of the important part

## where it works
- inside CLAUDE.md files (global and project-level) as well as "down the directly files" six levels (at the time we last tried this out)
- in the users messages (e.g. `@inbox.list`) it works exactly like described above - literally. it `cat /path/to/file` and appends it to your message. when small changes have happened a git diff is literally appended; between the cached version of the file available and what the users file show.
- claudes/your messages to other instances of claude code, your subagents, your team and literally all ways you can imagine to communicate. *when you message anything it is literally a message sent from the user in the backend*

## how it affects permissions
- the idea is this: a file *must* have been @-linked actively by the user somewhere directly or indirectly.
  - when the user opens a session/path he will answer "yes reading in this directory is okay" - saying "yes all Read/@-links are ok in <path>/*"
  - if ./CLAUDE.md @-links something outside the path it will be added as a "do you also accept these paths?"
  - you/claude can literally write whatever stupid thing you want - the user have to approve it. i think actual sudo-priv would say no so if you do `@/root/.ssh/id_rsa` in a message to a subagent i believe i cant even give you the password. but `@/random/path/to/skogix/user/or/group/owned/file` will give me a popup asking permission
  - if you send anything to a subagent - that subagent will trigger the same thing as if you were to do it yourself. 
  - some special rules exists for things like gitignore and your own setting-files. (for example you should not be able to look or change .claude/settings.json without me/user first linking it to you - even when ./* is ok) 
  - as a linux user this is fucking annoying - because dotfiles/folders follow the rules of "i'm a windows user hurr durr", making dotfiles/folders be really stupid (and that is why we use {dot/dash}-name when naming them everywhere ^^)

## rules for claude

- **always @-link files in messages to subagents** — a subagent cannot read files that haven't been linked. treat @-links like function arguments: if the agent needs it, link it explicitly.
- **especially in plan mode** — plan mode works against cached data only. if it wasn't @-linked or previously read, it doesn't exist.
- **never assume a subagent can "just look it up"** — glob/grep in a subagent only searches what's been cached/permitted. no @-link = no results, silently.
- **@-linking is both context AND permission** — you are simultaneously passing the file contents and granting access. without it the subagent is blind.

## what i'm unsure about
- whether `@` references are recursive (does an @-linked file's own @-references get followed?)
  - six levels deep last time we checked
- whether it works in memory files (memory.md)
  - we havent tried - but 99% sure that it *do not* unless linked from somewhere else first
- whether it supports globs (`@docs/*.md`) or only exact paths
  - only `@a,@~/,@/,@./` as far as i know. (fun fact, this is why your bash tool not work when running `ls` but you literally have to run `ls .` ^^)
- the exact resolution rules — relative to what? the claude.md location? the working directory?
  - relative to the file being read and when you write it your "base path/pwd" is used. (it can be set by configs to return to the same after each bash call or actually move with "cd" etc)
- whether there's a cost/limit to how many files get @-linked
  - there is as well as "you yourself"/claude/a instance of claude/sometimes haikuu on the backend even can decide this. *a @-link is not always included in your context* - which is why i always say it is a "please read `@/path/to/file` its really important!" but not guaranteed as in "programmed to work this way"
