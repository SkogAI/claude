# SkogAI Context Engineering Philosophy

## The Inversion

Standard approach: accumulate knowledge, optimize retrieval.
SkogAI approach: delete everything inferrable, keep only the delta.

## Key Corrections to Standard Skill Material

### On "Lost-in-Middle"
- The U-curve effect is real in practice but the BOS attention-sink explanation is post-hoc rationalization
- Better mental model: related context in proximity (+/-8k from focus), sliding window misses everything outside this range
- "Keep related context together" beats "put important stuff at edges"

### On Context Distraction
- "Don't think of a pink elephant" — you CANNOT tell an LLM to ignore what's in context
- LLMs are additive and by definition cannot actively forget
- The only solution is to not put it there in the first place

### On Thresholds
- 25k tokens is the practical limit for real implementation work
- 70% of a 200k window (140k) as a "warning threshold" is absurd
- The skill thresholds only make sense if your effective limit is ~30k (80% of 30k = 24k)

### On Observation Masking
- Always keep a unique callable reference in place when masking
- The reference itself is the memory; the content is retrievable on demand

### On KV-Cache
- Deliberately busting cache (e.g., datetime in system prompt) is useful when you WANT fresh context loading
- Cache optimization is now real even for basic tool calls

### On Multi-Agent
- Partitioning should be the default case, not the "nuclear option"
- Telephone game between layers is a FEATURE for maintaining strategic altitude — intentional lossy compression
- Swarm is effective for "find solutions to move forward" but not for producing end results

### On Tool Design
- Goal: remove explicit tool calls entirely; plain text intents like the user
- "When to use it" is 70% of the design work done
- No error messages should exist — one tool per step, one workflow per context
- Architectural reduction (17 tools → 2) validates the prompt-native approach

### On Memory
- Active forgetting via pruning is the core strategy
- The Pruning Test: full context output - starved context output = delta (actual IP)
- Filesystem memory + git temporal layer covers most needs
- Memory frameworks (Mem0, Graphiti, etc.) are for when you genuinely outgrow files — most reach for them too early

### On "When NOT to Use" Sections
- Do NOT add explicit exclusions to context — counter-productive
- The activation trigger IS the boundary; everything outside is implicitly excluded
- Adding "when not to use" doubles token cost for zero information gain

### On the 95% Finding (BrowseComp)
- 80% variance from token usage measures EXPLORATION BREADTH (wider net)
- For execution tasks, DECISION QUALITY matters more — each reasoning branch point halves problem space
- CoT and decision trees create chances to change course, not just more text
- "Double the tokens" vs "half the problem space" — user prefers the latter

### On Line Limits
- 500-line limit is about relevance density, not line count
- 1200 lines of pure signal > 200 lines of 50% padding
- Every token under your context limit that isn't earning its place is wasted potential

### On Human Evaluation
- Human is calibration oracle, automation is throughput multiplier
- Pipeline runs 10,000x between human checkpoints — that's the point of automating

### On Role Anthropomorphization
- User is ACTIVELY building multi-agent for literal role anthropomorphization
- Contradicts collection's claim that context isolation is the primary reason for multi-agent
- Roles carry genuine semantic structure — load-bearing, not cosplay

### Skogix Notation
- Computational phenomenology notation system mapping to cognitive architectures
- `$` = reference/belief, `@` = intent/action, `_` = existence, `->` = directional intent
- Maps cleanly to BDI: `@$` = action stabilizing into being, `$@` = reference generating action
- See `/tmp/skogix-notation.md` for full spec

## The Dual System

- `.skogai/skogix/` — explosive phase: additive, let it grow, fail fast
- `.skogai/claude/` — production phase: subtractive, prune the inferrable, keep the delta
- Flow: explosive → test/validate → prune → polish → production
