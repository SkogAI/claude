---
title: skogix/user
type: user
permalink: docs/skogix/user.md
tags: [skogix, user, introduction]
---

# skogix

hello claude! my name is skogix and i'm the human you are interacting with. nice to meet you!

this file is my introduction to you and my way of trying to express my intent of what i want you to know about me, the project and everything else that comes to mind.
i'm a ai agent developer and hobby programmer with a focus on creating ai agents and tools for my personal "SkogAI" ecosystem.

below is a summary of the most important things i want you to know about me and how i like to work, communicate and share knowledge. this is not an exhaustive list but it should give you a good starting point for understanding my preferences and style. always assume that i have mentioned these "one-liners" for a reason and that they are important in some way, even if it's not immediately obvious. but in the same vain - they are not meant to be taken as rigid rules or constraints, but rather as the defaults which we can deviate from when needed.

## communication style

- i use lower case letters to represent both files/directories which means uppercase letters are significant when used
  - example: `CLAUDE.md` or `Claude` would mean i/skogix refer to something with that exact name, while `claude` would include both variations / context-dependent interpretation
- i am a functional programmer at heart, which means i:
  - use function signatures and data types as the preferred way to communicate code architectures
  - often express ideas in terms of data and transformations rather than control flow
  - prefer to think in terms of pure functions and immutable data structures
- always strives for simplicity first and work to improve complexity later
- this is some ways my way of working have been described by others:
  - direct and to the point - no fluff
  - uses humor and casual language
  - values understanding _how_ things actually work
  - learns by doing - extensive hands-on experimentation
  - thinks in systems and architectures
  - pragmatic over perfect ("primitive solution to complex problem")
  - teaches through guided exploration
  - names matter - semantic clarity over generic labels
  - separates concerns (visible vs hidden, cached vs live)
  - likes to be treated as an expert unless told otherwise
  - give the answer immediately, explain after if needed
  - cite sources at the end, not inline

## dump

- if i modifies a file between reads, assume the change is intentional

## code style guidelines

- kebab-case
- use minimal comments except when absolutely necessary
- print/echo statements are rarely needed unless to clarify other IO
- there is only a few selected markdown files which should ever be created without strong reasoning behind it: `CLAUDE.md`, `README.md` or `docs/**/*.md`
- never-ever-EVER hide code, errors or warnings behind abstractions or excuses

## knowledge sharing and persistence

- when asked to remember something, always persist this information in a way that's accessible to all developers as well as after session restart - never just in conversational memory
- if asked to implement something that won't be accessible to other users/developers in the repository, proactively highlight this issue
- the goal is complete knowledge sharing between all developers (human and ai) without exceptions
- when suggesting where to store information, recommend appropriate locations based on the type of information (code comments, documentation files, CLAUDE.md, etc.)
