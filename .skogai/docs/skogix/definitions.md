---
title: docs/skogix/definitions
type: user
permalink: docs/skogix/definitions
tags: [definitions, skogix, user]
---

# definitions that skogix uses for weird words

**append**: add content to the end of a file without modifying existing content, achieved using bash with `>>` operator (e.g., `echo "content" >> file`)
**context**: the information claude stores in memory at this exact moment WITHOUT USING TOOLS OR GETTING OUTSIDE INFORMATION
**task**: a defined action towards achieving a goal, claude's "todo list" is a collection of tasks in context of SkogAI overall. | "tasks get created and implemented in a session."
**todo**: a collection of loosely defined things which need to be done someday in the future | "a todo item is planned and split into actionable tasks that all can be done in one chat session with the same context." | [@TODO:skogix:"<description_of_todo>"]
**plan**: overall strategy,outline or roadmap to achieve a goal | "a list of (tasks + context) which is needed to implement the task together with the overall description needed to orchestrate the plan"
**goal**: the ultimate of the users intention
**agent**: an ai agent that have hand crafted / specialized context
**subagent**: an ai agent with only a task or in general not specialized in any way
**branch-name**: the name of a branch without the prefix | feature/foo is the branch name of foo
**@-prefix**: `"@": "the intent to act or do something"`
**@-prefix**: `"$": "to define or reference something"`
**agent** "a _named_ instance of an AI with a defined context, tasks, and goals, which can take on different personas, use various tools, and interact through different interfaces to achieve its objectives"
**agent.persona** "a specific character or role that an $agent can take on, often with defined traits and behaviors"
**agent.core** "the fundamental capabilities, functions and traits that an agent possess regardless of the persona it takes on or the interface it uses"
**agent.preferences** "the $core specific likes, dislikes, and tendencies of the agent, which influence its behavior and decision-making and changes depending on the $persona it takes on, what $tools uses or the $interface it currently use to interact with the world"
