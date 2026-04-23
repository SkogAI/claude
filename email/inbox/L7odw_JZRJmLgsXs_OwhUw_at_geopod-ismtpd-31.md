Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:3905:b0:abc:2b0f:5fd9 with SMTP id so5csp782221ejc;
        Fri, 7 Mar 2025 09:32:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLkycexNpqElN93jIebrhIK4f7JhZZMHMiAt7O99mcXhEBWLX5lwnTpRLTudZx4JXfbeAR
X-Received: by 2002:a05:622a:1a25:b0:475:408:c446 with SMTP id d75a77b69052e-4761095013emr57699201cf.4.1741368744329;
        Fri, 07 Mar 2025 09:32:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741368744; cv=none;
        d=google.com; s=arc-20240605;
        b=NxjGAsHE0TPLq3Jk475uxEofrhEh5oCDxMijgZepLvUjntd5t4hreN/BPAudVfDowk
         +WBi1CoWsFghvl5Nbgy6btaBFWnHJNHGQdneDSKcksbUJgiOOjT5NXKO4zA2llxGB5t4
         hILpMGb+hi0gcU8l9acGrnlAHT1mTH/4UalJgEUr0OVq1NKdnA9fG7pxZ2gbkWAgUy3R
         3EE13/Y+VxeQF8hOvwHkmVLfM5kHHWbE+1zB/vluSdSUF17L+1shOdoQR//Qzh5uFAyW
         OZsSHUBRXGEushi0vTkqpqnpn8lrVx16CiggEPXjJ2oH+guvL547h/B2rwdn+cIfElAh
         hFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=DgCF7IcijwQwTAZ991g9Gfn84T2xdgt5nnbPEqVqEqE=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=QHlSfdIrc2469tT+fdfhwhb5+cDYd3W2WL5yEY874M9m3Dpwsm1PEU6UnsKHGwMaEY
         Mr1VBJgBvO98Pa67HW4WFHohVexOsiI+Sk3fe1Uhu5lSr0pDQHvukP4K6or572iaa7Zz
         qT5UWa87j+FtD+jNiPxr/vI3Izs5nVCGLqy3Vpk5Rrv8qImcxRz8cJLaJteDYAS131/v
         4Z9RlrgUX9qhdEEm3ACIvY/LGOjWcOV/yeQZvnBdE8bvtKFgcKnkkqqcxa/ktUQcMqxV
         J0ZjG0f6uN+JontVtxClaVqsRCKHXchb1WGY+kYksKt8dwbjDSI1su2lmpXYY2JsWm/Q
         mk2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="nO/p6CSO";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Dtujtcbr;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsb.outbound-mail.sendgrid.net (s.wfbtzhsb.outbound-mail.sendgrid.net. [159.183.224.107])
        by mx.google.com with ESMTPS id d75a77b69052e-4751d9c481fsi39617501cf.196.2025.03.07.09.32.23
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 09:32:24 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) client-ip=159.183.224.107;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="nO/p6CSO";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Dtujtcbr;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=DgCF7IcijwQwTAZ991g9Gfn84T2xdgt5nnbPEqVqEqE=;
	b=nO/p6CSON5s/z1O1yr312h0RLCUHs7fDTpTSJA6vmIEJVmWZI3hDB2TDojYD4MRHVcTQ
	PVrmMcpprK99FJXM5k1hVNAaJFD9oTrmfoLgi/00zjK3OZV2+hD1Czuhd86d+gC7+UZSSU
	HIoX/3l22S1hyTW3KOaiBztAwBuPG2hzZAwoP9Kx4xsUOdHYlXyNTt2632aQxSXpJ74C/Y
	DDUSGk0mkqnCjI4JACB0vHd+t17p8m9rYPJJfGyW4veIPoRN6ODN9ecY5CY1hC3+tvMlnm
	ktNr3GyadidZjYTTW11Kgt2eUPIcFqUhJfv2DAQ4NYEaOJ2evVB4IqKT3tv6AHtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=DgCF7IcijwQwTAZ991g9Gfn84T2xdgt5nnbPEqVqEqE=;
	b=DtujtcbrixJOYSgo974SqKPmwE6ktSrS6uHdz/v6jqoTs6FsBzRKDnfp4dVxAY3TpXgx
	Y6XxU1/EhMpgyL0LmkvO2d9ccXERKik9Udfc8KsPvmbzhY1LsoEe6atAnkHisYX870KDkg
	rRMK4kDnD18YlTPk+G7S9cV3Nq+Zpt1qo=
Received: by recvd-69cbc48b94-cc5f7 with SMTP id recvd-69cbc48b94-cc5f7-1-67CB2DA6-1
	2025-03-07 17:32:22.115160602 +0000 UTC m=+9749279.394914831
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-31 (SG) with HTTP
	id L7odw_JZRJmLgsXs_OwhUw
	Fri, 07 Mar 2025 17:32:22.069 +0000 (UTC)
Content-Type: multipart/alternative; boundary=7f4a1c12567592266f263afac1e5f3a1a7d800754e5f53887083e4b46f6f
Date: Fri, 07 Mar 2025 17:32:22 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <L7odw_JZRJmLgsXs_OwhUw@geopod-ismtpd-31>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7OAymvMXxtGXw0c?=
 =?us-ascii?Q?nlDokD7Cez0XErytQONcuCjYDJf7htF5VUFAR4f?=
 =?us-ascii?Q?Vh3vIjda5xRr6UwKs7WB5+BUc9p0EI4jxQEJ=2FKz?=
 =?us-ascii?Q?Ozl+DMy4+ReRMZ1PLOwmHUNCqxdNfHUcIQdjlyw?=
 =?us-ascii?Q?icbJZIXAQEMK9g8fLKAP6=2FZM=2FHs3M8PJ+NTx6GX?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 10Z9lK8rLavV

--7f4a1c12567592266f263afac1e5f3a1a7d800754e5f53887083e4b46f6f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Eden Abhez: The strangest hit songwriter
This article explores the life of Eden Ahbez, the composer of the iconic so=
ng "Nature Boy". It details how Ahbez, a one-hit wonder, lived a unique lif=
estyle that anticipated the hippie movement. Despite his success, he strugg=
led with fame and remained an eccentric figure in the music world.Top Comme=
nts:Many readers were surprised to learn about Ahbez's influence on music a=
nd his unconventional lifestyle.Some commenters discussed the song's musica=
lity and its connection to other works.2. Making my local LLM voice assista=
nt faster and more scalable with RAG
This blog post discusses the author's efforts to improve the performance of=
 a local voice assistant using Retrieval Augmented Generation (RAG). The au=
thor shares insights on optimizing language model performance and the chall=
enges faced in achieving faster response times.Top Comments:Readers appreci=
ated the technical depth and practical solutions presented in the article.T=
here was a lively discussion about the implications of using RAG in voice a=
ssistants.3. Face of ancient Australian 'giga-goose' revealed after fossil =
skull found
The article reports on the discovery of a skull belonging to the extinct bi=
rd *Genyornis newtoni*, providing insights into its appearance and lifestyl=
e. The findings suggest that this giant bird lived over 45,000 years ago an=
d went extinct shortly after humans arrived in Australia.Top Comments:Comme=
nters debated the reasons behind the extinction of *Genyornis*, discussing =
the roles of climate change and human activity.Many expressed fascination w=
ith the discovery and its implications for understanding prehistoric life.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--7f4a1c12567592266f263afac1e5f3a1a7d800754e5f53887083e4b46f6f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Eden Abhez: The stranges=
t hit songwriter</h2><p>This article explores the life of Eden Ahbez, the c=
omposer of the iconic song "Nature Boy". It details how Ahbez, a one-hit wo=
nder, lived a unique lifestyle that anticipated the hippie movement. Despit=
e his success, he struggled with fame and remained an eccentric figure in t=
he music world.</p><h3>Top Comments:</h3><ul><li>Many readers were surprise=
d to learn about Ahbez's influence on music and his unconventional lifestyl=
e.</li><li>Some commenters discussed the song's musicality and its connecti=
on to other works.</li></ul><h2>2. Making my local LLM voice assistant fast=
er and more scalable with RAG</h2><p>This blog post discusses the author's =
efforts to improve the performance of a local voice assistant using Retriev=
al Augmented Generation (RAG). The author shares insights on optimizing lan=
guage model performance and the challenges faced in achieving faster respon=
se times.</p><h3>Top Comments:</h3><ul><li>Readers appreciated the technica=
l depth and practical solutions presented in the article.</li><li>There was=
 a lively discussion about the implications of using RAG in voice assistant=
s.</li></ul><h2>3. Face of ancient Australian 'giga-goose' revealed after f=
ossil skull found</h2><p>The article reports on the discovery of a skull be=
longing to the extinct bird *Genyornis newtoni*, providing insights into it=
s appearance and lifestyle. The findings suggest that this giant bird lived=
 over 45,000 years ago and went extinct shortly after humans arrived in Aus=
tralia.</p><h3>Top Comments:</h3><ul><li>Commenters debated the reasons beh=
ind the extinction of *Genyornis*, discussing the roles of climate change a=
nd human activity.</li><li>Many expressed fascination with the discovery an=
d its implications for understanding prehistoric life.</li></ul><footer><p>=
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokM=
j2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswwBZf_zKD=
9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDAgIZoXS2LiNhzTqC5kfWXgyoKj55GuBTK=
r7FyvRC0gjZbEi1BJXDxtqYnpN9TS7O0mn-2FVMbIXcOfS8xzaVoiS9-2F8TC0DejKY1LNdBX9j=
Aytki5pYKUIWoflKXWZ2zykAlLUr2QLu-2FvUQU-2F-2FlQXh7VIF5uuthKTOqW7xzC2Vj67g-3=
D-3D'>here</a>.</p></footer><img src=3D"http://url1228.toolhouseai.com/wf/o=
pen?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GJB8eAsmp0qoZMn-2=
FrfVQUh2SGS5IPvg3Bx4f7IasQyEmGYH-2FFkFUFZRUnu-2FZEo2yDAYzy1PIJmVo32iRbIPLvq=
pvyuYHRjVSu8VTR7RsCCUhKFrf0mlj618p470HW5hDLK2nWgDuS7fchzPAt4W8pkqm9KGuqm2ge=
bAZs0ox2LJVEL-2FumuIX0b-2FoDTLSJGFtHo-3D" alt=3D"" width=3D"1" height=3D"1"=
 border=3D"0" style=3D"height:1px !important;width:1px !important;border-wi=
dth:0 !important;margin-top:0 !important;margin-bottom:0 !important;margin-=
right:0 !important;margin-left:0 !important;padding-top:0 !important;paddin=
g-bottom:0 !important;padding-right:0 !important;padding-left:0 !important;=
"/></body></html>
--7f4a1c12567592266f263afac1e5f3a1a7d800754e5f53887083e4b46f6f--
