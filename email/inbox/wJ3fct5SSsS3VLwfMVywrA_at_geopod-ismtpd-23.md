MIME-Version: 1.0
From: OpenAI Dev Digest <noreply@email.openai.com>
To: emil.skogsund@gmail.com
Date: Tue, 11 Mar 2025 21:58:20 +0000
Subject: New tools for building agents
Message-ID: <wJ3fct5SSsS3VLwfMVywrA@geopod-ismtpd-23>
Content-Type: multipart/alternative; boundary="7264b10d2cb874acd620f67ee101f145f1cc9e38ff5ce18e8b1f9682cabb"

Responses API, web search, file search, computer use, and agents SDK

Today, we released ( https://x.com/OpenAIDevs/status/1899531225468969240 ) our first set of tools to help you accelerate building agents. These building blocks will help you design and scale the complex orchestration logic required to build agents and enable agents to interact with tools to make them truly useful.

-----------------------------
Introducing the Responses API
-----------------------------

The *Responses API* ( https://platform.openai.com/docs/api-reference/responses ) ** is a new API primitive that combines the best of both the Chat Completions and Assistants APIs. It’s simpler to use, and includes built-in tools provided by OpenAI that execute tool calls and add results automatically to the conversation context. As model capabilities continue to evolve, we believe the Responses API will provide a more flexible foundation for developers building agentic applications.

-----------------------------------------
New tools to help you build useful agents
-----------------------------------------

*Web search* ( https://platform.openai.com/docs/guides/tools-web-search ) delivers accurate and clearly-cited answers from the web. Using the same tool as search in ChatGPT, it’s great at conversation and follow-up questions—and you can integrate it with just a few lines of code. Web Search is available in the Responses API as a tool for the `gpt-4o` and `gpt-4o-mini` models, and can be paired with other tools. In the Chat Completions API, web search is available as a separate model, called `gpt-4o-search-preview` and `gpt-4o-mini-search-preview`. Available to all developers in preview.

*File search* ( https://platform.openai.com/docs/guides/tools-file-search ) is an easy-to-use retrieval tool that delivers fast, accurate search results with a few lines of code. It supports multiple file types, reranking, attribute filtering, and query rewriting. File Search is available in the Responses API, plus continues to be available via the Assistants API.

*Computer use* ( https://platform.openai.com/docs/guides/tools-computer-use ) is the fastest way to build computer-using agents with CUA, the same model that powers Operator in ChatGPT. You can use this tool to control computers or virtual machines that you operate. You simply pass screenshots to the tool, and it responds with an action you should take like click, scroll, or type. The model is available for select developers in a research preview in the Responses API.

*Agents SDK* ( https://platform.openai.com/docs/guides/agents ) is an orchestration framework that abstracts the complexity involved in designing and scaling agents. It includes built-in observability tooling that allows developers to log, visualize, and analyze agent performance to identify issues and areas of improvement. Inspired by Swarm, the Agents SDK is also open source and supports both other model and tracing providers.

--------------------------------------------
Free tokens by helping improve OpenAI models
--------------------------------------------

Eligible developers can also help us improve our models by sharing prompts, completions, and traces with us. If your organization is eligible for the offer, we’ll provide free usage of traffic shared with OpenAI, through the end of April—up to 1 million tokens per day across gpt-4.5-preview, gpt-4o, and o1, and up to 10 million tokens per day across gpt-4o-mini, o1-mini, and o3-mini. *Check your dashboard* ( https://platform.openai.com/settings/organization/data-controls/sharing ) to see if you’re eligible.

( https://community.openai.com/ )

Dev Forum

( https://twitter.com/OpenAIDevs )

Twitter

( https://www.youtube.com/@OpenAI?themeRefresh=1 )

YouTube

Unsubscribe ( http://url3243.email.openai.com/asm/unsubscribe/?user_id=20216706&data=R7WODXRH84iN7uEQg5EptuZD-Fjh8dI8pjvmTuvmNvRoMDAwdTAwMPdFQIJhGNugNKS1dyV1QmdAtPKzmI21xaCLytmMLMAeohJEWBuAeHaLwNyiH_6bHsx9BUtNJ9RwBrHoUIe31EKsmPQhFckhblULZVMxPSM6DbN5Ksksx7We9tgVQRieSjv1ITGYRSTPrqmKmc1y_pIr9GgAMl-p_7hJb05l9yT55wq51Vs9-rzrf3GMa9ibqPMBBxvM0he9s7-3aKp66cIZNp1LLhE8XE4rTxWVeaq3W14DyyR4sgytj7VJprLyx6FEFIfpX_YmtaysPAKUp-oeTXu1L5-bn2X5Lk9J63Ntxsy8bDyYWvrg8cPcD8eykBjvJuOiLQtwFCiJTkn0_4BhVaCV6jtBCXNLzkNnmZUrOaRJrbkByMJ5kGarC82b4G9AzQIUX6lZ49xtFj3r8dEH97oZ6cRanIy7PRWX0Vv1ghXBfZe4QlHaiDf1U4Cs_nvMt_CZeocojcIpkk5ZslolXB72FuGe55Gyj4tZiWv44uFMssJwPy9i82vbNULDnFL8G_SeSaB2ujRcW8d2pKM6pxR7VPBV2lA4VixY0W5yXjJOf6mmLFnrPEf2EoFYnVVnX-2RVotldQ1WiE5y-ZBxuoigBltSKbtSxnHMUKlvYwf5sHOw6OCquCKMMUtgWd0D_viQE9OAIHBv6LWN4WZX57YpKgarDWv2C4SfuUtEp7aFlCO3QfruUV1JiYgS1UbkBsKwh5QTlQLSaAvKnT_TanxPdhf_e-jHjxNESj9gVB6kIeU6ptf_VqHMVRDW_CNaAmMVQOb-WlzU3engxCXKghP8r0j2vrG9YKBoy9Szbd1ZWRUB-JePKAoGM4ijVucGlX4j5k9d2WsLQnPuZjtquOyqMKloGDMfdtKzHzCF8SOU5ZqBiSi-Bw4qo8XMqIb_0kfGAE5I_v5xQ7ldB5c7q8ko8jwko6fDtL_vsaauIQqT4rHK2vSwgDMWTb4N8E0MqEK0sllwauXDBVkO3-h6swe3B0pWEufNSo0ptxDD86GfqpYJJfKIKfPK-oU1OqUnE227cUXsfvzkfIkI0Mf5HfUBostACh1SBxLXEuLt )