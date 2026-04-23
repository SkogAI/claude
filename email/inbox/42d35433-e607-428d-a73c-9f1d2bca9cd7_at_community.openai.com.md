MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 17 Oct 2025 19:17:40 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <42d35433-e607-428d-a73c-9f1d2bca9cd7@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68f29653efe6e_2b19c01bc1470898"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2025-10-10 19:08:29 UTC

77 New Topics
5070 New Users


  
  ### Popular Topics

    [Chat Completions API endpoint *down/blocked* - any web browser request][2]

      On chat completions. (models/responses OK, Python RESTful/SDK OK)

My own serverless web page making API requests, the platform site Playground making API requests, multiple browsers, multiple PCs, multiple API keys including the platform site’s session key, all: 
NetworkError when attempting to fetch resource. (Firefox) 
API Error Error: Failed to fetch (Chrome) 
The same browser window that’s been continuously open now fails. 
Looks like something bad was committed to the API, such as not accepting browser patterns such as attempts at http/3 promotion. The request is getting through API key validation; that error of no auth you can see just typing the URL in a browser. 
OPTIONS https://api.openai.com/v1/chat/completions - 404 
POST https://api.openai.com/v1/chat/completions - nothing (fast close connection?) 
 ![image](https://us1.discourse-cdn.com/openai1/original/4X/8/f/9/8f94a1718bace2a7ca6cae1860da721e489d56f1.png)

    
    [Asterisk / Realtime API with SPI : Getting a "BYE" after a few seconds][3]

      Hello there! 
I’m trying to set up OpenAI with the new SIP module from my own Asterisk server. My goal is to call the AI agent and put it on a conference using CONFBRIDGE. 
I have the following set up on Asterisk: 
; -------- transport TLS client --------
[transport-tls]
type=transport
protocol=tls
bind=0.0.0.0:0

; TLS
method=tlsv1_2
verify_server=yes
allow_wildcard_certs=yes
require_client_cert=no

; Trust store (Debian/Ubuntu) :
ca_list_file=/etc/ssl/certs/ca-certificates.crt
; (RHEL/Alma/CentOS : /etc/pki/tls/certs/ca-bundle.crt)

; NAT
external_signaling_address=XXX.XXX.XXX.XXX
external_media_address=XXX.XXX.XXX.XXX
local_net=XXX.XXX.XXX.XXX
local_net=XXX.XXX.XXX.XXX

; QoS
tos=cs3
cos=3
allow_reload=yes

[openai-sip-aor]
type=aor
contact=<SIP-URI-A>:5061;transport=tls

[openai-sip]
type=endpoint
transport=transport-tls
aors=openai-sip-aor

from_domain=<SIP-DOMAIN>
from_user=anonymous

send_pai=no
send_rpid=no
trust_id_outbound=no

; Media/SDP
disallow=all
allow=ulaw,alaw
direct_m...

    
    [How to limit number of input images processed by image_generation tool via Responses API?][4]

      Hi all, 
I’m using the Responses API with the image_generation tool. My chat sometimes contains a lot of images sent by users as input (not the generated images), which makes the processing expensive. It looks like image_generation processes every image previously sent by the user every time I call it, increasing the cost. 
Is there a way to limit image_generation to only process the most recent 1-2 input images instead of all images present in the chat history? How should I structure the API calls or the user messages to achieve this? 
Thanks in advance for any hints or solutions!

    
    [Fine-tuning Safety Evaluation Error][5]

      Hi, 
I am trying to fine-tune gpt-4o mini with a custom dataset. After the model is fine-tune I get this error: Error while running moderation eval refusals_v3 for snapshot ####: Error while running eval for category hate for snapshot ###. Please try again. 
Does anyone know why this happens?

    
    [Access session user within the agent builder UI][6]

      Hey. How can we access a current user (passed to the session when it was created from ChatKit) inside the agentic workflow? Right now, we have an option to pass a user to the ChatKit session (https://platform.openai.com/docs/api-reference/chatkit/sessions/create#chatkit-sessions-create-user), but there is no way to get that value and use it inside the tool (or an MCP server). 
All existing templates (flows) in the agent builder cover simple use cases, but any suggestions on how to inject different users(can be userID or user token)?

    

  


  ### Popular Posts

    _j - [Tokens of Appreciation — milestone awards for OpenAI API token usage][7]

    Hello! 
Does it feel like: 

you should get something when using the API but don’t,
it would be there for some, but not for you,
you cannot directly request them be sent,
you cannot affect the probability OpenAI will deliver one,
reception would be symbolic recognition of partnership and trust?

What I describe, and what I award to you… 
A special token
 ![e4baf660-6baf-430b-ba1d-13439d278298](https://us1.discourse-cdn.com/openai1/optimized/4X/8/9/5/8956aa83ae306f9471bc6b732bba5d29fd4e9bec_2_500x500.jpeg) 

something you ultimately are paying for but never got.

This beautlful award, suitable for changing the color of the pixels of your graphics display, embodies a special token: stringified for you in a special escape sequence, indescribable by AI otherwise, undeliverable as customer-seen artifact. 
What is a token? It is not a fungible unit of value exchange, so we must conceptualize a better physical manifestation as an encompassing semantic unit. Enclosed in the block made of trans...
    3rd_Digital - [Chat Completions API endpoint *down/blocked* - any web browser request][8]

    Facing same issue… I dont know how but suddenly api is blocked.
    creativeflightsstudi - [The Official 4o and Dall-E image Megathread][9]

    I’ve not had a great day in ChatGPT today. I’ve been trying to get some shifts in style and it’s taken way too much to get it to do that and then it ended telling my prompt violated content policies…which was not the case. 
 ![ChatGPT Image Oct 12, 2025, 03_27_14 PM](https://us1.discourse-cdn.com/openai1/optimized/4X/3/2/2/3226d1a07a10db2ba0c8f0cbaf53bb284a652ecb_2_333x500.jpeg) 
 ![ChatGPT Image Oct 12, 2025, 03_22_13 PM (1)](https://us1.discourse-cdn.com/openai1/optimized/4X/2/6/f/26fe48b423eba1e3ef6129e1549faecbdaac37d7_2_333x500.jpeg) 
 ![ChatGPT Image Oct 12, 2025, 02_30_49 PM](https://us1.discourse-cdn.com/openai1/optimized/4X/d/c/5/dc50b3ecd09c4aab7a50a343f6cd469c7e0b7dfe_2_333x500.jpeg) 
 ![ChatGPT Image Oct 12, 2025, 01_52_46 PM](https://us1.discourse-cdn.com/openai1/optimized/4X/c/f/6/cf682e872dc91c21ec05e2c88bccd2a8d92e2f5a_2_333x500.jpeg) 
 ![ChatGPT Image Oct 12, 2025, 01_41_20 PM](https://us1.discourse-cdn.com/openai1/optimized/4X/5/d/f/5df097a41a49e8119de83e28f8963e759f5...
    _j - [Chat Completions API endpoint *down/blocked* - any web browser request][10]

    “We’re not aware of any issues affecting our systems” 


It seems that there is no automation nor human powering the status page, such as vector stores being down for days in the past (although this browser-only issue against a particular endpoint would be harder to anticipate a unit-test for).
    vb - [Chat Completions API endpoint *down/blocked* - any web browser request][11]

    Thanks for flagging this issue! 
The team at OpenAI is aware and looking into this right now.


**New for you**

* [FYI: OpenAI Guardrails SDK (Preview)][12] - 1 - [Documentation]
* [Agent Builder - While Loop, Transform and Set State an example][13] - 1 - [Community]
* [Mitigating Hallucinations in RAG - a 2025 review][14] - 8 - [Community]
* [A Question on the Apps SDK Monetization Model: Is Usage-Based Revenue Sharing a Possibility?][15] - 1 - [Community]
* [LLM as a Grammar book on steroids - And Developers role][16] - 1 - [Prompting]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/chat-completions-api-endpoint-down-blocked-any-web-browser-request/1362527
[3]: https://community.openai.com/t/asterisk-realtime-api-with-spi-getting-a-bye-after-a-few-seconds/1362442
[4]: https://community.openai.com/t/how-to-limit-number-of-input-images-processed-by-image-generation-tool-via-responses-api/1362776
[5]: https://community.openai.com/t/fine-tuning-safety-evaluation-error/1362213
[6]: https://community.openai.com/t/access-session-user-within-the-agent-builder-ui/1362274
[7]: https://community.openai.com/t/tokens-of-appreciation-milestone-awards-for-openai-api-token-usage/1361639
[8]: https://community.openai.com/t/chat-completions-api-endpoint-down-blocked-any-web-browser-request/1362527
[9]: https://community.openai.com/t/the-official-4o-and-dall-e-image-megathread/1230134
[10]: https://community.openai.com/t/chat-completions-api-endpoint-down-blocked-any-web-browser-request/1362527
[11]: https://community.openai.com/t/chat-completions-api-endpoint-down-blocked-any-web-browser-request/1362527
[12]: https://community.openai.com/t/fyi-openai-guardrails-sdk-preview/1362076
[13]: https://community.openai.com/t/agent-builder-while-loop-transform-and-set-state-an-example/1362386
[14]: https://community.openai.com/t/mitigating-hallucinations-in-rag-a-2025-review/1362063
[15]: https://community.openai.com/t/a-question-on-the-apps-sdk-monetization-model-is-usage-based-revenue-sharing-a-possibility/1362103
[16]: https://community.openai.com/t/llm-as-a-grammar-book-on-steroids-and-developers-role/1362209
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/e1ecaf8d690ee3d0c3625dc086d4382287dd9c4776625ccf9f1d4d2873d87537



