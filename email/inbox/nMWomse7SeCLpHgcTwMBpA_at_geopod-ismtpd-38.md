Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:94cc:b0:ac7:e5d6:90a7 with SMTP id dn12csp1104337ejc;
        Sun, 6 Apr 2025 10:31:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgROQOJLEvz8geqvimUthV8NuvCeBCxeUpTuMQr9QSPPKCAXxi2mNtAd7+m9z7UGiexXOc
X-Received: by 2002:a05:622a:1a93:b0:477:1dd0:6d15 with SMTP id d75a77b69052e-47924c30c60mr153788481cf.5.1743960692375;
        Sun, 06 Apr 2025 10:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743960692; cv=none;
        d=google.com; s=arc-20240605;
        b=M28dBcdX9AxGpe8gx9Qvyipb0zMTNK96FhjCxn3HaBRZUt7KEdqrbiSfDEseX+HuGd
         rRTH6KgggGrIgWfaBtDPtFzR0WRLlEJGaL5ntPu8JKQJqYuA+Hn2TsRanVOSrnZVFNej
         H7AlVo9AhkY47FOU8GvNO6wy3Ovjn6BmY073Cp482P8eTCXVgq8tTUTdrdopbAbabLtY
         EqdvDHA9GMPNzUiyjdsNNngBb9y3lsUgRUftEZZUihIpR+WBxT38tFrX+NFP9V0sV7aZ
         B5mJfM9IgLnrJwZg9O2MqdRqeUoHhKtfJRAsi7NfqskfmwaNJnxnasOb8YnruHiI0qR+
         BsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=4K09V614F1CCxJdZzpR+rQDUq3YEtcNg4cqERwlDw3g=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=C79iFnTWJz47cyL3m7kZZwOC5Ab2eFiUuC6r6NipAOzrrZpN5wdArckXrtSMbWWZEC
         gZ8xaIHPnCk4mhFKg46PkaybiQhYby5LcNkVInsU5p4wevmJy3h2dDWm7fswjEFACIsK
         uLyWBYmegcOuvE7agpIkqrfo/XfgtwxgUpIzottqSFS9ZEJ/Dr/+a+h2NgHg7VrTJR4P
         PjzcYLpXx8qbD4wm7/4m0gQpZtR2C7IWT7OFHBiW5BuOqyh3NYzKxteUFUOvh6c94FUU
         iOGSJcyRsMaKoAhsBWku1/fwdIPLW4uEV1YRN7Xy0y02G00gUNNdLZo6jVFSMTPFZlNj
         b3BQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=Ey0MBV2L;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=YzmF+atK;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id d75a77b69052e-4791b07bea3si69647411cf.146.2025.04.06.10.31.31
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 10:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=Ey0MBV2L;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=YzmF+atK;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=4K09V614F1CCxJdZzpR+rQDUq3YEtcNg4cqERwlDw3g=;
	b=Ey0MBV2LNzHWiXAUEZ8Q4JZpvCGbt33EKrF6qocvp9U5wHn8zWBahIj/K3MlZN4AInVt
	H3eKqSG/H2yZRN4G2YP0M1uoDWYtXhNTuUURdrQpztLZ2FsBB8QWFVeSf6ec5c34YldxHr
	DAo0wTqtyJoz1OcoGluSDhrlEg0eb+jMNiwcKwkEiqvoUC8otllQlrRnryM11nPlmUwDna
	R6OySfBnT+xv/5nPbBXn6A3NDk6OcI5kNHVvppPGSvrU55GseSNhtqvs0z0RqXjfrdubTd
	RWnReAl1gZatbDef8MGG6+IEqhtEBLqKDlRMBySJoECprd24W6LGnfn4UXgtLr+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=4K09V614F1CCxJdZzpR+rQDUq3YEtcNg4cqERwlDw3g=;
	b=YzmF+atKson+MAPmI8tmtPx13nmZbKaN28SrgHHZi/TPBSkoyviTuqmLMO7sp62CXvgC
	+Ykw+qfS03LSd2gvtkgMspJ05k6AfipGMba7DNEKi2G8yzxZBhph+sgZnGJ5t6C8uKe4at
	exTgauGdMRmN66iuEL9cVtqUAGg/IgtC4=
Received: by recvd-69fb75db69-n7s5j with SMTP id recvd-69fb75db69-n7s5j-1-67F2BA72-24
	2025-04-06 17:31:30.38810373 +0000 UTC m=+3970442.945117935
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-38 (SG) with HTTP
	id nMWomse7SeCLpHgcTwMBpA
	Sun, 06 Apr 2025 17:31:30.377 +0000 (UTC)
Content-Type: multipart/alternative; boundary=99c05ae2ea80712afbc0b86373529d740fbbae499ff462ebd7ea05c2ed18
Date: Sun, 06 Apr 2025 17:31:30 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <nMWomse7SeCLpHgcTwMBpA@geopod-ismtpd-38>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5=2FEsFNrfcAJhcQv?=
 =?us-ascii?Q?n+gj3sAOIciMW1NJaII9NZkbLhtskt44y4L2BfU?=
 =?us-ascii?Q?Vielejyn3VlywvZoQVxqCP4NCfQx+zyoL+U2S+6?=
 =?us-ascii?Q?L1MFBHzthDc58o0x9Bmau9LGKY82qGELxYNAtet?=
 =?us-ascii?Q?bxTrvYMovpNjyEWMW466DpjJ2NAOVTih+BRZKzi?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: RX1iruqwcfSs

--99c05ae2ea80712afbc0b86373529d740fbbae499ff462ebd7ea05c2ed18
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Standard Ebooks: liberated ebooks, carefully prod=
uced for the true book lover
Standard Ebooks is a volunteer-driven project that produces new editions of=
 public domain ebooks that are lovingly formatted, open source, free of U.S=
. copyright restrictions, and free of cost. They focus on modern typography=
, full proofing, and rich metadata to enhance the reading experience.Top Co=
mments:Users appreciate the project but suggest implementing filters for pu=
blic domain books only.Some users express concerns about editorial changes =
made to the texts.2. The "S" in MCP Stands for Security
This article discusses the security vulnerabilities associated with the Mod=
el Context Protocol (MCP) used in AI agents. It highlights issues like comm=
and injection and tool poisoning, emphasizing the need for better security =
measures.Top Comments:Many agree on the critical flaws in MCP's design and =
the need for a clear distinction between user input and external commands.S=
ome users suggest that the security issues are inherent to the nature of AI=
 and agent systems.3. Hiding elements that require JavaScript without JavaS=
cript
The author shares techniques for hiding elements that depend on JavaScript =
using HTML and CSS. They discuss the use of the  tag and CSS media queries =
to enhance user experience for those without JavaScript enabled.Top Comment=
s:Users appreciate the practical solutions provided for progressive enhance=
ment.Some suggest further improvements and alternatives for better implemen=
tation.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--99c05ae2ea80712afbc0b86373529d740fbbae499ff462ebd7ea05c2ed18
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Standard Ebooks: liberat=
ed ebooks, carefully produced for the true book lover</h2><p>Standard Ebook=
s is a volunteer-driven project that produces new editions of public domain=
 ebooks that are lovingly formatted, open source, free of U.S. copyright re=
strictions, and free of cost. They focus on modern typography, full proofin=
g, and rich metadata to enhance the reading experience.</p><h3>Top Comments=
:</h3><ul><li>Users appreciate the project but suggest implementing filters=
 for public domain books only.</li><li>Some users express concerns about ed=
itorial changes made to the texts.</li></ul><h2>2. The "S" in MCP Stands fo=
r Security</h2><p>This article discusses the security vulnerabilities assoc=
iated with the Model Context Protocol (MCP) used in AI agents. It highlight=
s issues like command injection and tool poisoning, emphasizing the need fo=
r better security measures.</p><h3>Top Comments:</h3><ul><li>Many agree on =
the critical flaws in MCP's design and the need for a clear distinction bet=
ween user input and external commands.</li><li>Some users suggest that the =
security issues are inherent to the nature of AI and agent systems.</li></u=
l><h2>3. Hiding elements that require JavaScript without JavaScript</h2><p>=
The author shares techniques for hiding elements that depend on JavaScript =
using HTML and CSS. They discuss the use of the <noscript> tag and CSS medi=
a queries to enhance user experience for those without JavaScript enabled.<=
/p><h3>Top Comments:</h3><ul><li>Users appreciate the practical solutions p=
rovided for progressive enhancement.</li><li>Some suggest further improveme=
nts and alternatives for better implementation.</li></ul><footer><p>This em=
ail has been sent by Toolhouse. You can change your delivery preferences at=
 <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9Cmw=
qP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswBS09_zKD9qStml-=
2FkjU46ulTqeWVsrM3061nr98hteMD12SmAgMirRgOh-2Ba1iNmKakAFQKfwszg6HvnihDzn7Ae=
d8txsO2IKgMn2SYl2Xj8IEZxzA2pEsZbarCtPcYmGs1r9zJB6pkekfEGmK80ELoxRjUg31qkRBu=
0igNxkaBPaYY-2FD6AfcVl-2FafJL-2FrPUs2DyPxYIr4jxkLzddLnkV41ZojT6A-3D-3D'>her=
e</a>.</p></footer><img src=3D"http://url1228.toolhouseai.com/wf/open?upn=
=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GIhcVnMH0LD4yThUf93A-2Fs=
CXDJtr5Iva-2BScofrXQYlCC119eVEWJgSorU5w3LB8yIRGGZxYLJfxrS9dz4nhGFPRGSoYPsg9=
Vb-2BVerduHZYCqdUkyvi6J0v01MPT7cbGQE-2BSXzgULt6agqf3amW-2FUArE9RIm3CV9XJWPO=
-2FlQkJPLzum0aVLyLdinTG5IduV6rmg-3D" alt=3D"" width=3D"1" height=3D"1" bord=
er=3D"0" style=3D"height:1px !important;width:1px !important;border-width:0=
 !important;margin-top:0 !important;margin-bottom:0 !important;margin-right=
:0 !important;margin-left:0 !important;padding-top:0 !important;padding-bot=
tom:0 !important;padding-right:0 !important;padding-left:0 !important;"/></=
body></html>
--99c05ae2ea80712afbc0b86373529d740fbbae499ff462ebd7ea05c2ed18--
