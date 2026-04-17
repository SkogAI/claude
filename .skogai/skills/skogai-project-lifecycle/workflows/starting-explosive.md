---
title: starting-explosive
type: note
permalink: skogai/skills/skogai-project-lifecycle/workflows/starting-explosive
---

# Starting Explosive - Working in .skogai/skogix/

<objective>
Start new features in the explosive creative phase where rapid iteration and experimentation are prioritized over perfection.
</objective>

\<when_to_use>

- Testing a new idea or approach
- Building MVP/proof of concept
- Unsure if something will work
- Need to try multiple approaches quickly
- Early exploration phase \</when_to_use>

<location>
Work in: `@.skogai/skogix/src/`

This is your sandbox. No constraints, no standards enforcement (yet). </location>

<process>

## 1. Start Without Planning

Don't overthink structure. Just start building:

- Create files where they make sense
- Test approaches rapidly
- Duplicate code if needed (prune later)
- Use verbose naming (clarity over brevity)

## 2. Spew Tokens Everywhere

"Half won't even be close, the other half might have merit"

- Write multiple versions
- Try different patterns
- Over-document initially (prune later)
- Keep failed attempts visible (learn from them)

## 3. Test Constantly

- Does it work? Ship it
- Does it fail? Try another approach
- Partial success? Note what works, iterate

## 4. No Premature Optimization

Don't worry about:

- Code quality (yet)
- Test coverage (yet)
- Documentation polish (yet)
- Performance (unless blocking)
- Naming perfection (yet)

## 5. Know When to Stop

Ready to transition when:

- Core functionality works
- You understand what's actually needed (vs theoretical)
- Clear which parts were valuable
- Ready to throw away the 50% that didn't work

</process>

\<tools_available>

**In explosive phase you have:**

- All sisyphus agents (11+ subagents)
- Multi-agent orchestration
- `/ultrawork`, `/deepsearch`, `/analyze`
- No restrictions on approach

**You don't need:**

- Approval processes
- Standards compliance
- Comprehensive tests
- Production-ready docs

\</tools_available>

\<real_example>

**This session** is explosive phase:

- We're figuring out routing skills structure
- Creating docs as we go
- Testing approaches live
- Will prune later

**What happened:**

1. Started with questions → too complex
1. Rewrote README structure → better
1. Realized routing IS the practice → breakthrough
1. Now building skill while using it → meta-recursive

Half the approaches didn't work. That's expected. That's the point.

\</real_example>

\<transition_signal> When you find yourself saying "this works but it's messy" - that's the signal to move to pruning phase.

Next: `@workflows/pruning-to-production.md` \</transition_signal>

\<success_criteria>

- Working prototype exists
- Core value proven
- Learned what actually matters
- Ready to cut the cruft \</success_criteria>
