# Memory — Agent Skills for Context Engineering

## User Philosophy (SkogAI)

See [context-philosophy.md](./context-philosophy.md) for detailed notes.

Core principles:
- **Subtractive over additive**: prune everything the LLM can infer; only the delta has value
- **25k effective context limit**: treat anything over 25k as unreliable for real work, regardless of model's advertised window
- **Replace and update > add or historize**: mutate in place, git handles history
- **Proximity > position**: keep related context close together; +/-8k from focus is the practical attention range
- **Partitioning as default**: sub-agents with clean focused contexts, not a single bloated window
- **Filesystem as RAM**: markdown files as active workspace, not just storage
- **Prompt-native philosophy**: remove tool calls, let agent use plain text intents like the user does
- **Telephone game as feature**: intentional lossy compression between agent layers to maintain strategic altitude (20,000m overview)
- **"When to use it" is 70% of tool design**: activation triggers matter more than implementation details

## Environment Notes

- Python package manager: `uv` (no pip available, Arch Linux)
- Parallel sessions on same repo can cross-commit staged files — use worktrees or separate branches

## Session Notes

- User has deep practical experience with context engineering — skip the basics, engage at expert level
- Wrapup files go to /home/skogix/claude/
- User expects critical engagement with skill material, not just summaries
- User wants outside perspective preserved — don't rewrite analysis to match their philosophy
- Handover pattern: write per-path markdown briefs with full context pointers for parallel follow-up sessions

## Deep Dive Status

All 13 skills critically annotated across 2 sessions. 5 handover briefs written for parallel follow-up:
1. **Examples deep dive** — COMPLETED. See `journal/2026-02-27/examples-deep-dive-hands-on.md`
2. **Source material provenance** — COMPLETED. See `journal/2026-02-27/source-material-provenance.md`
3. **Researcher methodology** — COMPLETED. See `journal/2026-02-27/researcher-methodology-analysis.md`
4. **Build stress-test** — COMPLETED. See `journal/2026-02-27/build-stress-test.md` and `examples/context-harness/`
5. **Synthesis reference** — COMPLETED. See `journal/2026-02-27/context-engineering-synthesis.md`

## Examples Deep Dive Findings

Key findings from hands-on testing (full: `journal/2026-02-27/examples-deep-dive-hands-on.md`):
- Collection claims 5 examples but only 1.5 are fully testable (context-harness + llm-as-judge with API key)
- context-harness (45/45 tests pass): best example, implements filesystem-context patterns correctly
- `memory-systems` SKILL.md has broken frontmatter — YAML multi-line scalar (`description: >`) not parsed by harness's naive parser, making the skill invisible to matching
- Skill keyword matching: 50% accuracy on realistic queries (word-intersection can't handle natural language)
- 200-line truncation cuts best content: advanced-evaluation loses 56%, project-development loses 42% (practical guidance, anti-patterns, examples)
- Observation masking extends sessions 2.4x (12 vs 5 turns before compaction)
- x-to-book-system has zero code (3 markdown files only)

Journal entries in `/home/skogix/claude/journal/2026-02-27/`

## Source Material Provenance Findings

Key findings from provenance audit (full: `journal/2026-02-27/source-material-provenance.md`):
- `claude_research.md` and `gemini_research.md` are secondary syntheses (likely AI-generated), not primary sources — skills citing them inherit uncertain provenance
- Three systematic drift patterns: caveats dropped, secondary-as-primary, provenance laundering
- Highest-value missing material: Peak Ji's recitation/errors-in-context/anti-few-shot patterns, fabrication threshold taxonomy, Anthropic's scale-effort heuristic, initializer+coding agent pattern
- `agentskills.md` spec prescribes workflow checklists and feedback loops that no skill implements
- Vercel d0 caveat ("only worked because data was well-structured") missing from skill synthesis

## Researcher Methodology Findings

Key findings from meta-evaluation (full: `journal/2026-02-27/researcher-methodology-analysis.md`):
- Gate logic contradiction: line 28 allows 2 failures, line 64 rejects on ANY failure
- G4 (Source Verifiability) encodes reputation bias it claims to avoid — names "Anthropic, Google, Vercel" as credible
- D1 overloaded: measures both "Technical Depth" AND "Actionability" (anti-pattern per advanced-evaluation)
- No D3=0 override: evidence-free content can score APPROVE (1.7) on other dimensions
- context-fundamentals would fail G3 (Beyond Basics) — methodology has no exception for foundational content
- Only 1 worked example across 13 skills — thin evidence of operational use
- Methodology scores 1.35 by own rubric = HUMAN_REVIEW, not APPROVE

## Build Stress-Test Findings

Key findings from building against the collection (full: `journal/2026-02-27/build-stress-test.md`):
- Observation masking is the killer pattern: 5x token savings (7.3k vs 43k tokens for 13-skill analysis)
- Skill catalog costs 4% of 25k budget; 2 loaded skills cost 18%; practical max is 2-3 loaded skills
- Architectural reduction worked: 3 tools cover all agent needs (from initial 5-7 design)
- Skills helped most during DESIGN, less during IMPLEMENTATION (expected for architecture skills)
- Biggest gap: no skill covers the agent loop itself (turn mgmt, tool routing, termination)
- `memory-systems` SKILL.md frontmatter broken (YAML `>` scalar) — invisible to keyword matching
- 200-line truncation in system prompt cuts 42-56% of best skills' practical content
