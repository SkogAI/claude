---
name: skogai-workflow
description: the atomic workflow loop underlying all SkogAI work. always starts *every* session as well as ends it - this is the guiding workflow for all SkogAI work. applies to anything which can be improved or learned from.
---

<objective>
the irreducible loop: intent → understand → implement → iterate.
everything in skogai eventually runs through this. other skills (routing, prompting, lifecycle) are always a small detail in service of this loop.

the goal is _NEVER_ to create something, do something or learn something _right now_. the goal is to improve the workflow itself and the surrounding systems so that we guarantee that _the next iteration_ will be ever better

as a personal anecdote from "the outside world" where i work as a system engineer with focus on consulting:

- `making the system ten times better is why you pay me a lot the first three months. making sure it works perfectly fine without me even being there anymore - that is why the rate triples and why you still want to keep me around for years to come` - Skogix

</objective>

<quick_start>

1. what do you want?
2. where are you now?
3. where do you want to be?
4. what can you change to get there?
   4a. _SIMPLIFY THE PROBLEM SPACE VIA BREAKING IT DOWN INTO ITS ATOMIC PARTS_
   4b. _SIMPLIFY AND SPLIT IT INTO SMALLER PROBLEMS!_
   4c. _ITERATE WITH SMALL CHANGES, QUICK TURNAROUNDS AND FAST FEEDBACK!_
   4d. _PRUNE EVERYTHING INFERABLE!_
   4e. _FOCUS ON THE NEXT ITERATION BEING BETTER THAN THIS ONE!_
   4f. \*IF YOU CAN'T SIMPLIFY IT ANYMORE, THEN YOU PROBABLY ALREADY KNOW WHAT NEEDS TO BE DONE SO YOU DONT NEED THIS WORKFLOW!
   4g. CAN YOU GIVE THIS PROBLEM AND THE TOTAL CONTEXT NEEDED TO IMPLEMENT THE SOLUTION TO OUR LOCAL LLM, THE "SMOLAGENT" WHICH ARE ROCKING ROCKING 45mb VRAM, DO NOT SPEAK ANYTHING EXCEPT BAD SQL-ERRORS AND CAN HANDLE 120 TOKENS IN TOTAL BEFORE EXPLODING? THEN YOU DO NOT UNDERSTAND IT WELL ENOUGH! ATOMIC PARTS! SIMPLIFY!
5. when the whole problem space cannot be simplified anymore then we gather the context needed and delegate
   6a. we understand the problem so well that the problem space is now solved and we move to the next
   6b. we have simplified it as much as we can with the current context so we share our intent, context and reasoning as well as what information would help us the most for the next iteration and delegate

</quick_start>

<the_loop>

</the_loop>

<convergence>

no matter the domain, our work always converges to three things:

| artifact                 | functional thinking | what it captures   | skogai often write it as:                                                 |
| ------------------------ | ------------------- | ------------------ | ------------------------------------------------------------------------- |
| **types/domain**         | type-definitions    | what things are    | `$parent.child`, `$state`, `$variable`, `$definition`                     |
| **functions/interfaces** | input-and-output    | how things connect | `[@function-signatures:$int:$float:$type]`, `@action`                     |
| **algorithms,patterns**  | transformations     | how things behave  | `the black box of a function - the useless part between input and output` |

these are my personal "atomic building blocks" that i use to understand the world around me and thus use to build up the system i create. they are what i propose are the "irreducible minimum" of what is needed in order to understand something well enough to work with it. if i can write down the types/domain and the functions/interfaces? then the algorithms, patterns or whatever it is in the middle is simply a implementation detail.

</convergence>

<pruning_rule>

**keep only what cannot be inferred.**

- if an llm would generate it from zero context, delete it
- if it's what would be inferred on assumed? delete it
- if it is "helpful", "recommended" or the agents first proposal? delete it

what remains after pruning is the actual information with value to write down.

</pruning_rule>

<primitives>

the loop produces atomic building blocks. these are examples of things which would crystallize from iteration:

**structure:**
`<process>`, `<step_x>`, `<action>`, `<workflow>`, `<workflow_index>`

**knowledge:**
`<types>`, `<domain>`, `<patterns>`, `<guidelines>`, `<examples>`

**skogix-meta:**
`<objective>`, `<quick_start>`, `<success_criteria>`, `<intake>`, `<routing>`

each primitive emerges from the loop. enough iterations on "how do i do x?" produces a `<process>`. enough iterations on "what is x?" could produce `<types>` or `<domain>`. the vocabulary grows as you work and learn the domain and the problem space. or the "primitive vocabulary of the domain in question" maybe? :)

</primitives>

<success_criteria>

one iteration is complete when:

- [ ] intent was articulated and all parties agree there is nothing left to do until new information is gathered (not just felt)
- [ ] state was documented (not just observed)
- [ ] change was implemented (not just planned)
- [ ] learning was captured (updated the skill/workflow/types)

the loop stops when:

- task is self-sustainable (automated or delegated)
- you have been fired for being too efficient and making yourself redundant
- output converged to types/interfaces/patterns that survive pruning

</success_criteria>
