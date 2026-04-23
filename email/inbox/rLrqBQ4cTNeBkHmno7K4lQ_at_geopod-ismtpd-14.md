Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:96a7:b0:ac7:e5d6:90a7 with SMTP id hd39csp1453090ejc;
        Wed, 16 Apr 2025 10:37:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBEeJnnSWEQDHajcTthCovFtjse4crD8aU59J7zR1pwUPs4GVwQw8gzqf8mmqLU+YZRX04
X-Received: by 2002:a05:690c:7344:b0:6f9:544f:67dc with SMTP id 00721157ae682-706b325d72dmr40620407b3.1.1744825057425;
        Wed, 16 Apr 2025 10:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744825057; cv=none;
        d=google.com; s=arc-20240605;
        b=PU9HKC9y2Ggue+PSW9HmZyPoga1XasD0n2ZN58CAZmDmZDqrdhCd5i3Ejxt3Op6RmH
         oQFt8qoangURocqOV488CxkVx4B3ETKgt7ImOsenoHe35/loXelt8hhSpl7kd4ZyVDHE
         eJOfToUGaSL7DZKIjRF/OPFsKdy3pUQvbElI79Y5Seg7DIjoz9n0i2t7ievw6ZrBoCoM
         kqZaCpQYHMURaHLoTu10ogYEaulqqGoYzoD2uUHWBGpCLdOOKcRy1LJBnhqHk96cc9wG
         TP6bVsPnMUs17ydZU/VgwFQurfkq+BBHnLxcNmC6aDG4wthUu6Xh/gV6oPoStJIuoSzp
         eDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=03+G6LpHMicTlgq8kjV9uSXSZ+vwniH2AHIOpdP0KsA=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=OfcO97dzS9Ln234GS4whjhIt/cg6FqhpkSINoQU88QLslGS71y6Mr9yG2Afr4x1Gc2
         CO9jU/zPPEW/M/Xe2LBefZTw56aMA8U6EEPIts24v/KyXWo42Y9zBzPZ/3M8Zk7zCnTl
         qmE9h0dpBrwrOdQ7yOLIrRA4c7g7nCRyFUo/bWRANyaa4TJGHWELgFD3XRLIojNfZx7D
         8dzIhRwOYZRewmtrEY7vZf70cuLkF7vHxOm4cpd7mcRzK0POpBUvASrmDdrab456nY/W
         cUa95FkPnSPjf/J/MlSF3p6alWhVL19Id8HNmdRA/omsaurbKMhT63iHXNmfKjbEiPbi
         SLfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="xRWW/Glb";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=lK1sfr91;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id 00721157ae682-7053e0ebbc0si228321467b3.44.2025.04.16.10.37.36
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 10:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="xRWW/Glb";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=lK1sfr91;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=03+G6LpHMicTlgq8kjV9uSXSZ+vwniH2AHIOpdP0KsA=;
	b=xRWW/GlbQ6M9glxcVncb0O8F+9hYTJek+MzG0tFmiCMnd+1JIkCfrLlyJ59zFA7nfn6x
	PisfyY0DYK1UFIOMHFWJgv9tTQVO+CgOIZtfesRleDOuxjwb/G1mDisCqwp+Y43gyWLMGL
	sFyiaapvGdMSSeVTLiTNRqIGR4cA9OeFXHD8TGTkfQDxQ1Yvx6Nx2FdwSnZq+v9wX+FBqM
	deHG/rWiY1SRaWuHMeSFlMoKRv7sA7GRJr3Nufzu7CznZrSo+C8TvW8JWRxEKKhZjIRdLF
	VtBx4aGRSvQomEl0Yzzdch3rfTIMqtxkrZlLymrRv9Bb9aOaVEXkAqKn5e/lyp+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=03+G6LpHMicTlgq8kjV9uSXSZ+vwniH2AHIOpdP0KsA=;
	b=lK1sfr91/hUuHVNyBvWqp2X0qN15tyFV78zbqWVhK7mQTe6BZTiJaoCmhUYl12JBf7kM
	wCU88C7rUSUSv849pnB8+V+gy7hbdJlJc0o584ZnPLI6iUohUnTH+6klLJzk1Cbz/YCr0a
	ro0Uu2K2sSMlxgnHifzOE4p3rHVcL3LTc=
Received: by recvd-545d4d4647-bjnsl with SMTP id recvd-545d4d4647-bjnsl-1-67FFEADF-9
	2025-04-16 17:37:35.050703782 +0000 UTC m=+674974.221282495
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-14 (SG) with HTTP
	id rLrqBQ4cTNeBkHmno7K4lQ
	Wed, 16 Apr 2025 17:37:35.027 +0000 (UTC)
Content-Type: multipart/alternative; boundary=5f4c1b5c560618c28ee6e12226f4dc76b5c01e10d664d55ce50c3a06a141
Date: Wed, 16 Apr 2025 17:37:35 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <rLrqBQ4cTNeBkHmno7K4lQ@geopod-ismtpd-14>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7pFqdo4tZH8ZKyi?=
 =?us-ascii?Q?VoQw2g4QbbvZjP3oC6bEGSSf9qVACJogpbHODsV?=
 =?us-ascii?Q?mzpq0r1KLInd53TP2iVqtSyZvjlY97aPBaTdUqD?=
 =?us-ascii?Q?JkZg7SUqGq4wXJ=2FOiu7BXOOwMwGUkt3jAFMyAQt?=
 =?us-ascii?Q?+71AdU2c4n92Rh76aX2sKU8dFzSSZNyoPPi+rhR?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 7Cj7SxFjEUq0

--5f4c1b5c560618c28ee6e12226f4dc76b5c01e10d664d55ce50c3a06a141
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0

Your Hacker News Digest1. Darwin's Children Drew All Over the Manuscript
Yesterday was Darwin Day, marking the 205th anniversary of the great natura=
list=E2=80=99s birth. The article discusses the digitized work of Darwin, i=
ncluding drawings made by his children on the manuscript of "On the Origin =
of Species." These drawings provide a glimpse into the family life of Darwi=
n and the creativity of his children.Top Comments:One user reflects on the =
continuity of human nature through history.Another comments on the societal=
 changes in parental responsibilities.2. Damn Vulnerable MCP Server
This project is an educational tool designed to demonstrate security vulner=
abilities in Model Context Protocol (MCP) implementations. It includes vari=
ous challenges that showcase different types of vulnerabilities and attack =
vectors.Top Comments:Users discuss the importance of understanding these vu=
lnerabilities in the context of AI safety.Some express nostalgia for progra=
mming in assembly language.3. Dirty Tricks 6502 Programmers Use
This article recaps coding tricks used in a Commodore 64 coding competition=
, focusing on how to create efficient code in assembly language. It highlig=
hts various techniques and optimizations that programmers used to achieve t=
heir goals.Top Comments:Users share their experiences with different memory=
 layouts in programming.There are discussions about the evolution of progra=
mming languages and techniques.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--5f4c1b5c560618c28ee6e12226f4dc76b5c01e10d664d55ce50c3a06a141
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Darwin's Children Drew A=
ll Over the Manuscript</h2><p>Yesterday was Darwin Day, marking the 205th a=
nniversary of the great naturalist=E2=80=99s birth. The article discusses t=
he digitized work of Darwin, including drawings made by his children on the=
 manuscript of "On the Origin of Species." These drawings provide a glimpse=
 into the family life of Darwin and the creativity of his children.</p><h3>=
Top Comments:</h3><ul><li>One user reflects on the continuity of human natu=
re through history.</li><li>Another comments on the societal changes in par=
ental responsibilities.</li></ul><h2>2. Damn Vulnerable MCP Server</h2><p>T=
his project is an educational tool designed to demonstrate security vulnera=
bilities in Model Context Protocol (MCP) implementations. It includes vario=
us challenges that showcase different types of vulnerabilities and attack v=
ectors.</p><h3>Top Comments:</h3><ul><li>Users discuss the importance of un=
derstanding these vulnerabilities in the context of AI safety.</li><li>Some=
 express nostalgia for programming in assembly language.</li></ul><h2>3. Di=
rty Tricks 6502 Programmers Use</h2><p>This article recaps coding tricks us=
ed in a Commodore 64 coding competition, focusing on how to create efficien=
t code in assembly language. It highlights various techniques and optimizat=
ions that programmers used to achieve their goals.</p><h3>Top Comments:</h3=
><ul><li>Users share their experiences with different memory layouts in pro=
gramming.</li><li>There are discussions about the evolution of programming =
languages and techniques.</li></ul><footer><p>This email has been sent by T=
oolhouse. You can change your delivery preferences at <a href=3D'http://url=
1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16=
oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswlgUL_zKD9qStml-2FkjU46ulTqeWVsrM3061n=
r98hteMD12SmDgwKiiNcXnJwsboheHXCmE79Qqol8NABhrKmJjobd744zR3TdJsjDGqmoY9cJRL=
X2RF5km1YgNMS1Z-2BmEGpc0kksoLVfP3fAYGB-2BT8sqE-2FA9MzsUmIojILJZECwvYby764tx=
gmyGwOQPKiSTPB-2Fa-2Be6SMvH-2FDTEctb80vJzmC-2FGw-3D-3D'>here</a>.</p></foot=
er><img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgx=
xDtaqhc9sx2P513JhjX8oSKm62DliywF0GLKxoPq-2Fa4IQ1U-2BaxxdZk7twPmJ6jqxOx-2BdC=
W6oXHsKr2PEbhe19TQlbUbB3kacQPmUXkY37Ve3XOsllpPUVzPqzHQZXw-2Bm5om5T4jB-2F048=
0wcWcm3E1R0kFkCMuALHbzQE2forU3dXTYXHuEjaZA-2BzTxH34cJ79p8iZVAlT1Zw52kzfQ52p=
zYolBKPutbEy4U-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"=
height:1px !important;width:1px !important;border-width:0 !important;margin=
-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;marg=
in-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;p=
adding-right:0 !important;padding-left:0 !important;"/></body></html>
--5f4c1b5c560618c28ee6e12226f4dc76b5c01e10d664d55ce50c3a06a141--
