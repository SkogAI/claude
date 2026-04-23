MIME-Version: 1.0
From: OpenAI Dev Digest <noreply@email.openai.com>
To: emil.skogsund@gmail.com
Date: Thu, 17 Apr 2025 01:34:30 +0000
Subject: Our most powerful reasoning models, GPT-4.1, Codex CLI, and new audio models
Message-ID: <kwEsg_CdTG-GZ5FsDUlk7A@geopod-ismtpd-39>
Content-Type: multipart/alternative; boundary="b230bd20f0bdf7626826d757d2334d4421f9e1b12a8b0da5c0dd1e42fe84"

We recently announced a slew of new models and features for developers—our latest reasoning models, the GPT-4.1 family, and new audio models.

We recently announced a slew of new models and features for developers—our latest reasoning models, the GPT-4.1 family, and new audio models. We’re excited to see what you do with them—from coding to voice experiences to powering faster, more capable agentic apps. Here’s the download:

----------------------------------
Our most powerful reasoning models
----------------------------------

*o3 and o4-mini* ( https://platform.openai.com/docs/models/compare?model=o3 ) are now available in the API. o3 achieves leading performance on coding, math, science, and vision—it tops the SWE-Bench Verified leaderboard with a score of 69.1%, making it the best model for agentic coding tasks. o4-mini is our faster, cost-efficient reasoning model.

While they’re available in both the Chat Completions and Responses APIs, for the richest experience, we recommend the Responses API. It supports *reasoning summaries* ( https://platform.openai.com/docs/guides/reasoning?api-mode=responses#reasoning-summaries ) —the model’s thoughts stream while you wait for the final response—and enables smarter tool use by preserving the model’s prior reasoning between calls.

o4-mini is available to developers on tiers 1–5, and o3 is available to developers on tiers 4–5. Developers on tiers 1–3 can gain access to o3 by *verifying their organizations* ( https://help.openai.com/en/articles/10910291-api-organization-verification ). Reasoning summaries and streaming also require verification.

For these models, we’re introducing *Flex processing* ( https://platform.openai.com/docs/guides/flex-processing ) —significantly cheaper per-token prices for longer response times and lower availability. Flex processing helps you optimize costs even further when using these models on non-urgent workloads such as background agents, evals, or data pipelines.

-------------------------------
Developer-first models: GPT-4.1
-------------------------------

We launched *GPT-4.1* ( https://platform.openai.com/docs/models/gpt-4.1 ) , *GPT-4.1 mini* ( https://platform.openai.com/docs/models/gpt-4.1-mini ) , and *GPT-4.1 nano* ( https://platform.openai.com/docs/models/gpt-4.1-nano ) in the API, trained for developer use-cases related to coding, instruction following, and function calling. They also have larger context windows—supporting up to 1 million tokens of context—and are able to better use that context with improved long-context comprehension.

---------
Codex CLI
---------

Meet *Codex CLI* ( https://github.com/openai/codex ) —an open-source local coding agent that turns natural language into working code. Tell Codex CLI what to build, fix, or explain, then watch it bring your ideas to life. Codex CLI works with all OpenAI models, including o3, o4-mini, and GPT–4.1. Watch the demo ( https://www.youtube.com/watch?v=FUq9qRwrDrI ).

---------
Evals API
---------

With our new *Evals API* ( https://platform.openai.com/docs/guides/evals ) , you can now programmatically define tests, automate evaluation runs, and quickly iterate on prompts.

-------------------------------------------------
A new suite of audio models to power voice agents
-------------------------------------------------

We introduced *three new state-of-the-art audio models* ( https://platform.openai.com/docs/guides/audio ) in the API—two speech-to-text models, outperforming Whisper, and a new TTS model that you can instruct on how to speak. We’ve also updated the *Agents SDK* ( https://platform.openai.com/docs/guides/voice-agents ) to support audio.

------------------
Customer spotlight
------------------

*In this video* ( https://x.com/OpenAIDevs/status/1910079596420333872 ) , see how Lemonade uses the Realtime API to power AI Maya, a friendly and engaging voice agent. The Realtime API's automatic voice detection and low latency enable Lemonade to offer 24/7 multilingual phone support.

--------------------------------------------
Free tokens by helping improve OpenAI models
--------------------------------------------

Eligible developers can also help us improve our models by sharing prompts, completions, and traces with us. If your organization is eligible for the offer, we’ll provide free usage of traffic shared with OpenAI, through the end of April. *Check your dashboard to see if you’re eligible* ( https://platform.openai.com/settings/organization/data-controls/sharing ).

-------------------
Developer resources
-------------------

* OpenAI.fm, our TTS demo, is now open source ( https://github.com/openai/openai-fm )
* Voice Agents SDK sample app ( https://github.com/openai/openai-voice-agent-sdk-sample )
* Starter app ( https://github.com/openai/openai-responses-starter-app ) to build with the OpenAI Responses API
* Computer Using Agent sample app ( https://github.com/openai/openai-cua-sample-app )
* Customer Support Agent with Human in the Loop demo ( https://github.com/openai/openai-support-agent-demo )

( https://community.openai.com/ )

Dev Forum

( https://twitter.com/OpenAIDevs )

Twitter

( https://www.youtube.com/@OpenAI?themeRefresh=1 )

YouTube

Unsubscribe ( http://url3243.email.openai.com/asm/unsubscribe/?user_id=20216706&data=xaq8CdjWLzdqZ0lhWTYbIzd_jXTn5FpKl_1o0HKJ37BoMDAwdTAwMCp44aSJ7fcApFNPUHnXJDB-1B7RkimFvz1C_1ev5AowDP9xHTu4g9SY-YGqAvM2-2Tta-APIlEXZ18Txgo-TUKzrmeT5p_T0htctVcvBXQGK1L2UznOs7owjIlaNjUP7b-6uB93dFVDtTtg73snpt5-NJuk3m6ELHTRUdVjqIyyKSVetp-yRAYmcv3ad8g3HR5gAxZTSM6TchIj5gCWi-NmPk-hn8n5ZUOQ12WaNDSxo4MOuz-x_enazkqD8fRPBOnQJzMbYQGO4B4iX9HtuBI12dB9gmBpUxqxlwF_9IfpZhrS1OC6TTxZwS8SHCb7xHYb-6XbYx5wnptzgvi2mMEaTo-bryQb_LNyAQUzj85wm1i8AI9_wf1PBqnUG4X28acLEGCBsVbOgHAvPOiR1oP3VLkdF9Eg1YjacQnMQyQ5i0VT2VsLfydaOR05Zed2lylrz-JZTZIFAaM8pHKunI4lf4OhdhhsR0FcMzBX0bpbOIQa-e4EPn5t8U0gDNBku_gihkg7mw2W26JzGXgUZWtxPST1PTlu1vjBPnQiqHFyohvzJogzPQnmJGeK06W78EsTUfo3e8zLSl0lFN5Jf__OSRDBxsNjZyhJnEBTtH8-8hM7v2SnpF2JsU7-2McEEOdLdrl1D-0Q5tQbTpzXjJsFdhNLeSgs0wVCsFGfxbU8OMtDGoN8lfV2E4V3peOjthp4ANWKKnLLZDEuYjiZPfDQbVXNlbhbneqlSVMbcLxwDCs4xVU_Z0K6bAWd2rS1WH-qEGnl05npaiYmCMpVsv-cpqvkxZ9gu7jCuOXXKo51TIRbaCAudlhjeeSF7VkGOsijLzP8o7RMsKzWT32CNRXhOEfhIzqAxtU1aaznrfDFeSuZNGCdpwQcwbo1txwLXCojv0tQJh37XCp6LSgtb6lmbboE2ZRBm51f6PijTghaMpn3yETS5kfoELLxVoDyHLKCM2J37su45UUlpkcEfy52Nt0LAP16xJCIkKhF4WM6X2yHKilL4OLU9np4oZGyVZf7cjaRvw_d8siBRgjIPZOHMy1fOCzR6yjuyYb2OlbR )