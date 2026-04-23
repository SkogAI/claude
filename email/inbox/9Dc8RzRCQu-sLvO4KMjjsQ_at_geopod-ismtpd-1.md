Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp410977ejc;
        Fri, 18 Apr 2025 10:31:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIobGBEpt9aVRxvpr1SEwnzCGf2IWeOtyjVIFmt0vvL2VuwcyO7ZgPfZS+VfTKXhtVCnTR
X-Received: by 2002:a05:6e02:214f:b0:3d8:1768:242f with SMTP id e9e14a558f8ab-3d88ed7c3abmr34250835ab.2.1744997473742;
        Fri, 18 Apr 2025 10:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744997473; cv=none;
        d=google.com; s=arc-20240605;
        b=hT6KvQ7cU7KpsboO3Teaip2g89HwPogQPaT0BuK7yKMKLOmVih6wZ3hBu6+z9hKb30
         MsCINK9IMqMreZemiNIIikW4yEOXm7uRi7mqlyKKt8L8nS9WkHt9Katjz8NtYKHZaEih
         DC7nHO+TdFX9F+DWRtgpCRpWuts8P5dkbrga6+1rKldyKfCM6qj/GZvxgPnHqetEnsDF
         Z8TJeQN+tQ86Dt01NMfG3ej8FhHAVxPtM4Zt9xOqO5AKut4N59DyprO/GN3FB133glTq
         JuWEw8JL1uO4aSuUTgaH/+8UD/gEHlKNrYzqGkvXMkoyiLknTC01iZyWfDrwhJYWfxvB
         i5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=fwwoRFFHaYZDf1vcX6BHAatvqZegY3IM4Ap5DQVI7eQ=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=BBBVTaOpes9kX3nU3grPprvw4dmzh5xXKI5iX9RG9LjVnbElMYuSmo0mxOF4uSd3uo
         9+VU+FmIaX2MPnxH9JGT7yGTcwzTEI4RtsGmDiob/Ot24ALgPZWeu2aDzjbH28dSO24T
         AROUORzR7JB9v02Jvg9W/5ewatOhZC7EyETsFDdWO9xjbKt7PafnzYH97gp/aftlU4VZ
         u2fb38BxrTqJnE3S8qfdaVonlGBBz9C3w517uiXY18LO5WZrpZzf1uVZsGrQhr3gOdRl
         r90xd7wvBHJrOkIRm2LEzuyi9px+/t7ILPHhb9+13EoNS3Byx61hkgHiUpr8N0aD50KU
         Ng0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=ryOfa2yJ;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=zxWH+WVr;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3d821d35708si27745715ab.25.2025.04.18.10.31.13
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 10:31:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=ryOfa2yJ;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=zxWH+WVr;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=fwwoRFFHaYZDf1vcX6BHAatvqZegY3IM4Ap5DQVI7eQ=;
	b=ryOfa2yJ3BS66B4ZMR8u6jy2DW4doiObERPnO2HR0S/QqEarzFsfFIfktI9ahKzgG+PQ
	T9aDTxVxfdX762bjzTDfBPblQCiMcftCz9TXga768OcvfnvjHNWpg4MT8etsqjuSA3GsnX
	cxktHmRZCuDQKHFWk5oShzi8s9x9jiDPSNwA3XkMVOneDNKQhhhBJmDeSbPg4blYO6IUie
	ofUqqh+ycewUFEM8tbW/iGlzKN4giaFWQdVcygypTn1tmuL1XJf2Euwql/7Y19lzT00l/q
	UmHKcPWNf6nsuISNsUcUHhERKLPxMRLcbsQ8ljmbQmJ39vP5OGY5C494GUCr3IeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=fwwoRFFHaYZDf1vcX6BHAatvqZegY3IM4Ap5DQVI7eQ=;
	b=zxWH+WVrfSkj3wdsz5D/TKlrUxBvRPgMZNDpgyC4oIL2mIsRxVqRe52tQd7IqXoMG87A
	o6p7s0DNmjqt/wTw/6ddb3UYXd2d3W7Tjt+N6VkekkMJwrVb6PoTXP1rLDFkxvNl+RtzO9
	HYxV/9uW+4+IT6nWQP0T2PrxATkvz+OYY=
Received: by recvd-65bb6cdcb5-p7669 with SMTP id recvd-65bb6cdcb5-p7669-1-68028C60-8D
	2025-04-18 17:31:12.991067071 +0000 UTC m=+847381.835549061
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-1 (SG) with HTTP
	id 9Dc8RzRCQu-sLvO4KMjjsQ
	Fri, 18 Apr 2025 17:31:12.966 +0000 (UTC)
Content-Type: multipart/alternative; boundary=cecef124c28d36248f3bfa74593ee17470d7c14a2ba11b10ee976b6dcfc1
Date: Fri, 18 Apr 2025 17:31:13 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <9Dc8RzRCQu-sLvO4KMjjsQ@geopod-ismtpd-1>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4+H9351gYLZSWBv?=
 =?us-ascii?Q?0PHX+yxKP39pFklh6KoassPP+FKMPBdVptDOdzY?=
 =?us-ascii?Q?8e4PmvIfFPBJUqizUugl4HJZXuBnPH+RwtUsVY7?=
 =?us-ascii?Q?gxELYytOU=2FuMHADTUDa4xGkV3Cw6dF1+t9ZeUEh?=
 =?us-ascii?Q?FEZo4MeTt2I8+JV6k84FTUEXdyI1DaVhVQgEy48?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 7IodiKvHGVKi

--cecef124c28d36248f3bfa74593ee17470d7c14a2ba11b10ee976b6dcfc1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
1. Show HN: I made a Doom-like game fit inside a QR code
Summary: The Backdooms is a compressed, self-extracting HTML game inspired =
by DOOM that can be played directly from a QR code. The project showcases i=
nnovative methods of hosting lightweight web applications entirely within a=
 QR code, utilizing extreme compression techniques.
Top Comments: Users expressed excitement about the technical achievement an=
d shared their experiences with QR code limitations. Some discussed the cha=
llenges of compressing games and the nostalgia associated with DOOM.
2. A New ASN.1 API for Python
Summary: This article introduces a new ASN.1 API for Python, aiming to impr=
ove performance and reduce differential vulnerabilities in ASN.1 parsing. T=
he API will utilize a Rust-based parser for better efficiency and modernize=
 the interface with type hints.
Top Comments: Comments highlighted the historical context of ASN.1, with us=
ers discussing the challenges of working with ASN.1 in various applications=
. Some shared their experiences with existing libraries and expressed hope =
for improvements in the new API.
3. Show HN: Attune - Build and publish APT repositories in seconds
Summary: Attune is a tool designed for securely publishing and hosting Linu=
x packages. It allows users to create APT repositories quickly and securely=
, addressing the shortcomings of existing tools in the market.
Top Comments: Users appreciated the simplicity and speed of Attune, with ma=
ny expressing interest in its potential for CI/CD workflows. Feedback on de=
sired features and improvements was actively shared.
This email has been sent by Toolhouse.
Change your delivery preferences at Toolhouse Settings.
--cecef124c28d36248f3bfa74593ee17470d7c14a2ba11b10ee976b6dcfc1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; }
        h2 { color: #333; }
        p { margin: 0.5em 0; }
        footer { margin-top: 2em; font-size: 0.8em; color: #777; }
    </style>
</head>
<body>
    <h2>Your Hacker News Digest</h2>
    <h3>1. Show HN: I made a Doom-like game fit inside a QR code</h3>
    <p><strong>Summary:</strong> The Backdooms is a compressed, self-extrac=
ting HTML game inspired by DOOM that can be played directly from a QR code.=
 The project showcases innovative methods of hosting lightweight web applic=
ations entirely within a QR code, utilizing extreme compression techniques.=
</p>
    <p><strong>Top Comments:</strong> Users expressed excitement about the =
technical achievement and shared their experiences with QR code limitations=
. Some discussed the challenges of compressing games and the nostalgia asso=
ciated with DOOM.</p>

    <h3>2. A New ASN.1 API for Python</h3>
    <p><strong>Summary:</strong> This article introduces a new ASN.1 API fo=
r Python, aiming to improve performance and reduce differential vulnerabili=
ties in ASN.1 parsing. The API will utilize a Rust-based parser for better =
efficiency and modernize the interface with type hints.</p>
    <p><strong>Top Comments:</strong> Comments highlighted the historical c=
ontext of ASN.1, with users discussing the challenges of working with ASN.1=
 in various applications. Some shared their experiences with existing libra=
ries and expressed hope for improvements in the new API.</p>

    <h3>3. Show HN: Attune - Build and publish APT repositories in seconds<=
/h3>
    <p><strong>Summary:</strong> Attune is a tool designed for securely pub=
lishing and hosting Linux packages. It allows users to create APT repositor=
ies quickly and securely, addressing the shortcomings of existing tools in =
the market.</p>
    <p><strong>Top Comments:</strong> Users appreciated the simplicity and =
speed of Attune, with many expressing interest in its potential for CI/CD w=
orkflows. Feedback on desired features and improvements was actively shared=
.</p>

    <footer>
        <p>This email has been sent by Toolhouse.</p>
        <p>Change your delivery preferences at <a href=3D"http://url1228.to=
olhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFl=
AYjazfEAqUm0-2FD2kMX-2BcmQdjMswVK1N_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteM=
D12SmB3RZEv1lHXzS-2FtfCgsuUQjD5Z33LVF34UJq-2F6MLz3wEZ4lYRyMFkmcHezZFc6XKwuG=
-2Ftagdj4uXX0sJIlMzsK0TO2-2FAC8X2wXyUUgRsiblIrFOeI6WcAb-2BcsSDac3HcSQUbMv4U=
0z6fo83GMor0zxvqPN2BK29rfz23HntWmBxaQ-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GKoD-2BIFLbOyDVGCIz-2FHewKVf0S9w3QQKJs-2ByYve=
Ekr8m5dHiQ5vdgZj7sAhliP5EcTB-2BSVFBs9SE4i-2FD5-2BH1MuHBb-2BeZlA6HmF2oF4y-2F=
mAU6D37CsvxjifWxcpmnY2z17piLeGBXZUxaomUeuOa4zg-2FdUlgwNCr9TmQtthY6aTwhIvxx0=
xDEh-2FUvHjEhbWSmJU-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" styl=
e=3D"height:1px !important;width:1px !important;border-width:0 !important;m=
argin-top:0 !important;margin-bottom:0 !important;margin-right:0 !important=
;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !import=
ant;padding-right:0 !important;padding-left:0 !important;"/></body>
</html>
--cecef124c28d36248f3bfa74593ee17470d7c14a2ba11b10ee976b6dcfc1--
