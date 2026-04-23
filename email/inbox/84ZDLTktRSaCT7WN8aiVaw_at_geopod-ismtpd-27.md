Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:57d4:b0:ab7:3ba4:7d71 with SMTP id u20csp416743ejr;
        Fri, 7 Feb 2025 09:32:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/l/MPvupbh6CFbIlf/GRr9qcnPBjQcpWHKJLa69K73y7N7IyOoyJP7tNgOt9wx+YN/bPi
X-Received: by 2002:a05:6a00:1a93:b0:728:e906:e446 with SMTP id d2e1a72fcca58-7305d57be71mr6961583b3a.24.1738949532235;
        Fri, 07 Feb 2025 09:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738949532; cv=none;
        d=google.com; s=arc-20240605;
        b=dNCBAYmRCwo2ZGzPeYVU4Z+/8SsaSvwsQc6FDppigIigSyX53ZYm5AKHrSOCEoO45P
         9fMJYzDjD5Vuy/X5d1rMR/WftNbR6B+Y+/BYhNNucsjyVD4wWl7ObFCZR6ygI9wpNceu
         /7Ls+IbUnQAmUlFNK/lVDW8GlDhboQMqvROcHbQfoF1LqiKXltcv/xv182VW+zmWJNFp
         B9e4VgaMppBYoJuJwwOOjci/qozBMTZW8KjpSolgLGseK3kaLKgXJNbZRmKCmNEj005a
         xBGiT1CxvVz2G2AMGLMWNQ8ZV7npqjFlyy6uZ056tNuslWx+ChAKcw8l8BVQQYs95ajA
         YOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=UHo6ILsBFBA39QJ8bQ/lh1t0yJrnKT5rq3PBPmXcfhA=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Ta+8vH/V9T7NhseGWFtNf+MRVeOMsyuRA03gZr+G1Jh8LXHejZE0A3QD53zSPPIRZy
         42xZkfOu4KdDhKGscDi2Ev5BfL46vzHIH47f0blLSZOrdZE44fu9Za94OxAl0OR/a0AQ
         gfFIKqRZKlrbel+LTnQLykuDrjDj0tfSAr3Ur7hqqOhDrYqNNTVvxDPSVqeP25gm/YK7
         lnA7L28+GjFVEMpFrgfUpDvWKI+H2pMQAwV18qwj+I1FIQ18VFh1DHfaVAsd97YmfTVZ
         /4obxZqARVBUL3A5NrTntnaHwmDCFlvCKp68oXOa6ATPxdRtp7Ls3V6uZab2PBDSFKSf
         4Vqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=xK6Xn7oR;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=nMVmBeTl;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhst.outbound-mail.sendgrid.net (s.wfbtzhst.outbound-mail.sendgrid.net. [159.183.224.103])
        by mx.google.com with ESMTPS id d2e1a72fcca58-73048c285d0si5410756b3a.268.2025.02.07.09.32.10
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:32:12 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) client-ip=159.183.224.103;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=xK6Xn7oR;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=nMVmBeTl;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=UHo6ILsBFBA39QJ8bQ/lh1t0yJrnKT5rq3PBPmXcfhA=;
	b=xK6Xn7oRoZCzS7u98BGUVt8An+7MHdZRlXk4s4XSKw8dzMPhJuA9aiWSFIQ4iH7Bw3M8
	Cjmw0G57LLnInUzwqkYVP/AJz5AUjbk1isPupIWo321rEU8LAYsyzs4AT2EeAiH2l/GwWw
	pmj12fc2JZecEHnZblIgkz/8xT06Gn9N8kopuVDPJ3JuSAnFBUKYMYTZJNlUEt3pdbhEZ6
	hEJn4ZsSet/KMDgYsnhu91IQzeTc/TwuRtntp01jWK6HpHVzb6aDo7UwQPL1k1pC9HNAvn
	P2Op+1TS/mGtYybYVdD0k+dA0MYXohHQRNZjObieHHs1iWbrp2inE5JFcCFS2/xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=UHo6ILsBFBA39QJ8bQ/lh1t0yJrnKT5rq3PBPmXcfhA=;
	b=nMVmBeTlz9V4H4YuNpuGwigBjlGwHZSBvEWsmSwFqiNoHO7g5YEaZ8vDSUrmW/DyY2V2
	KoYTmpdf8NZuTyEUR+GzZudFXL4C3x55A1TUbX7SX1Kbl5aoxnbO/kW2zxshzUUSPA3P/4
	LYk8h31XS4LAlmWeXv7Ra0ZfaXa6AMpZA=
Received: by recvd-84b546689d-7r6pp with SMTP id recvd-84b546689d-7r6pp-1-67A64398-19
	2025-02-07 17:32:08.527330799 +0000 UTC m=+7330225.543949151
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-27 (SG) with HTTP
	id 84ZDLTktRSaCT7WN8aiVaw
	Fri, 07 Feb 2025 17:32:08.479 +0000 (UTC)
Content-Type: multipart/alternative; boundary=b75f1ea042dcffa4709f34f5097523121ecb87c1692c839c24c7efd06f49
Date: Fri, 07 Feb 2025 17:32:08 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <84ZDLTktRSaCT7WN8aiVaw@geopod-ismtpd-27>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n6txu7PFRJK7blz5?=
 =?us-ascii?Q?JbBit6Z94lRpaYPBhF2I62tVEYYAw9bMx0VFYK=2F?=
 =?us-ascii?Q?HCpTpB0Ph08Qs0VLZ7GZzY5bIENMu9WJ9I9VHT=2F?=
 =?us-ascii?Q?Mi=2FX0b5R9GuIJZdyvji5FXxksy=2FyNdVsURCMC2T?=
 =?us-ascii?Q?L70ojXvpjEmPbNAouBXnuYDDf016z8WdEjdwyn6?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: tDTjxxDFJE34

--b75f1ea042dcffa4709f34f5097523121ecb87c1692c839c24c7efd06f49
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Eden Ahbez: The Strangest Hit Songwriter
A fascinating deep dive into the life of Eden Ahbez, the composer of the 19=
48 hit "Nature Boy" performed by Nat King Cole. Ahbez was a unique figure w=
ho lived an unconventional lifestyle, including residing under the Hollywoo=
d Sign and surviving on $3 per week eating only fruits, vegetables, and nut=
s. The article portrays him as possibly the first hippie, predating the mov=
ement by decades.
Key Discussion Points:
Many readers discovered that "Nature Boy" was later featured prominently in=
 Baz Luhrmann's "Moulin Rouge!"
Interesting discussion about the song's musical composition, including its =
unusual chord progression
Some controversy over the song's originality, with mentions of potential in=
spiration from a Yiddish theater song
2. Making Local LLM Voice Assistant Faster with RAG
A technical article about improving the performance of a local LLM-based vo=
ice assistant using RAG (Retrieval Augmented Generation). The author descri=
bes how they optimized their home assistant by reducing context length and =
implementing smart retrieval of relevant information, resulting in signific=
antly faster response times.
Key Discussion Points:
Discussion about the model used (Llama 3 70B AWQ)
Technical debate about the implementation of RAG and its benefits
Comments about the assistant's response style and personality
3. Face of Ancient Australian 'Giga-Goose' Revealed
Scientists have discovered a well-preserved skull of Genyornis newtoni, a m=
assive flightless bird that lived in ancient Australia over 45,000 years ag=
o. Standing over two meters tall and weighing up to 240 kilograms, this "gi=
ga-goose" was part of Australia's megafauna before going extinct shortly af=
ter human arrival.
Key Discussion Points:
Extensive debate about the cause of extinction - climate change vs. human i=
mpact
Discussion about the species' adaptation to changing environments
Interesting speculation about what the bird might have tasted like, given t=
hat humans apparently ate them to extinction
This email has been sent by Toolhouse. To change your delivery preferences,=
 please visit https://app.toolhouse.ai/settings
--b75f1ea042dcffa4709f34f5097523121ecb87c1692c839c24c7efd06f49
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<!DOCTYPE html>
<html>
<body style=3D"font-family: Arial, sans-serif; max-width: 800px; margin: 0 =
auto; padding: 20px;">

<h1 style=3D"color: #ff6600;">Hacker News Digest</h1>

<div style=3D"margin-bottom: 40px;">
    <h2 style=3D"color: #333;">1. Eden Ahbez: The Strangest Hit Songwriter<=
/h2>
    <p>A fascinating deep dive into the life of Eden Ahbez, the composer of=
 the 1948 hit "Nature Boy" performed by Nat King Cole. Ahbez was a unique f=
igure who lived an unconventional lifestyle, including residing under the H=
ollywood Sign and surviving on $3 per week eating only fruits, vegetables, =
and nuts. The article portrays him as possibly the first hippie, predating =
the movement by decades.</p>
   =20
    <p><strong>Key Discussion Points:</strong></p>
    <ul>
        <li>Many readers discovered that "Nature Boy" was later featured pr=
ominently in Baz Luhrmann's "Moulin Rouge!"</li>
        <li>Interesting discussion about the song's musical composition, in=
cluding its unusual chord progression</li>
        <li>Some controversy over the song's originality, with mentions of =
potential inspiration from a Yiddish theater song</li>
    </ul>
</div>

<div style=3D"margin-bottom: 40px;">
    <h2 style=3D"color: #333;">2. Making Local LLM Voice Assistant Faster w=
ith RAG</h2>
    <p>A technical article about improving the performance of a local LLM-b=
ased voice assistant using RAG (Retrieval Augmented Generation). The author=
 describes how they optimized their home assistant by reducing context leng=
th and implementing smart retrieval of relevant information, resulting in s=
ignificantly faster response times.</p>
   =20
    <p><strong>Key Discussion Points:</strong></p>
    <ul>
        <li>Discussion about the model used (Llama 3 70B AWQ)</li>
        <li>Technical debate about the implementation of RAG and its benefi=
ts</li>
        <li>Comments about the assistant's response style and personality</=
li>
    </ul>
</div>

<div style=3D"margin-bottom: 40px;">
    <h2 style=3D"color: #333;">3. Face of Ancient Australian 'Giga-Goose' R=
evealed</h2>
    <p>Scientists have discovered a well-preserved skull of Genyornis newto=
ni, a massive flightless bird that lived in ancient Australia over 45,000 y=
ears ago. Standing over two meters tall and weighing up to 240 kilograms, t=
his "giga-goose" was part of Australia's megafauna before going extinct sho=
rtly after human arrival.</p>
   =20
    <p><strong>Key Discussion Points:</strong></p>
    <ul>
        <li>Extensive debate about the cause of extinction - climate change=
 vs. human impact</li>
        <li>Discussion about the species' adaptation to changing environmen=
ts</li>
        <li>Interesting speculation about what the bird might have tasted l=
ike, given that humans apparently ate them to extinction</li>
    </ul>
</div>

<hr style=3D"margin: 40px 0;">

<footer style=3D"color: #666; font-size: 0.9em;">
    <p>This email has been sent by Toolhouse. To change your delivery prefe=
rences, please visit <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswkOC0_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBcyTKiD9H0I-2Bg1sUfJW=
dxHY8qncrjNbWbPWoT3f-2FCbahy0ZI9OVTxPD23G6CmJ8hESJe1NxPzkejfy06Mmf0i-2B1zqY=
dsAnjSYBiAycUOr92pwwC-2BvKxyNZm99ekDwD4W-2BFtxUss3HYMtpH22eZ-2F-2Fbgnfh3n0q=
ML-2FTFkSQWigBNyA-3D-3D">https://app.toolhouse.ai/settings</a></p>
</footer>

<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GLaQHS9xG5BSrSZ-2BT9uhBwcMCtZNgX5bWAQLKe82OOh=
CKKxkz3nUghghIEJNcm9-2BKFmayLHd3zvoq5soGVWikZlw-2F-2FKzsJoV6Vi-2Fe1Xqp-2FQq=
CvOw4lhcCWpj3pNeeB5dcu6vxX6LF26Ghjy96FEfJAwtGIlIL1uxwPhX6e9Qh-2FQClXDdiU0hv=
QB-2Far-2BhJ4ySYc-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=
=3D"height:1px !important;width:1px !important;border-width:0 !important;ma=
rgin-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;=
margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !importa=
nt;padding-right:0 !important;padding-left:0 !important;"/></body>
</html>
--b75f1ea042dcffa4709f34f5097523121ecb87c1692c839c24c7efd06f49--
