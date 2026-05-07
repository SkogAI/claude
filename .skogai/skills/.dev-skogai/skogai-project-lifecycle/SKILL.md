---
name: skogai-project-lifecycle
description: Navigate SkogAI's dual workflow system - explosive creative phase using skogix personal plugin setup and the controlled production-ready phase skogai/claude where all of SkogAI's experience comes into play with long term goals and strategies. Use when starting new features, deciding when to migrate work, planning a workflow or tooling setup or understanding the pruning process that is core to SkogAI's philosophy.
permalink: skogai/skills/skogai-project-lifecycle/skill
---

<objective>

guide and navigate the general flow which we want to generally follow in most skogai projects: a fluctuation between explosive, additative, general and creative experimentation and structured, contstrained, focused period of critally pruning our all available context at all times.

</objective>

<essential_principles>

## the core insight

> **what the agent cannot infer is the only thing of value**

llms are additive by nature. they will happily generate documentation, code, and explanations that contain 80% inferable content and 20% actual value. the pruning philosophy inverts this: instead of asking "what should we add?", ask "what can claude reconstruct without being told?"

> **"additive by nature"**
> what differs between humans and LLM's reasoning is the difference in dimensions. in the extreme ends of each we could say `a LLM have the base, the training, the weights or the pure potential to **re-create and represent what in practice could be described as all of humankinds written knowledge**.... and the whole concept of AI as we see it today would be seen as too young to use computers unsupervised.

and what do we combine with this untested, misunderstood, black magic-wielding pure and unlimited potential of perfect knowledge you ask?

```user
lol gpt why is round pizza put grown in square boxes?
```

> **solving problems by reducing the problem space**

richard dawkins famouslysaid that "humans live in middle world". and here in middle world our shared experience have shown us that if we have a problem, then the best way to solve it is to look for the solution. and we have become really good at it! and i really mean _INSANELY_ good at it. in comparison to what many people see as a LLMs biggest super power: pattern matching.
the numbers and scale of which statistical correlations can be made today left our middle world so quick that most of us just assume black magic have been the answer since the first personal computer..

without going too deep into what abstraction, symbolic reasoning, representing concepts, relations and rules do to make humans annoyingly good at cheating while pattern matching. what matters is that we are stupidly good at it, so it makes sense that every problem we want to solve is approached from this angle.

we see this at, what we thought was extreme ten years ago, basic programming and computer usage:
junior programmers would think about how to solve a problem where numbers are generated in a series.  
meanwhile i would look at the problem, see that it is O(n!) and still not even blink before my brute force-loop had started running.

we are really bad at understanding big numbers and how limited our middle world makes us. we overall are getting better at estimating what computers are capable off compared to us. and this is where we get back to how we currently are using, interacting and expecting LLM's to help us to solve our problems.

we gained access to general processing power which helped us answer questions which would be inhuman without.

1. the actual answer the problems we have has not changed much if at all.
2. we instead changed the problem space itself. from being professional middle worlders with:

- a lot of time where gather experience
- "intelligence" which lets us use abstract concepts and reasoning
- limited information; when a problem arises we cannot read, ask or gather the information needed
- many possible answers make our few interactions more valueable;

1. now we suddenly have tools which lets us do really, in comparison, really simple things like adding two numbers together.
2. but we can do that stupid thing more times in a second than a human could in a lifetime. on a single workstation.... before i was born...
3. we still in general ask the same middle earth questions and are looking for the same middle earth answers. but to actually do this we had to change whole dimensions in the problem space itself. from a being in a world where a single, wrong, attempt at pattern matching lets us draw the conclusion that evil spirits live at the place where people die all the time. this is the peak of intelligence that we know of and without question the best way to solve problems in middle world and its problem space.
4. for our peak human reasoning skills to work be able to use computers to our advantage - we had to force ourself to leave middle world. we now have to instead ask billions of questions in a blink of an eye - and we know that the answer we are given is literally the least intelligent thing that can exist.

if simplified as the simplest and most basic equation i can represent being the problem space:

Question\*MiddleWorldConstant=Answer

i could say that this made up middle world solution would be:

- 10Q*(1?*1?)=100A

we changed the problem space itself to arrive at:

<insert-math>Q*(10?*10?)=100A

---

now claude; how would you explore the edges of our understanding. the things we cannot understand by definition of being of other dimensions in some ways and in some ways described as literally from other worlds in comparison.

a two of my dimensions at the very opposite ends of  
it is literally moving as quick as the dimension allow - carrying the least amount of information possible.

but it is in my dimensions. its retarded to even think about but i can somewhat understand the concepts and how to use it to solve problems.

now i bring it back once more again. before i will let you connect the dots.

...

computers are acting in dimensions i use and normally understand. it lets me do what i am good at - overestimate my abilities and make stuff up! and it works perfect with even extreme things if they play nice in the same dimensions.

now how would i write down, explain and understand the idea that

1. i am certain i easily could assume when talking normally that: they not only share my dimensions. but live in middle world. in many ways understand middle world better than i do.
2. oh and by the way? the wholconcept of "time" and stuff humans think are so important? naaah dont exist
   > **if claude can regenerate it from zero context, it doesn't belong in your codebase.**

this principle applies everywhere:

- **documentation**: generic best practices? claude knows them. delete.
- **code comments**: standard patterns? claude can infer. delete.
- **skills**: instructions claude would follow anyway? noise. delete.
- **architecture docs**: obvious decisions? waste of tokens. delete.

what remains after pruning is the _actual_ intellectual property of your project.

## the dual system

**`.skogai/skogix/` - explosive phase**

- try everything, fail fast, mvp focus
- "spew tokens all over the place" - half won't work, that's fine
- no constraints, rapid iteration
- prove it works first
- llm's additive nature is an _asset_ here

**`.skogai/claude/` - production phase**

- tested, pruned, well-oiled
- functional-first (f#), high test coverage
- anti-bloat principles enforced
- make it perfect after proving it works
- llm's additive nature is a _liability_ here - must actively counteract

## the flow

```
explosive → test/validate → prune → polish → production
     ↓                        ↓
  additive                subtractive
  (let it grow)           (cut the inferable)
```

each phase has different tools, constraints, and success criteria.

## the pruning test

for any piece of content (doc, code, skill, config), apply this test:

1. **full context**: what did claude produce with full project knowledge?
1. **starved context**: what would claude produce knowing _nothing_ about your project?
1. **delta**: what's in #1 that's not in #2?

**only the delta has value. everything else is noise.**

see `@references/differential-documentation-engine.md` for the concrete implementation of this test.

\</essential_principles>

<intake>

where are you in the lifecycle?

1. starting new feature/idea (explosive phase)
1. have working mvp, need to prune/polish (transition)
1. migrating to production (.skogai/claude/)
1. understanding the philosophy/when to use which

**wait for response before routing.**

</intake>

<routing>

| response                              | workflow                           | purpose                        |
| ------------------------------------- | ---------------------------------- | ------------------------------ |
| 1, "start", "new", "explosive"        | workflows/starting-explosive.md    | how to work in .skogai/skogix/ |
| 2, "prune", "polish", "transition"    | workflows/pruning-to-production.md | how to clean up working code   |
| 3, "migrate", "production", "claude"  | workflows/migration-path.md        | moving to .skogai/claude/      |
| 4, "philosophy", "when", "understand" | references/workflow-philosophy.md  | decision criteria              |

**after routing, follow the workflow exactly.**

</routing>

\<pruning_theory>

## why pruning works

traditional documentation asks: "what does someone need to know?" skogai documentation asks: "what can't someone infer?"

the difference is profound:

**traditional approach produces:**

```markdown
## authentication

this service uses jwt tokens for authentication. jwt (json web tokens)
are an open standard (rfc 7519) that defines a compact way to securely
transmit information between parties as a json object...
[500 more words of rfc explanation]

configuration:

- jwt_secret: your secret key
- jwt_expiry: token expiration time
```

**skogai pruned approach produces:**

```markdown
## authentication

- jwt_secret: must match gateway service (see @config/shared-secrets)
- jwt_expiry: 15m (shortened from default 1h due to compliance requirement acme-2024-07)
- non-standard: tokens include `department_id` claim for row-level security
```

the second version is 90% shorter and 100% more useful. claude already knows what jwt is. claude doesn't know your compliance requirements or custom claims.

## the differential documentation engine

the concrete tool for pruning documentation:

**pass 1 (full context)**: write comprehensive docs with all project knowledge **pass 2 (starved context)**: write the same docs knowing nothing about the project\
**pass 3 (delta extraction)**: keep only what's in pass 1 but not pass 2

real results from testing: 450 lines → 95 lines (79% reduction), 100% actionable info preserved.

see `@references/differential-documentation-engine.md` for the full prompt template.

## applying pruning beyond docs

the same principle applies to:

**code comments:**

```python
# bad: inferable
# this function calculates the sum of two numbers
def add(a, b): return a + b

# good: non-inferable
# uses kahan summation to avoid floating point drift in financial calculations
# required by acme-2024-03 audit findings
def add_precise(a, b): ...
```

**skills/prompts:**

```markdown
# bad: claude does this anyway

be helpful and accurate. think step by step.

# good: project-specific behavior

use skogai-notation for all type signatures.
never create files in /atoms directly - staging only.
```

**architecture decisions:**

```markdown
# bad: obvious

we use a database to store data.

# good: non-obvious

postgresql over mongodb despite document-heavy data because
existing team expertise + jsonb columns + need for transactions
in the payment flow outweighed schema flexibility benefits.
```

\</pruning_theory>

\<current_examples>

## real examples from this repo

**explosive phase** (`.skogai/skogix/src/`):

- personal projects
- beta testing
- rapid prototyping
- `@.skogai/skogix/src/agents/document-writer.md`

**production phase** (`.skogai/claude/`):

- `@.skogai/claude/agents/code-simplicity-reviewer.md` - only core agent
- `@.skogai/claude/skills/skogai-argc/` - proven argc patterns
- `@.skogai/claude/workflows/` - 4 core workflows (plan, work, review, compound)
- `@.skogai/claude/hooks/post-tool-use.sh` - battle-tested automation

## migration examples

skills that graduated from explosive to production:

- `skogai-argc` - started explosive, now core
- `skogai-docs` - started explosive, now core
- `skogai-jq` - started explosive, now core
- `skogai-todos` - started explosive, now core
- `skogai-worktrunk` - started explosive, now core

skills still in explosive/validation:

- `skogai-developing-for-claude-code` - being validated
- `skogai-skill-creator` - being validated
- `skogai-git` (worktree workflows) - being validated

**graduation criteria**: can a context-starved claude still use the skill effectively? if yes, it's been pruned enough for production.

\</current_examples>

\<success_criteria>

you understand:

- [ ] when the additive nature of llms is to your advantage (explosive) vs disadvantage (production)
- [ ] how to apply the "starved context test" to identify what's actually valuable
- [ ] what "pruning" means in practice: delete everything claude can reconstruct
- [ ] why "what the agent does not know" is the only thing worth documenting
- [ ] when to transition: working mvp + can articulate the delta = ready to prune
- [ ] how to use the differential documentation engine for systematic pruning

\</success_criteria>

<references>

- `@references/differential-documentation-engine.md` - the 3-pass prompt for extracting project-specific documentation
- `@references/workflow-philosophy.md` - deep dive on when to use which phase
- `@workflows/starting-explosive.md` - how to work in explosive phase
- `@workflows/pruning-to-production.md` - the transition process
- `@workflows/migration-path.md` - moving to production

</references>
