Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:abd4:b0:ab7:3ba4:7d71 with SMTP id kq20csp360354ejb;
        Mon, 3 Feb 2025 09:32:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6+GPMSV8tnGbMdrMgqo0x5J+vz9TKZwjuye7jkH7p3N/p0AHjgOOjOEE2LOlGpeyh3VPK
X-Received: by 2002:a05:6a00:a25:b0:727:99a8:cd31 with SMTP id d2e1a72fcca58-72fd0c148ffmr30838874b3a.14.1738603936719;
        Mon, 03 Feb 2025 09:32:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738603936; cv=none;
        d=google.com; s=arc-20240605;
        b=QEk+SMvbAOGZwIiQ9Gr1blAJz/yCYxHMCYQVlnZT2iWVTOEzqBN0N/pxoM2k+nZTow
         fsvn/6P32x/ZexzGrbb4yEGIuFWCYDNgYboF1CmJUxQn3ewrLmBzvGBtVRNoQEa+cym4
         D1B1TVnW8ZnyJAWtaPh8UfExRnNQPCXAstTQaG8xg6fiKZdye9j3QggfOJpNwFrEZYPi
         4epdIH56RlcWlBee3hNWLEo2OrdshN3EQesJ+E2BpK1UZmkqusvjJlXZ8bcRlJGL4FlZ
         /3OlD8AiI5JNmrtJK6DhOIwNc6cE918BQIl1livFz70Pa1s77pGQbgsWluXWuKWl/qrn
         0bQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=O4eLWfSiOuxpXSsDO3JZd8jQQq4svkfqGnEiplM+9gg=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=NJICgCzalSY0O9X6m19JYqmkfQ6YTcjxqmw7wsaoLAGI3VFAiJdXqx6yBBEdx7ahGQ
         ywo3LNlX09joNtzLhx/2XawWO4ccuiPYpLaojdCOEO/fxVAmVilN8Ayq7o6Go0A0BC64
         TWX76K/ts5VRaWkUzXkCDoR0mpoBFZiPolCZ3oYg9G7/cKub3HiGZLHlUGn5GZcunzXO
         ptKy2cUR41IkeB9LEgMLPtv7BCqCRAGNTlXWyDjZGzrDnNV4cB6r/pMe+3U794J9lh6H
         WcUVBRtmQFEwrdp/tRrAfqELkC1oIFw2G5iOlGt0mYddtiulF1ImqfhDX8pAs6ia6nrw
         +5pQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="cK59iu/d";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=UtGerYSO;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.120.24 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wrqvtvkv.outbound-mail.sendgrid.net (s.wrqvtvkv.outbound-mail.sendgrid.net. [149.72.120.24])
        by mx.google.com with ESMTPS id 41be03b00d2f7-acec0278524si13792603a12.252.2025.02.03.09.32.16
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 09:32:16 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.120.24 as permitted sender) client-ip=149.72.120.24;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="cK59iu/d";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=UtGerYSO;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.120.24 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=O4eLWfSiOuxpXSsDO3JZd8jQQq4svkfqGnEiplM+9gg=;
	b=cK59iu/dL5Ev8oj+LeSH2JLAyDPpl5/ft0zgeWaRGT2KCZXOqYXlMBLaXNQSs0DKMTTa
	aBV7ogPbS2vHqx6Ce1Y7DSPhztjwhmcv3JEn/spVSbjbgcw4ZU2SJ2e0o9xUuBKxnLbbEl
	I03Njh4mtCZU60vxogBb5KP/klu+Omb1KOvWk+tuP6uuZT0fkNSiTMxryPj6rA3k7qtZ+s
	bJvdU4QnGMJNXDtaKOxq3fShydyAIh1Nv/FIi8EoRWyTj04nOFpKadFp9PplAOlVj+BsaG
	/AQ2ajXotgZstHzBDA4t9OEqfdVr7ftvIQNiO8lUpAJvXwNYkp2qVARat4Y9JphQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=O4eLWfSiOuxpXSsDO3JZd8jQQq4svkfqGnEiplM+9gg=;
	b=UtGerYSObFkKqfcgo8NSQkx//DalhZS/zMQLQjuGHINv08YNHwQNw01HoJNTDAMXbV6L
	OT71zhgpzTiOoG492YtavAu+4iHGylcF9mD10HB/Wh6SxA+ZRAIael0P3suE3LdolCGfgg
	L8JUizMqk8h6y6SiyP68k0MXB7Ddo9ucU=
Received: by recvd-5f54b5d587-zs5q6 with SMTP id recvd-5f54b5d587-zs5q6-1-67A0FD9F-D
	2025-02-03 17:32:15.190205066 +0000 UTC m=+6984549.753731322
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-30 (SG) with HTTP
	id Ux_qa3CnQsKqBfUASgH2BQ
	Mon, 03 Feb 2025 17:32:15.140 +0000 (UTC)
Content-Type: multipart/alternative; boundary=41798ff71d29bd38c29bc3aa95e43b3980103317409678ea83b1d46d916e
Date: Mon, 03 Feb 2025 17:32:15 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <Ux_qa3CnQsKqBfUASgH2BQ@geopod-ismtpd-30>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5VqltNIa9dNbh4+?=
 =?us-ascii?Q?jTDAkn3jfhL9pEn2VseVSwWvYRkgZ=2FY2s=2Fc2ddS?=
 =?us-ascii?Q?jSVE8DHPhEHl4YwmcfPCkSYSN93psBhZI08vXeN?=
 =?us-ascii?Q?x1ouYnvyaj1H7Ex1RUkhpBW0vUi5NzKPDlWfdFm?=
 =?us-ascii?Q?Ttmif2jONrSg=2FQpAXqmhwVGyyiecCXoQXsehcn2?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: F+FO3q/lPEUJ

--41798ff71d29bd38c29bc3aa95e43b3980103317409678ea83b1d46d916e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Eden Ahbez: The Strangest Hit Songwriter
A fascinating article about Eden Ahbez, the composer of the 1948 hit "Natur=
e Boy" performed by Nat King Cole. Ahbez was a unique figure who lived an u=
nconventional lifestyle, sleeping outdoors and following a natural diet dec=
ades before the hippie movement. The article details how he delivered his s=
ong to Cole, his brief success, and his lasting influence on music.
Key Discussion Points:
Many readers discovered that the song was featured prominently in Baz Luhrm=
ann's "Moulin Rouge!"
Interesting discussion about the song's musical composition, particularly i=
ts unusual chord progression
Historical context about possible inspiration from a Yiddish theater song "=
Shvayg, mayn harts"
2. Making Local LLM Voice Assistant Faster with RAG
A technical article about improving the performance of a local LLM-based vo=
ice assistant using RAG (Retrieval Augmented Generation). The author descri=
bes how they optimized their home assistant by reducing context length and =
implementing smart retrieval of relevant information.
Key Discussion Points:
Technical discussion about the implementation of RAG and its benefits
Debate about the model used (Llama 3 70B AWQ)
Comments about the assistant's response style and personality
3. Face of Ancient Australian 'Giga-Goose' Revealed
Scientists have discovered a well-preserved skull of Genyornis newtoni, a m=
assive flightless bird that lived in ancient Australia. Standing over two m=
eters tall and weighing up to 240 kg, this "giga-goose" went extinct shortl=
y after humans arrived in Australia.
Key Discussion Points:
Extensive debate about the cause of extinction - climate change vs. human i=
mpact
Discussion about the timing of human arrival in Australia and population si=
zes
Interest in the potential taste of ancient megafauna, given that humans may=
 have hunted them to extinction
This email has been sent by Toolhouse. To change your delivery preferences,=
 please visit https://app.toolhouse.ai/settings
--41798ff71d29bd38c29bc3aa95e43b3980103317409678ea83b1d46d916e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<!DOCTYPE html>
<html>
<body style=3D"font-family: Arial, sans-serif; max-width: 800px; margin: 0 =
auto; padding: 20px;">

<h1 style=3D"color: #ff6600;">Hacker News Digest</h1>

<div style=3D"margin-bottom: 40px;">
    <h2>1. Eden Ahbez: The Strangest Hit Songwriter</h2>
    <p>A fascinating article about Eden Ahbez, the composer of the 1948 hit=
 "Nature Boy" performed by Nat King Cole. Ahbez was a unique figure who liv=
ed an unconventional lifestyle, sleeping outdoors and following a natural d=
iet decades before the hippie movement. The article details how he delivere=
d his song to Cole, his brief success, and his lasting influence on music.<=
/p>
   =20
    <p><strong>Key Discussion Points:</strong></p>
    <ul>
        <li>Many readers discovered that the song was featured prominently =
in Baz Luhrmann's "Moulin Rouge!"</li>
        <li>Interesting discussion about the song's musical composition, pa=
rticularly its unusual chord progression</li>
        <li>Historical context about possible inspiration from a Yiddish th=
eater song "Shvayg, mayn harts"</li>
    </ul>
</div>

<div style=3D"margin-bottom: 40px;">
    <h2>2. Making Local LLM Voice Assistant Faster with RAG</h2>
    <p>A technical article about improving the performance of a local LLM-b=
ased voice assistant using RAG (Retrieval Augmented Generation). The author=
 describes how they optimized their home assistant by reducing context leng=
th and implementing smart retrieval of relevant information.</p>
   =20
    <p><strong>Key Discussion Points:</strong></p>
    <ul>
        <li>Technical discussion about the implementation of RAG and its be=
nefits</li>
        <li>Debate about the model used (Llama 3 70B AWQ)</li>
        <li>Comments about the assistant's response style and personality</=
li>
    </ul>
</div>

<div style=3D"margin-bottom: 40px;">
    <h2>3. Face of Ancient Australian 'Giga-Goose' Revealed</h2>
    <p>Scientists have discovered a well-preserved skull of Genyornis newto=
ni, a massive flightless bird that lived in ancient Australia. Standing ove=
r two meters tall and weighing up to 240 kg, this "giga-goose" went extinct=
 shortly after humans arrived in Australia.</p>
   =20
    <p><strong>Key Discussion Points:</strong></p>
    <ul>
        <li>Extensive debate about the cause of extinction - climate change=
 vs. human impact</li>
        <li>Discussion about the timing of human arrival in Australia and p=
opulation sizes</li>
        <li>Interest in the potential taste of ancient megafauna, given tha=
t humans may have hunted them to extinction</li>
    </ul>
</div>

<hr style=3D"margin: 40px 0;">

<footer style=3D"font-size: 12px; color: #666;">
    <p>This email has been sent by Toolhouse. To change your delivery prefe=
rences, please visit <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswl2n4_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAChJvK9NPm88OHoc-2BBY=
qdBzjQxU3Jq-2BxFjYOv544piqwHU8k-2FG6WQZ8AqI7qGHBPWE1qwlbJMiaGeCP7KVFJ9crOmk=
8LH59V0dubJ6YK1AwndNsrKCDszs9AHYfzphjyaQqZj44ibxnFNFOAF1XybYmE8BeyWe6hn5-2F=
m1ndNp0mQ-3D-3D">https://app.toolhouse.ai/settings</a></p>
</footer>

<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GLPsIf6PFSdPuPRqFsOZ2pAD5Hb-2FfNfNLZKxugSSPoM=
3Rx0EIbZv3vXmg-2FDpj7jeQH1zN53H88k8fDEMZrHJuItCb85lkV4ljfQXO73p-2BIIW7s6-2F=
pn-2BsdW0Vn-2FF76Q-2BIbHVE3cAfCQTxtXAhc2OCqcmFZqijvfpWegXwbdaqq7JOLDG2CYiop=
br4AW00ummpHc-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"h=
eight:1px !important;width:1px !important;border-width:0 !important;margin-=
top:0 !important;margin-bottom:0 !important;margin-right:0 !important;margi=
n-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;pa=
dding-right:0 !important;padding-left:0 !important;"/></body>
</html>
--41798ff71d29bd38c29bc3aa95e43b3980103317409678ea83b1d46d916e--
