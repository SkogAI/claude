MIME-Version: 1.0
From: OpenAI <noreply@email.openai.com>
To: emil.skogsund@gmail.com
Date: Thu, 08 Aug 2024 22:42:40 +0000
Subject: OpenAI Dev Digest: DevDay, Structured Outputs, GPT-4o mini fine-tuning, and more
Message-ID: <keM_R9BfRPW0Gz8KBnIsZw@geopod-ismtpd-35>
Content-Type: multipart/alternative; boundary="c95b35acfbb9341c8834c4d45e38ebdbf160628e77429fe9331534f2ee6b"

Developer updates & resources

**********
Highlights
**********

-----------------------------------------
Join us at OpenAI DevDay around the globe
-----------------------------------------

This year, we’re taking DevDay on the road! Apply to attend ( https://openai.com/devday/ ) IRL in San Francisco, London, or Singapore. We’ll have hands-on sessions, demos and workshops covering everything from model customization to multimodal applications and more. Meet our engineers and hear from developers around the world about how they're building with OpenAI—we'll be selecting a handful of developers to feature onstage at the events!

------------------------------------------------------------------------------
*Generate model outputs that follow your JSON Schemas with Structured Outputs*
------------------------------------------------------------------------------

We just released Structured Outputs ( https://openai.com/index/introducing-structured-outputs-in-the-api/ ) , a new feature designed to ensure model-generated outputs will exactly match JSON Schemas that you provide. You can start using Structured Outputs in two forms in the API: through function calling and through the response_format parameter (with a new json_schema option). To get started, check out our docs ( https://platform.openai.com/docs/guides/structured-outputs ).

------------------------------------------
Save costs with our newest GPT-4o snapshot
------------------------------------------

The latest GPT-4o snapshot gpt-4o-2024-08-06 ( https://platform.openai.com/docs/models/gpt-4o ) is 50% cheaper for input tokens and 33% cheaper for output tokens than the original GPT-4o. It also supports Structured Outputs.

---------------------------------------------------------------------------
*Access GPT-4o mini in the API—and fine-tune for free through September 23*
---------------------------------------------------------------------------

GPT-4o mini ( https://platform.openai.com/docs/models/gpt-4o-mini ) is our most advanced small model, and our cheapest model yet (60% cheaper than GPT-3.5 Turbo and more intelligent, but just as fast). We have just extended access to fine-tuning for GPT-4o mini to all paid customers on API usage tiers ( https://platform.openai.com/docs/guides/rate-limits/usage-tiers ) 1-5. Now through September 23, fine-tuning is free (up to 2 million training tokens per day).

**************
Recent updates
**************

We've launched several features since our last Dev Digest. Below are just a few:

----------------------------------------
Try out text-to-speech in the Playground
----------------------------------------

Building with the text-to-speech API is even easier with the new TTS Playground ( https://platform.openai.com/playground/tts ). You can quickly generate audio by entering a message and selecting from one of six preset voices.

----------------------------------------
*Use function calling in the Playground*
----------------------------------------

With function calling, you can describe functions and have the model intelligently output a JSON object containing arguments to call one or many of your functions. And now you can quickly define and test functions within the Playground ( https://platform.openai.com/playground/chat?models=gpt-4o ).

-------------------------------------------------------------
*Manage your API organization with Admin and Audit Logs APIs*

-------------------------------------------------------------

Use the new Admin API ( https://platform.openai.com/docs/api-reference/administration ) to manage invites, users, projects, and service accounts programmatically, and our new Audit Logs API ( https://platform.openai.com/docs/api-reference/audit-logs ) helps you keep track of logins and changes to your organization.

-------------------------------
*Get started with the .NET SDK*
-------------------------------

Together with Microsoft, we've released the OpenAI .NET SDK (currently in beta). This SDK allows you to easily integrate OpenAI's models into your .NET applications. To get started, find the SDK on GitHub ( http://url3243.email.openai.com/ls/click?upn=u001.IQLfsj4kk-2BK7JhymNusRMo1Gk6HnuRhxrPuVmtIiLlL6HHmIKsRH7dBHdZ8ObCDGMD02V82FWVxP3HnRZp1TDQ-3D-3Dh09U_LZzZlHIzN91qDqTgFUU9g6fs4drXGsNeZVqF7g4rZFigRxKcR91VOSdvT1bZkCEuJC554m40IU-2FNdjt-2FiI-2BZx8pMmdZIrt3jTciabiQ3mk6ai9VgaXtkxIqmfLY-2B6VgcOr65iS9cpr7OQabfljMOrnY3YiTSSmDFEyCrhMD8rjrQ-2B5c-2FNffa6Rc0HtYa8HesXqZGo8zp-2BUcg6ZPyunea-2F0bBIcQCURlhXAszHibBfhqoqUrohj-2BwO1Tb3Znr5fvpNcwDsGDXhcoMeolehF072Usht8z1OPrcBC-2BreXJbxH6hZGrYDzWLEPWBx6IcPWjr2NzbNqO0lJuiO-2BpMDQwtBnoWE2dz1IACPVT-2BbOSeg0DckYsYDBW-2BepsVOyiM0svW5Eolh9YjbYjeTAhDO3nZfMBlPsC3N6FIde0p5oTtKkcJOMmRxdlzP3Ha5Vf4cDXVhox1RhjQMqvFNwxKTtpMo4Id9HHLD9OugO5p9inrH-2F-2BKOIbKAE5lRPvkVwWvq11CQcFnLTMKxRAHmzhCRkMQHCUQ5A0CR4b89wAPDnIbMmasJeGbWzwpG29HdGrENjS6HgHoWCaeSFQ3Yn1m8iDMsYI-2Fw-2Bo8KV1FEV5GCMVlMacnCtLJrlAOzBN6qVqn3lFv-2Fm1ZiEIuXyqgGTpYt4FihrCjs-2BupJiPzHhdPHl2Adjw-3D ) and view our docs ( http://url3243.email.openai.com/ls/click?upn=u001.IQLfsj4kk-2BK7JhymNusRMkuuWNTB2xtKMTOzsaHXXCxOZkka7vRslgaFwKVQeqfahFD9YJSxe531aZDoZQQmspM75Lh-2Fg2hOBBLt4xBl2i4-3Drs_E_LZzZlHIzN91qDqTgFUU9g6fs4drXGsNeZVqF7g4rZFigRxKcR91VOSdvT1bZkCEuJC554m40IU-2FNdjt-2FiI-2BZx8pMmdZIrt3jTciabiQ3mk6ai9VgaXtkxIqmfLY-2B6VgcOr65iS9cpr7OQabfljMOrnY3YiTSSmDFEyCrhMD8rjrQ-2B5c-2FNffa6Rc0HtYa8HesXqZGo8zp-2BUcg6ZPyunea-2F0bBIcQCURlhXAszHibBfhqoqUrohj-2BwO1Tb3Znr5fvpNcwDsGDXhcoMeolehF072Usht8z1OPrcBC-2BreXJbxH6hZGrYDzWLEPWBx6IcPWjr2NzbNqO0lJuiO-2BpMDQwtBnoWE2dz1IACPVT-2BbOSeg0DckYsYDBW-2BepsVOyiM0svW5Eolh9YjbYjeTAhDO3nZfMBlPsC3N6FIde0p5oTtKkcJOMmRxdlzP3Ha5Vf4cDXVhox1RhjQMqvFNwxKTtpMo4Id9HHLD9OugO5p9inrH-2F-2BKOIbKAE5lRPvkVwWvq11CscJbWsqLgBcck6Y1IJ9W1yPKIbGopII73-2BpMiPkMvKbCjhN-2FCs1soGsW4mDCmKrj4XzljSaNDp6LmsAaljSayG-2BulJ447zrE0atNo1fG-2F6TT8JlJtjs2zYYpoLaiPqUDen8GXW9kFCvYhu0bVqKjB8YL8CVrUyqtZcKvmAq1ei4-3D ) , or check out the Microsoft community post ( https://techcommunity.microsoft.com/t5/ai-azure-ai-services-blog/azure-openai-service-expands-net-sdk-support/ba-p/4162940 ) for details.

*******************
Developer resources
*******************

We’ve recently updated our docs page ( https://platform.openai.com/docs/ ) and are regularly adding guides, sample apps, and cookbooks to help you get started and build on the OpenAI platform. Here are a few resources:

* Train, evaluate, and deploy ( https://cookbook.openai.com/examples/how_to_finetune_chat_models ) a fine-tuned GPT-4o mini model.
* Call functions ( https://github.com/openai/openai-cookbook/blob/main/examples/How_to_call_functions_with_chat_models.ipynb ) with the Chat Completions API.
* Increase reliability ( https://cookbook.openai.com/examples/developing_hallucination_guardrails ) with hallucination guardrails.
* Enforce tool use ( https://cookbook.openai.com/examples/using_tool_required_for_customer_service ) with a customer service example.
* Generate synthetic data ( https://cookbook.openai.com/examples/sdg1 ) for training and fine-tuning models.
* Use CLIP (Contrastive Language–Image Pre-training) embeddings ( https://cookbook.openai.com/examples/custom_image_embedding_search ) with multimodal RAG.
* Extract and transform ( https://cookbook.openai.com/examples/data_extraction_transformation ) unstructured data with GPT-4o.

We’re busy cooking up more features for you for the next Digest. In the meantime, if you have any questions, suggestions, or feedback, please join us in the forum ( https://community.openai.com/ ).
*
* Happy building!
— The OpenAI team

( https://community.openai.com/ )

Dev Forum

( https://twitter.com/OpenAIDevs )

X

( https://www.youtube.com/@OpenAI?themeRefresh=1 )

YouTube

Unsubscribe ( http://url3243.email.openai.com/asm/unsubscribe/?user_id=20216706&data=u8lfWLolk8RweqTphplBexiSIgyA25mqmxOm1_ii9kJoMDAwdTAwMGazRvrG466a87jYnJaNGKJeX9os8fECXeEpD-43Het3x3qoupXMVLOgwfCgfcm1mEZK-euIi_1P5o7JV8sfl0wIv6v6EzQPxTh6lvJNiX7m4fZ7o3u9B6jcgxVl3mpghyEpUA6pBjJkFjZbO_vfcrrTCsIgFiCYo2dbl5H-zNNNWQvNRDRJgBFD3aypk38KePutEvWxNJdYbEWHdYdhz48rC5xBwjU-uGxX7Ps5-eMYtUCWLobOyHRS-QrAif4N16aRo7MUe2Qnb00TMcDBWc-IjcANAnRP5NvMB23sf3lceCcbpH8zkc8uZGub2X2xW1V4yRJNmhMgoHNkzMXBrZ7c2k6pnRYsmhbHU-7qR9_45mip-rV6Dm0_3OG6Rgr4cF3Cu04iNG20WQx1tVFlFa_R3DGXrSqHQPUJ81DjwFTiwL7dzYBTZI284LWsrKUCNh9gALA6G50XK4wPwr-rYxW3yLsolG43TmGdr-yIGRDHK0NESmSKmBuWRunz6_xswIrNW4jtgge9zHPvJ6Ljd7oOQoJONzodQIqrj0XmmTCGri3KbBXvSD4jCJsEpwNzXNFLDhT8p-Fq8UPrMaeyC-WFKG8Zpiujc1v-SNS3dy4pIvLoginSPYhFm4eGKU7Uv3_Ve25kICJhQOIG3FwIGwTsRrFwZYRVTTNfQxKEclGfFV4vj2ckhWPlosjHEKqNuLuAlDwKAjsFZsFJaeYbySiC1qmzxg3QhbBdonxokvFZm2g_EaJh42al6vTGxshLUeaLumU7YE-GACBDadXmGxebb83xsX2V1ZfCKjXo_swQtVdZIs5SpR-bEfdwzOwSJbZcRQMEqX5L2SzehewgaSKbFCV-oJuQLiCVGvjzOtcO_Wp5x1AYGT3X4zHrlp26sZEr_5y6S4CA8fa7cZcePOYXKHOR_rJPrr-uUo4uniNgBy96pgd7BX623-Fl7ISoLBUHW2zfHpBUCfp5b6XAmYQx3TePe7dA2u2SGTF-LCaCmvZqG4vVINQvseLb-xje4B8PWExHpvrc-0i5CNDah7RhKAAR_nKLLNG-ddPCxVv16EFu3OtD2Dj3T1i20Cz1k_HHcC2pOe_9bpGGG7PHTOG8DvNemdAIowMWFKg5YjQNfgiKc1huMPk9RApDyLs_H5eGJEzt338_kz2Fcp1DFlY= )