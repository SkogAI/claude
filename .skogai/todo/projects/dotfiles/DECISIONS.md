# Decisions

## Config File Philosophy: Explicit Over Minimal

**Date:** 2026-02-10

Config files should spell out all meaningful settings explicitly, including defaults. This differs from the traditional "overrides-only" approach.

**Reasoning:**

- The primary maintainer of these configs is Claude, not a human. Verbosity isn't a cost — it's complete context for every future session.
- A setting left at its default is still a conscious decision. Overrides-only configs can't distinguish "I chose to keep the default" from "I never considered this setting."
- Every line should represent a deliberate choice, with comments capturing the *why* when it's not obvious.

**Caveat:** Not always possible — some tools have too many settings or don't document defaults well. Apply where practical.
