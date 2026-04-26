# Examples Deep Dive — Critical Analysis

All 5 example projects read in full. Code, configs, READMEs, reference materials, generated outputs.

---

## TL;DR Ratings

| Example | Rating | Skills Alignment | Verdict |
|---------|--------|-----------------|---------|
| Digital Brain Skill | Reference implementation | Genuine, thorough | Best showcase of filesystem-context and progressive disclosure |
| LLM-as-Judge Skills | Beta / near-production | Genuine, partial gaps | Strong TypeScript, weak CoT enforcement |
| Book SFT Pipeline | Conceptual + real results | Genuine, demonstrates well | Hybrid — pseudocode but with real Gertrude Stein results |
| Interleaved Thinking | Reference implementation | Tangential to collection | Most sophisticated code, weakest skills connection |
| X-to-Book System | Design document only | Genuine design influence | Best architecture spec, zero implementation |

---

## 1. Digital Brain Skill

**Path**: `examples/digital-brain-skill/`
**Size**: 236 KB, ~45 files, ~580 lines Python across 4 scripts
**What it is**: Personal OS for founders — identity, content, knowledge, network, operations as filesystem modules

### What Works

**Progressive disclosure is real, not aspirational.** Three loading levels:
- L1: SKILL.md overview (~50 tokens) — always loaded
- L2: Module .md files (~60-100 tokens each) — on-demand per task type
- L3: Data files (.jsonl/.yaml) — as-needed for specific operations

Claimed 87% token reduction (650 vs 5000 tokens per task). The math checks out if you accept their module isolation — a content task genuinely never needs to load network/contacts.jsonl.

**JSONL design is thoughtful.** Every file starts with a `_schema` line. Append-only with `"status": "archived"` instead of deletion. Git-friendly diffs. Stream-parseable. This isn't just "we picked JSONL" — the format choice directly implements the append-only memory pattern from memory-systems skill.

**Scripts are consolidation done right.** 4 comprehensive tools (weekly_review, content_ideas, stale_contacts, idea_to_draft) instead of 15+ micro-tools. Each has robust error handling, defensive file-existence checks, clean load→process→output separation. The engagement scoring formula (likes + comments×2 + reposts×3) is simple but defensible. The stale_contacts thresholds (inner=14d, active=30d, network=60d, dormant=180d) with urgency multipliers (1.5x overdue, 0.75x early warning) show real domain thinking.

**HOW-SKILLS-BUILT-THIS.md (408 lines) is the crown jewel.** Maps every architectural decision to a specific skill principle. This document alone justifies the example's existence — it shows how abstract principles become concrete implementations.

### What Doesn't Work

**The "87% reduction" claim is aspirational, not measured.** There's no instrumentation. No token counter. No A/B comparison. The number comes from estimating module sizes, not from actually loading both configurations and comparing. It's plausible but unverified.

**Templates are 80% placeholder.** voice.md, brand.md, values.yaml — all `[PLACEHOLDER: ...]`. The example shows the structure but not a working brain. You can't run the weekly_review script on empty JSONL files and get useful output. The workflow examples (content-workflow.md, meeting-prep.md) describe what *would* happen, not what you can reproduce.

**No tests.** Zero. The Python scripts work but there's no validation that they produce correct output, handle edge cases, or don't break when JSONL schemas evolve.

**SKILLS-MAPPING.md claims 11 of 13 skills are implemented.** That's suspiciously comprehensive. Evaluation skill is "implemented" via pre-publish checklists in templates? That's a stretch. Advanced-evaluation is "implemented" via voice attributes rated 1-10? That's a rubric, yes, but it's not what the advanced-evaluation skill teaches (LLM-as-judge, position bias, inter-rater reliability). The mapping oversells.

### Key Question Answer

> Does the filesystem structure actually implement filesystem-context patterns, or is it just a folder hierarchy?

**It implements the patterns.** Module isolation is real — content/ and network/ are genuinely independent. The JSONL streaming design is genuinely agent-friendly. The progressive disclosure hierarchy maps directly to the skill's file system metadata → active context → reference layers. This isn't a folder hierarchy with skill terminology painted on; the structure was designed around the principles.

**But** it doesn't implement the *dynamic* aspects of filesystem-context — no agent-side discovery, no index files for routing, no context window measurement. The routing is implicit (SKILL.md tells the agent which module to load) rather than programmatic.

### Rating: Reference Implementation

Production-quality architecture, production-quality Python, but you can't clone-and-run it productively without populating all the templates first. It teaches the patterns well. It doesn't run as a demo.

---

## 2. LLM-as-Judge Skills

**Path**: `examples/llm-as-judge-skills/`
**Size**: ~530 lines TypeScript, 19 tests, AI SDK 4.0 + Zod + Vitest
**What it is**: Three evaluation tools (directScore, pairwiseCompare, generateRubric) + EvaluatorAgent orchestrator

### What Works

**Position bias mitigation is fully implemented.** Not just mentioned — the pairwise-compare.ts (255 lines) does actual dual-pass evaluation:
1. Pass 1: A first, B second
2. Pass 2: B first, A second (swapped)
3. Map pass2 winner back to original nomenclature
4. If consistent → use result with averaged confidence
5. If inconsistent → declare TIE with penalized 0.5 confidence
6. Per-criterion consistency checking

This is textbook debiasing from the advanced-evaluation skill. The anti-bias prompt instructions ("Do NOT prefer responses because they are longer", "Do NOT prefer based on position") are explicit. Real implementation, not just a flag.

**Zod schemas are strict and comprehensive.** All inputs/outputs typed. Enum enforcement for scales (1-3, 1-5, 1-10), winner values (A, B, TIE), strictness levels. Weight constraints (0-1). Array minimums. The type safety is genuine — malformed inputs fail at the boundary.

**Tests use real API calls.** All 19 tests hit actual LLM endpoints. No mocks. This means the tests validate actual behavior, not stub implementations. The comparative tests (good response scores > poor response, identical responses → TIE) validate functional correctness, not just structural output.

**Tool architecture is clean.** Tools are defined with AI SDK's `tool()` pattern (schema + execute), agents are thin orchestrators. Clean separation. The `evaluateWithGeneratedRubric` method chains rubric generation → scoring with `Promise.all()` for parallel rubric creation.

### What Doesn't Work

**Chain-of-thought is requested but not enforced.** The prompt says "For each criterion: 1. Find specific evidence, 2. Score according to rubric, 3. Justify your score." The output schema requires `justification` and `evidence` fields. But there's **no verification** that reasoning happened before scoring. The LLM could assign scores first and backfill justifications. The test only checks `justification.length > 20` — that's presence validation, not CoT enforcement.

The advanced-evaluation skill explicitly teaches "chain-of-thought-before-score" as a technique. The implementation has chain-of-thought-alongside-score. This is a meaningful gap — research shows scoring before reasoning and reasoning before scoring produce different quality distributions.

**Output parsing skips re-validation.** After `JSON.parse()`, the result isn't validated against the Zod output schema. This means a structurally valid JSON that's semantically wrong (e.g., score outside 1-5 range) passes through silently. The input schemas are strict; the output parsing is trusting.

**Confidence scoring is naive.** Pairwise confidence when positions are swapped is just `(pass1.confidence + pass2.confidence) / 2`. This doesn't account for disagreement magnitude. If pass1 says A wins with 0.9 confidence and pass2 says B wins with 0.9 confidence, the "averaged confidence" is 0.9 — but the actual signal is maximum uncertainty. The inconsistency check catches winner disagreement (→ TIE), but doesn't adjust confidence for near-TIE cases.

**No observability.** No structured logging. No evaluation audit trail. No token usage tracking beyond metadata timestamps. For a tool explicitly about evaluation quality, this is a significant gap. You can't debug why evaluations differ across runs.

**Test coverage has blind spots:**
- No error handling tests (all assume API success)
- Position swap test only validates `positionConsistency` object exists, not that two evaluations actually ran
- No prompt injection resistance tests (adversarial responses)
- No inter-rater reliability tests (same input, multiple runs → consistency)

### Key Question Answer

> Does position bias mitigation actually work? Does chain-of-thought-before-score show up?

**Position bias mitigation: Yes, implemented correctly.** Dual-pass with swap, winner remapping, consistency tracking. The mechanism is sound.

**Chain-of-thought-before-score: No, not enforced.** It's chain-of-thought-requested-in-prompt, which is weaker. The skill teaches this as a specific technique with specific benefits (calibrated scores, detectable reasoning errors). The implementation treats it as an output format requirement, not a cognitive ordering constraint.

### Rating: Beta / Near-Production

The TypeScript is clean, the type safety is real, the position bias work is genuine. But the CoT gap, missing output validation, and no observability put it one step below production. Good enough for evaluation workflows with human review. Not autonomous-grade.

---

## 3. Book SFT Pipeline

**Path**: `examples/book-sft-pipeline/`
**Size**: 6,043 lines total, 187 lines Python, rest is docs + reference + sample outputs
**What it is**: Fine-tuning pipeline for author-voice replication (Gertrude Stein case study)

### What Works

**Real results from a real experiment.** This isn't vaporware. The Gertrude Stein case study has:
- Actual training config (Qwen3-8B-Base, LoRA rank 32, lr=5e-4, 3 epochs)
- Actual loss curves (7584 → 213 test loss, 97% reduction)
- Actual sample outputs with originality verification
- Actual AI detector results (Pangram: 100% Human Written)
- Actual cost breakdown ($2.00 total: $0.50 LLM + $1.50 training)

The sample outputs demonstrate genuine style transfer. "Real estate office" text reads like Stein — simple vocabulary, repetitive sentence patterns, domestic detail focus — and the phrase "real estate office" doesn't appear in the training data. The model learned *style*, not *content*.

**Segmentation strategy is the star.** Two-tier approach:
- Tier 1: Paragraph-level accumulation (150-400 words, deterministic, fast)
- Tier 2: LLM-assisted for oversized paragraphs (handles stream-of-consciousness)
- Scene-aware detection prefers natural breaks
- Dialogue grouping keeps exchanges together

The key insight — smaller coherent chunks teach style better than larger diluted ones — is well-argued and validated by results (296 chunks × 2 variants = 592 examples from an 86k-word book).

**Prompt diversity prevents memorization.** 15 instruction templates × 5 system prompts = 75 combinations. Templates emphasize technique ("simple, repetitive sentences") not content. System prompts range from generic ("expert creative writer") to period-specific ("early 20th century American modernist"). This is smart context engineering — varying the instruction frame prevents the model from pattern-matching on prompt structure.

**Multi-agent pattern is correctly applied.** Supervisor/orchestrator with phase-output artifacts. Each agent (extraction, segmentation, instruction generation, dataset building, training, validation) gets only what it needs. Idempotent design — can restart from any intermediate phase. The key insight from the skills mapping: "Sub-agents exist primarily to isolate context rather than simulate roles."

### What Doesn't Work

**The Python is pseudocode, not runnable code.** `pipeline_example.py` has proper type hints and data structures (Chunk, TrainingExample) but `llm_call()` is a placeholder. ePub extraction requires an unspecified library. Tinker training requires SDK credentials. You can read the code and understand the algorithm, but you can't `python pipeline_example.py` and get results.

**6 stages, not 5.** The handover says "does this demonstrate the 5-stage pipeline pattern from project-development?" It has 6: extraction, segmentation, instruction generation, dataset construction, LoRA training, validation. The project-development skill's pipeline pattern is more generic — the book pipeline extends it rather than following it. Not a bug, but the claim should be precise.

**Known limitations are undersold.** Character name leakage (~30% of outputs) is significant. When training on a single book (Three Lives), the model learns "Lena", "Herman", "the good Anna" as part of the style. The docs note this but frame it as "single book limitation" rather than a fundamental challenge of style-vs-content separation in fine-tuning. Multiple books as training sources would help, but that's untested.

**Evaluation is stronger in concept than in automation.** The three-pronged approach (functional testing, originality verification, AI detection) is well-designed. But only originality verification is automated (grep for phrase matches). Functional testing (does it write like Stein in modern scenarios?) requires human judgment. AI detection requires manual Pangram submission. The evaluation skill teaches automated multi-dimensional assessment — this example partially implements it.

### Key Question Answer

> Does this actually demonstrate the 5-stage pipeline pattern from project-development?

**It exceeds it.** 6 stages, not 5. The pipeline is more detailed than the skill pattern suggests, with explicit segmentation as its own phase (the most novel contribution). The project-development skill's influence is visible in: idempotent phases, artifact outputs between stages, pipeline architecture over monolith. But the example adds domain-specific sophistication that the skill doesn't cover.

### Rating: Conceptual + Real Results

Hybrid. The code is pseudocode. The results are real. The architecture is buildable from the spec. The Gertrude Stein case study is the most compelling proof point in the entire examples collection — it shows context engineering principles producing measurable outcomes ($2, 15 minutes, 100% human detection).

---

## 4. Interleaved Thinking (Reasoning Trace Optimizer)

**Path**: `examples/interleaved_thinking/`
**Size**: 2,818 lines Python across 8 modules, 19 unit tests, 3 examples, full optimization artifacts
**What it is**: Optimization loop that captures M2.1 reasoning traces, detects failure patterns, and iteratively improves prompts

### What Works

**Most sophisticated codebase in the collection.** Clean separation of concerns across 5 core modules:
- `capture.py` (417 lines) — M2.1 API wrapper with thinking block extraction
- `analyzer.py` (465 lines) — Pattern detection via LLM self-analysis
- `optimizer.py` (449 lines) — Prompt improvement generation
- `loop.py` (468 lines) — Orchestration with convergence checking
- `skill_generator.py` (502 lines) — Converts learnings into shareable skills

Each module has a clear responsibility. Error handling is thorough — 3-layer fallback parsing in analyzer (JSON → regex → neutral default), 4-strategy prompt extraction in optimizer (JSON → markers → code blocks → prose). These fallbacks show real-world brittleness awareness.

**Best-score tracking is the key innovation.** The loop doesn't use the final iteration's prompt — it independently tracks which iteration scored highest and returns that prompt. Real data from 10-iteration run: scores zigzag (69, 66, 61, 72, 59, 50, 70, 64, 64, 70). Best prompt came from iteration 4 (72/100). Without best-score tracking, you'd get 70. With it, you get 72.

This matters because multi-step agent behavior is inherently stochastic. The same prompt produces ±15 point variance. Tracking the best is a practical engineering decision that the theoretical skills don't discuss.

**Pattern detection is concrete, not abstract.** 10 failure patterns (context_degradation, tool_confusion, instruction_drift, hallucination, incomplete_reasoning, tool_misuse, goal_abandonment, circular_reasoning, premature_conclusion, missing_validation) with severity levels, evidence quotes, turn indices, and confidence scores. The analyzer doesn't just label — it provides actionable specifics.

**The skill generator closes the loop.** Optimization results → SKILL.md file with activation triggers, anti-patterns, practices, guidelines. The generated comprehensive-research-agent skill contains evidence-backed recommendations from actual optimization runs. This is a novel contribution — automated skill extraction from agent behavior analysis.

**Convergence safeguards are well-designed.** Stop conditions: score threshold met, improvement below convergence threshold, max iterations, 2+ consecutive regressions. Prompt growth limiting (5x original max) prevents bloat. These show production thinking about runaway optimization.

### What Doesn't Work

**Tests are unit-only.** 19 tests validate data model construction (ThinkingBlock, Pattern, AnalysisResult, etc.) and enum values. Zero integration tests. No test validates that capture actually captures thinking blocks, that analysis actually detects patterns, or that optimization actually improves prompts. The most important behaviors are untested.

**Convergence is real but modest.** 67.6 → 72.0 = +6.5% improvement over 10 iterations. The handover asks "does it converge?" — yes, but to a local plateau, not to high performance. Complex multi-tool tasks plateau around 65-75 due to inherent stochastic variance. The system correctly identifies this (convergence_threshold, regression tracking) but the improvement ceiling is low. 10 API calls (expensive) for 6.5% improvement is questionable ROI.

**Skills connection to the collection is weak.** The handover lists no specific parent skills. Looking at the mapping:
- context-degradation? Detected as a pattern, but the tool doesn't apply the skill's mitigations
- evaluation? The scoring rubric (reasoning_clarity, goal_adherence, tool_usage_quality, error_recovery) is custom, not from the evaluation skill
- context-optimization? No — the optimizer works on prompts, not on context structure

This example is **adjacent** to the skills collection rather than demonstrating it. It's excellent standalone work, but its inclusion as a "context engineering example" is the weakest of the five.

**MiniMax M2.1 dependency is limiting.** The entire system is built around M2.1's interleaved thinking blocks (thinking type in response content). Anthropic's Claude also has extended thinking, but the capture code targets M2.1's API format via Anthropic-compatible endpoint. Portability is claimed but not tested.

**The full example (03_full_optimization.py) is 1,223 lines with mock tools.** web_search, read_url, read_file, etc. all return hardcoded content. The "real-world" demonstration uses simulated web pages. This is fine for showing the optimization loop, but the results (72/100 score) reflect performance against mock data, not real tool behavior.

### Key Question Answer

> The optimization loop (capture → analyze → improve → rerun) — does it converge? Is the best-score tracking actually useful vs. just using the last iteration?

**Converges: Yes, to a modest plateau.** +6.5% over 10 iterations. Scores stabilize in the 64-72 range after iteration 4.

**Best-score tracking: Definitively useful.** Without it: 70/100 (last iteration). With it: 72/100 (iteration 4). The stochastic variance (±15 points between runs) means the last iteration is rarely the best. This is the most practical insight from the entire example — agent optimization needs peak tracking, not recency.

### Rating: Reference Implementation

The most technically sophisticated example. Well-architected, extensible, rich data models. But unit-only tests, mock tools, modest convergence, and weak connection to the parent skill collection hold it back. Best viewed as a standalone agent optimization toolkit that happens to live in this repo.

---

## 5. X-to-Book System

**Path**: `examples/x-to-book-system/`
**Size**: 3 files, ~44K total (README.md, PRD.md, SKILLS-MAPPING.md). Zero code.
**What it is**: Architecture spec for a multi-agent system that monitors X accounts and synthesizes daily books

### What Works

**Skills mapping shows genuine design influence.** This is the key question, and the answer is clear: these aren't post-hoc labels.

Evidence:
1. **Context budgets per agent** (Orchestrator 50k, Scraper 20k, Analyzer 80k, Synthesizer 100k, Writer 80k, Editor 60k) — directly from context-fundamentals teaching context as finite resource
2. **File system as coordination backbone** — directly from filesystem-context's observation masking pattern. Raw tweets (100k+ tokens/day) never pass through agent context; they're written to `raw_data/{account}/{date}.json` and read by downstream agents
3. **Tool consolidation from 15+ to 3** — directly from tool-design's "if a human can't pick the right tool" principle. `x_data_tool`, `memory_tool`, `writing_tool` instead of `fetch_timeline`, `fetch_thread`, `fetch_engagement`, `search_tweets`, `store_entity`, `query_entities`, ...
4. **Temporal knowledge graph over vector store** — directly from memory-systems teaching that vector stores lose relationship info. Entities (Account, Tweet, Theme) with relationships (DISCUSSES, AGREES_WITH, DISAGREES_WITH) and temporal validity
5. **"Telephone game" mitigation** — directly from multi-agent-patterns. Raw data stored in filesystem; Orchestrator receives phase summaries only, never raw content. Prevents the supervisor paraphrasing that causes 50% performance loss

Each mapping traces problem → skill principle → architectural decision. Not "we used context-fundamentals" but "we have 100k tokens/day of raw tweets, context-fundamentals teaches observation masking, therefore scraper writes to filesystem and analyzer reads from filesystem."

**The PRD is excellent.** 5 specific failure modes with concrete mitigations (not generic). 7-phase pipeline with quality gates. Multi-dimensional evaluation rubric (Source Accuracy 30%, Thematic Coherence 25%, Completeness 20%, Insight Quality 15%, Readability 10%). Human review triggered at <0.7 overall or <0.8 source accuracy. YAML configuration schema. Tool API specifications with parameters and error handling. 10-week implementation timeline. Tech stack recommendations (LangGraph, Neo4j, Temporal.io).

**The architecture is buildable.** Not hypothetical. Phase 1 (core pipeline) is 2-3 weeks with existing tools. Full system is ~3 months. The spec makes enough tactical decisions to guide implementation while leaving appropriate flexibility.

### What Doesn't Work

**Zero code.** No proof of concept. No prototype. No validation that the architecture works in practice. The X-to-Book system is the most ambitious design in the collection, but it's entirely unvalidated. The digital-brain-skill has running Python. The LLM-as-judge has passing tests. The book-sft-pipeline has real training results. This has prose.

**Agent coordination mechanism is underspecified.** How does the Orchestrator call the Scraper? REST API? LangGraph state machine? Direct function call? The PRD recommends LangGraph but doesn't show the graph structure. For a system that claims multi-agent-patterns as a core influence, the actual coordination protocol is hand-waved.

**X API rate limiting is an unsolved constraint.** The PRD acknowledges it ("open question") but the architecture doesn't account for it structurally. Circuit breaker and exponential backoff are mentioned as mitigations, but the Scraper agent's context budget (20k) assumes clean API access. If rate limiting forces batch-and-wait patterns, the entire daily pipeline timing changes.

**The evaluation rubric is described but not operational.** Source Accuracy verification requires "regex matching against source JSON" — this is automatable but not specified in pseudocode. Thematic Coherence requires "LLM-as-judge with rubric" — which model? What rubric? The LLM-as-judge skills example in the same repo implements exactly this, but the PRD doesn't reference it. Missed connection.

### Key Question Answer

> Does the skills mapping show genuine design influence, or is it post-hoc justification?

**Genuine design influence.** The evidence is in the specificity. Post-hoc justification says "we used context-optimization." Genuine influence says "we have 100k tokens/day, the skill teaches observation masking, so we route raw data through filesystem instead of context, and the orchestrator only sees phase summaries." The SKILLS-MAPPING.md document consistently shows the latter pattern.

### Rating: Design Document

Not a pejorative. It's a thorough, well-reasoned architecture spec that demonstrates how skills translate to system design. But it doesn't belong in `examples/` alongside running code — it belongs in `docs/case-studies/` or similar. The gap between "design that applies skills" and "implementation that validates skills" is the gap between this example and the others.

---

## Cross-Cutting Observations

### 1. Skills Alignment Spectrum

The examples demonstrate skills integration at different depths:

| Depth | Example | How |
|-------|---------|-----|
| **Architectural** | X-to-Book | Skills shaped every major design decision |
| **Structural** | Digital Brain | Filesystem layout, data formats, module isolation all skill-driven |
| **Functional** | LLM-as-Judge | Implements specific techniques (position bias, rubric generation) |
| **Methodological** | Book SFT Pipeline | Pipeline pattern, evaluation approach from skills |
| **Tangential** | Interleaved Thinking | Adjacent concepts, custom approach |

### 2. What the Examples Teach That Skills Don't Cover

- **Best-score tracking in stochastic optimization** (Interleaved Thinking) — no skill covers this
- **JSONL-as-memory-format** with schema-first lines (Digital Brain) — filesystem-context skill mentions file formats but doesn't prescribe this specific pattern
- **Prompt diversity as memorization prevention** (Book SFT) — context-optimization skill discusses repetition but not in the fine-tuning context
- **Tool consolidation with concrete before/after** (X-to-Book) — tool-design skill teaches the principle but this example shows the 15→3 reduction with specific tool designs
- **Engagement scoring formulas** (Digital Brain) — evaluation skill is about LLM output quality, not social media metrics

### 3. Patterns Worth Extracting Back Into Skills

**For filesystem-context skill:**
- JSONL with schema-first-line pattern (from Digital Brain)
- Append-only with archival status instead of deletion
- Three-level progressive disclosure hierarchy with token budgets

**For evaluation skill:**
- Output schema re-validation after LLM response parsing (gap identified in LLM-as-Judge)
- Best-score tracking for stochastic evaluation loops (from Interleaved Thinking)
- Multi-source originality verification as an evaluation dimension (from Book SFT)

**For context-optimization skill:**
- Prompt diversity as attention collapse prevention (from Book SFT)
- Explicit per-agent context budgets with numbers (from X-to-Book)

**For multi-agent-patterns skill:**
- File system as coordination backbone — concrete pattern with examples (from X-to-Book, Digital Brain)
- Phase-output artifacts as checkpoints enabling idempotent restart (from Book SFT)

**For tool-design skill:**
- 15→3 tool consolidation case study with before/after (from X-to-Book)
- Engagement scoring as a concrete "tool output" design (from Digital Brain)

### 4. The Collection's Blind Spot

None of the examples demonstrate **context degradation in practice**. The context-degradation skill teaches lost-in-middle, context poisoning, attention dilution. Digital Brain claims to mitigate it (critical info at top of files). But no example shows: here's a task that fails at 50k context, here's how we restructured context to fix it, here's the before/after. The skill is theoretical; the examples are preventive. A debugging-focused example showing degradation diagnosis → fix would be the most valuable addition.

### 5. Production-Readiness Distribution

```
Production-ready code:     0/5  (none are pip-install-and-run)
Reference implementation:  2/5  (Digital Brain, Interleaved Thinking)
Beta with real validation:  1/5  (LLM-as-Judge — tests pass, types strict, but gaps)
Conceptual with evidence:  1/5  (Book SFT — pseudocode but real results)
Pure design:               1/5  (X-to-Book)
```

The collection has a depth-over-breadth character. Each example goes deep on a subset of skills rather than shallowly touching all 13. This is the right tradeoff for a skill collection — you learn more from one deeply applied principle than from 13 superficially demonstrated ones.

---

## Verdict

The examples validate the skills collection. They're not marketing demos — each one shows real architectural thinking driven by the principles. The weakest connection (Interleaved Thinking) is also the strongest standalone code. The strongest connection (X-to-Book) has zero running code.

If forced to keep only two examples: **Digital Brain** (shows how skills shape a real system's file structure, data formats, and automation) and **Book SFT Pipeline** (shows real measurable results from applying the principles, even if the code is pseudocode). Together they demonstrate that context engineering produces both architectural clarity and measurable outcomes.
