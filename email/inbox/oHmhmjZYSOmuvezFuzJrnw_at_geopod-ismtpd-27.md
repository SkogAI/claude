Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:d554:b0:ac7:e5d6:90a7 with SMTP id cr20csp565763ejc;
        Thu, 17 Apr 2025 10:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRjPoIqxcvpDkbSieoWox5zB7s2GuJOzcfgKr5KyF5Mc81vpCbNXT6EZPZT523fn2wiNA6
X-Received: by 2002:a17:902:d58e:b0:224:283f:a9ef with SMTP id d9443c01a7336-22c358c5a6bmr80762505ad.6.1744911076331;
        Thu, 17 Apr 2025 10:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744911076; cv=none;
        d=google.com; s=arc-20240605;
        b=QTkiiBKRX+JWdiRdM1vCBIywBSAEGIT2Jpwz1sTIMMZu08mvlpbl8ZY8v5525knQA6
         KNFv2egxIjRqyH1ANU1/BRxYscktIjMP3k/O4wpF98P1WRmuyzCfOZcvlyKm5upvCQ4k
         ueoiOEz8DSsttZA8rZEOjHPvGvBAr2FITHMQ/JbpSAbKKp9nTxEya+HjLnLGyNtTICQn
         cqB+TjcyULoI9Mq1/EV/176hOSjlySEW/5HyU7GmKhowIMbgEbueSK8PynJq9qPuayAC
         Z+6Ij+dmJVRAIjIJoQR+TLipmliGklnvBFkWxgeQosJySEZrkT1eNJae2S9nWHrCyC7n
         Q2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=r8janEsyKUzMXT4xH/S7JYwuTjskkRoWA4t63oGCL3g=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=AvD62O+fiYMb/Uu5l0qD6Yd8XZ4JjIbg85b/amfYb2h9SBIIy5oNHaecfWTD7fftNQ
         M9jP0DUG8ewdf7PYoglo9vF0V5BEdDYxBtRL1waU/FAAs4u0aG00LguZu/H20V11ijbu
         Wr6dx2O2cS1cyhG6doZradOpNvWGR8fBANNu0n2N5xZM9GTKGeGdK4ZzAOlmDOBaSP2n
         WoHerKr6GEEyKsISX+717C3Wf9UalGXfJh1RHtOg8TBf/dhyqygLqGD5eXOnqP5TzheG
         ilnRe/03+2jigevylFKmpHD2wehCl/D95xtajh3ivCS+2S6QvCTgG/0lc9euFb4CxObF
         1GSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=hOQl1ghP;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Knz88zZk;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsb.outbound-mail.sendgrid.net (s.wfbtzhsb.outbound-mail.sendgrid.net. [159.183.224.107])
        by mx.google.com with ESMTPS id d9443c01a7336-22c50bd99edsi4463255ad.164.2025.04.17.10.31.15
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 10:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) client-ip=159.183.224.107;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=hOQl1ghP;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Knz88zZk;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=r8janEsyKUzMXT4xH/S7JYwuTjskkRoWA4t63oGCL3g=;
	b=hOQl1ghPQGvWiYfmYjaSLE8qpgt1RKN5l/L0CliklPwW5XfwT/yV276qDvpFBqG1yV0N
	SMppn/07h45VcoW5gTuamwR4nrYyD0OCPMbPTn/wxm/2nSGkcBgBzLK4uMgsyIu1G47221
	RdO673kIS2XZfrzG5zHRmYpb+W6TyIiLk3OnsmUzXIvQiOVKm9LTXwY6f+r2SjWc84kwki
	k7kbdeHiP81M+Sgfhs+h0F0+lk6MiKg8Y5/fBFtIlMNSuSfLN9k2oIxv9RtlmRVkIqkDon
	o5ulxhwu+nDu5i1ao629TvaFB46NKPyFqAsfcPy3mmY6Ex35hho9+v/tg9ZAVikQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=r8janEsyKUzMXT4xH/S7JYwuTjskkRoWA4t63oGCL3g=;
	b=Knz88zZkSbSmzbdGaVwL6Mykn7jg+1dALekp1hLz8RmgFRwd2YmTl5sYe3OpzBcrvH7O
	vU8/tkhYoMoU6B7E7ztz7jkgglmgIQJb3qXiSNSPFUzMpIkb/kTknjHhcKvpecCZM/KVfM
	Cjp8IjBExn/9TPFR2NNuw0NBoDuu9ak4Y=
Received: by recvd-84ff9c6c5c-mxfdk with SMTP id recvd-84ff9c6c5c-mxfdk-1-68013AE1-F
	2025-04-17 17:31:13.290583923 +0000 UTC m=+760819.331995264
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-27 (SG) with HTTP
	id oHmhmjZYSOmuvezFuzJrnw
	Thu, 17 Apr 2025 17:31:13.245 +0000 (UTC)
Content-Type: multipart/alternative; boundary=b01e2fcf9bc7fae6a4978f5531c9ae5bdd47ceb064ca9c14c54a7b06254b
Date: Thu, 17 Apr 2025 17:31:13 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <oHmhmjZYSOmuvezFuzJrnw@geopod-ismtpd-27>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5A4qiYlpBVTVH=2Fl?=
 =?us-ascii?Q?kDtVjKBzE0zrbpL4LneK+qTExdNkkp=2Fprlju0dk?=
 =?us-ascii?Q?cS1zwSdu9nTvPcgb7TEOWAP4G4MxSIy5yg36TgH?=
 =?us-ascii?Q?b6W+yN+J2UapSyxPoWFmNpWxcWV0ueTfabiCjDy?=
 =?us-ascii?Q?VmOK90pIf63f8JKpqBxYwQzQHVCH2z1tUhoia2Q?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: GStXJ11l767u

--b01e2fcf9bc7fae6a4978f5531c9ae5bdd47ceb064ca9c14c54a7b06254b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0

Your Hacker News Digest1. An Intro to DeepSeek's Distributed File System
This article discusses the 3FS (Fire-Flyer File System) released by DeepSee=
k, which is a distributed filesystem designed to handle massive amounts of =
data with high throughput. It abstracts the complexities of distributed sto=
rage, allowing users to interact with it as if it were a local filesystem. =
The article dives into its architecture, advantages, and practical applicat=
ions in various fields.Top Comments:Architecturally, it is a scale-out meta=
data filesystem.3FS isn't particularly fast in mdbench, though.JuiceFS is v=
ery good and supports lots of DBs.2. Top OpenAI Catastrophic Risk Official =
Steps Down Abruptly
Joaquin Qui=C3=B1onero Candela, the former head of OpenAI's Preparedness te=
am, has stepped down to return to coding after years in management. His dep=
arture raises concerns about the stability of OpenAI's safety protocols ami=
dst a series of leadership changes and controversies within the organizatio=
n.Top Comments:Companies self-regulating around safety is even worse than b=
anks self-regulating before 2008.People should stop quitting as a moral pro=
test when companies go against their principles.Click bait. This wasn't abr=
upt, and it has nothing to do with a safety crisis at OpenAI.3. Show HN: Ag=
entAPI =E2=80=93 HTTP API for Claude Code, Goose, Aider, and Codex
AgentAPI is a tool that allows users to control various coding agents throu=
gh an HTTP API. It provides a unified interface for interacting with differ=
ent coding agents, making it easier to build applications that leverage AI =
coding capabilities.Top Comments:It's a very different architecture.AgentAP=
I solves the problem of how to programmatically control coding agents.How e=
asy is it to disable DeepSeek's distributed FS?
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--b01e2fcf9bc7fae6a4978f5531c9ae5bdd47ceb064ca9c14c54a7b06254b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. An Intro to DeepSeek's D=
istributed File System</h2><p>This article discusses the 3FS (Fire-Flyer Fi=
le System) released by DeepSeek, which is a distributed filesystem designed=
 to handle massive amounts of data with high throughput. It abstracts the c=
omplexities of distributed storage, allowing users to interact with it as i=
f it were a local filesystem. The article dives into its architecture, adva=
ntages, and practical applications in various fields.</p><h3>Top Comments:<=
/h3><ul><li>Architecturally, it is a scale-out metadata filesystem.</li><li=
>3FS isn't particularly fast in mdbench, though.</li><li>JuiceFS is very go=
od and supports lots of DBs.</li></ul><h2>2. Top OpenAI Catastrophic Risk O=
fficial Steps Down Abruptly</h2><p>Joaquin Qui=C3=B1onero Candela, the form=
er head of OpenAI's Preparedness team, has stepped down to return to coding=
 after years in management. His departure raises concerns about the stabili=
ty of OpenAI's safety protocols amidst a series of leadership changes and c=
ontroversies within the organization.</p><h3>Top Comments:</h3><ul><li>Comp=
anies self-regulating around safety is even worse than banks self-regulatin=
g before 2008.</li><li>People should stop quitting as a moral protest when =
companies go against their principles.</li><li>Click bait. This wasn't abru=
pt, and it has nothing to do with a safety crisis at OpenAI.</li></ul><h2>3=
. Show HN: AgentAPI =E2=80=93 HTTP API for Claude Code, Goose, Aider, and C=
odex</h2><p>AgentAPI is a tool that allows users to control various coding =
agents through an HTTP API. It provides a unified interface for interacting=
 with different coding agents, making it easier to build applications that =
leverage AI coding capabilities.</p><h3>Top Comments:</h3><ul><li>It's a ve=
ry different architecture.</li><li>AgentAPI solves the problem of how to pr=
ogrammatically control coding agents.</li><li>How easy is it to disable Dee=
pSeek's distributed FS?</li></ul><footer><p>This email has been sent by Too=
lhouse. You can change your delivery preferences at <a href=3D'http://url12=
28.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZ=
ZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswj2Bq_zKD9qStml-2FkjU46ulTqeWVsrM3061nr9=
8hteMD12SmCftHip-2Bh2-2BbvzXnPzuugmsO3KT7S89GKO3unq-2B-2B6y-2FVKQGirXG7yOp2=
lCR2DhMx4BCqOlBwm6bETAsNz3quAsE7YWDp1xUAxk0anXp3iNeaeVJp9eqlxbjXY6WmnzTndMk=
oZZZXfuqzfs2EFmgBtGzOvnh6YzvQMd2zyyjE9dedQ-3D-3D'>here</a>.</p></footer><im=
g src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqh=
c9sx2P513JhjX8oSKm62DliywF0GIJa4l4UEymLoHpc9hd0jyEa5my-2FkJvhEixm3OB09yyXhz=
y2TbECGbZuEhaiBNB3TtT5mHffuQdRmviqzpNUfd2V0VPZo3uUjEKx-2BGhO0hV3ka1VgHey0p5=
wyYEzxHsck6csNZktJUj6d8CGYcvAoiiSfexsS-2BrYfqGNWijuodpajt5yENOv3Wwlu1wvsEZr=
lo-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !=
important;width:1px !important;border-width:0 !important;margin-top:0 !impo=
rtant;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !i=
mportant;padding-top:0 !important;padding-bottom:0 !important;padding-right=
:0 !important;padding-left:0 !important;"/></body></html>
--b01e2fcf9bc7fae6a4978f5531c9ae5bdd47ceb064ca9c14c54a7b06254b--
