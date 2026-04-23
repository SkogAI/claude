Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:7fa3:b0:ac6:bce4:fa68 with SMTP id qk35csp3726644ejc;
        Wed, 2 Apr 2025 10:31:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP7RIyiWmfpJ6ogz/SH5iEjAFR6BA4SuigrmUPl1hyEMtPJsSGJpPACv8R4fddQPQUuSdU
X-Received: by 2002:a05:6e02:1887:b0:3d2:b72d:a502 with SMTP id e9e14a558f8ab-3d6d5576639mr35242225ab.22.1743615097847;
        Wed, 02 Apr 2025 10:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743615097; cv=none;
        d=google.com; s=arc-20240605;
        b=UvkmBYAaYaO4MhcvTTkI09TfhQLsx2xXRaQGI5gzr1GHDqjsDffMZpthte5+C0jx35
         PulBYVC6iobtBfP5fT7Rm8hjq1LlX99kugSWjiaq8oZ2WRiawbrFm+6USy8zdhwRdzdh
         ZLG/Ue6i/wU4p2LTsn6ak0d7F7MmTRe43yAu+UPGVUsSwTVD8MgWUt+DCK/UuA1Fzu04
         H3ToNpVmw4n9+6k4pG2Mt4oBIg/tWHWkSfm8KRcicfarTpJb9EXDkohwUMLKHLlvRC29
         bN5LaPizyYEsXkjuRlHfwd0RSlqVkhan9HqURRjdiF9dUpq+yjbX8hgoAX/Y/Rubzw3N
         A8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=B5qkzpMNN8IsPnSdrYnUXS8H69WgWouBaXDDCYPvEng=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=irOZVFq+Vg78MSPFI3MANJ6qqLCWpFd4dia1xQ2CXrtMZCWgiG/u0GsQlP/t5m/bAW
         yPYSIDxlDdx79CUDIkbKqujGlcBCLeaA/7Rc+k1fU9jSoE+RTUkCdoN241bMZYV11sf5
         hNxVTqkXb97SXm7r6EY/gW18rzEAKTRb91pElpEpLx3bgyUbaZZ7roAjHBbJmD8Y1Qjf
         WpGjVetAXNrox40HUWMxHGdIKIfPrt4zMRZJo1cdQDFGfERUpwuq1dfgLLpUOOQXREe1
         TdA22/CANU/7ywHYt77+2gDEMxtMGkmToQNaH15Rftv/XnpF/iq+FX6wTZGtck/0oaKi
         OdGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=lr7jcRnW;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=GGkZ5rO+;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3d5e43fb0c9si110483065ab.12.2025.04.02.10.31.37
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 10:31:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=lr7jcRnW;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=GGkZ5rO+;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=B5qkzpMNN8IsPnSdrYnUXS8H69WgWouBaXDDCYPvEng=;
	b=lr7jcRnWrorlBa76iUWpxK7epz2ggDT4x29KQHMmxpdVABFwMIKjC/g/8asLvMr44A0t
	UlO4JEuCn8P2kafq41EeMTOXLuQhWaYsv6dg7WVf5Hd+LXrmwh0GRPpP+nSB9ix3+h84XZ
	sD18gt6NBIIMB+bjysHPhDfRbbG53loRsS4n6PiR0u+39GwsdrVE6BGVggoxmZcwSHXLRJ
	dSJmrSsWgrxIQ4/lGov0xc1g/PUWsaSwhJHlasFCIYbdu+pZ8/id1XnAi0xnjsRcJPq9fg
	JdztoPA0aSVmaO9gEvUtaBXoEH9fPyoVRoB1ThxsbWaMZp4D1PaL8GU4GfuOH4TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=B5qkzpMNN8IsPnSdrYnUXS8H69WgWouBaXDDCYPvEng=;
	b=GGkZ5rO+K7QVLEQNtmgO9GU7a9d60stIZ9TMYneOFM5BposNRKDN2WYAdoUlvgaYnjXr
	Ht1T6GWXO8Ktf16GhccY36UN9DmYDlocKyMUCekYWg7m/pGO4JHtBGAHrPwnJIjlwdyjTy
	WIukc2ZJXLVOihPv5DezjyMEg/9eQHSZU=
Received: by recvd-69cbc48b94-dfm74 with SMTP id recvd-69cbc48b94-dfm74-1-67ED7479-2E
	2025-04-02 17:31:37.275474253 +0000 UTC m=+11995829.281249763
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-35 (SG) with HTTP
	id iqtfaGRPTDumyCD5OF1ppw
	Wed, 02 Apr 2025 17:31:37.253 +0000 (UTC)
Content-Type: multipart/alternative; boundary=c5736ae782c1b26c9d133c42977d309978493f4a8d90ebcaf1d4089e5de0
Date: Wed, 02 Apr 2025 17:31:37 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <iqtfaGRPTDumyCD5OF1ppw@geopod-ismtpd-35>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4ZUpkuvq8KmcqYE?=
 =?us-ascii?Q?vkOJL6QCL2slhY=2FBvD58IIFmeAjp56gbFkI45+V?=
 =?us-ascii?Q?G2NiMvKYiee8k3DhQYRflFAt0pdc3=2FhrDnlKc5g?=
 =?us-ascii?Q?kCQm3hh+69skI1dyFIsaxBlMvZeko49ayL=2F8Jpx?=
 =?us-ascii?Q?cB9uFaTZDMyUVj3mu8GDY2KHVeqTMt8UJaU3GtZ?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: I25rB9GAmFwE

--c5736ae782c1b26c9d133c42977d309978493f4a8d90ebcaf1d4089e5de0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Animals Made from 13 Circles
This article explores the artistic process of creating animals using only 1=
3 circles. The discussion in the comments highlights various techniques and=
 the challenges of achieving perfect curves, with users sharing their exper=
iences and insights on drawing and design.
2. Why Is the World Losing Color?
The article discusses the trend of diminishing color in our environment, at=
tributing it to cultural shifts and design choices. Comments reflect a mix =
of opinions, with some arguing that a more muted palette is aesthetically p=
leasing, while others lament the loss of vibrancy in everyday life.
3. Digital Archivists: Protecting Public Data from Erasure
This piece emphasizes the importance of digital archivists in preserving pu=
blic data and the potential consequences of data loss. The comments section=
 features a debate on the value of data preservation and the challenges fac=
ed by archivists in the digital age.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--c5736ae782c1b26c9d133c42977d309978493f4a8d90ebcaf1d4089e5de0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; }
        h2 { color: #333; }
        p { margin: 0.5em 0; }
        footer { font-size: 0.8em; color: #777; }
    </style>
</head>
<body>
    <h2>Hacker News Digest</h2>
    <h3>1. Animals Made from 13 Circles</h3>
    <p>This article explores the artistic process of creating animals using=
 only 13 circles. The discussion in the comments highlights various techniq=
ues and the challenges of achieving perfect curves, with users sharing thei=
r experiences and insights on drawing and design.</p>
    <h3>2. Why Is the World Losing Color?</h3>
    <p>The article discusses the trend of diminishing color in our environm=
ent, attributing it to cultural shifts and design choices. Comments reflect=
 a mix of opinions, with some arguing that a more muted palette is aestheti=
cally pleasing, while others lament the loss of vibrancy in everyday life.<=
/p>
    <h3>3. Digital Archivists: Protecting Public Data from Erasure</h3>
    <p>This piece emphasizes the importance of digital archivists in preser=
ving public data and the potential consequences of data loss. The comments =
section features a debate on the value of data preservation and the challen=
ges faced by archivists in the digital age.</p>
    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswJfh9_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmCDzix-2BlMpLvAT0UG4UT=
ZV8RF9P7-2FY8TjH0Tg1NYUE9md5I3wWKdgJ6QsXE-2F5XMUmc-2Bw4jBLnr6pOKnIRheK1-2Bm=
ZWPYdqRXB9VYjNlUY1jdCGgf85qbkvB5vdCc-2FkX1JCQhZPH-2FhdjoztpJgfa7wu-2B9nUP3j=
3H5wta5sLwXzlprTQ-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GKSXby5k1eWoyGcDNMt0-2FzCh5Ra8vpBCvDlpkDtPtWh=
YE1lo0sylqQ4VrWeTCotgFMKuMeOaRX1iIWal-2F389K-2BxbYfl6ILiqeJVp7NDm6bBCQ-2Bgc=
uKne52KtXPV8LLrrDy-2B-2BgnDxJ-2BFWZ7jCSJIIcFPsvfGbRhUEj4bSghI3fvyJ-2B4Krk7j=
w4PXHi-2BJ5pr3Mcc-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=
=3D"height:1px !important;width:1px !important;border-width:0 !important;ma=
rgin-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;=
margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !importa=
nt;padding-right:0 !important;padding-left:0 !important;"/></body>
</html>
--c5736ae782c1b26c9d133c42977d309978493f4a8d90ebcaf1d4089e5de0--
