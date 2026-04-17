---
name: skogai-workflow
description: The atomic workflow loop underlying all SkogAI work. Always starts *EVERY* session as well as ends it - this is the guiding workflow for all SkogAI work. Applies to anything which can be improved or learned from.
permalink: skogai/skills/skogai-workflow/skill
---

<objective>
The irreducible loop: intent → understand → implement → iterate.
Everything in SkogAI eventually runs through this. Other skills (routing, prompting, lifecycle) are lenses on top.
</objective>

\<quick_start>

1. What do you want? (intent)
1. Where are you now? (understand)
1. What's the smallest change? (implement)
1. What did you learn? (iterate)

Loop until self-sustainable. Prune everything inferable.

\</quick_start>

\<the_loop>

**1. Intent** — What do we want? Where do we want to be?

- Philosophy, goals, constraints
- Can we make it simpler? Can we break it down?
- Can we somehow make sure that the next iteration always improves?

→ Output: Clear statement of how to improve via making context _worth more_ by using tokens that _matter_.

**2. Understand** — Where are we now? Use what the user knows to know which way to go.

- Current state is probably something _we do not want_ - otherwise why change it?
- What went wrong and how can we understand it so we can remove it?
- What's already there is almost always enough - we just need to remove the bad things around it.

→ Output: The reasoning behind the things we remove as well as targeted arguments for why something needs to change.

**3. Implement** — Argument for _a change_ with sound logic and questions that would make a change if answered.

- Give many alternatives and let the user choose one
- Iterate with small ideas, quick turnarounds and fast feedback
- Verify the change worked as intended

→ Output: Changed state. The system is now different.

**4. Iterate** — Start over. Set expected outcome. Compare with reality. Adapt and change.

- Did the change achieve intent?
- What new understanding emerged?
- Refine intent based on what you learned

→ Output: Updated intent, workflow, delegate and automate. The loop continues.

\</the_loop>

<convergence>

No matter the domain, work converges to three artifacts:

| Artifact                 | Functional Thinking | What it captures   | Example                            |
| ------------------------ | ------------------- | ------------------ | ---------------------------------- |
| **types/domain**         | Type-definitions    | What things ARE    | `$keybind.layer`, `$mod`, `$key`   |
| **functions/interfaces** | Input-And-Output    | How things CONNECT | function signatures, API contracts |
| **algorithms,patterns**  | Transformations     | How things BEHAVE  | movement patterns, error handling  |

These are your deliverables. If your work doesn't produce one of these, ask why.

</convergence>

\<pruning_rule>

**Keep only what cannot be inferred.**

- If an LLM would generate it from zero context, delete it
- If it's what would be inferred on assumed? delete it
- If it is "helpful", "recommended" or the agents first proposal? delete it

What remains after pruning is the actual information with value to write down.

\</pruning_rule>

\<quick_check>

Before any work session, ask:

1. **Intent clear?** → If no, clarify first
1. **State understood?** → If no, research first
1. **Change identified?** → If no, you're not ready to implement
1. **Previous iteration learned from?** → If no, review before continuing

\</quick_check>

<primitives>

The loop produces atomic building blocks. These crystallize from iteration:

**Structure:** `<process>`, `<step_x>`, `<action>`, `<workflow>`, `<workflow_index>`

**Knowledge:** `<types>`, `<domain>`, `<patterns>`, `<guidelines>`, `<examples>`

**Meta:** `<objective>`, `<quick_start>`, `<success_criteria>`, `<intake>`, `<routing>`

Each primitive emerges from the loop. Enough iterations on "how do I do X?" produces a `<process>`. Enough iterations on "what is X?" produces `<types>` and `<domain>`. The vocabulary grows as you work.

</primitives>

\<success_criteria>

One iteration is complete when:

- [ ] Intent was articulated (not just felt)
- [ ] State was documented (not just observed)
- [ ] Change was implemented (not just planned)
- [ ] Learning was captured (updated the skill/workflow/types)

The loop stops when:

- Task is self-sustainable (automated or delegated)
- Output converged to types/interfaces/patterns that survive pruning
- Next iteration requires no external input

\</success_criteria>
