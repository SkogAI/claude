Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:9488:b0:ac7:e5d6:90a7 with SMTP id dm8csp1589390ejc;
        Sun, 13 Apr 2025 10:31:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpj8s4wKJfGO1n9/2+3n7D/qVQy61PVa3jpBlvHMGhxw1b/IzeisPjXRK2xuYrScYuZlOi
X-Received: by 2002:ad4:5f45:0:b0:6e6:6964:ca77 with SMTP id 6a1803df08f44-6f23a0dbb5amr158173336d6.28.1744565489903;
        Sun, 13 Apr 2025 10:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744565489; cv=none;
        d=google.com; s=arc-20240605;
        b=WCsjJ4rWXy8y0UHaAAmdOuFOasJdMbb3/T1yRS/IpdWeH2i9pKt0oNP1u5bky84YHH
         T3Drf7eyZVl/Xs+3XROpejg6DZ+14HsF17os0F+m+t4Tc+j21nWfg2WR7uQeikvvWROS
         WKZHRINpYN7a/jnFNs2Qi0+TZ+DmAaU8H8kf1fJJrYcBjjNogX83G7UuIPg19fTJpKk+
         zo/JBm00ikTCWvyNee7yhiok/YiLacpxtbDJFwy9M6aFdrvkX47max0aLYcjgTOD/ULA
         FnJu3rkDXcO9h0+SCyP0y/irb4iWGvbMlfBnJ1H2zw9bZveQjOC9K5mdmo/YbDsACf9M
         eeng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=bzleYO8k8j5M6Dfr3okWkd1drvA8uKcf+Cuo1CqQOhY=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=NU6h7hn2Cn/rQR7AQ/DXAu+IVBQUCRQNTnPZKPPqb222R4HkBdTqlXFVMlJW+CRCDp
         8wbdaanoaPlFL8YzPkz1jk4YiIhlMawz4ITAXfifEtYrujIEZJBHFGDyGyRx7icmCtAx
         tqoFZVUVbRtvqhmxJ6Q6qLJFzhNbie5cvxNSpBbxB/QSkwqxofE3jDKyNaFl3QONmB+D
         fb1shGunIe3gzOeprxaDdV+y43gpyc+GpLfkkAzODyk2cmD64c4lb5Nr2SP7p4ecDbg9
         3O+kWk55wT63rR54n62+LKySZCQt0bgb/feUmrmHdJUsQ3wu6pjxlQV6nSV9i7w1/pEr
         D/4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=k7urNXYJ;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=K19X1wHT;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de970e59si89033316d6.119.2025.04.13.10.31.29
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 10:31:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=k7urNXYJ;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=K19X1wHT;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=bzleYO8k8j5M6Dfr3okWkd1drvA8uKcf+Cuo1CqQOhY=;
	b=k7urNXYJTsyRI07rIL2H8QdnW2Swu4uzdtbxVcqf+So8HpWXUYjIwjCWuEkkR6VwBUZB
	9H/M+SFCyBhG359DaOQrddpLRsLK2WcTx+uv7jvNiRrwz3nxqNDgm8aLdhnz7siJ3rrQIE
	fy8+a3PZOdXY/WXOA44rOL10KmeDHHm611+50J4EVchQcoxfhPOwSfBEKPcaIBOTNYx2TG
	Q++fQRzfNl/sdBHSxL0nM37XVw6OQvpMzU6smBiCxqsU6dhSMFeu/iSDp1XJPEdOb2ZcZq
	A4PehoVES4nIelkvMpFmX1R0N7saVT8fxpHOCBYXERA0gjfx6bemrvVfzREufA3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=bzleYO8k8j5M6Dfr3okWkd1drvA8uKcf+Cuo1CqQOhY=;
	b=K19X1wHTNC8gXzobmtSLXl9Z6gR6k1eIeHi7x8b2Op+064LDNaX62L8uSZ4au7jPyIUR
	LzB5+AF6Rl0iPlpLqMx3o/3c73fWhNYpRgpHSGM1g4/htW+E3C0HbyH5pkjiGEC+txLA5K
	JmsdP7B4dJDOFHMlqB5A8VML/0G39PToI=
Received: by recvd-b7858b88-wr4sr with SMTP id recvd-b7858b88-wr4sr-1-67FBF4F1-25
	2025-04-13 17:31:29.175649831 +0000 UTC m=+415396.725895616
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-32 (SG) with HTTP
	id UcwKrSN9S9-pCaGdRaqVIw
	Sun, 13 Apr 2025 17:31:29.156 +0000 (UTC)
Content-Type: multipart/alternative; boundary=3031d50a4b0d98849da230cf648f755823e923264c1d5913a6c7cfe3fbc8
Date: Sun, 13 Apr 2025 17:31:29 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <UcwKrSN9S9-pCaGdRaqVIw@geopod-ismtpd-32>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5f+XvF10Df7CeDE?=
 =?us-ascii?Q?MtuSV+JFSK2ufDy8jGj7XB03RUsN4Kz9f8dscGX?=
 =?us-ascii?Q?eDvKtKADSv2LpGjzvDht5jLQGlZMUd5plrR6U8u?=
 =?us-ascii?Q?TmtaZt4yYWMuL13DMa1iB1Mvd3kNQAEI2VlitC9?=
 =?us-ascii?Q?o2XK41TydVpj3dDAIAoWAB25WGvXkWW+X7EED2Y?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: g5Ap2OhtbBhZ

--3031d50a4b0d98849da230cf648f755823e923264c1d5913a6c7cfe3fbc8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
1. The Dark Side of the Moomins
This article explores the complex themes within Tove Jansson's Moomin stori=
es, highlighting how they are often misinterpreted as simple tales of domes=
tic life. The author discusses the darker undertones and the existential th=
emes present in the narratives, which reflect Jansson's own experiences dur=
ing tumultuous times.
Top Comments:
Many readers appreciate the whimsical yet profound nature of the Moomins, n=
oting that the stories resonate with both children and adults.
Some argue that the article overanalyzes the darker aspects, emphasizing th=
e wholesome family dynamics portrayed in the stories.
Others reflect on their personal experiences with the Moomin tales, sharing=
 how they introduced them to their children.
2. Skywork-OR1: New SOTA 32B Thinking Model with Open Weight
This post introduces the Skywork-OR1 model series, which includes powerful =
reasoning models trained using large-scale rule-based reinforcement learnin=
g. The article emphasizes the open-weight nature of the models, which is se=
en as a significant step forward in the field.
Top Comments:
Users discuss the implications of training models on lower-parameter versio=
ns and the potential for innovation with open weights.
There is excitement about the performance metrics and the open-source relea=
se of the training code.
3. Why Fennel?
This article discusses Fennel, a programming language that runs on the Lua =
runtime. It highlights the simplicity and power of Lua while explaining how=
 Fennel addresses some of its shortcomings, making it a more user-friendly =
option for developers.
Top Comments:
Readers share their positive experiences with Fennel, particularly in conve=
rting their configurations.
There is a discussion about the advantages of using Fennel over Lua, especi=
ally regarding syntax and error handling.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--3031d50a4b0d98849da230cf648f755823e923264c1d5913a6c7cfe3fbc8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html>
<body>
<h1>Your Hacker News Digest</h1>
<h2>1. The Dark Side of the Moomins</h2>
<p>This article explores the complex themes within Tove Jansson's Moomin st=
ories, highlighting how they are often misinterpreted as simple tales of do=
mestic life. The author discusses the darker undertones and the existential=
 themes present in the narratives, which reflect Jansson's own experiences =
during tumultuous times.</p>
<h3>Top Comments:</h3>
<ul>
<li>Many readers appreciate the whimsical yet profound nature of the Moomin=
s, noting that the stories resonate with both children and adults.</li>
<li>Some argue that the article overanalyzes the darker aspects, emphasizin=
g the wholesome family dynamics portrayed in the stories.</li>
<li>Others reflect on their personal experiences with the Moomin tales, sha=
ring how they introduced them to their children.</li>
</ul>

<h2>2. Skywork-OR1: New SOTA 32B Thinking Model with Open Weight</h2>
<p>This post introduces the Skywork-OR1 model series, which includes powerf=
ul reasoning models trained using large-scale rule-based reinforcement lear=
ning. The article emphasizes the open-weight nature of the models, which is=
 seen as a significant step forward in the field.</p>
<h3>Top Comments:</h3>
<ul>
<li>Users discuss the implications of training models on lower-parameter ve=
rsions and the potential for innovation with open weights.</li>
<li>There is excitement about the performance metrics and the open-source r=
elease of the training code.</li>
</ul>

<h2>3. Why Fennel?</h2>
<p>This article discusses Fennel, a programming language that runs on the L=
ua runtime. It highlights the simplicity and power of Lua while explaining =
how Fennel addresses some of its shortcomings, making it a more user-friend=
ly option for developers.</p>
<h3>Top Comments:</h3>
<ul>
<li>Readers share their positive experiences with Fennel, particularly in c=
onverting their configurations.</li>
<li>There is a discussion about the advantages of using Fennel over Lua, es=
pecially regarding syntax and error handling.</li>
</ul>

<footer>
<p>This email has been sent by Toolhouse. You can change your delivery pref=
erences at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.du=
okMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswf51p_=
zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBADAjl3vF1bZtH3KJ34EuY8XfnM02cI=
LwLMP9VstOfktNvQ3M9Qf9OB8JUmEY87OxW-2FreN6ulXLaYFq3VgpMB1YFWYJkJdAmG666cwf4=
UeldSuOHJDUrw-2BRVQ0OYoCjbziNw4KjDMd1ZlnlOCnE9ITxXHNuacU77d-2Bv-2Fn3P8lRwg-=
3D-3D'>Toolhouse Settings</a>.</p>
</footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GKtMn-2FwmG6wNgyBSTDdALmBaaby3CmI8doWPVWWQgpz=
EQNIbGWkk9se2OaJOmvc3P8mscHda28eS8FRwqJbcHkh7-2F73qnfBPrXGtPQwyR-2Ba3rY7uvv=
5XEkvZQs-2B-2BTUOiqJjQYR1XUdva2Kc4AsSIr3L9EHZ-2F9iKAzlpe9w2EvbToA-3D-3D" al=
t=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important=
;width:1px !important;border-width:0 !important;margin-top:0 !important;mar=
gin-bottom:0 !important;margin-right:0 !important;margin-left:0 !important;=
padding-top:0 !important;padding-bottom:0 !important;padding-right:0 !impor=
tant;padding-left:0 !important;"/></body>
</html>
--3031d50a4b0d98849da230cf648f755823e923264c1d5913a6c7cfe3fbc8--
