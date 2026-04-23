Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp5113092ejc;
        Sat, 26 Apr 2025 10:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWlsRxuuUUNi3koALNMtfxkmOECiuS1hBiWL7WlYzIcik9t40tIC8XBWwg7EmhBq4Tf9ld
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7c9668cda1cmr634141585a.51.1745688733493;
        Sat, 26 Apr 2025 10:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745688733; cv=none;
        d=google.com; s=arc-20240605;
        b=Kl9fFXlwskXq8boTz6CFK1/r5ScSKousmgHvu5sxRZCgApGnlVWV4yg0lyT+pvAlhG
         +6R2FvweOboTece6Ui5agnXIeTMtZfvsOf/arKEdIoEhTDKTSvJHX1M5KS+4RgLlIlhl
         CUx+iBV11W8djabkn4ALR8W7RXN1bfoWv9jmrKHJO4Dv1lEu6CAnkqj4cNBZc+LriHXd
         s0pDkstoM3pzRpwXy8JFQFg2noVYGqM6m3KAix+d2R0pG0jXTJZcCTBz029FzTuQ69qI
         uVdKKnNgxtmOayMxJBCqd2LmNZUEA3Ovjr69sLpBpoNVDp/JIBD172/mf2R+M8pH5gID
         QKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=pNpDN79pUz/8ynNwoloy9Qq7bU4VzzpnSn2FVO8k1Ts=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=LGV6Iy/4hIPND6U4MjwdJg4CEjCHVDSwTg6X1Dm3JEh6aM/Oipetzw/oyCvoLyeMMS
         pYlidLGnJmydK9MKWbzfmZNR1AfHnnDpYzCoJFnW70xyo6q7VY6p/YwV2yrhQ9EIbDof
         hHa+0CYv00xq1VtjRBRY1EgNk96xqsxg1GNWeo6Z17jT6bG8SCSplUvkXKt/6T/1yTdN
         KzL5YvbrsQFUzYwUz0lmWBxjmXmDchivsEPA3FXZl5YYVyIza5c07mDT1VnxBtztN5rl
         G5j3poIFl19cA7JWQebGvhJ4hEMxy6+vZ+xd0iU8oM3fx404ouCaH6y2v/L/gT04TbFJ
         NfHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="N0/qRp1B";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=DsXSUtjk;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsb.outbound-mail.sendgrid.net (s.wfbtzhsb.outbound-mail.sendgrid.net. [159.183.224.107])
        by mx.google.com with ESMTPS id af79cd13be357-7c958ea103dsi633708385a.348.2025.04.26.10.32.12
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 10:32:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) client-ip=159.183.224.107;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="N0/qRp1B";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=DsXSUtjk;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=pNpDN79pUz/8ynNwoloy9Qq7bU4VzzpnSn2FVO8k1Ts=;
	b=N0/qRp1Bu0Ykx06fYXDtGxyfd4/MrtNiV9uADv/4cCoDFxLmqLhDrQ3fhDt7DFjIkfwq
	UV+0Q1am5S5zWabLsva3RJ6ItdSmmcIg138gBqTnVqVpqGRxPXq5s0q45LhBId0Cddp9vh
	nDyX4UXtXXUJGTSlGuHl4aa1y90LD8oslrIW3MyAbhtKyRQN11kC8tLRPh9rO5OIq8ngLo
	+9QxgvrJJ76HhOE/AAh2NHEbwXD4rMrQF3IjgJggo59ygOpKZ5ThLITtxA4Dv7URamfaHl
	HZxtm7YNafhaZTkYhuovb2QuAzLuzq0Vqxa8t2oNWvg2Ub0uz9dVvEVs9IhLX1tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=pNpDN79pUz/8ynNwoloy9Qq7bU4VzzpnSn2FVO8k1Ts=;
	b=DsXSUtjkVQFN+KWN1nixRo/z+vJ2soQs6t90sACofbPe4Stqc6MyUGSv+cleZZQQofVC
	TU1mxXd+yJu2joAyi/B35+HVHnuJWF4U+NN3ILdCsha/OexQWs7S5/npDCpeddOBU/NQ2Q
	TN3IcpJPedfL6stXR8F1NW3qLc9LwgvNo=
Received: by recvd-545d4d4647-bzs6t with SMTP id recvd-545d4d4647-bzs6t-1-680D189B-1B
	2025-04-26 17:32:11.243886741 +0000 UTC m=+1538629.532715248
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-29 (SG) with HTTP
	id AyJwYoX2Quu6JIM-Ich_Dg
	Sat, 26 Apr 2025 17:32:11.205 +0000 (UTC)
Content-Type: multipart/alternative; boundary=b08118cf54ecb8ab996d92265ce07aba67775ce6f53c1de78e93081b0a2b
Date: Sat, 26 Apr 2025 17:32:11 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <AyJwYoX2Quu6JIM-Ich_Dg@geopod-ismtpd-29>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4OgjyrAhIWMsWrN?=
 =?us-ascii?Q?zc8oH+wWdxRAbbNe=2FmnR7GvgWkaruI5AMP4bICN?=
 =?us-ascii?Q?55efagGlI3lUJGKClI43KkLBPL4qtPXmUGy1lYF?=
 =?us-ascii?Q?K2LtN8dMl7OVPhbtN9Z5x+GWvS5C9OeqZPXgNj6?=
 =?us-ascii?Q?PBSThtDS6BaL26Jc6CMgbrS6dCUpdQq3U9VgoBB?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: vwK7AXHzCpt6

--b08118cf54ecb8ab996d92265ce07aba67775ce6f53c1de78e93081b0a2b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Watching o3 guess a photo's location is surreal, =
dystopian and entertaining
In this article, the author explores the capabilities of OpenAI's o3 model =
in guessing the location of photos. The process involves feeding a photo to=
 the model and prompting it to guess the location. The author shares their =
experience of testing the model with various photos, noting its impressive =
accuracy in identifying locations based on subtle clues like vegetation and=
 architecture. However, the author also raises concerns about the implicati=
ons of such technology for privacy and safety.Top Comments:Many users expre=
ssed amazement at the model's accuracy, sharing their own experiences with =
geolocation.Concerns were raised about the potential for misuse of this tec=
hnology, particularly in stalking and privacy violations.Some users discuss=
ed the ethical implications of AI's ability to identify locations from imag=
es.2. Show HN: My self-written hobby OS is finally running on my vintage IB=
M ThinkPad
This article showcases a personal project where the author has developed a =
32-bit hobby operating system that runs on vintage hardware. The OS feature=
s multitasking, networking, and a graphical interface. The author shares in=
sights into the development process, the challenges faced, and the joy of s=
eeing the project come to life on older machines.Top Comments:Users praised=
 the author's dedication and shared their own experiences with similar proj=
ects.Some expressed interest in the technical details and asked about futur=
e plans for the OS.There was a discussion about the nostalgia associated wi=
th using vintage hardware.3. An end to all this prostate trouble?
This article discusses the challenges associated with prostate health, incl=
uding benign prostatic hyperplasia (BPH) and prostate cancer. The author ex=
plores various theories regarding the causes of these conditions and highli=
ghts a new surgical approach that aims to address the underlying issues. Th=
e article emphasizes the importance of understanding prostate health and th=
e potential for innovative treatments.Top Comments:Many readers shared pers=
onal stories related to prostate health and treatment experiences.There was=
 a lively discussion about the effectiveness of different treatments and th=
e need for more research.Some users expressed frustration with the medical =
community's handling of prostate issues.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--b08118cf54ecb8ab996d92265ce07aba67775ce6f53c1de78e93081b0a2b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Watching o3 guess a phot=
o's location is surreal, dystopian and entertaining</h2><p>In this article,=
 the author explores the capabilities of OpenAI's o3 model in guessing the =
location of photos. The process involves feeding a photo to the model and p=
rompting it to guess the location. The author shares their experience of te=
sting the model with various photos, noting its impressive accuracy in iden=
tifying locations based on subtle clues like vegetation and architecture. H=
owever, the author also raises concerns about the implications of such tech=
nology for privacy and safety.</p><h3>Top Comments:</h3><ul><li>Many users =
expressed amazement at the model's accuracy, sharing their own experiences =
with geolocation.</li><li>Concerns were raised about the potential for misu=
se of this technology, particularly in stalking and privacy violations.</li=
><li>Some users discussed the ethical implications of AI's ability to ident=
ify locations from images.</li></ul><h2>2. Show HN: My self-written hobby O=
S is finally running on my vintage IBM ThinkPad</h2><p>This article showcas=
es a personal project where the author has developed a 32-bit hobby operati=
ng system that runs on vintage hardware. The OS features multitasking, netw=
orking, and a graphical interface. The author shares insights into the deve=
lopment process, the challenges faced, and the joy of seeing the project co=
me to life on older machines.</p><h3>Top Comments:</h3><ul><li>Users praise=
d the author's dedication and shared their own experiences with similar pro=
jects.</li><li>Some expressed interest in the technical details and asked a=
bout future plans for the OS.</li><li>There was a discussion about the nost=
algia associated with using vintage hardware.</li></ul><h2>3. An end to all=
 this prostate trouble?</h2><p>This article discusses the challenges associ=
ated with prostate health, including benign prostatic hyperplasia (BPH) and=
 prostate cancer. The author explores various theories regarding the causes=
 of these conditions and highlights a new surgical approach that aims to ad=
dress the underlying issues. The article emphasizes the importance of under=
standing prostate health and the potential for innovative treatments.</p><h=
3>Top Comments:</h3><ul><li>Many readers shared personal stories related to=
 prostate health and treatment experiences.</li><li>There was a lively disc=
ussion about the effectiveness of different treatments and the need for mor=
e research.</li><li>Some users expressed frustration with the medical commu=
nity's handling of prostate issues.</li></ul><footer><p>This email has been=
 sent by Toolhouse. You can change your delivery preferences at <a href=3D'=
http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1=
sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMsw0TYA_zKD9qStml-2FkjU46ulTqe=
WVsrM3061nr98hteMD12SmBXToGpE-2By2WvQ6JaDSs1XKqP7Nv9bqqLOqVg3Z-2BT-2BTyDW-2=
BN1zC0Nkhl-2B1Vl578Yy5MocRFOauUerWg3Rt4oQAQcO2LoiMl7ghvN07bzPHMlprC2NJdeshU=
yjaohxX960nEeIfg0M1IM3QRIM8f-2B7rpVwurCgCjDNg9WXY1gLx-2BOw-3D-3D'>Toolhouse=
 Settings</a>.</p></footer><img src=3D"http://url1228.toolhouseai.com/wf/op=
en?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GLog4u9Je2XTpd2pMQ=
1DqaAAXNcjbWi0cf-2B2bW5wccBFR3pHSv9ikqNtSVEwljtLNbrb44j7RVNPCkHnGFk-2FPzeqs=
1xJJvoOsXLomA8hhvHkhPyXN6DaDUjL6AyiN7ex9r3RpjyqmFrlhhUQVJ0OM0LozIXxQ4Jv1ZtU=
NiMq3KUAJ34vV7lGVQohnddC9HR2pY-3D" alt=3D"" width=3D"1" height=3D"1" border=
=3D"0" style=3D"height:1px !important;width:1px !important;border-width:0 !=
important;margin-top:0 !important;margin-bottom:0 !important;margin-right:0=
 !important;margin-left:0 !important;padding-top:0 !important;padding-botto=
m:0 !important;padding-right:0 !important;padding-left:0 !important;"/></bo=
dy></html>
--b08118cf54ecb8ab996d92265ce07aba67775ce6f53c1de78e93081b0a2b--
