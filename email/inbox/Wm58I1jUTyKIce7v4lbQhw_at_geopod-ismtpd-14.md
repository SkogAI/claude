Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:96a7:b0:ac7:e5d6:90a7 with SMTP id hd39csp737657ejc;
        Tue, 15 Apr 2025 10:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPzLCxMgGe2XHgitPiQ2xNu8vLSBam1OKPoQTK7/je55D2GVJYx2hgFp4MwMpDoVkszOG2
X-Received: by 2002:a17:903:2444:b0:220:c813:dfd1 with SMTP id d9443c01a7336-22bea4f398emr242235545ad.36.1744738300966;
        Tue, 15 Apr 2025 10:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744738300; cv=none;
        d=google.com; s=arc-20240605;
        b=NspHOg266SxhvPJgQ9VOfDjLFApNHwhgg3Gmt19D/RhxZMaw79iC/7lOVsjU9TYpBX
         DW3IyCOjnItGpaKezNx8m0GoJ2yCB2Ts2wMcNCyirOHfMmESbCTkh/2/SEIPb6egahBz
         h2mF0oBpeK49bqITaGM++yVQ3D3jVwQdiDMJm74/2mEew7STXmHHuBXPXeVkwQZmlkpa
         RTUiaPxwWH3SyfxcnwlvuZ7Tmhorm72DIR1cDSho/fyaA0IEJFfwHHhhBQKFjpDC7Qil
         fjSNqfXU6OpTPoA/0c0B1Q1cMI0YlakdqZjmOk3PJjRD450iU2HGWw1+VhBcXaSQXgFm
         iLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=AXLvfNuKPdR/OkDEN4RWteR33dCrWX+kIeWf862ZpX0=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=SuqxhxVA7cyOBgpenAVwN6/5RqM7M+N/ZFXZl5vIy4m82UPe/0oBKj8akEZgxKoYlH
         xt+2Jrbb66eSwyutomXgqT8xBWwt6rdlassa1UdVe4UHIdC+zSCpFgQ1T4QujyAh7Irb
         KK01fT1xsLxBdpHOWe+ZLQ089Ya+NBe1Lc9DTHq5Lp9MXUK88+IyB563QV0om8RwUft6
         18IIURespbIKQAnAb75Q3RqXUGSGl72edHfg5bppWD16CHc6D7fzFRQvmI52Q8rw7iJY
         /fkJ7BtKSf8qDM+g9pYpBAiZKdwPaXAFaK2abUEUMNwUHj9Kpa3+Z0HyF495RUDiPcbB
         ZB3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=l0sW4kRl;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b="woO/wSdn";
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsb.outbound-mail.sendgrid.net (s.wfbtzhsb.outbound-mail.sendgrid.net. [159.183.224.107])
        by mx.google.com with ESMTPS id d9443c01a7336-22ac7b3a474si196004255ad.90.2025.04.15.10.31.39
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 10:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) client-ip=159.183.224.107;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=l0sW4kRl;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b="woO/wSdn";
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=AXLvfNuKPdR/OkDEN4RWteR33dCrWX+kIeWf862ZpX0=;
	b=l0sW4kRl692NRyV2WMqnSU5cFjWMr7zpoP96v5u+BaXVoI0rBkFXIBA9XLNzltrubDlt
	ZzEzCmkoop0lEHTBz370pE0fvBw7+RebKcpeM86EKjJ8d5HrEC9rw7DQlf9HsW5YAaG8D4
	IZfC9Jj6ooBpVorr4/RmylA/qfqQMd/+d92hG/OTmxiClHLH704UIz+19m+m9Voln8hx9i
	bM1e+w5WsqcQ42Qu+uAL5VzC8H0fL8Covh0OMUSuDQxs9SwwV4GHUlZlu7udtoEPtfsT4H
	HGu3J6YVcF94yE05uUsO3ZUE65YX1nKLP2dP5PLU7tG+RkD7E6VdeOigY7zUxXjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=AXLvfNuKPdR/OkDEN4RWteR33dCrWX+kIeWf862ZpX0=;
	b=woO/wSdn2rMSUGPJKGf7xeX1Trl79XZG60HyzQoGpzffOxHfSFAYIbFERZW8+NhaA4A6
	XH36iJ+Q18kcLWsBll0O5Ke7K+y6QUY79xzqTP+lzbgNZ4UxazQvAsSURf7CvrE/ljbb9y
	E+8P1oKTnivRHeoz9DGVfK/Uzzj7kFRpQ=
Received: by recvd-84ff9c6c5c-s8nqj with SMTP id recvd-84ff9c6c5c-s8nqj-1-67FE97F9-6D
	2025-04-15 17:31:37.944074395 +0000 UTC m=+588023.131251332
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-14 (SG) with HTTP
	id Wm58I1jUTyKIce7v4lbQhw
	Tue, 15 Apr 2025 17:31:37.896 +0000 (UTC)
Content-Type: multipart/alternative; boundary=73a45d45539c9f702604f19e97c1db3842d54c376b506b6f7797d78db9df
Date: Tue, 15 Apr 2025 17:31:37 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <Wm58I1jUTyKIce7v4lbQhw@geopod-ismtpd-14>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7mJ7wonIQXKa+8s?=
 =?us-ascii?Q?iob6BxwW80BieWMP=2F8PM1PRPAVCQnj8P62e5MFa?=
 =?us-ascii?Q?5s1DuCxeRoJv6JyaNaZfvuassHtkvvVbg8re33m?=
 =?us-ascii?Q?rWDAwT5ngVtxMAHi1wCz8uXu+3NABhr3sjE7+3E?=
 =?us-ascii?Q?Q3bgxcpKnMm+E6moBex3dX4gFx+9JgiapbmKY7X?=
 =?us-ascii?Q?w=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: +RjHwSHUAc0B

--73a45d45539c9f702604f19e97c1db3842d54c376b506b6f7797d78db9df
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
1. Benn Jordan's AI Poison Pill and the Weird World of Adversarial Noise
Benn Jordan's latest video discusses a method to combat generative AI music=
 services that exploit music for their datasets. He introduces the concept =
of adversarial noise poisoning attacks, which, while not yet practical, ope=
ns up discussions on protecting music from AI.
Top Comments:
Many commenters appreciate Jordan's practical approach to machine learning.
Some express skepticism about the effectiveness of adversarial noise.
Others discuss the ethical implications of AI training on copyrighted music=
.
2. How to Win an Argument with a Toddler
This article explores the dynamics of arguing with toddlers, emphasizing th=
at toddlers often seek validation rather than genuine debate. The author su=
ggests that understanding and acknowledging their feelings can lead to more=
 productive interactions.
Top Comments:
Many readers relate to the challenges of communicating with toddlers.
Some argue that the principles apply to adult interactions as well.
Others share personal anecdotes about parenting and negotiation techniques.
3. Clolog
Clolog is a full-featured logic programming language embedded in Clojure, d=
esigned for expressive power and execution transparency. It supports rapid =
prototyping and proof-of-concept development.
Top Comments:
Commenters discuss the potential applications of Clolog in various fields.
Some express interest in its unique syntax and features.
Others compare it to existing logic programming languages.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--73a45d45539c9f702604f19e97c1db3842d54c376b506b6f7797d78db9df
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
        footer { font-size: 0.8em; color: #777; }
    </style>
</head>
<body>
    <h1>Your Hacker News Digest</h1>
    <h2>1. Benn Jordan's AI Poison Pill and the Weird World of Adversarial =
Noise</h2>
    <p>Benn Jordan's latest video discusses a method to combat generative A=
I music services that exploit music for their datasets. He introduces the c=
oncept of adversarial noise poisoning attacks, which, while not yet practic=
al, opens up discussions on protecting music from AI.</p>
    <h3>Top Comments:</h3>
    <ul>
        <li>Many commenters appreciate Jordan's practical approach to machi=
ne learning.</li>
        <li>Some express skepticism about the effectiveness of adversarial =
noise.</li>
        <li>Others discuss the ethical implications of AI training on copyr=
ighted music.</li>
    </ul>

    <h2>2. How to Win an Argument with a Toddler</h2>
    <p>This article explores the dynamics of arguing with toddlers, emphasi=
zing that toddlers often seek validation rather than genuine debate. The au=
thor suggests that understanding and acknowledging their feelings can lead =
to more productive interactions.</p>
    <h3>Top Comments:</h3>
    <ul>
        <li>Many readers relate to the challenges of communicating with tod=
dlers.</li>
        <li>Some argue that the principles apply to adult interactions as w=
ell.</li>
        <li>Others share personal anecdotes about parenting and negotiation=
 techniques.</li>
    </ul>

    <h2>3. Clolog</h2>
    <p>Clolog is a full-featured logic programming language embedded in Clo=
jure, designed for expressive power and execution transparency. It supports=
 rapid prototyping and proof-of-concept development.</p>
    <h3>Top Comments:</h3>
    <ul>
        <li>Commenters discuss the potential applications of Clolog in vari=
ous fields.</li>
        <li>Some express interest in its unique syntax and features.</li>
        <li>Others compare it to existing logic programming languages.</li>
    </ul>

    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswL5rU_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBPm8DI4xFez6Af0hp48Qy=
RV5WrqHLqYPvzyFDjgbM36EvYkMqVozj-2BMPg2pFZrXsHhMPQvNmmMGhq3WEN-2Flchu4hCEFk=
IH31RlwDOmszg3onPZdDFULld9RhExLOPx7Jp-2BGytQY6mn-2F-2BtvdAej8Lb6ONeWNJxQGpP=
uEguz6K36iw-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GL3cGUB849WDVfk3ITCfv0j9x8gYgBDvWPabKT33hpcK3=
ZoX7hDBu8z21gv7zpNW4WupZbVcYPJPqzjyF9gPDEm85HLKyRx-2FoVp9C9LwyTDbnN7X4UG9rK=
TkEAuaP9UA29u7jrh4hsU29IMkYGvTmNmrcvHelAqBXV1ONNsvFFKvMwQK13I8aI0qvjjWcABHb=
M-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !i=
mportant;width:1px !important;border-width:0 !important;margin-top:0 !impor=
tant;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !im=
portant;padding-top:0 !important;padding-bottom:0 !important;padding-right:=
0 !important;padding-left:0 !important;"/></body>
</html>
--73a45d45539c9f702604f19e97c1db3842d54c376b506b6f7797d78db9df--
