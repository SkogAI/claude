Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:94cc:b0:ac7:e5d6:90a7 with SMTP id dn12csp127320ejc;
        Fri, 4 Apr 2025 10:31:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHozvadhE0kQi0KH3spEi9rTz0+FJ6ztArRCZHVqUQhnV/Xo1ChdqxdEXOa/boEcSM4vXqd
X-Received: by 2002:a05:6602:3fd5:b0:85e:16e9:5e8d with SMTP id ca18e2360f4ac-860ef3c3fe5mr1201161339f.7.1743787890589;
        Fri, 04 Apr 2025 10:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743787890; cv=none;
        d=google.com; s=arc-20240605;
        b=D5fqzvI+rK4BEET+2AzteVkGeqbClANQBl/rvI+KKQzeO5lBA02uJncxaZrSe8BpK9
         NsBdHllHWr8cZBNeJnGit//9YSnBXb3BULeKEd433R4DZ3noHPY9bq4hraF3uibJwTSm
         s8d514DQeP+1iMF4FEdwlq1dkGzCSh6H56YOBVBeCEv4yVH6DQsVy97cPzq7w+UaNMpC
         mvJu3X3a0PaO2tFSHe1J/SqeojRNqGZHMmUeJthirASFCx0/ZWM3X2/yaA5/6hv8kViu
         j9MHymzc/ujbHdzBYgEavhBN/qKSQobxAFXiTlFBO5pjjDjFcFbYINCNGGVs/k/zkmWr
         ZZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=3b83AzWXKjQky+VftzRM9ux5m+GcGmMLEx39l1F32rg=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=BWZ1Fh0F1onsu9p6n8C9vAhSB8b3NtIrccQdwGDTpF9ZFJ7Wh+9P/85uupK4PFmBib
         umk7BDCVWrDzlHZsbS957at2zxZ0UyNiayEVBMg/fJQlYVfGR8Hntw9WBtsViLENPEUX
         fbouszcTljQMn1JBTTM4lSyUW1hgqbflP3KMpPPzgvt+EqpAf/36kHqV5R901rqwdZc5
         SyGCro8851JOz1B7sYlAB7jwEwYph47aijiRYzyJdYFhbgveWdw3srwo2M2Adbzl9yG+
         dgQ/+K2dofSVxV4pZU6DVkilujYB6ilv/Bm1vyXCoo/s4R/+d3AV4QPQBe9gTJo9nZCC
         X8uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=nwjGJ4NU;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=omxfF0ma;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id ca18e2360f4ac-86111435720si421772339f.121.2025.04.04.10.31.29
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 10:31:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=nwjGJ4NU;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=omxfF0ma;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=3b83AzWXKjQky+VftzRM9ux5m+GcGmMLEx39l1F32rg=;
	b=nwjGJ4NUqfwZt76ISLEiqg5Rp9iyXfzD38EtYp59lnnvFxwecestOjUM/3AAsz8iRMMr
	MjAz/KPelj+XTB8lt4EXOsjuoBvhYstm6rYEMbwbN9vbjaBhY7AyEu/NYUvaxlgdfMWYlt
	H6GMSXWcMRj/U/kat/wEgA6leW1fMnRLxv2qmLQfT8ZgSF2Ww2UKrLb8R6cf9Y9GsKXKiR
	eQU1qcBzgDBlYwnvZJeHmJTIyym2f3ycJus0pEPxdgv2vARi2zMKxMZUL1NidH5uxPbKag
	AuK9cuB7H+eNehZcCN3wDxnW4lsAQ4KQ5hx5sjCx+oM/MAwdom3xwwRBX4V+gw/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=3b83AzWXKjQky+VftzRM9ux5m+GcGmMLEx39l1F32rg=;
	b=omxfF0maQQAS+fQWh8MrcTaSAyKd6L5WkM/gkRXZOHzio9aunXZqEmYLrwDGO2TPdp6B
	T0tacYnLEyiQ0Zgn087tQ+3LZHw/z3Oth/vxXr1z5MC7WajkJWJz5ADXjntYNnbuSn6sfG
	E0eZTxsRulZefZRt7As5f5yM5yR/ddcMs=
Received: by recvd-66b84f6d7b-lw4hz with SMTP id recvd-66b84f6d7b-lw4hz-1-67F01770-2D
	2025-04-04 17:31:28.284827178 +0000 UTC m=+357626.958506646
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-12 (SG) with HTTP
	id ej9yVBOfRV6hojjCevldQA
	Fri, 04 Apr 2025 17:31:28.270 +0000 (UTC)
Content-Type: multipart/alternative; boundary=9449b536be9abba7706fd4f8c16c480c893455cc1044b10e22739698b469
Date: Fri, 04 Apr 2025 17:31:28 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <ej9yVBOfRV6hojjCevldQA@geopod-ismtpd-12>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4zobuIS0pz4oZjr?=
 =?us-ascii?Q?5UOWmR7TE7J+p9qNSHgHnMv92ZTZE8Jy9QgkxoL?=
 =?us-ascii?Q?AOGBo3kiU16LOdkZMtEl3IQZm4Yc4ExndkRBu2W?=
 =?us-ascii?Q?ws2M01Z3j0trjj3D5U9RGQS6seX+Cz5f=2FJO3uT0?=
 =?us-ascii?Q?plUF9Bz=2FZli1VYJu4rh4Y0VJ4DuW8vGhwgU0vYe?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: HFoBC6kohl8B

--9449b536be9abba7706fd4f8c16c480c893455cc1044b10e22739698b469
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
1. Kerosene did not save the sperm whale
This article discusses the fascinating biology of sperm whales and the hist=
orical context of their hunting. It argues against the common belief that k=
erosene saved sperm whales from extinction, highlighting that the demand fo=
r whale oil continued to rise even after kerosene became popular. The autho=
r emphasizes the need for government intervention to protect these magnific=
ent creatures.
Comments Summary:
Comments reflect a mix of agreement and skepticism about the author's claim=
s. Some users argue that kerosene did indeed reduce the demand for whale oi=
l, while others emphasize the ongoing exploitation of whales for various pr=
oducts.
2. An image of an archeologist adventurer who wears a hat and uses a bullwh=
ip
This article explores the phenomenon of AI-generated images, particularly t=
hose mimicking the style of Studio Ghibli. It discusses the implications of=
 AI art and the ethical concerns surrounding copyright infringement, especi=
ally when the AI produces images that closely resemble well-known character=
s.
Comments Summary:
Many commenters express frustration with the AI's tendency to produce deriv=
ative works, often pointing out that the generated images lack originality.=
 There is a strong sentiment against the commercialization of AI-generated =
art, with calls for better regulations to protect original creators.
3. The Curse of Ayn Rand's Heir
This article delves into the life of Leonard Peikoff, Ayn Rand's intellectu=
al heir, and the contradictions within Objectivism. It highlights the perso=
nal struggles Peikoff faces, including family disputes over Rand's estate, =
and critiques the philosophy's emphasis on individualism while exhibiting d=
ependency.
Comments Summary:
Commenters discuss the irony of Objectivism's principles in light of Peikof=
f's life choices. Many express skepticism about the philosophy's practicali=
ty and its implications for personal relationships and societal structures.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--9449b536be9abba7706fd4f8c16c480c893455cc1044b10e22739698b469
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; }
        h1 { color: #333; }
        h2 { color: #555; }
        p { margin: 0.5em 0; }
        footer { margin-top: 2em; font-size: 0.8em; color: #777; }
    </style>
</head>
<body>
    <h1>Your Hacker News Digest</h1>
    <h2>1. Kerosene did not save the sperm whale</h2>
    <p>This article discusses the fascinating biology of sperm whales and t=
he historical context of their hunting. It argues against the common belief=
 that kerosene saved sperm whales from extinction, highlighting that the de=
mand for whale oil continued to rise even after kerosene became popular. Th=
e author emphasizes the need for government intervention to protect these m=
agnificent creatures.</p>
    <h2>Comments Summary:</h2>
    <p>Comments reflect a mix of agreement and skepticism about the author'=
s claims. Some users argue that kerosene did indeed reduce the demand for w=
hale oil, while others emphasize the ongoing exploitation of whales for var=
ious products.</p>

    <h2>2. An image of an archeologist adventurer who wears a hat and uses =
a bullwhip</h2>
    <p>This article explores the phenomenon of AI-generated images, particu=
larly those mimicking the style of Studio Ghibli. It discusses the implicat=
ions of AI art and the ethical concerns surrounding copyright infringement,=
 especially when the AI produces images that closely resemble well-known ch=
aracters.</p>
    <h2>Comments Summary:</h2>
    <p>Many commenters express frustration with the AI's tendency to produc=
e derivative works, often pointing out that the generated images lack origi=
nality. There is a strong sentiment against the commercialization of AI-gen=
erated art, with calls for better regulations to protect original creators.=
</p>

    <h2>3. The Curse of Ayn Rand's Heir</h2>
    <p>This article delves into the life of Leonard Peikoff, Ayn Rand's int=
ellectual heir, and the contradictions within Objectivism. It highlights th=
e personal struggles Peikoff faces, including family disputes over Rand's e=
state, and critiques the philosophy's emphasis on individualism while exhib=
iting dependency.</p>
    <h2>Comments Summary:</h2>
    <p>Commenters discuss the irony of Objectivism's principles in light of=
 Peikoff's life choices. Many express skepticism about the philosophy's pra=
cticality and its implications for personal relationships and societal stru=
ctures.</p>

    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMsw5MMK_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBo8sYhOTckDL0uF9XGhmq=
URRmUh9kctv0nHu2SaFyP6ivS-2BmVzW6t0D9lfRKtSaUgNp-2BW-2FEE1pkz9rKHrJlMFODVrh=
txs24FUc9lzWAGYi4Lv0TZ5o5258PDKGRbxlJZWmXcWrTUC0yZwwodMIjsAqTDKQP-2FBWZ7u0F=
jSMegS4-2BQ-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GI80f-2FBgnFpqW7f8NTqCaz8G9FE1JkIWQYbFvIPJ9xj=
qy8UBCS4udBV4tuETpcxVs4Y34Zozx9xqTrnBhFdENQXxFkB8Io8nWxWb6tJBxanwAf1-2F1zHc=
a82ZHD2e9w06mzhOpw8hO4qsg3dkWzN-2BR-2FN31Z-2BrfKtmrU9ATKyfPBYhRZrZMS-2BQWEw=
KH8MQMon42M-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"hei=
ght:1px !important;width:1px !important;border-width:0 !important;margin-to=
p:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-=
left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padd=
ing-right:0 !important;padding-left:0 !important;"/></body>
</html>
--9449b536be9abba7706fd4f8c16c480c893455cc1044b10e22739698b469--
