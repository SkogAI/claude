Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:5a72:b0:ab2:c2e3:f765 with SMTP id my50csp195391ejc;
        Thu, 30 Jan 2025 09:33:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGy7CVr3nrG4fT+V5lHVqRoINlyuO7lw/Lq98ffDAZO44qEdGi082gUjBgu7dkp3aCdG+NM
X-Received: by 2002:a17:903:24d:b0:21d:cd0c:a1ac with SMTP id d9443c01a7336-21dd7c624e0mr119350905ad.17.1738258406039;
        Thu, 30 Jan 2025 09:33:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738258406; cv=none;
        d=google.com; s=arc-20240605;
        b=QJXOYZrOEkcG5kkdxtLAaRJ+kB2AA00uPYxE9IJqDkXwF/v+yiwg/UbLhyje1SIY69
         crx89XxZ3zs99Mor5t6D/ijXUs2em/kfjept0Zgb+wI4ayFJTZTH2uI5kXbOfJIox7Zg
         vBKS9ajGUccGu00HHJ7g9+i83uypjUOj+dzrAJF9+fQv67IkHz5QnhJeiAnRbLprsDe1
         y98+FCOtKJ0agBMqNHNRmKHJCuJP9ZZU1C+JhzeCVd95XB53OSnw53huEl3OwP45VteR
         idCpXqxcb+pKK5HiI/qOd0zl0Oj1VofHr5PE7KmKIMvna7qNyE4JV95Os58jEONndOzy
         86uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=c4pqBZ3NrzhMa8IE9uduOppUZA0vwBqrG5U7bsvbJSE=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Wv8lJCfipwQr3NbA/gf7J+6U6hAbazJxkn/qw8fpWeJL9xlgZiWybP7BZGVfcd7suW
         ZnK52i5b2AHIKi0aDl6aLjmq2MqsRP3ZMlJ/smgnZl0zSRuYS2pYnkHqW7Z8tDyZuFCk
         f6DJGzSprpJP+3QkDYqcTCUb9ak57kL9ndc3QmM+GNFUHC14DqpDrsnB68rk4yQ6GCxU
         JN3arnmM6xn2hxdSW+DG6qisCaWvHsHVunF0g6XGLrZSO95ByUitH9oMAeG+cuULdhU9
         v+u2dfrGA5ZNL8WaUJhpouTK04nl00lB2AlSISYVdk8hv3mCugAVXY5ICyLXv9NBoyFx
         lGVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=bf5fhJw7;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=UMa0O8G9;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.106 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsx.outbound-mail.sendgrid.net (s.wfbtzhsx.outbound-mail.sendgrid.net. [159.183.224.106])
        by mx.google.com with ESMTPS id d9443c01a7336-21de5e507e3si14335155ad.144.2025.01.30.09.33.24
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:33:25 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.106 as permitted sender) client-ip=159.183.224.106;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=bf5fhJw7;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=UMa0O8G9;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.106 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=c4pqBZ3NrzhMa8IE9uduOppUZA0vwBqrG5U7bsvbJSE=;
	b=bf5fhJw7HzEojLNrCZjjubIXehDjVKxFVBUYTBW6OeYiEo4rzZIW/r18VUp431gNZmnZ
	tkH+YmcmBTZjaWph7FypUx5cyPVlWiUka7nYCBPnz4FkAVkA7YC8gVks6AXwhZy5ymlpBa
	ZFB7AFnNIJru2KBwcsI5b3SgyayE//fgoOihp20YOwU79bFs51DCc/GUbe8bIUXK+t3QhV
	+ixuyRXwPRKYMFFvzsIDnraxjwxTCU8q//1R+PiR03RmpPTTffN9hq4xEWPGFBEQ4jWwq5
	h09aFTDJePAGzERzK0micokOP/WTrqks1hT6rJ+QTMy/CBZY4GIIVL1rdcdd2S4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=c4pqBZ3NrzhMa8IE9uduOppUZA0vwBqrG5U7bsvbJSE=;
	b=UMa0O8G9aa+BvAVqI2PQ/wAg3Cn/xWzn8SKF1lYRt4Pt6dyIm0iF3uyhjn9y/dhnn+iN
	cOmIsbaU1cp9pFqkaahVe9NqBPkMuutMMhEA4F/NohXx0IWx+7BrgTN9cIBUMJeB2DCqCT
	JjbAES8BIe4lzoL49yoEmVeGjGHwktAqE=
Received: by recvd-84b546689d-7r6pp with SMTP id recvd-84b546689d-7r6pp-1-679BB7E2-18
	2025-01-30 17:33:22.679816212 +0000 UTC m=+6639099.696434564
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-19 (SG) with HTTP
	id qjYegW-nSVOm3FXOLpu6XA
	Thu, 30 Jan 2025 17:33:22.607 +0000 (UTC)
Content-Type: multipart/alternative; boundary=36c4fc4423063f6edbed2ce71b1ad7182215d50a95b1987f0e548e3552b2
Date: Thu, 30 Jan 2025 17:33:22 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <qjYegW-nSVOm3FXOLpu6XA@geopod-ismtpd-19>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4Y+qMMn3UTL5hia?=
 =?us-ascii?Q?W59bloerTxG6clto31dItvpMIUHReVP52zF9uGt?=
 =?us-ascii?Q?My1netvcwaevAZdMk4VlvwqGVenISxTIV7ZPnWQ?=
 =?us-ascii?Q?Xi+y8E7KdzTzP8U56Qm9wQn5A28rkGfgtpxcU2O?=
 =?us-ascii?Q?oH=2FnlWCLy63J3OnKdPS4BD39tJjUl9mjlbcV5vc?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 7eD+LTh3wcfF

--36c4fc4423063f6edbed2ce71b1ad7182215d50a95b1987f0e548e3552b2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Eden Ahbez: The Strangest Hit Songwriter
Summary: A fascinating article about Eden Ahbez, the composer of the 1948 h=
it "Nature Boy" performed by Nat King Cole. Ahbez was an eccentric figure w=
ho lived an unconventional lifestyle, sleeping outdoors and following a nat=
ural diet decades before the hippie movement. The article details how he de=
livered his song to Cole, his brief success, and his lasting influence on m=
usic culture.
Key Discussion Points:
Many readers recognized the song from Baz Luhrmann's "Moulin Rouge!" adapta=
tion
Interesting discussion about the song's musical composition, including its =
unique chord progression
Historical context about possible plagiarism claims, with mentions of simil=
arities to a Yiddish theater song
Appreciation for Ted Gioia's writing style and music analysis
2. Making my local LLM voice assistant faster and more scalable with RAG
Summary: A technical article detailing improvements to a local LLM-powered =
voice assistant using RAG (Retrieval Augmented Generation). The author desc=
ribes how they optimized their system by reducing context length and implem=
enting smart retrieval of relevant information, resulting in faster respons=
e times and better scalability.
Key Discussion Points:
Technical discussion about the Llama 3 70B model implementation
Debate about the assistant's response style and personality
Suggestions for potential optimizations and pre-computing common responses
Interest in the practical implementation of local AI assistants
3. Face of ancient Australian 'giga-goose' revealed after fossil skull foun=
d
Summary: Scientists have discovered a well-preserved skull of Genyornis new=
toni, a massive flightless bird that lived in ancient Australia. Standing o=
ver two meters tall and weighing up to 240 kg, this "giga-goose" went extin=
ct shortly after humans arrived in Australia, around 45,000 years ago.
Key Discussion Points:
Extensive debate about the role of humans versus climate change in the spec=
ies' extinction
Discussion about the timing of human arrival in Australia and population si=
zes
Interest in the species' relationship to modern birds and its unique adapta=
tions
Speculation about what the bird might have tasted like, given its apparent =
popularity as food
This email has been sent by Toolhouse. To change your delivery preferences,=
 please visit https://app.toolhouse.ai/settings
--36c4fc4423063f6edbed2ce71b1ad7182215d50a95b1987f0e548e3552b2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<!DOCTYPE html>
<html>
<body style=3D"font-family: Arial, sans-serif; max-width: 800px; margin: 0 =
auto; padding: 20px;">
    <h1 style=3D"color: #ff6600;">Hacker News Digest</h1>
   =20
    <div style=3D"margin-bottom: 40px;">
        <h2>1. Eden Ahbez: The Strangest Hit Songwriter</h2>
        <p><strong>Summary:</strong> A fascinating article about Eden Ahbez=
, the composer of the 1948 hit "Nature Boy" performed by Nat King Cole. Ahb=
ez was an eccentric figure who lived an unconventional lifestyle, sleeping =
outdoors and following a natural diet decades before the hippie movement. T=
he article details how he delivered his song to Cole, his brief success, an=
d his lasting influence on music culture.</p>
       =20
        <p><strong>Key Discussion Points:</strong></p>
        <ul>
            <li>Many readers recognized the song from Baz Luhrmann's "Mouli=
n Rouge!" adaptation</li>
            <li>Interesting discussion about the song's musical composition=
, including its unique chord progression</li>
            <li>Historical context about possible plagiarism claims, with m=
entions of similarities to a Yiddish theater song</li>
            <li>Appreciation for Ted Gioia's writing style and music analys=
is</li>
        </ul>
    </div>

    <div style=3D"margin-bottom: 40px;">
        <h2>2. Making my local LLM voice assistant faster and more scalable=
 with RAG</h2>
        <p><strong>Summary:</strong> A technical article detailing improvem=
ents to a local LLM-powered voice assistant using RAG (Retrieval Augmented =
Generation). The author describes how they optimized their system by reduci=
ng context length and implementing smart retrieval of relevant information,=
 resulting in faster response times and better scalability.</p>
       =20
        <p><strong>Key Discussion Points:</strong></p>
        <ul>
            <li>Technical discussion about the Llama 3 70B model implementa=
tion</li>
            <li>Debate about the assistant's response style and personality=
</li>
            <li>Suggestions for potential optimizations and pre-computing c=
ommon responses</li>
            <li>Interest in the practical implementation of local AI assist=
ants</li>
        </ul>
    </div>

    <div style=3D"margin-bottom: 40px;">
        <h2>3. Face of ancient Australian 'giga-goose' revealed after fossi=
l skull found</h2>
        <p><strong>Summary:</strong> Scientists have discovered a well-pres=
erved skull of Genyornis newtoni, a massive flightless bird that lived in a=
ncient Australia. Standing over two meters tall and weighing up to 240 kg, =
this "giga-goose" went extinct shortly after humans arrived in Australia, a=
round 45,000 years ago.</p>
       =20
        <p><strong>Key Discussion Points:</strong></p>
        <ul>
            <li>Extensive debate about the role of humans versus climate ch=
ange in the species' extinction</li>
            <li>Discussion about the timing of human arrival in Australia a=
nd population sizes</li>
            <li>Interest in the species' relationship to modern birds and i=
ts unique adaptations</li>
            <li>Speculation about what the bird might have tasted like, giv=
en its apparent popularity as food</li>
        </ul>
    </div>

    <hr style=3D"margin: 40px 0;">
    <footer style=3D"font-size: 12px; color: #666;">
        <p>This email has been sent by Toolhouse. To change your delivery p=
references, please visit <a href=3D"http://url1228.toolhouseai.com/ls/click=
?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2=
BcmQdjMsw355w_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmCn-2Fp3O6idGxYY3b=
oaoXQN7L9YVmmIv1NkE4LTF8WKK-2FJib8K1J58V9bm3aUbUYXk3f7W-2FfAnURjQsYvvAvG1Z6=
wXtVfa1NRKhHkFpSK-2FGWyCA7BgYYTbtDaN-2FV5kZCSiCmcmTMBzug1I2iCUqmvFVo6xrCEbQ=
fPeCi6rrE9QPPfg-3D-3D">https://app.toolhouse.ai/settings</a></p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GJXDfSP1SMmvIsYMuqPykaBB0F25Czq5MYR0QsK2wpOIH=
XI6x6NsApMHYFfYkGuNZK6PxZyPHVyRDfZRj4X-2B3OguhLFGHwMPkj8Ri1Ty-2Fd6Dxmq0mNPB=
cmGnCs7W69gh222IKuPONz-2FdRDs87B4F3H9IAaG3IOTrdmZw1USSkT5yYnf7cXRADbhi1N3RC=
q6qFU-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1p=
x !important;width:1px !important;border-width:0 !important;margin-top:0 !i=
mportant;margin-bottom:0 !important;margin-right:0 !important;margin-left:0=
 !important;padding-top:0 !important;padding-bottom:0 !important;padding-ri=
ght:0 !important;padding-left:0 !important;"/></body>
</html>
--36c4fc4423063f6edbed2ce71b1ad7182215d50a95b1987f0e548e3552b2--
