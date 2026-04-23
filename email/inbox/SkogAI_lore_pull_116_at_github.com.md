MIME-Version: 1.0
From: "github-actions[bot]" <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Fri, 28 Nov 2025 19:28:02 -0800
Subject: [SkogAI/lore] Release 20 (PR #116)
Message-ID: <SkogAI/lore/pull/116@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692a68423efe1_e411003222ed"; charset="UTF-8"

## What&#39;s Changed
* . by @Skogix in https://github.com/SkogAI/lore/pull/99


**Full Changelog**: https://github.com/SkogAI/lore/compare/0.0.1...20
    
## Release summary


  
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/lore/pull/116

-- Commit Summary --

  * Squash merge master into develop
  * feat: update lore paths and add new lore data

-- File Changes --

    A .aider.input.history (9)
    D .dev/worktree/sharp-beacon (1)
    D .env.example (20)
    M .envrc (2)
    M .github/workflows/claude.yml (7)
    M .gitignore (11)
    M CLAUDE.md (617)
    D DEPENDENCIES.md (323)
    A MASTER_KNOWLEDGE_COMPLETE/checksums.txt (83)
    A MASTER_KNOWLEDGE_COMPLETE/duplicate-report.json (11)
    A MASTER_KNOWLEDGE_COMPLETE/find-duplicates.sh (82)
    A MASTER_KNOWLEDGE_COMPLETE/find-overlaps.sh (91)
    A MASTER_KNOWLEDGE_COMPLETE/overlap-report.md (200)
    A MASTER_KNOWLEDGE_COMPLETE/whats-next.md (90)
    D PRESERVATION.md (251)
    M README.md (17)
    A TO-DOS.md (33)
    M agents/api/agent_api.py (23)
    M agents/api/lore_api.py (4)
    M config/paths.sh (62)
    M config/test_config.sh (0)
    D context/current/context-1763096289.json (22)
    A context/current/context-1763801845.json (37)
    A context/current/context-1763802331.json (25)
    A context/current/context-1763802337.json (27)
    A context/current/context-1763802339.json (23)
    A context/current/context-1763807861.json (60)
    A context/current/context-1763807871.json (60)
    A context/current/context-1763808607.json (23)
    A context/current/context-1763811579.json (23)
    A context/current/context-1763812691.json (27)
    A context/current/context-1763846623.json (50)
    D demo/content_creation_1763095258/research_output.json (50)
    A demo/lore_demo_1763846679/lore_book.json (39)
    A demo/lore_demo_1763846679/lore_entries.json (77)
    A demo/lore_demo_1763846679/persona.json (41)
    A demo/lore_demo_1763846679/persona_context.json (116)
    A demo/lore_demo_1763846679/persona_with_lore.md (22)
    M demo_tui.py (4)
    A docs/CONCEPT.md (139)
    D docs/PROJECT_STRUCTURE_ANALYSIS.md (437)
    M docs/handover.md (116)
    A docs/project/PIPELINE_PLAN.md (150)
    M docs/project/handover.md (50)
    M generate-agent-lore.py (134)
    M integration/orchestrator-flow.sh (5)
    M knowledge/INDEX.md (2)
    M knowledge/expanded/lore/books/book_1763802973_f5593f80.json (8)
    A knowledge/expanded/lore/books/book_1763812594_9ad7c317.json (33)
    A knowledge/expanded/lore/books/book_1763814117.json (47)
    A knowledge/expanded/lore/books/book_1763820180_d3dd7ae8.json (36)
    A knowledge/expanded/lore/books/book_1763820233_a357232b.json (29)
    A knowledge/expanded/lore/books/book_1763884806_139e45da.json (29)
    A knowledge/expanded/lore/books/book_1763884886_a13b9e0c.json (29)
    A knowledge/expanded/lore/books/book_1763885110_cc0cb3b1.json (29)
    A knowledge/expanded/lore/books/book_1763885202_623c7dd5.json (29)
    A knowledge/expanded/lore/books/book_1763885338_24456904.json (29)
    A knowledge/expanded/lore/books/book_1763885364_3a8c4281.json (32)
    A knowledge/expanded/lore/books/book_1763886177_37c36795.json (32)
    A knowledge/expanded/lore/books/book_1763890149_41c563ae.json (78)
    A knowledge/expanded/lore/books/book_1764308586.json (47)
    M knowledge/expanded/lore/entries/entry_1744512859.json (18)
    M knowledge/expanded/lore/entries/entry_1744512981.json (8)
    M knowledge/expanded/lore/entries/entry_1744513046.json (8)
    M knowledge/expanded/lore/entries/entry_1744513314.json (8)
    M knowledge/expanded/lore/entries/entry_1744513423.json (8)
    M knowledge/expanded/lore/entries/entry_1744513517.json (8)
    A knowledge/expanded/lore/entries/entry_1763808305_d0c215a3.json (24)
    A knowledge/expanded/lore/entries/entry_1763808306_7a771b06.json (24)
    A knowledge/expanded/lore/entries/entry_1763808306_8dfccaa8.json (24)
    A knowledge/expanded/lore/entries/entry_1763808306_abb93493.json (24)
    A knowledge/expanded/lore/entries/entry_1763812594_160d22f7.json (22)
    A knowledge/expanded/lore/entries/entry_1763814032_332373a0.json (21)
    A knowledge/expanded/lore/entries/entry_1763814061_a11607b4.json (21)
    A knowledge/expanded/lore/entries/entry_1763814134.json (25)
    A knowledge/expanded/lore/entries/entry_1763814153.json (25)
    A knowledge/expanded/lore/entries/entry_1763814171.json (25)
    A knowledge/expanded/lore/entries/entry_1763814187.json (25)
    A knowledge/expanded/lore/entries/entry_1763820193_5149a4fb.json (24)
    A knowledge/expanded/lore/entries/entry_1763820193_65de46b4.json (24)
    A knowledge/expanded/lore/entries/entry_1763820193_68a25c03.json (24)
    A knowledge/expanded/lore/entries/entry_1763820204_6997824d.json (24)
    A knowledge/expanded/lore/entries/entry_1763820204_d6ba396d.json (24)
    A knowledge/expanded/lore/entries/entry_1763820204_f82bfb42.json (24)
    A knowledge/expanded/lore/entries/entry_1763884789_f80d91d3.json (21)
    A knowledge/expanded/lore/entries/entry_1763885402_e02a0aad.json (22)
    A knowledge/expanded/lore/entries/entry_1763885432_72c61e59.json (22)
    A knowledge/expanded/lore/entries/entry_1763886221_b716db8f.json (22)
    A knowledge/expanded/lore/entries/entry_1763886259_1d092059.json (22)
    A knowledge/expanded/lore/entries/entry_1763890184_6c04e65a.json (28)
    A knowledge/expanded/lore/entries/entry_1763890184_785a7ef1.json (28)
    A knowledge/expanded/lore/entries/entry_1763890184_8c9d5fe8.json (27)
    A knowledge/expanded/lore/entries/entry_1763890184_937f767b.json (28)
    A knowledge/expanded/lore/entries/entry_1763890184_ba1dd319.json (28)
    A knowledge/expanded/lore/entries/entry_1763890184_e79fa1e8.json (28)
    A knowledge/expanded/lore/entries/entry_1763890184_e96faec7.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_1405c1a1.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_5a7e606b.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_628f47bc.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_644063d6.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_8433f0d6.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_90d84d3a.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_9de48ba7.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_a39b27de.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_a9f3c916.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_b78eb5c2.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_f98b74c5.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_fa689c6d.json (27)
    A knowledge/expanded/lore/entries/entry_1763890225_feeb8e42.json (27)
    A knowledge/expanded/lore/entries/entry_1763890226_bb7bfda3.json (27)
    A knowledge/expanded/lore/entries/entry_1763890255_64ecfe1f.json (28)
    A knowledge/expanded/lore/entries/entry_1763890255_7699677b.json (27)
    A knowledge/expanded/lore/entries/entry_1763890255_7c787481.json (27)
    A knowledge/expanded/lore/entries/entry_1763890255_d5c6b32b.json (27)
    A knowledge/expanded/lore/entries/entry_1763890255_feb49e22.json (30)
    A knowledge/expanded/lore/entries/entry_1763890286_5a931874.json (27)
    A knowledge/expanded/lore/entries/entry_1763890286_6c07adb7.json (27)
    A knowledge/expanded/lore/entries/entry_1763890286_ab6bbfd7.json (28)
    A knowledge/expanded/lore/entries/entry_1763890286_bda3dd9c.json (28)
    A knowledge/expanded/lore/entries/entry_1763890286_d2b8464d.json (28)
    A knowledge/expanded/lore/entries/entry_1763890286_e12f8630.json (28)
    A knowledge/expanded/lore/entries/entry_1763890286_ea00ae69.json (28)
    A knowledge/expanded/lore/entries/entry_1763890287_4be563c2.json (27)
    A knowledge/expanded/lore/entries/entry_1763890287_5307a46a.json (27)
    A knowledge/expanded/lore/entries/entry_1763890287_b8a594c1.json (27)
    A knowledge/expanded/lore/entries/entry_1763890287_db8c0e94.json (28)
    A knowledge/expanded/lore/entries/entry_1763890315_41e9850e.json (27)
    A knowledge/expanded/lore/entries/entry_1763890315_72875069.json (27)
    A knowledge/expanded/lore/entries/entry_1763890315_a2e188b1.json (27)
    A knowledge/expanded/lore/entries/entry_1763890315_b7dca611.json (27)
    A knowledge/expanded/lore/entries/entry_1763890315_d1698e4c.json (27)
    A knowledge/expanded/lore/entries/entry_1763890315_d4ec227d.json (27)
    A knowledge/expanded/lore/entries/entry_1763890339_0a2bfe87.json (27)
    A knowledge/expanded/lore/entries/entry_1763890339_20c61f74.json (27)
    A knowledge/expanded/lore/entries/entry_1763890339_25bd7c22.json (27)
    A knowledge/expanded/lore/entries/entry_1763890339_697113a4.json (27)
    A knowledge/expanded/lore/entries/entry_1763890339_e0f4bdf2.json (27)
    A knowledge/expanded/lore/entries/entry_1764308586.json (27)
    A knowledge/expanded/personas/persona_1763812641.json (41)
    R knowledge/expanded/personas/persona_1763812681.json (6)
    A knowledge/expanded/personas/persona_1763820091.json (55)
    A knowledge/expanded/personas/persona_1763884800.json (41)
    A knowledge/expanded/personas/persona_1764308005.json (41)
    M node_modules/.pnpm-workspace-state-v1.json (2)
    M orchestrator/orchestrator.py (174)
    A package-lock.json (1367)
    A showcase.md (146)
    A tools/llama-lore-creator.py (303)
    M tools/llama-lore-creator.sh (113)
    A tools/llama-lore-integrator.py (521)
    M tools/llama-lore-integrator.sh (234)
    A whats-next.md (156)

-- Patch Links --

https://github.com/SkogAI/lore/pull/116.patch
https://github.com/SkogAI/lore/pull/116.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/116
You are receiving this because you were mentioned.

Message ID: &lt;SkogAI/lore/pull/116@github.com&gt;
