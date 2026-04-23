Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:cf8d:b0:abc:2b0f:5fd9 with SMTP id ux13csp352759ejc;
        Tue, 4 Mar 2025 09:31:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFevVVRZvMJ4xW0px3rRAKiliEmH0z6Ky+UPMnJn1yVcDOlKEDP9GM2FY2oGlTawTbxdAyQ
X-Received: by 2002:a05:6808:ab0:b0:3f6:6b64:6652 with SMTP id 5614622812f47-3f66b646b27mr3586315b6e.3.1741109475379;
        Tue, 04 Mar 2025 09:31:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741109475; cv=none;
        d=google.com; s=arc-20240605;
        b=RRs2mDqqVagSebSI7WAR4s+0NEyoYqympCLESkfcUWBp3wVDhZZweCOhpN+i1OMXCh
         kn8YJgMo/vIBct0Lpp9PBZHyW6KGCMqUL2SLvYh31a5kzBmjd6fYP5kOnSFf3xfN6eAB
         mOjVy6zO3beEnnJwWKuKZ+Ckxm7xRBKaO8LI/tMXkOuRed6mWX8nKHTb5Pj3GnG0d+P/
         sMeEp90s8oLE6PMcVtymOdvsRGNi2DRwwXLOo0rqKiJVjRlVDFa1VvfQ9i0318QyBWBc
         75POtxK05TpuLd4/6m1INrA7cDb3/JBzZ6O6ZnTmDNirgiz18IbMNZeLFADsrHxEZeTw
         6cmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=OVnA6s0PmAI3kxBOe8BU5oA6l52VWZ9aUQx9RU0ZpxM=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=WWNTtlUhyNt4T5QCzK4Cr5YwmpUQOtII+yYJQjeay+GKa7XD9G0BHQaDF7ASpvj/wf
         2/JXuxEc7bfsxxbI2GW1fmpAFNAGgrBivphjenBTriPP/nvLUlNrq/qU5DEnwIEWONIW
         JRo0Fwforp9HotxvGy5TO9AVpBemrq5y2OmQYCAZYh0i9KeeuN5emf/AoLyJBa8vmfWi
         J0IemW0Rm8NiDiJAhn2StU7wKSoYXtzrC14bu3sUFQ8cJVvxIyvtqsm05peZh0snVQrq
         rLQQtgnSW7woSeu0XOhpHQl7PbsV3xEs9Z6S0wbCES5pdmOV8h3IC6HH6z2zRJNobsEv
         KHZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=vyqbghmx;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=h+ziufjM;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsb.outbound-mail.sendgrid.net (s.wfbtzhsb.outbound-mail.sendgrid.net. [159.183.224.107])
        by mx.google.com with ESMTPS id 006d021491bc7-6001fed73d6si2380910eaf.8.2025.03.04.09.31.14
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 09:31:15 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) client-ip=159.183.224.107;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=vyqbghmx;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=h+ziufjM;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=OVnA6s0PmAI3kxBOe8BU5oA6l52VWZ9aUQx9RU0ZpxM=;
	b=vyqbghmx49lMEAKC6XaHb2+M+DSp8rHMv5pq3ATroTv45dldxV8PGJ/jOeSWm8b73n18
	FFIuz5tZEgu+8gKwTgUvOmDHbHc37SPCwXBZ1kU7XL0BTa+i9vLNpCX+hMoiGRo1APEPkP
	f7aoUfvrDvdU5PcXtJi5wPbPEXcwgmg9Tz5davhFQtA2nTQn5l13bEls854OIkXC7998d2
	7mIcuj6v0rxeX1UEYA2cHdO0ukfJEBVc5QtvNgihJOxC6VS1WxCH2Izr+9ctg/+Noj5IaZ
	pqRcvxXUObLHRYfnvxlYqdQhlIhuivtipnDir49iiKWzCpsdm6KMOumZmvb7D8Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=OVnA6s0PmAI3kxBOe8BU5oA6l52VWZ9aUQx9RU0ZpxM=;
	b=h+ziufjM9vIRxMa2ZzUxDtCRyvmbb+Yz94K7LycdzrfyYaR6Vy2ABWii/RdMUIYEsAl5
	jmk11bpwO5O4w1KomjKAMONqKk3R8Q/8uIcqxVsK8r95I7rYSP02lQPProf8dx+ZfgeEQZ
	K2SaiViWndKkp/dI7TkBC7zHAwAEd7gtA=
Received: by recvd-5f54b5d587-zdng7 with SMTP id recvd-5f54b5d587-zdng7-1-67C738DF-A0
	2025-03-04 17:31:11.890685519 +0000 UTC m=+9490026.192593028
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-20 (SG) with HTTP
	id d2aKSOpRTgq7ILANkeaIfA
	Tue, 04 Mar 2025 17:31:11.746 +0000 (UTC)
Content-Type: multipart/alternative; boundary=21cf0d130a5f40002310bbc7987848fe14ba0cf437dbe640c3375c43ada4
Date: Tue, 04 Mar 2025 17:31:11 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <d2aKSOpRTgq7ILANkeaIfA@geopod-ismtpd-20>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n6YhVK0L59Q6cpky?=
 =?us-ascii?Q?LOVFZJL0RMJx4252mfWEI1QItXrPFt+6LfbNLIc?=
 =?us-ascii?Q?AG7ptSV6N1G+TZPwKajmC5eBUfzd6oOd6BmMiUF?=
 =?us-ascii?Q?68GEnXSzV4G4HKZfej41qMgEMxV7XjNcjkvBj0c?=
 =?us-ascii?Q?KazkK8a84BryRtD5d7yDWGRT8EfS4RqBt=2FqIJ89?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 400HnKKeDVhg

--21cf0d130a5f40002310bbc7987848fe14ba0cf437dbe640c3375c43ada4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Eden Abhez: The strangest hit songwriter
This article explores the life of Eden Ahbez, the composer of the iconic so=
ng "Nature Boy". It details how Ahbez, a one-hit wonder, lived a unique lif=
estyle that anticipated modern alternative living. Despite the song's succe=
ss, Ahbez struggled with fame and remained an enigmatic figure in music his=
tory.Top Comments:Many readers recognized the song from *Moulin Rouge!* and=
 discussed its unique musical qualities.Some commenters noted the philosoph=
ical depth of the lyrics and compared Ahbez's singing style to Nat King Col=
e's.2. Making my local LLM voice assistant faster and more scalable with RA=
G
This article discusses the author's journey to optimize a local voice assis=
tant using Retrieval Augmented Generation (RAG). The author shares insights=
 on improving performance by reducing context length and enhancing response=
 quality through innovative techniques.Top Comments:Readers appreciated the=
 technical depth and shared their own experiences with LLMs.There was a liv=
ely discussion about the implications of using RAG in voice assistants.3. F=
ace of ancient Australian 'giga-goose' revealed after fossil skull found
The article reveals the discovery of a skull belonging to *Genyornis newton=
i*, a giant flightless bird that lived over 45,000 years ago. The findings =
provide insights into the bird's diet and extinction, highlighting the impa=
ct of climate change and human activity.Top Comments:Commenters debated the=
 role of climate change versus human activity in the extinction of megafaun=
a.Many expressed curiosity about the bird's characteristics and its place i=
n the ecosystem.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--21cf0d130a5f40002310bbc7987848fe14ba0cf437dbe640c3375c43ada4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Eden Abhez: The stranges=
t hit songwriter</h2><p>This article explores the life of Eden Ahbez, the c=
omposer of the iconic song "Nature Boy". It details how Ahbez, a one-hit wo=
nder, lived a unique lifestyle that anticipated modern alternative living. =
Despite the song's success, Ahbez struggled with fame and remained an enigm=
atic figure in music history.</p><h3>Top Comments:</h3><ul><li>Many readers=
 recognized the song from *Moulin Rouge!* and discussed its unique musical =
qualities.</li><li>Some commenters noted the philosophical depth of the lyr=
ics and compared Ahbez's singing style to Nat King Cole's.</li></ul><h2>2. =
Making my local LLM voice assistant faster and more scalable with RAG</h2><=
p>This article discusses the author's journey to optimize a local voice ass=
istant using Retrieval Augmented Generation (RAG). The author shares insigh=
ts on improving performance by reducing context length and enhancing respon=
se quality through innovative techniques.</p><h3>Top Comments:</h3><ul><li>=
Readers appreciated the technical depth and shared their own experiences wi=
th LLMs.</li><li>There was a lively discussion about the implications of us=
ing RAG in voice assistants.</li></ul><h2>3. Face of ancient Australian 'gi=
ga-goose' revealed after fossil skull found</h2><p>The article reveals the =
discovery of a skull belonging to *Genyornis newtoni*, a giant flightless b=
ird that lived over 45,000 years ago. The findings provide insights into th=
e bird's diet and extinction, highlighting the impact of climate change and=
 human activity.</p><h3>Top Comments:</h3><ul><li>Commenters debated the ro=
le of climate change versus human activity in the extinction of megafauna.<=
/li><li>Many expressed curiosity about the bird's characteristics and its p=
lace in the ecosystem.</li></ul><footer><p>This email has been sent by Tool=
house. You can change your delivery preferences at <a href=3D'http://url122=
8.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZ=
nnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswGTbu_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98=
hteMD12SmChhhquErprCP1vOmu79cItZP5iQNl9JErmeAbb6fCJPc2SYMwx3-2B8PPAp7YfD5S2=
Hpx4yGiOUjWg8OIyFgMef6KExUGfigRJFmF4LHWsWVMj5KOYV8IU7CZiw0v6bGt6eql310YxPUc=
N3DtOCwTidab7NONIxL3G-2F94gm4ewLQIg-3D-3D'>here</a>.</p></footer><img src=
=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2=
P513JhjX8oSKm62DliywF0GLexA1w4EZ9r5ApVJDQkaCgJWXDJ0p46jcA6OKDJXblul69noMcgb=
VxIvt62JGcWWzkZufyp2HOHGs3-2FnuWaLV2F5I3BJNtgygsbpoRtZbW3bXV-2F8CjYLJu7l0fD=
NtfD4c9tVWdpepK2EWanPmS2N1IehAhhXXH0oxDHbwxiePphQTxfAsGMuX3SG6-2Bqk-2BtqZc-=
3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !imp=
ortant;width:1px !important;border-width:0 !important;margin-top:0 !importa=
nt;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !impo=
rtant;padding-top:0 !important;padding-bottom:0 !important;padding-right:0 =
!important;padding-left:0 !important;"/></body></html>
--21cf0d130a5f40002310bbc7987848fe14ba0cf437dbe640c3375c43ada4--
