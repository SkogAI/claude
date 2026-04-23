Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:7049:b0:ac7:37f3:5ea9 with SMTP id ws9csp3573773ejb;
        Thu, 3 Apr 2025 10:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSy4/hB2ehSSnjaQ1VAJTAETVfXoW5+dpGuko+lYRxSma8KWoQjJo8/kc5GRdW0PzkpuWj
X-Received: by 2002:a05:6830:61c7:b0:72a:d54:a780 with SMTP id 46e09a7af769-72e368b2c09mr259429a34.17.1743701500674;
        Thu, 03 Apr 2025 10:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743701500; cv=none;
        d=google.com; s=arc-20240605;
        b=ApiLg6SLpLA4J+27VXWar9hGHim5O7BdA+WEc7oE1g2nUGQNDDTap65dyzCNLxSS1g
         x+mFCGF0qmDTsoyIxQ9t3+1UhMBUELnIP3tsqeCc+tkLwKERfoAp5Nda/N6Azyc/ov5t
         GXn1xHxaMnm/ljwqeJ4+r1fI1UU4PV9Hpp93nDQdoWQ7H9ttFfAGRMQSCVaEEZNC2DGV
         6AGL1qAFsfdTwAQFCWDVpv/nCJRFtbLQ6GuuE6TYBaIKgro0FCbXpa16iyfXQhkHWA8q
         CUTd6DewUBbL0T56QzAOkt7SBN89Ly9ypnonC9h5QrzQXxcTxB8e8LOix2e2WJTAT4Oz
         WtGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=GImnIK5dQxcETDifRwda9ACZec15O35FcvLydfny0F4=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=IQVQpDExVzzFal3/i+JZ246bpjq9QiZHE6mxXJlMWoBla71msKjWn96rK+BoxgA8Oj
         li7nla/X6T/TUcUAyp+9Eo8AdQ+lPlH4JdyVhv2vxPI92d5F4KGgSvnGRONGp9HMIX+d
         D+yB9B1PQdR4e1/XZdD6BerwfPqJBm7E997i5Oi5hDzb8PsOGzRu3/v9BOxuIuGfWEqR
         uGovLaXtxYzaesMQYecWXIqZ4gFLlije93fzm+ru78YmMleDZFYGMqGzweUjcedC1sSH
         9r8wsHtGLkx+W4Bp8bzAZG5eUbFjMjYFu0XmTBdNZACscYGc2dY413uAYi1am7e2sbcc
         Jusw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=mj5vxS0w;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=ERoP1FU7;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id 46e09a7af769-72e3057e996si1114545a34.174.2025.04.03.10.31.37
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 10:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=mj5vxS0w;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=ERoP1FU7;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=GImnIK5dQxcETDifRwda9ACZec15O35FcvLydfny0F4=;
	b=mj5vxS0wqkmiPauZ5AJHch/2s6/GWBMJe9njNyBjSN9EVkUWgTb9ksNyTcEL2p2duXmW
	Dqzmdz15bV/WAZ5anWH6qtbFag4/fTP144JDM5Wn88prfooMYVBDhMDMdIXoszVsuvTBAG
	6TmWQVlabME9pU8It4GJIVlM2PvZ/P/i23f5ahM7BwtAykjglvoTf387Y4MDNLcEkO+UWy
	cFOES+BSBx8WTBi88P2O1zgRwRmXy8GdEfUJSIaPGuy4nL8HoHoemN9aHdfrpZpKRo1S5z
	+48kNnsczr0zF7cnf/bpqvKEATaGhJEWxTZoAzYKjghiXcvBAcl/quFGuYfF8EyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=GImnIK5dQxcETDifRwda9ACZec15O35FcvLydfny0F4=;
	b=ERoP1FU72ZQuhJqP2pnlr2ZA9iKPpVFW5pKolNgjaFZDiJlpwfFA8JT8o3rTIF+Yq3tk
	B0OeRxuB3KG6Scp0iiblwYlrA8L3eYujGk2poJMEbNH2rTosOy5z0hKRvfUNzSKp4VoYtv
	+19LA8suSd1uaj854/29kL7bpE0xu3hpo=
Received: by recvd-66b84f6d7b-ptdm8 with SMTP id recvd-66b84f6d7b-ptdm8-1-67EEC5F8-BA
	2025-04-03 17:31:36.963746824 +0000 UTC m=+271240.638602794
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-38 (SG) with HTTP
	id WUN1K_uiS3-Kdv2l1XeW3Q
	Thu, 03 Apr 2025 17:31:36.942 +0000 (UTC)
Content-Type: multipart/alternative; boundary=7014749fef7365a88b4a1e1383d1f2910f77c4a9a1ac126ff92fba6b93a8
Date: Thu, 03 Apr 2025 17:31:37 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <WUN1K_uiS3-Kdv2l1XeW3Q@geopod-ismtpd-38>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4ceFx8CD3KLIrEV?=
 =?us-ascii?Q?ROilsUluR8=2FQE8=2FrY3e060x1w1usu54B1zR9OT1?=
 =?us-ascii?Q?MO=2Fx8wEOcYK2GQmEAuy=2FqrjdyNyjp01VP+6ggJi?=
 =?us-ascii?Q?ZlySknoew9sff8pEPGFtOVVBkk9kf2MsqV3JniA?=
 =?us-ascii?Q?eQG6tuqeIGxdbgAHnLKFb=2Ft5cSoLtwnS4F1NU8J?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: /sk9r0piQu22

--7014749fef7365a88b4a1e1383d1f2910f77c4a9a1ac126ff92fba6b93a8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Overengineered Anchor Links
This article discusses the complexities involved in implementing anchor lin=
ks on web pages. The author explores various solutions to improve user expe=
rience, including adding padding, shifting trigger lines, and creating virt=
ual headings. The article emphasizes the balance between functionality and =
simplicity in web design.Top Comments:Some commenters expressed concern ove=
r the complexity introduced for a simple scroll.Others appreciated the inno=
vative approach but noted potential distractions from the design.Overall se=
ntiment is mixed, with some finding the solutions interesting while others =
see them as unnecessary.2. A Special Build of Curl that Can Impersonate Bro=
wsers
This project presents a modified version of curl that mimics the behavior o=
f major browsers during TLS and HTTP handshakes. The goal is to bypass rest=
rictions imposed by web services that differentiate between clients based o=
n their handshake signatures.Top Comments:Users praised the project for its=
 potential to enhance web accessibility.Some expressed skepticism about the=
 necessity of such modifications.The overall sentiment is positive, with ma=
ny seeing it as a valuable tool for developers.3. InitWare: A Portable Syst=
emd Fork
InitWare is introduced as a modular and portable alternative to systemd, de=
signed to run on various platforms. The article highlights its compatibilit=
y with systemd interfaces and its potential benefits for service management=
.Top Comments:Commenters appreciated the modularity and potential for bette=
r service management.Some expressed concerns about the project's long-term =
development and support.The sentiment is generally positive, with many hopi=
ng for its successful adoption.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--7014749fef7365a88b4a1e1383d1f2910f77c4a9a1ac126ff92fba6b93a8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Overengineered Anchor Li=
nks</h2><p>This article discusses the complexities involved in implementing=
 anchor links on web pages. The author explores various solutions to improv=
e user experience, including adding padding, shifting trigger lines, and cr=
eating virtual headings. The article emphasizes the balance between functio=
nality and simplicity in web design.</p><h3>Top Comments:</h3><ul><li>Some =
commenters expressed concern over the complexity introduced for a simple sc=
roll.</li><li>Others appreciated the innovative approach but noted potentia=
l distractions from the design.</li><li>Overall sentiment is mixed, with so=
me finding the solutions interesting while others see them as unnecessary.<=
/li></ul><h2>2. A Special Build of Curl that Can Impersonate Browsers</h2><=
p>This project presents a modified version of curl that mimics the behavior=
 of major browsers during TLS and HTTP handshakes. The goal is to bypass re=
strictions imposed by web services that differentiate between clients based=
 on their handshake signatures.</p><h3>Top Comments:</h3><ul><li>Users prai=
sed the project for its potential to enhance web accessibility.</li><li>Som=
e expressed skepticism about the necessity of such modifications.</li><li>T=
he overall sentiment is positive, with many seeing it as a valuable tool fo=
r developers.</li></ul><h2>3. InitWare: A Portable Systemd Fork</h2><p>Init=
Ware is introduced as a modular and portable alternative to systemd, design=
ed to run on various platforms. The article highlights its compatibility wi=
th systemd interfaces and its potential benefits for service management.</p=
><h3>Top Comments:</h3><ul><li>Commenters appreciated the modularity and po=
tential for better service management.</li><li>Some expressed concerns abou=
t the project's long-term development and support.</li><li>The sentiment is=
 generally positive, with many hoping for its successful adoption.</li></ul=
><footer><p>This email has been sent by Toolhouse. You can change your deli=
very preferences at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswXBy3_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBM-2FXTQzl1Aoel1lo2n-=
2F5dXmAn848CvAB-2BEijaWRGX0wlZuq-2FWX8z168VtIBz7zssZJQh6TlxSRtEjPUjojRQtz5u=
Wh0Es11tlWVgcCOSH6tOxicBBMmf4KwieVbttrmjGmvJIvTNv79JQjxKFBT2ztWjhAk8T8PMyi9=
5lvSeOypA-3D-3D'>here</a>.</p></footer><img src=3D"http://url1228.toolhouse=
ai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GJnjsd=
V9AFXNXuCkS5oJOO8RJKTxN0IfphptPxd76KPT-2B5mfygZfpAM5Qsao4OkiEShtF-2FgRqm0O7=
nUEq8I-2F4Y61EseTlVVpFwMSEIp9f6bxtM9rFW68tOgV31b0nuK0pEkNyj0nSbzXOJX1i8MEfb=
t01eQMszdwo6V3ZQ2T1jw97E493JPl7R-2BWArJyG9Mbew-3D" alt=3D"" width=3D"1" hei=
ght=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !important;=
border-width:0 !important;margin-top:0 !important;margin-bottom:0 !importan=
t;margin-right:0 !important;margin-left:0 !important;padding-top:0 !importa=
nt;padding-bottom:0 !important;padding-right:0 !important;padding-left:0 !i=
mportant;"/></body></html>
--7014749fef7365a88b4a1e1383d1f2910f77c4a9a1ac126ff92fba6b93a8--
