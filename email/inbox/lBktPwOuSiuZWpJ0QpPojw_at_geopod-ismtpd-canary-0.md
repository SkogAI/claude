Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:abd4:b0:ab7:3ba4:7d71 with SMTP id kq20csp360352ejb;
        Mon, 3 Feb 2025 09:32:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtRZr1CdPQ02FuK8ZSg060KzHFULslTphWk47rsDQcx/m9m7OoK9EgjDMuntMoO1EGUSlH
X-Received: by 2002:a05:6a00:3e06:b0:728:eb62:a132 with SMTP id d2e1a72fcca58-72fd0c679d9mr32914378b3a.15.1738603936643;
        Mon, 03 Feb 2025 09:32:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738603936; cv=none;
        d=google.com; s=arc-20240605;
        b=F5lrkBJlGophG1/Qs5v6YtrzvU6V4t1PXuHXCGqvjjOgnLEY/WVlL8Z1GuKyqXo5oa
         5yycLZmqaC8IBo6gSzfcheDZ54ZqPrFriBiY5OOx6sumXOrctO5HIlgkQuVqyf3fUbNd
         lSr8ViIP/qTd7odqaB65F5IXYV4OnCQykyKkBOf1Bf67PB0tdc06a+5ni9K7PluKTpcQ
         1nO8EY1aYBeSTWV7ssHChSbGcjTfi3dTxErpINQK2I4RmzVIibSOWq8BX6DQOwJ0FXi3
         /5FLKPQPHeQAY42kUm8CbnmA0eMJRN0Xelbg7QuR/3Q75gTzp8fsNfti9xUnwLx2HkIz
         NJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=MrKceNcW50pE5tgvZJV1hMtYucWVc3fQiVR/HUlts/I=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=P3wgYIQY8PLddMmaQeTBf3b/mgn8ekOHJip841HUiqS8qhMPnwrr8EV7AS5PvnzrSd
         iG4b5MG4q+McvtWsA0TQHIm/hLzF5EFqbA65w675CCJOOCcff2XrVgCQjDD9x/+lKjKr
         tTQAKGYKLszw8DRMZCDzLbfT4zHdwO624f+TqT4/5CCdzvgp/OEcU2E3Xoyh8btJforV
         hwhIvAgLYvTYw+bVrPBIVMr9Wa4axdbZ07CjH2w38K+9p6OQG1pPAJAnBLir6BUWhkoT
         mFRVVQ9Y5u0LRv1IdckbZsb4LUC/52tHgqNg+4bt006PcpoCO4wl8PMtKKPEr4BgsV9p
         q0vA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=lr809J3z;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=z6UjFbnE;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.106 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsx.outbound-mail.sendgrid.net (s.wfbtzhsx.outbound-mail.sendgrid.net. [159.183.224.106])
        by mx.google.com with ESMTPS id d2e1a72fcca58-72fe69069a3si12648440b3a.153.2025.02.03.09.32.15
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 09:32:16 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.106 as permitted sender) client-ip=159.183.224.106;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=lr809J3z;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=z6UjFbnE;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.106 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=MrKceNcW50pE5tgvZJV1hMtYucWVc3fQiVR/HUlts/I=;
	b=lr809J3z3xSTTr3LS9ZJmGisT7XLAkx9dFZCf5W0eqV4ix+CvCSrTKSqz0H89VXkKBfq
	c0ObMV7cp+E/ZJxPDN/01NQSIpjn+vOS805CoQAcQ1g4ue1QG3gZqdbdRt2FNVT0XqYihw
	0gyJv/holQXP6tvLG8fhtUhlbgLMau0s2AIOgMeUaaHCBf9SdeGwEX0fFXqYHO4yAbzPqi
	+C1+lDK12vBFN0W18+oIjZlxCEnqcAEkJJLUF5gwdUkLRnXNFc+0AeaK4vz/IK/ZsyYkCE
	TZYT2GpN/ZotpT0OwPmJYHDwPqX4Ud4IyJIlW/3zx5TRzO3TbcDJxHh2mk/mo9Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=MrKceNcW50pE5tgvZJV1hMtYucWVc3fQiVR/HUlts/I=;
	b=z6UjFbnE6vekzWuRtLcP5IYJoAD3lgYXixTCMipJ/VYXmkRCZ/EMDsjd8zfOZgIJQ1Tp
	uckbJY55I9cG76b8dbtm+uGPgTMJyoRMSTbD4jA8ZJhqXQbnDXmGZTfLuL0x2zRwv/0cup
	ZvYaOa5UkYFQXdtKSzPzKgroeqd3wLv6M=
Received: by recvd-5f54b5d587-9l68f with SMTP id recvd-5f54b5d587-9l68f-1-67A0FD9D-7
	2025-02-03 17:32:13.093778174 +0000 UTC m=+6984589.206700234
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-canary-0 (SG)
	with HTTP
	id lBktPwOuSiuZWpJ0QpPojw
	Mon, 03 Feb 2025 17:32:13.017 +0000 (UTC)
Content-Type: multipart/alternative; boundary=c01aaf45bcdb6cc1adad82a814516cbe64267aa2720e52e0756b7469bfe4
Date: Mon, 03 Feb 2025 17:32:13 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <lBktPwOuSiuZWpJ0QpPojw@geopod-ismtpd-canary-0>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4tXXCHf=2FIgwNRM2?=
 =?us-ascii?Q?lLfnXUXGvxAvoZObLbuoyNu6Di1HzcF+y3jP4Mz?=
 =?us-ascii?Q?PSlMweMKklI39j8S8NMZ7IogtpgY=2FcVwe4w51Tg?=
 =?us-ascii?Q?WgNuugPsLR3LH4FIK8W1bNiZ75UDmdORp0CVeHy?=
 =?us-ascii?Q?FPdk4Tti1LquEkWV6KqSi=2F79Oqgd+rxY2zvAGgj?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: tw7ZKp3eAAHx

--c01aaf45bcdb6cc1adad82a814516cbe64267aa2720e52e0756b7469bfe4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Eden Ahbez: The Strangest Hit Songwriter
A fascinating article about Eden Ahbez, the composer of the hit song "Natur=
e Boy" made famous by Nat King Cole in 1948. Ahbez was a unique character w=
ho lived an alternative lifestyle decades before the hippie movement, often=
 sleeping outdoors and surviving on $3 per week. He was found living under =
the Hollywood Sign when Capitol Records needed his permission to record the=
 song.
Key Discussion Points:
Many readers discovered that the song was featured prominently in Baz Luhrm=
ann's "Moulin Rouge!"
Interesting discussion about the song's musical composition, with some noti=
ng its unusual chord progression
Historical context about possible inspiration from a Yiddish theater song "=
Shvayg, mayn harts"
2. Making Local LLM Voice Assistant Faster with RAG
A technical article about optimizing a local LLM-based voice assistant usin=
g RAG (Retrieval Augmented Generation). The author describes how they impro=
ved the system's performance by reducing context length and implementing sm=
art retrieval of relevant information.
Key Discussion Points:
Discussion about the Llama 3 70B model mentioned in the article
Technical suggestions about pre-computing responses for common services
Observations about the LLM's response style and personality
3. Face of Ancient Australian 'Giga-Goose' Revealed
Scientists have discovered a well-preserved skull of Genyornis newtoni, a m=
assive flightless bird that lived in ancient Australia. Standing over two m=
eters tall and weighing up to 240 kilograms, this "giga-goose" went extinct=
 shortly after humans arrived on the continent.
Key Discussion Points:
Debate about the role of climate change versus human activity in the specie=
s' extinction
Discussion about how the species survived multiple climate changes but disa=
ppeared shortly after human arrival
Interesting observations about the term "giga-goose" and its recent emergen=
ce in scientific literature
This email has been sent by Toolhouse. To change your delivery preferences,=
 please visit https://app.toolhouse.ai/settings
--c01aaf45bcdb6cc1adad82a814516cbe64267aa2720e52e0756b7469bfe4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<!DOCTYPE html>
<html>
<body style=3D"font-family: Arial, sans-serif; max-width: 800px; margin: 0 =
auto; padding: 20px;">
    <h1 style=3D"color: #ff6600;">Hacker News Digest</h1>
   =20
    <div style=3D"margin-bottom: 30px;">
        <h2 style=3D"color: #333;">1. Eden Ahbez: The Strangest Hit Songwri=
ter</h2>
        <p>A fascinating article about Eden Ahbez, the composer of the hit =
song "Nature Boy" made famous by Nat King Cole in 1948. Ahbez was a unique =
character who lived an alternative lifestyle decades before the hippie move=
ment, often sleeping outdoors and surviving on $3 per week. He was found li=
ving under the Hollywood Sign when Capitol Records needed his permission to=
 record the song.</p>
        <p><strong>Key Discussion Points:</strong></p>
        <ul>
            <li>Many readers discovered that the song was featured prominen=
tly in Baz Luhrmann's "Moulin Rouge!"</li>
            <li>Interesting discussion about the song's musical composition=
, with some noting its unusual chord progression</li>
            <li>Historical context about possible inspiration from a Yiddis=
h theater song "Shvayg, mayn harts"</li>
        </ul>
    </div>

    <div style=3D"margin-bottom: 30px;">
        <h2 style=3D"color: #333;">2. Making Local LLM Voice Assistant Fast=
er with RAG</h2>
        <p>A technical article about optimizing a local LLM-based voice ass=
istant using RAG (Retrieval Augmented Generation). The author describes how=
 they improved the system's performance by reducing context length and impl=
ementing smart retrieval of relevant information.</p>
        <p><strong>Key Discussion Points:</strong></p>
        <ul>
            <li>Discussion about the Llama 3 70B model mentioned in the art=
icle</li>
            <li>Technical suggestions about pre-computing responses for com=
mon services</li>
            <li>Observations about the LLM's response style and personality=
</li>
        </ul>
    </div>

    <div style=3D"margin-bottom: 30px;">
        <h2 style=3D"color: #333;">3. Face of Ancient Australian 'Giga-Goos=
e' Revealed</h2>
        <p>Scientists have discovered a well-preserved skull of Genyornis n=
ewtoni, a massive flightless bird that lived in ancient Australia. Standing=
 over two meters tall and weighing up to 240 kilograms, this "giga-goose" w=
ent extinct shortly after humans arrived on the continent.</p>
        <p><strong>Key Discussion Points:</strong></p>
        <ul>
            <li>Debate about the role of climate change versus human activi=
ty in the species' extinction</li>
            <li>Discussion about how the species survived multiple climate =
changes but disappeared shortly after human arrival</li>
            <li>Interesting observations about the term "giga-goose" and it=
s recent emergence in scientific literature</li>
        </ul>
    </div>

    <hr style=3D"margin: 30px 0;">
    <footer style=3D"color: #666; font-size: 0.9em;">
        <p>This email has been sent by Toolhouse. To change your delivery p=
references, please visit <a href=3D"http://url1228.toolhouseai.com/ls/click=
?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2=
BcmQdjMswGJjo_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAolqLPlCeW4FYn0Ie=
k-2FPYdczYssCGzEM-2FjECZJUuvp4vzBhbBEHqfh5tYnoGpC-2BAapHhGe1tEckuF-2FASU7CE=
rjt262x1LiXGd6TlCcJ4GsqC5vaA0w48XsZiScukll-2B-2BQNfvswjJDOWWdwub-2F-2BGbXgr=
icSgd4-2FXV2T4lPFuCnEVQ-3D-3D">https://app.toolhouse.ai/settings</a></p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GKmqPbm1uMZjIPB651H9q18URdimh6Jma5h5flAR9CeBz=
yKTEfiwXrFYO7Uw3VgPl7VFEEGibLBynnAeRJt2zTu0Ct8PyEKpjG40s1huGzibFPmduBxUVPzx=
YzyV5sk81pnTOeJ6mtiWfQ8LckoJzE8vC85xifvX9-2FhlB7-2B7TT53oM1FjcR0AI5amAxuNdj=
nWk-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px =
!important;width:1px !important;border-width:0 !important;margin-top:0 !imp=
ortant;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !=
important;padding-top:0 !important;padding-bottom:0 !important;padding-righ=
t:0 !important;padding-left:0 !important;"/></body>
</html>
--c01aaf45bcdb6cc1adad82a814516cbe64267aa2720e52e0756b7469bfe4--
