Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:d104:b0:abc:2b0f:5fd9 with SMTP id uy4csp644827ejc;
        Sun, 9 Mar 2025 10:31:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpB2DHDQaVGvuee4KmLBONZIT29SJa6Q+EFiKoA3U8Qeb7LjSdMXauycbrHlPOUFqS24fe
X-Received: by 2002:a05:690c:3612:b0:6fb:b2c0:71da with SMTP id 00721157ae682-6febf3b37c8mr148836997b3.36.1741541474823;
        Sun, 09 Mar 2025 10:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741541474; cv=none;
        d=google.com; s=arc-20240605;
        b=VXeXDd8Rpl4WCEb2PMpW8dxkm23DXXLjniReQf3NcCR95Cqzje/vzO+neZA57UbF8t
         EJL3uxK4/qyFmihR0eo+S9HKMM10xX8MMekGl1nfJY7Vn+p3YZXHSg36tq5MX+5XAtUZ
         9fWmoGm4nxbT1r8affq1IYy/HAnNzgbpQ88bH3PwD9Oj1s9i6Pb10vnlcizCWt+NXzY0
         hF+JnCKjM4PrvtQfuZ2set2B2bo9orAz+bbbxQ9BV21CUhJoaZo2mJGd6gA9oONICwCy
         +qfd1TxyfaHnZcU1tY6zA2GtkYi+VWhhPV4oUJ6rQqyTvrl9dxX8m2PYrQ/Wyta+cW+Z
         9AuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=vxkoQWUPyi30bOqpBOev2DyQLWGLA3aKAtiyEvduLzY=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=ABapD7npByu/wvnawDIGxzicmHulABw6kbwxXfC2Jy2ayILRYKgL78zlAVWZrYJAlu
         VjoaRL5HTBckEVWKsPSlaD5nE9vlv3DQu4pXz1emYDpr+xAk9xfRmkv+U3UrFXBbSt+J
         I0XWg9zD1+7HCov0FODMQtKTq8S+yHp2YeLp3TfZ+eRBF9fzZN5y49uttrUedUz0aGdA
         Mh3xDpUUkH20NOos9AwhI3VoXiv8D5JKFgMXs0G7gFyCMrKaMPqnZ2kpOS8M8I/BYTYY
         jEcU2r+5+uctGX61KqAUiAFXVoHrSaLLOxWmHXRM5JIch+ZVio+cq6vQSnsgVGiKGvfV
         3s3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=mIu+m+Vj;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=WKSN50Vm;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwnvrh.outbound-mail.sendgrid.net (s.xtrwnvrh.outbound-mail.sendgrid.net. [167.89.40.80])
        by mx.google.com with ESMTPS id 00721157ae682-6fec1155e82si58977607b3.314.2025.03.09.10.31.14
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 10:31:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) client-ip=167.89.40.80;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=mIu+m+Vj;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=WKSN50Vm;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=vxkoQWUPyi30bOqpBOev2DyQLWGLA3aKAtiyEvduLzY=;
	b=mIu+m+Vj8XshxJf8XmVhuAtrgfRcm8MMpCnZuXSMk9W9CgvGWs1AKgSVHKCqiLqgVhMz
	of4QNovJB925+k6SBcn1yUhZGDAORIZblcnkpbgUS/WM0O+aSt+JUJZJu9bIXXpJtJAjSo
	ptYO+1VOS+QH+6zLBd6C8X/kuHdAnpyEMqbb5p5NmV8BscaizS1+hB8mGImW3RhZw/49Tx
	fuhZDk36+QEgM3n7PwUWPCk1ir19v1QfLtLNuBtoN0CUPyvnWevsv9m4Mc07CHZzSHsbfS
	CrmgM4veEreSRg1+8zKxc8E/MgyXOu5yE4jgd7LOwgctKI5d7J3i59eQf+x2TeOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=vxkoQWUPyi30bOqpBOev2DyQLWGLA3aKAtiyEvduLzY=;
	b=WKSN50Vmznfgp/vcFO6EXb66uN3v+A5qYY9/NyM382x7MJrBO7ca1a0zUhQMNJoQfv55
	ZBlm+1w5wJ+Ujg89iq+HuCVj12Zz5ALEy00t8yb4G57ftAKZpZvhtqpjMbZAhj3njM+3XN
	auyST+kUiGHXa3jaw/3b/+56okzBkzYhk=
Received: by recvd-786d47b7ff-g66kr with SMTP id recvd-786d47b7ff-g66kr-1-67CDD062-4
	2025-03-09 17:31:14.118992501 +0000 UTC m=+9922094.249544129
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-2 (SG) with HTTP
	id CuQWVA4iTZWGfuFPvFGKOw
	Sun, 09 Mar 2025 17:31:14.101 +0000 (UTC)
Content-Type: multipart/alternative; boundary=88ccae2e1782174542bee2416b3aa1b17e5b79ae094bacac7f83fc3ddfc1
Date: Sun, 09 Mar 2025 17:31:14 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <CuQWVA4iTZWGfuFPvFGKOw@geopod-ismtpd-2>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7qnG1FteKdLzb02?=
 =?us-ascii?Q?ajZkGFhkGnAp9vbPVrVxPbrGgPfjMOBGSHTfWgK?=
 =?us-ascii?Q?YYZanGlUOjVFxQJBXBHakwlILZs+hn6akucYxnQ?=
 =?us-ascii?Q?GvQjmA4O9h7IEc81Wf8pvuH8y505aT1UQqIHAzL?=
 =?us-ascii?Q?ddMHSrdPybI=2Fu5Fhqz92tQp5=2FR32dSTTkIrRm5T?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: OPp7vQetkVL4

--88ccae2e1782174542bee2416b3aa1b17e5b79ae094bacac7f83fc3ddfc1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Frida 14.1 Released
Frida 14.1 has been released, improving the Windows backend to support in-p=
rocess injection. This enhancement allows for evading common antivirus heur=
istics and speeds up the process significantly.Top Comments:
Many users discussed the transition from V8 to QuickJS and the implications=
 of this change.2. Why Discord is switching from Go to Rust
This article explains Discord's decision to reimplement parts of their syst=
em in Rust, highlighting performance improvements and the benefits of using=
 Rust over Go.Top Comments:
Commenters expressed excitement about the switch, noting Rust's advantages =
in safety and performance.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--88ccae2e1782174542bee2416b3aa1b17e5b79ae094bacac7f83fc3ddfc1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Frida 14.1 Released</h2>=
<p>Frida 14.1 has been released, improving the Windows backend to support i=
n-process injection. This enhancement allows for evading common antivirus h=
euristics and speeds up the process significantly.</p><h3>Top Comments:</h3=
><p>Many users discussed the transition from V8 to QuickJS and the implicat=
ions of this change.</p><h2>2. Why Discord is switching from Go to Rust</h2=
><p>This article explains Discord's decision to reimplement parts of their =
system in Rust, highlighting performance improvements and the benefits of u=
sing Rust over Go.</p><h3>Top Comments:</h3><p>Commenters expressed excitem=
ent about the switch, noting Rust's advantages in safety and performance.</=
p><footer><p>This email has been sent by Toolhouse. You can change your del=
ivery preferences at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswFtKP_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmA0vqq-2BmGdMiFBnTxwXG=
yfe8CLya0hai7T-2FcKGjeZN5tE3ux7hQdqTYYPi-2B5AWgoYwqxSrG-2B4H-2FT9ze-2Bebyfu=
2Bv0dbYI4MsoPnqI0cJzsmhs2RxmaJGu0Ayqd9mb-2Bq8rbq-2F-2FANAFUNX-2FW7rgphQk7cX=
wgI5s7DLHk7L1p5XWYSxA-3D-3D'>here</a>.</p></footer><img src=3D"http://url12=
28.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62D=
liywF0GJ3BQJGGPA9ilGm2vGjIwca1MRDFy9AB4RF0ppCegIbkb8E7bYefU5iVbvNf5oV8bLx-2=
BTB6kM9pNiz-2BQt75Oh4T-2BLSzWaCn4IYq4nvRgQGLF7RAnyuTQ9qRq64iiLrQ-2Fz5gZkhEb=
BNC-2BrZMhxtb2p-2FEHZV84-2Ff9iG-2BdNiuQgxExNbKLQDRyYKnNTtUCDAGXKzw-3D" alt=
=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;=
width:1px !important;border-width:0 !important;margin-top:0 !important;marg=
in-bottom:0 !important;margin-right:0 !important;margin-left:0 !important;p=
adding-top:0 !important;padding-bottom:0 !important;padding-right:0 !import=
ant;padding-left:0 !important;"/></body></html>
--88ccae2e1782174542bee2416b3aa1b17e5b79ae094bacac7f83fc3ddfc1--
