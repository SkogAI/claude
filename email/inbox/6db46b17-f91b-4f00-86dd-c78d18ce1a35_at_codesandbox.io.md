MIME-Version: 1.0
From: CodeSandbox <hello@codesandbox.io>
To: emil@skogsund.se
Date: Wed, 18 Mar 2026 11:39:54 -0000
Subject: Deprecation notice: CodeSandbox CI, Repos, and Sandpack — timeline and migration guide
Message-ID: <6db46b17-f91b-4f00-86dd-c78d18ce1a35@codesandbox.io>
Content-Type: multipart/alternative; boundary="==e10446dad87fbec036e0f21955021801"

******************
CodeSandbox Update
******************

******************
Deprecation Notice
******************

Hi ,

We want to share an update about CodeSandbox — what's changing, what's not, and what comes next.

TL;DR: What you need to know
----------------------------

* Sandpack: No longer actively maintained. Repo stays public.
* CodeSandbox CI: Shutting down on April 15, 2026. Migrate to an alternative CI provider before then.
* CodeSandbox Repos: New repository imports disabled April 15, 2026. Full shutdown on July 15, 2026. Migration guide to GitHub Codespaces
included below.
* Browser sandboxes and Devboxes: No changes. These remain live and supported.

Questions? Reach out to support@codesandbox.io.

A note on our journey
---------------------

When we started CodeSandbox, the browser sandbox was a simple idea: instant, shareable code — no setup, no friction. Millions of you showed up,
and we grew into something far beyond what we'd imagined.

Over time, we pushed the concept further. From simple fiddles to full prototypes. From sharing snippets to running CI against npm packages,
building out component systems, and collaborating on real product work — all in the browser.

We set out to recreate that instant UX in the cloud, for full repositories. Using Firecracker microVMs, we built CodeSandbox Repos — real cloud
development environments that spun up just as instantly as a browser sandbox. It was one of the hardest technical problems we solved, and we're proud of it. But the shift to
cloud-based development didn't accelerate the way the industry expected, and we found ourselves with powerful infrastructure waiting for the right moment.

That moment turned out to be AI. Together.ai ( https://click.email.codesandbox.io/click?ZTJDbbptAFEX5lpHSpxDNDMPNkqUajG_E2I6TVu0LmssxxcEMhsGmqfrvVdJUzdORtnT21loJnMrqc_esi66v1V0HVvwLndAIeUowTxDfPoRE2OyAsR14StnSDxQJJBDuuOgWSTQiTsAIDW6RQSNKXJ-6zPfZLeoJGjGHuuS39fQP0ugCzA9o73hp7eHEyyqXWkHHayX0kJc6z9LpJlony2Szmi-SON1MF7M0Wc_T6Xq2mKfR-5p1fyHW-aOFC7T6I-Bb-1sgdW2gNuPX2-r3jJ8aXhb1WEHTguSm1PUNxX2juIH_9jK4dhUYA-2n1_68VGOGuXPgMsQCQjgw7rmUM-IJhrGgnIWUBkHoYPX3Qer6Ms5-mhjwaqPwsPt-5Zdh8hz0W8d52EcPYfOkJuS8n2Qv0WyrhlxlojkWk2y3XC2i42A8OVzlcrV_dDtBX-b6qyJJXIWP5NuXoj-296za2VreOFOr4OK8jYs_AwA2nb784a79e ) recognized that what we'd built — fast, isolated, programmable
environments — was exactly the primitive needed for a world where AI agents write, run, and iterate on code at scale. Joining Together gave us both a home and a sharper mission.

What's changing
---------------

Sandpack

Sandpack is no longer actively maintained. The repository will remain public and available, but there will be no further feature development or
official support. We're proud of what Sandpack became in the ecosystem and hope the community continues to build on it.

CodeSandbox CI — Action required

CodeSandbox CI will be shut down on April 15, 2026.

If you're currently using CI in your workflow, please begin migrating to an alternative CI provider before that date.

CodeSandbox Repos — Action required

New repository imports will be disabled starting April 15, 2026. Full support for repositories will end on July 15, 2026.

We've prepared a step-by-step migration guide ( https://click.email.codesandbox.io/click?ZTJDbbtpMFIX9LCPlv8JhZjw2NhLSz8Ecg4GQtGpv0Bw21hDbY-wxuKn67lVoqnK1pSWtpW9_MeQ6-79-M2ndFOqxBmf8E-WojwIlWCBIzz1GRLjsiLEbBkq5shcqEkog3PNRB0nUJ17ICA07yKI-JX6P-qzXYx3UENRnHvXJL-f175PSKKh5oYRpH7XpKiPrbga8KroVlKbW1lQa6m6u04pbbQo3bbQCZw8519nhrn3Q5pCsJpvROl7Em-VsHo9Xm8l8uorXs9VkPZ3PVqNPMOfpQpzzvbALVObexW39FkhTWCjs4ONW5jPjecl1WgwUlBXIG9cDxU2puIV_ohO41hlYC9V_H_sHrQYMc-_IZYQFRHBkPPApZyQQDGNBOYsoDcPIw-pPQZriMkh-2DHg5Ubhdvf9yi_t8C1stp73vB89R-WrGpLzfpi8j6Zb1R5UIspTOkx2i-V8dGptINurXCz3L34t6PvMfFUkHmfRC_n2JW1O1RPLdq6RD97ESbk4b8fp7wEAfrb12b626c ) to help you move to GitHub Codespaces with as little
friction as possible. Please reach out to support@codesandbox.io if you need help with migration.

What's not changing
-------------------

We have no plans to deprecate browser sandboxes or Devboxes. Those remain live and supported.

What's next
-----------

We want to share something that genuinely excites us: the infrastructure we spent years building for CodeSandbox turns out to be a near-perfect
primitive for the AI era. Fast, isolated, programmable environments — it's exactly what's needed when AI agents are writing, running, and iterating on code at scale.

At Together.ai ( https://click.email.codesandbox.io/click?ZTJDbbptAFEX5lpHSpxDNDMPNkqUajG_E2I6TVu0LmssxxcEMhsGmqfrvVdJUzdORtnT21loJnMrqc_esi66v1V0HVvwLndAIeUowTxDfPoRE2OyAsR14StnSDxQJJBDuuOgWSTQiTsAIDW6RQSNKXJ-6zPfZLeoJGjGHuuS39fQP0ugCzA9o73hp7eHEyyqXWkHHayX0kJc6z9LpJlony2Szmi-SON1MF7M0Wc_T6Xq2mKfR-5p1fyHW-aOFC7T6I-Bb-1sgdW2gNuPX2-r3jJ8aXhb1WEHTguSm1PUNxX2juIH_9jK4dhUYA-2n1_68VGOGuXPgMsQCQjgw7rmUM-IJhrGgnIWUBkHoYPX3Qer6Ms5-mhjwaqPwsPt-5Zdh8hz0W8d52EcPYfOkJuS8n2Qv0WyrhlxlojkWk2y3XC2i42A8OVzlcrV_dDtBX-b6qyJJXIWP5NuXoj-296za2VreOFOr4OK8jYs_AwA2nb784a79e ), we're now focused on helping startups and companies harness sandboxing technology to build
AI-native products and development stacks. The work wasn't wasted — it was, in a sense, ahead of its time.

Thank you for being part of the CodeSandbox story. We mean that genuinely. The community, the feedback, the projects you built and shared — all of
it shaped something we're proud of, and something that continues to matter in a new form.

More to come.

With gratitude,

The CodeSandbox team (now part of Together.ai ( https://click.email.codesandbox.io/click?ZTJDbbptAFEX5lpHSpxDNDMPNkqUajG_E2I6TVu0LmssxxcEMhsGmqfrvVdJUzdORtnT21loJnMrqc_esi66v1V0HVvwLndAIeUowTxDfPoRE2OyAsR14StnSDxQJJBDuuOgWSTQiTsAIDW6RQSNKXJ-6zPfZLeoJGjGHuuS39fQP0ugCzA9o73hp7eHEyyqXWkHHayX0kJc6z9LpJlony2Szmi-SON1MF7M0Wc_T6Xq2mKfR-5p1fyHW-aOFC7T6I-Bb-1sgdW2gNuPX2-r3jJ8aXhb1WEHTguSm1PUNxX2juIH_9jK4dhUYA-2n1_68VGOGuXPgMsQCQjgw7rmUM-IJhrGgnIWUBkHoYPX3Qer6Ms5-mhjwaqPwsPt-5Zdh8hz0W8d52EcPYfOkJuS8n2Qv0WyrhlxlojkWk2y3XC2i42A8OVzlcrV_dDtBX-b6qyJJXIWP5NuXoj-296za2VreOFOr4OK8jYs_AwA2nb784a79e ))

https://click.email.codesandbox.io/click?ZNM_dToMwFADgPsu5Bt2BQitXZtCBVsTEeE36N9I41mg7NTG-uyHRJ_jyCbf60218DUu8nO1VdKT9hhUaqK2mtUaWH29Q5_S42-W8tjY3jFvkxqEqK8jAQIMlp1jwDBI0BVasqChjNIMLQkPLosIf8vKf3F7p06fk3rfXNXl2q_Kn2QTrojpbHb5mH-ZH2U37UdyJ6b4fRCunbjhIMfayGw9DL_d_JHn4QLIo_fbULr8DAAch48f5af06 ( https://click.email.codesandbox.io/click?ZTJBdj5pAFIb5LZNsr6SdGQYYTEwqiF-sqOtum_aGzJcEFxmEQek2_e-NW5v16iRPct5znjdWx6L82r7qvO0q-blVVvQbHMEQeJITjyPf3geI22QPoU09KW3hU4moUIg5LhgAAYbIoQRhOgAGDDFyfewS3ycD0CEwJA520R_r5b-kuRTGqObq9EVoqVpWSa57a6eOrCizO5QVOkuTyTpcxYt4vZzN4yhZT-bTJF7NkslqOp8l4e2y9XhG1um-kbNq9L3se_o7ELoyqjKj62z0jbFjzYq8GklVN0owU-jqAcOulsyojyZTdWlLdX3_0zU_K-SIQObsmQggV4HaE-a5mBHkcQIhx4wEGFMaOFD-WxC6Oo_SXyZScLmWsN_-vLBzP36l3cZxnnbhU1C_yDE67cbpWzjdyD6TKa8P-TjdLpbz8NAbT_QXsVjunt2W47eZ_i5RHJXBM_rxLe8OzSMpt7YWD87Eyhk_baL87wAcv9ad11cb0 )

https://click.email.codesandbox.io/click?ZNM_dSsMwFADgPMu5bmWnTZuYK1mbtRprBfG65G8xuC5IVhHEd5eBPsHHJ_0aT3f5PYW8nd1N9qT7hhUEtM7Q1iArj7doSnrc7UreOldaxh1y61HXDRRgQWDNKVa8gAuIChtWNZQxWsCGIGhdNfhDXv-T11eIl7fNXFvkxa86nhabnM_67Ez6WmJanlQ_7yd5L-eHYZSdmvvxoOQ0qH46jIPa_4Hk8RNJ0ObjuQu_AwA6r1c8e1c5e ( https://click.email.codesandbox.io/click?ZTJBbj9owEIXzWyxtn0hrO84NCakkhFuWAMtuq_Yl8o00bLBD4kC6Vf97xZaqPM3ojObofCeRx7L63L7qou2U-NhKK_4FjmAIPMGIx5Bv70PEbLKH0A48IWzuBwIFXCLquGAAOBgiJyAIBwNgwBAj18cu8X0yAB0CQ-JgF_22Xv5BFqX50bEr0ieuhWypEkz397vNq1IqY-3kkZZVfnfJS51n6WQdrZJFsl7O5kmcrifzaZqsZulkNZ3P0uiWxXo8I-t039FZNvoe_939XeBaGanM6DobfdPosaZloUZC1o3k1JRaPWDY1YIa-b_bTF7aShojmw9X_7wUIwKps6c8hEyGck-o52JKkMcIhAxTEmIcBKEDxd8HrtV5lP00sYTLtYD99vuFnvvxa9BtHOdpFz2F9YsYo9NunL1F043oc5Gx-lCMs-1iOY8OvfF4f-GL5e7ZbRl-m-mvAiVxFT6jb1-K7tA8kmpra_7gTKyCstMmLv4MAAbm0e1a31c7 )

https://click.email.codesandbox.io/click?ZNM9hS4QwGADg_Zb3s8a9Ot3yU5zutJYZRJ_F-e5knG7Eugii_x5C9wseHmU3tz7ES1ji1dNdtKz-gQ0qKMnw0qBIz_doUn4-HFJZEqWzkIRytjjlBSQwQ4W55JjJBD6hyrAQWcGF4AlcESqeZwX-svdbcn-tzl8sOb_H2JvdJreOcyAbJ08mfI8ujC-6GY69elTDU9upWg9Nd9Kqb3XTn7pWH_9J9vyFbJnMx2u9_A0Abn8753856b ( https://click.email.codesandbox.io/click?ZTJDZbtpAGIX9LCOlV7iZGY83JKRiYzYHAyFp1d5Ys2EZ7BnjBZxUffeKlCpc_dIn_UfnO5Es8-Jbc9RZ0ynxtZFG-BuUYAgcwYjDkGvufcRMsofQ9BwhTO56AnlcImrZYAA4GCLLIwh7A9CCIUa2i23iumQAOgSGxMI2-mO8_pe8ehW5OkqRq6vYI9dlRdXbI9dCNlQJpntjJ0uaF-kdSnOdJvFkHayiRbRezuZRGK8n82kcrWbxZDWdz-LgVsN4OiPjdD_PWdb63vwj_QNwrVqp2tH11vrGaFnRPFMjIatactrmWj1g2FWCtvJz1kRemkK2ray_XPPTXIwIpNaech8y6cs9oY6NKUEOIxAyTImPsef5FhT_HrhW51Hy1oYSLtcC9ttfF3rux0ev21jW8y549qtXMUan3Th5D6Yb0aciYdUhGyfbxXIeHPrW4f2FL5a7F7th-H2mfwgUhYX_gn5-z7pD_USKran5gzUxMspOmzD7OwAeg8f668028 )

( https://click.email.codesandbox.io/click?ZTJDbbptAEIZ5lpXSK1PtLsvJkqUajE_E2I6TVu0N2pMRDrAYFpuk6rtXpK7iq5H-0fyj74tkmRff2leVtV0lvrbSCH-DEoyBIxhxGHLNo4-YSY4Qmp4jhMldTyCPS0QtG4wAB2NkeQRhbwQ0GGNku9gmrktGoENgTCxsoz_Gy3_IgYsrIVtaCab6ga3sqly_GQdZ0rxI75ZprtIknm2DTbSKtuvFMgrj7Ww5j6PNIp5t5stFHNx-G48XZJzvnVxko-5xP9o_Aq4qLSs9GWajbhkta5pn1UTIupGc6lxVDxh2taBafrpM5LUtpNay-TL0p7mYEEitI-U-ZNKXR0IdG1OCHEYgZJgSH2PP8y0o_h1wVV0myZsOJVxvBez3v6700k9fvW5nWU-H4MmvX8QUnQ_T5D2Y70SfioTVp2ya7FfrZXDqtcP7K1-tD892y_D7Qv0QKAoL_xn9_J51p-aRFHtT8QdrZmSUnXdh9ncAbvb6a9ccd6 )

Copyright © 2026 CodeSandbox BV.

Unsubscribe ( https://click.email.codesandbox.io/click?ZTNHPbptAEAZwnmWl9mQSZln-WbJaxxC7ptiR0irqCQ3sQHEMi9mFxK367pWtVM1ppO8wmt83CbXN8bN-VrUeO3mjyVr9Zi2bM18Wwi8gsKsICltUjmOHvpR2GYQSwpIAXY_NWMnm4IYCeDhjhs05eAH3RBCIGRuBzYXLPfhjff-HxL6_qclMNKiL63bs9FjocmgKuu3Ui_VILTbHvFSSNHayUK95o_JdGu_vsuRLst-uN8kq3ceb-zTJ1mmc3W_W6d3bBdbXCazTJ4kGF7R9PQj82Rp7-_BLh-YxOw-HLMrOT9_8KUvT4byCU1zncXjYOU8_pmfvgMtlfD4tYUdSlBRUToUBd7iMOKDrR-hHbiQCLquPEw4NmkZ1eSMX4EEI3H_f84X3vusr6hqUqjPUmcVlDuotw7bHpu4WkvqByuviD9wZe4mG_j9yRy_6SMbQYNVYnB5W9d8BAA3r0439aefe )
