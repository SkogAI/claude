Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:94cc:b0:ac7:e5d6:90a7 with SMTP id dn12csp2305966ejc;
        Tue, 8 Apr 2025 10:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVkEXk00unrPFZuUGCGP3uYNhaC+RKHpnkm+ip99Fj6mwp8GCiSaICPSvOZO7lvbuYLW8W
X-Received: by 2002:a05:6a21:9013:b0:1f3:3c5d:cd86 with SMTP id adf61e73a8af0-2010460356amr22861355637.11.1744133453041;
        Tue, 08 Apr 2025 10:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744133453; cv=none;
        d=google.com; s=arc-20240605;
        b=VydAPsSMWq8QCKdll/ez13a9tIsCkEGgAl3p2bDR+E0blEmfCk1+wg8TsoV2U9GeXe
         kxibm5HgO0tKghMwmZgdt+iZSwNJDWirFQpdccKveb68nteR77EfhiQBS4YoC1RDXsRt
         JsjeA2JDOKjDfgJMbv0M7PoLrvx4Z2TNsOPxMK42CPuUCzTt93zDMp660IImpzjod/kr
         5J8zhocCDfmsQaRStJrOSlZQlp2zJBTi02xRrsCsuhKnuF3VQQX+q9DrGPqaUQU96knK
         m2PJ1fKbI9R7SHys7igl7mYz1kIZusTs/EXTzR/trU7dgYR3K4AD19nJrWsR5eOn8GVK
         grNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=swLX5JdeTdm2Rwm6/LfzYKNS5vD47gxRQP0T4Q2/Rkk=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=TRNxRjdTlRInYKhbsdF9OUAkbxcxgvSg4Si4QWjm9KT7OPR2qyiR9vKTTWHGP+HZZf
         pxdeQhOftPcN78LMtl5FyIyRzzvPgoqYuLOrQyCyFrXCVugR9dwSQxrhTHKeDNLr7JMq
         Glv/GdDSFC9UFZkLcGxlTIDddX7GzxvtQERnNFGXX6UpBLpUM0qfaqLIZlWKZNWLGmuu
         5Z83IXh28RgdBNSCe0Z5q4CXh7acBgjn5zILKrb7iWLzAe7JAl/pGDqP9d/eD0idL6bF
         btFSYb4U2tQ1JJ+kWnftph2o1dDeqQDut6YnLQtw5AGowmGogKE30J1XdYVs6Lje1RgP
         qFgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=yRe+MFy7;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=T8u0ZW+X;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id 41be03b00d2f7-af9bc31db8dsi14516751a12.190.2025.04.08.10.30.52
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 10:30:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=yRe+MFy7;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=T8u0ZW+X;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=swLX5JdeTdm2Rwm6/LfzYKNS5vD47gxRQP0T4Q2/Rkk=;
	b=yRe+MFy7Nd2Pr7cN61S6Qzz1tdWNmGgFoKxeeClIbdSc0T4NXV9RVikSdO0YvXqgT9VI
	XpXfOC28iG4wdeGbmnH3TIAv+K5wFCI2+FuC2FQ8yCohG0zbT1vAPA4P1ehFf0fypN/8KZ
	TiAu5AFdUIy2V21DbxhFlDx4kx1ioR9SsYp2HbFMyE7gEExG9apaqNhhAYFjNa48PoY6jI
	j8BgwS1frPUz01TBoS50VzSXTpAcppzHzwG2DV+pTsFon5xRbBnZ0IhFtOaf9AEvCfbpQt
	N/dOhmclaU4sl3RGXc2c4uoG+vPq0MFcJorSE7fRv/1hlUxNu7S1CVrvDnoKjSPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=swLX5JdeTdm2Rwm6/LfzYKNS5vD47gxRQP0T4Q2/Rkk=;
	b=T8u0ZW+XGRGvcfvDroKEVr5UKEfLE+4iPVv5pb7Qfnk2/gmktSI55K2LQI03uOSWw0K5
	1mkYi/1zuhkMsU5n5348kRj9LaSmlgl18rJ2gNmVCMZpyEU/+wB3lvywvyDvN2u6/KC/Vf
	mvtMwrU9COb6Q3+r3MmEptBVAWq7gUjrU=
Received: by recvd-8856c7f54-2999b with SMTP id recvd-8856c7f54-2999b-1-67F55D4B-6D
	2025-04-08 17:30:51.940991355 +0000 UTC m=+1220327.104509154
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-24 (SG) with HTTP
	id 5b70YxjkRMmlp2ubg7-Xvg
	Tue, 08 Apr 2025 17:30:51.912 +0000 (UTC)
Content-Type: multipart/alternative; boundary=072d31cf0871c4c45fab68b7ac6f29a0d1581442d2907491cba0244a1b92
Date: Tue, 08 Apr 2025 17:30:51 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <5b70YxjkRMmlp2ubg7-Xvg@geopod-ismtpd-24>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n6d0GIAHxAcyDCgV?=
 =?us-ascii?Q?5ovk09WWd9MxJ5J2ggyyW0K43mipPH2wV8WO2Cp?=
 =?us-ascii?Q?rsCaZVs1l56WeBR7xYRZOFjDIFT=2F6svwIhYGiv1?=
 =?us-ascii?Q?w=2F6fK4jLBBIM+D6YZhyrvN+vVJFilK9qhgSoEUu?=
 =?us-ascii?Q?qeJDJTlprpecZUGdlHNsY5UOf33THsEXajuxSq=2F?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: DU2td++q+f4r

--072d31cf0871c4c45fab68b7ac6f29a0d1581442d2907491cba0244a1b92
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Connecting an IBM 3151 terminal to a mainframe
The IBM 3151 from 1987 is an ASCII terminal that supports both character mo=
de and block mode, allowing for efficient data entry. A C program has been =
developed to connect it to IBM mainframes, enabling users to interact with =
the mainframe seamlessly.
Watch the video here
2. Middle-aged man trading cards go viral in rural Japan
A unique trading card game featuring local middle-aged men has gained popul=
arity among children in Kawara, Japan. The game aims to strengthen communit=
y ties and has led to increased participation in local events. Kids are now=
 looking up to these men as role models, fostering intergenerational connec=
tions.
Read the full article here
3. HNSW index for vector embeddings in approx 500 LOC
This project presents a C++ implementation of the HNSW (Hierarchical Naviga=
ble Small Worlds) algorithm for nearest neighbor search in vector embedding=
s. The code is efficient and concise, making it accessible for developers i=
nterested in implementing this data structure.
Explore the GitHub repository here
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--072d31cf0871c4c45fab68b7ac6f29a0d1581442d2907491cba0244a1b92
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
    <h2>Hacker News Digest</h2>
    <h3>1. Connecting an IBM 3151 terminal to a mainframe</h3>
    <p>The IBM 3151 from 1987 is an ASCII terminal that supports both chara=
cter mode and block mode, allowing for efficient data entry. A C program ha=
s been developed to connect it to IBM mainframes, enabling users to interac=
t with the mainframe seamlessly.</p>
    <p><a href=3D"http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj=
2A9CmwqP6J5tp-2BO9c6dwwo5Xoit3UUSonqjLdgfodCzRbpQZvqdRvB-2Bd-2FgykpZ-2FD5ek=
RoJnOjUurR-2Beg-3D-3DA_v8_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAcNjE=
PX9pUHacDWFqcT17M-2B2tJgssfGdMqm-2FdjpNg8SSdXpk4ShSHo0RTL1Kvtk0oU0OFPlE6nuh=
ubwtF8Jm3VaqNBEkOZzFD2QSp-2FjArq0p2H5-2F0XEYVDgqzvjd4Y7qD9O8-2FvOqczYpNklj7=
aidVEgDkR8Yt0uvdFA92DgB0YuA-3D-3D">Watch the video here</a></p>
    <h3>2. Middle-aged man trading cards go viral in rural Japan</h3>
    <p>A unique trading card game featuring local middle-aged men has gaine=
d popularity among children in Kawara, Japan. The game aims to strengthen c=
ommunity ties and has led to increased participation in local events. Kids =
are now looking up to these men as role models, fostering intergenerational=
 connections.</p>
    <p><a href=3D"http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj=
2A9CmwqP6J5tp-2BO0iU6W7dhZB2TRZMf-2BrdvNw44G1YfpbCluXsKC5P-2FPtzPXP2Dnf3Squ=
3genJfzbEZ1u-2FK0FVpQreR3h-2B8y-2FYWMu8Y7-2BWTkww94HyKo1atapb7VjWl2YWbru7l2=
a7NhtiaQ-3D-3DGyHn_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAcNjEPX9pUHa=
cDWFqcT17M-2B2tJgssfGdMqm-2FdjpNg8SfSgl3bIczDEwvK0EKVMtAoYjWCfeRcTP8GWRS5ja=
DQw99-2FQdP6lER-2FpVK4rF08fFRwRINjZB-2BkaKZWLBXF1xruac0TtqRTAanJt1JneJaxDHW=
UvGqJQJRcXfq9PLue3TA-3D-3D">Read the full article here</a></p>
    <h3>3. HNSW index for vector embeddings in approx 500 LOC</h3>
    <p>This project presents a C++ implementation of the HNSW (Hierarchical=
 Navigable Small Worlds) algorithm for nearest neighbor search in vector em=
beddings. The code is efficient and concise, making it accessible for devel=
opers interested in implementing this data structure.</p>
    <p><a href=3D"http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj=
2A9CmwqP6J5tp-2BO64c-2F6hOWNjZJH4Mouz-2FAuRTFLSe8QeORzFssa-2FaxrMYG5mm_zKD9=
qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAcNjEPX9pUHacDWFqcT17M-2B2tJgssfGdM=
qm-2FdjpNg8SYrPG6KAzJrYA-2BU2nsKeqiCJohJqBVNZUecKI9zzT58nUP4G0Cufdjlzs13knd=
Uq4lJ9z0fDxXUWefgFijKJonBVCIDc5GAuo8sp1A0u9Pj1kbKbtMPpNORxlyRGViuWyg-3D-3D"=
>Explore the GitHub repository here</a></p>
    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswbhN7_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAcNjEPX9pUHacDWFqcT17=
M-2B2tJgssfGdMqm-2FdjpNg8SZVzDEp54oaZ35E1Bg7SM3LhuXF584WAv5Y5lb-2FIUSh4fuPR=
RL629UK5GlgoWF2aR5LtRJQABiUnzS3RYCahW6RebdG2PpA5KPe1hN3w-2BtfZW2nba-2B0DMRn=
GoFQWoYtTdg-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GLJPUQnkqINCfeZzhYG55BELiytP-2B6e3tiAPIkazZmc=
JoqwC-2BMGxHqcXdVQ4Lmu6S9egD38-2BccE-2FSUkLu9aVt3udlh9b-2FIwWt0XluR5LE0VIdG=
n5sqLG35Lv9ngZ4ItUrXL4VzEWoPynRR2XQnwCubOlA1It2529vygwP7q0Q7LDRnXRD2uZRQgD0=
Kc-2B7Cm2SQ-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"hei=
ght:1px !important;width:1px !important;border-width:0 !important;margin-to=
p:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-=
left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padd=
ing-right:0 !important;padding-left:0 !important;"/></body>
</html>
--072d31cf0871c4c45fab68b7ac6f29a0d1581442d2907491cba0244a1b92--
