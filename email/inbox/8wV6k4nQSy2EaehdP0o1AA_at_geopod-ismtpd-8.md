Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp5113069ejc;
        Sat, 26 Apr 2025 10:32:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyuaiU9T6yZgUNo/UqZDGBWdJpCQrntusGfdKiPEy7rOxFvNvrJ6JV8Qvg49eP0oJT+cdH
X-Received: by 2002:a05:622a:510:b0:476:9b40:c2cf with SMTP id d75a77b69052e-4801ebd274bmr116766871cf.50.1745688730024;
        Sat, 26 Apr 2025 10:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745688730; cv=none;
        d=google.com; s=arc-20240605;
        b=QqKdU1EERyuR2cjYiaiN+0ZE+k5Ef4gS24zKRYR14jOBtRWZT6pVtmCPJ39QzwHn5r
         YfndhH+DUuypTk91SUxO57P0QlRX4CCEk0sL4Efw7AjQDRpTllqrA38PwSiITF3TewWP
         rCHTGIfXwNTvS9MoeoP+L28U/WZdUkpy+M4Xa0rLctuNLdU2HHwXP3hC/XrHSqg0PC/W
         c4tq/yrY7VqdNRnCDQksQzNQgCaYxTC+IOIp4TsfO7VckIZNc/RtA6qJcccMWLpXsTev
         EGuilzGaHU7L8veCt5hkdpYgDPfr6k53H9Dww0G6lVn8MRDDE+b5H9LILojLj8W77G6R
         mSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=/2/w7pLyzGW0x1BzenvBR7OiPhkxKEBEI4J2NF0xjMc=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=hBVsI91BMbkvS4qwgDLY+jaHB1Q7vkb5gCflnh73XBym4Eh/7oXo2lJko2Wxt8wLPc
         E9R0DuVxIMnCTozLRAX+1w/AbVxuckkdPjP+U9uBRvogWWtGnymmCuwVl5mKIO++DWsA
         HgjgXMxpmgA5Xy22JO2F6x2Werj4dzqkOTrhKevcQmXQ/+dR4jQVKNot6fMdPnDg1F8U
         vrc6g5fcF4fGCV3UAW1VuyKEsbFyzUtBcDPA617+Lqr6efSZc8ZFU7UI3zH7aCaCKPv7
         p/PuFqpG1qp+o9VoDzV9JfTgui3U2u564R/pd2rt+8B9OdXZEoIQkNT6+t7zd/Jn427R
         3ARQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=sJtWCULF;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=oqI6aOal;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea1f8a2ffsi66985911cf.379.2025.04.26.10.32.09
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 10:32:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=sJtWCULF;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=oqI6aOal;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=/2/w7pLyzGW0x1BzenvBR7OiPhkxKEBEI4J2NF0xjMc=;
	b=sJtWCULFrdrrEU3CHMIWMJ3FBK1xhZ9+ENCxWgz8AaGLkalgYQhuvdDq/ZWa54V2c3ZY
	ynmUqgC2rHurdlv6xpORwIV+RlbmHnkcwN27brA+YiUiQMHUXdechS46g3F5Zfm8vsyY6b
	PXXta/Yk4xgXI271eVMuC2fAxcZIrJ6UgyQJWdcuyMxohfN5bla31aGYSuR2FY4sAZBJQ8
	J4Mikrp6s/Iuygkw18wGNJgN0dngYI1lajE1syVzvsurwNKXM6glkxb1G5WY2EK7uBA02i
	fuyhGkdNA5a5sqmVEY0rFY3y7LXCsrCzNivl9m0vidgDGH2Bsie5BUrUeD1G5kpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=/2/w7pLyzGW0x1BzenvBR7OiPhkxKEBEI4J2NF0xjMc=;
	b=oqI6aOaluOUQM36iIkGj8RPKGceDj/X7eaQVyNE2emo8/jPgH6y+qa7NBczsE15586TC
	cAnn+zpS8lUo0rXhw32N/8luYiS+xI7A81mq1uiEtGYfoVSkT3DXsF470YKeO0ufA2EZSs
	KXGvyNAYRu9VGe/IR1Wumi6k5/pguBfrc=
Received: by recvd-57d69887f8-8qmgl with SMTP id recvd-57d69887f8-8qmgl-1-680D1897-31
	2025-04-26 17:32:07.912087436 +0000 UTC m=+1538615.087970283
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-8 (SG) with HTTP
	id 8wV6k4nQSy2EaehdP0o1AA
	Sat, 26 Apr 2025 17:32:07.889 +0000 (UTC)
Content-Type: multipart/alternative; boundary=31b55a0561607a7df61e0dd6cbc288d8ed123c259655ccfc0a50a9599402
Date: Sat, 26 Apr 2025 17:32:07 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <8wV6k4nQSy2EaehdP0o1AA@geopod-ismtpd-8>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n76zetkTPYxpp6Uj?=
 =?us-ascii?Q?trwShKwvD0oDvjCVaOSYDaLlJRLjfxh+5biJUBM?=
 =?us-ascii?Q?6F1fsFlIMUhI7LUM3rXVGc5nBFCFRr1uYHeXaOB?=
 =?us-ascii?Q?FMEWKvhOqPsuy4=2FKzuaV3K9RLDhSZB9EIqSxeE=2F?=
 =?us-ascii?Q?jBdOA3QJjsQr4=2FoGUHxNSKE6bgP9nvGSbafI964?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: Max2rkNN4ghJ

--31b55a0561607a7df61e0dd6cbc288d8ed123c259655ccfc0a50a9599402
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Watching o3 guess a photo's location is surreal, =
dystopian and entertaining
This article discusses the capabilities of an AI model that can accurately =
guess the location of photos. The author, a competitive Geoguessr player, t=
ests the AI and finds it astonishingly accurate, often outperforming human =
players. The comments reveal a mix of admiration for the technology and con=
cerns about privacy implications.Top Comments Summary:Users express amazeme=
nt at the AI's accuracy and its ability to use various clues to determine l=
ocations.Concerns are raised about the potential for misuse, particularly i=
n stalking and privacy violations.Some users discuss the technical aspects =
of how the AI works and its limitations.2. Show HN: My self-written hobby O=
S is finally running on my vintage IBM ThinkPad
This article showcases a personal project where the author has developed a =
32-bit hobby operating system that runs on vintage hardware. The project em=
phasizes graphics, multitasking, and networking capabilities. The comments =
reflect a mix of nostalgia and technical curiosity, with users discussing t=
he challenges of developing for older systems.Top Comments Summary:Many use=
rs express admiration for the project and share their own experiences with =
vintage computing.Technical discussions arise about the challenges of devel=
oping operating systems and the importance of community support.Some users =
inquire about potential future developments and compatibility with modern h=
ardware.3. An end to all this prostate trouble?
This article explores the common issues related to prostate health, includi=
ng benign prostatic hyperplasia (BPH) and prostate cancer. It discusses a n=
ew theory regarding the causes of these conditions and potential treatments=
. The comments section features a mix of personal anecdotes and medical ins=
ights.Top Comments Summary:Users share personal stories related to prostate=
 health and express hope for new treatments.Some comments delve into the sc=
ience behind the proposed theories and their implications for men's health.=
Concerns about the accessibility and affordability of new treatments are al=
so discussed.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--31b55a0561607a7df61e0dd6cbc288d8ed123c259655ccfc0a50a9599402
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Watching o3 guess a phot=
o's location is surreal, dystopian and entertaining</h2><p>This article dis=
cusses the capabilities of an AI model that can accurately guess the locati=
on of photos. The author, a competitive Geoguessr player, tests the AI and =
finds it astonishingly accurate, often outperforming human players. The com=
ments reveal a mix of admiration for the technology and concerns about priv=
acy implications.</p><h3>Top Comments Summary:</h3><ul><li>Users express am=
azement at the AI's accuracy and its ability to use various clues to determ=
ine locations.</li><li>Concerns are raised about the potential for misuse, =
particularly in stalking and privacy violations.</li><li>Some users discuss=
 the technical aspects of how the AI works and its limitations.</li></ul><h=
2>2. Show HN: My self-written hobby OS is finally running on my vintage IBM=
 ThinkPad</h2><p>This article showcases a personal project where the author=
 has developed a 32-bit hobby operating system that runs on vintage hardwar=
e. The project emphasizes graphics, multitasking, and networking capabiliti=
es. The comments reflect a mix of nostalgia and technical curiosity, with u=
sers discussing the challenges of developing for older systems.</p><h3>Top =
Comments Summary:</h3><ul><li>Many users express admiration for the project=
 and share their own experiences with vintage computing.</li><li>Technical =
discussions arise about the challenges of developing operating systems and =
the importance of community support.</li><li>Some users inquire about poten=
tial future developments and compatibility with modern hardware.</li></ul><=
h2>3. An end to all this prostate trouble?</h2><p>This article explores the=
 common issues related to prostate health, including benign prostatic hyper=
plasia (BPH) and prostate cancer. It discusses a new theory regarding the c=
auses of these conditions and potential treatments. The comments section fe=
atures a mix of personal anecdotes and medical insights.</p><h3>Top Comment=
s Summary:</h3><ul><li>Users share personal stories related to prostate hea=
lth and express hope for new treatments.</li><li>Some comments delve into t=
he science behind the proposed theories and their implications for men's he=
alth.</li><li>Concerns about the accessibility and affordability of new tre=
atments are also discussed.</li></ul><footer><p>This email has been sent by=
 Toolhouse. You can change your delivery preferences at <a href=3D'http://u=
rl1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq=
16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswz4RA_zKD9qStml-2FkjU46ulTqeWVsrM306=
1nr98hteMD12SmA1pxivEVNbKE2Z4kugonOP9QPtkBnfl2HVQ59QCox6e9AvgfMffhrAKB27cXF=
zNHezhYS-2FXcXmMHFze5Bk2QtQz-2F5gc1kbPUBEyi-2B-2Fv69n4qMjgKzSQdJ-2FVeu1-2F1=
IR7Pp591XdOcXKfxmGvOm9AYtD0asr4laRciU2giVlaPMHJg-3D-3D'>Toolhouse Settings<=
/a>.</p></footer><img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du=
001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GKOyKwM-2FDy6T3TsubqWlSA2192=
KzCXh-2FJmuJBcMgTqLu1-2FOk6zSAchcsIDBW5pjyDqkyu1u8hIbzIrZsJCyJJS-2FO1TbpDQO=
wjNTFzYIa-2FsGTpzgHBKHLE4xRVUnqmKeuMFRShfUSlHsJJsHSZZp7DrPlcWtxQhXp2UsvHf7k=
77zUn9JXgxiRSkXfKTXWCYWbuk-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"=
0" style=3D"height:1px !important;width:1px !important;border-width:0 !impo=
rtant;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !im=
portant;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 =
!important;padding-right:0 !important;padding-left:0 !important;"/></body><=
/html>
--31b55a0561607a7df61e0dd6cbc288d8ed123c259655ccfc0a50a9599402--
