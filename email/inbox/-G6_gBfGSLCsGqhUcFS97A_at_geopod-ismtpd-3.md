Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp410930ejc;
        Fri, 18 Apr 2025 10:31:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPTek1rk+WfjaveCGbcy5Q4/IrBOTEI8OvgIdC1G36TXkM8nAoIGuOS2OgJp93jIEXG2cX
X-Received: by 2002:a17:903:2352:b0:227:e74a:a066 with SMTP id d9443c01a7336-22c535c058bmr54885765ad.28.1744997470737;
        Fri, 18 Apr 2025 10:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744997470; cv=none;
        d=google.com; s=arc-20240605;
        b=fAFzvxli8X0xCs8cTa6Mw0W5xZrKfTCxwJkptvmcvEVTNbnlTzRe1H15qmZAhrZYuo
         HB3XrmQZyBH/0t2K8wWoUByjHm/1ieUiYKfadyTVOamzk3uy+gGMNX65kkEHJGd2aSlK
         k+uCG4oNK4DOA00o7bKdHF0cKgp6a7omKUPAdBxjxCaQj8MxHxQZPOVDwRHS4+2MYI+a
         nfEWYNST0wokNmkpEutvzI8CON3pTixILzVr12Abq9eGTt6CL4+UIPNSu8xGQ56X79sd
         N9oY4/wfhNdeYrblNhRk3HfEcJ3XkOARiqPwxPt+lbkHtWcxj0hSr1DrlH/aM5/PypuO
         6y3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=8vUBoEN7zYiG7KLtOIAQbPqtJCaQu+FOh/HVY3690Dw=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Z3iU6tIybUzqQ3iX/k0rJsosDqu81zbfQX7I0YHTTUxSva2WFBcrxJEvZx37WpZ3Hu
         6mjN/OKQorcxyR3VAAh79AC6LiLLixhA+LhaW+MQeohsGaFI3VnBsrlhgddhrpj+mOK2
         gqT/M2LJRbZdc+gzWPMUz8rlSpWrBbnnmHkHVcYz0dj1ie4CHCG768yLuLBhGPKlVLO2
         4zkKGKqyoWBWNvP+dfaKvaknrBgnAwQLdslEPiXVmr9kkDz+Xm/WqGFatgEwje95t9DO
         OymxclREdlbEdWgp4i7aptbRSyMcKeQN/0YQfF+CCRarSPnRCSePVimZ2f1L7BgH9Wct
         CWIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=xczUH9DX;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=XU9EboiD;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsb.outbound-mail.sendgrid.net (s.wfbtzhsb.outbound-mail.sendgrid.net. [159.183.224.107])
        by mx.google.com with ESMTPS id d9443c01a7336-22c50d40e1esi33723955ad.283.2025.04.18.10.31.09
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 10:31:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) client-ip=159.183.224.107;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=xczUH9DX;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=XU9EboiD;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=8vUBoEN7zYiG7KLtOIAQbPqtJCaQu+FOh/HVY3690Dw=;
	b=xczUH9DX3+4PL6pP0ikCVg5ipMDDvYEmiuIAMO3/AWV4ywExl4BYjSKqin8Oxrzlf9il
	v3sAjCNo2EBykKME5p81vyfNbi2zB/+sf7130MscTS0ETUMgLCcNB0Og59uXky+x5qiowZ
	Oumipu7rADq9OYnIB9RN0q9EHgbEw/MqU7LAb/NVkBCjfv52AUMbjjtdeBI4gSLIXmdXzU
	68HFfhTxfOl5dC0oIcelDFR01X5e+l+ml2Mk65e6irrE/EZ9tOoP+TvRlZidq5iRp09suQ
	QUNJhfzCHxA57vS1VICyV3LfazUekyjO5YALFsSubkO6HoEvP96eKBOT+f8x75Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=8vUBoEN7zYiG7KLtOIAQbPqtJCaQu+FOh/HVY3690Dw=;
	b=XU9EboiDT4mnysE8baqP/X7TTuZPqtpEedZYJEr9ieD46Qxps0DRG8ysWx0fh94rqps6
	Ya+iFmXZ7u/2FVVhVANvyivfgDmD43OOauGjVHLMUyAPL0OWzYeR7IO3Ye81D1hIhIBqDH
	wMshKI7ulmKq3WcQjwCR/uc62sXtPMH+0=
Received: by recvd-84ff9c6c5c-f6x7w with SMTP id recvd-84ff9c6c5c-f6x7w-1-68028C5B-3E
	2025-04-18 17:31:07.667175523 +0000 UTC m=+847192.793650033
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-3 (SG) with HTTP
	id -G6_gBfGSLCsGqhUcFS97A
	Fri, 18 Apr 2025 17:31:07.633 +0000 (UTC)
Content-Type: multipart/alternative; boundary=c42cf5680c564b04a7016967c36f00bdc2b9466955fb630fb0058e9af8e9
Date: Fri, 18 Apr 2025 17:31:07 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <-G6_gBfGSLCsGqhUcFS97A@geopod-ismtpd-3>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5jzWSmt4fpzPMcX?=
 =?us-ascii?Q?Uf7IOd2pQW5fk=2FrfASKQX33jfVeGATxGuxi9gpE?=
 =?us-ascii?Q?NtSvYmnU0HTgO3sShsbHyjip4UxFNzGi5P58fWs?=
 =?us-ascii?Q?qKH0Jzg9cAzL1QUwQQp2OvX59Nr5WQ4SHpL2CAR?=
 =?us-ascii?Q?TVXnLSbfAOvO6MJZsxU1xdWi9SvX3SRg=2FbWcHOc?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: zCHLwD57y2uu

--c42cf5680c564b04a7016967c36f00bdc2b9466955fb630fb0058e9af8e9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
1. Show HN: I made a Doom-like game fit inside a QR code
Summary: A project called The Backdooms allows users to play a game inspire=
d by DOOM directly from a QR code. The game is compressed to fit within a Q=
R code and utilizes modern web technologies for execution.
Comments Summary: Users expressed excitement about the innovative use of QR=
 codes and the technical challenges involved in compressing the game. Some =
shared their experiences with similar projects.
2. A New ASN.1 API for Python
Summary: This article discusses the development of a new ASN.1 API for Pyth=
on, aimed at improving performance and reducing vulnerabilities in cryptogr=
aphic applications.
Comments Summary: The community engaged in discussions about the historical=
 context of ASN.1, its complexities, and the need for better tools. Some us=
ers shared their experiences with existing libraries and expressed hope for=
 improvements.
3. Show HN: Attune - Build and publish APT repositories in seconds
Summary: Attune is a tool designed for securely publishing and hosting Linu=
x packages, offering a simple command-line interface for creating APT repos=
itories.
Comments Summary: Users provided feedback on the tool's usability and expre=
ssed interest in its potential features. The developers encouraged suggesti=
ons for improvements and additional functionalities.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--c42cf5680c564b04a7016967c36f00bdc2b9466955fb630fb0058e9af8e9
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
    <p><strong>Summary:</strong> A project called <em>The Backdooms</em> al=
lows users to play a game inspired by DOOM directly from a QR code. The gam=
e is compressed to fit within a QR code and utilizes modern web technologie=
s for execution.</p>
    <p><strong>Comments Summary:</strong> Users expressed excitement about =
the innovative use of QR codes and the technical challenges involved in com=
pressing the game. Some shared their experiences with similar projects.</p>

    <h3>2. A New ASN.1 API for Python</h3>
    <p><strong>Summary:</strong> This article discusses the development of =
a new ASN.1 API for Python, aimed at improving performance and reducing vul=
nerabilities in cryptographic applications.</p>
    <p><strong>Comments Summary:</strong> The community engaged in discussi=
ons about the historical context of ASN.1, its complexities, and the need f=
or better tools. Some users shared their experiences with existing librarie=
s and expressed hope for improvements.</p>

    <h3>3. Show HN: Attune - Build and publish APT repositories in seconds<=
/h3>
    <p><strong>Summary:</strong> Attune is a tool designed for securely pub=
lishing and hosting Linux packages, offering a simple command-line interfac=
e for creating APT repositories.</p>
    <p><strong>Comments Summary:</strong> Users provided feedback on the to=
ol's usability and expressed interest in its potential features. The develo=
pers encouraged suggestions for improvements and additional functionalities=
.</p>

    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswE4-q_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDVidfXBgbU2GlDH-2FYwG=
QQCqGitPJynuUifmtOqdWgT7-2BowjlU9GfZWIfYnJKYsnx2kTeFkBjCruFfL-2B3LgWLpmD19B=
2qpTxCxmyU-2BN0RvnfZDIBtva0BwANLB5oEI9OKDHayzqj3RPml1ui5u-2B36ZpXK8hrvrqmj5=
ozFAvbpDVHA-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GK4ykC87TUHS4LnXMvYmX2oxDN5TOIn3eQhuOBmka07im=
ueHzS5Jp0AnS8UKClc6uzs2SUQyaGSiIuPYkadaqtkZhMwYLcUr7wVWBBgv-2FVp5oAEGXbOGiQ=
hY-2FDMpp1VML7kPpwex8VgS3HWcBsW-2FHnNPuLeNhwNP24Zw6nxtHyltKKeHKC6ITPKNn0-2F=
7xv4-2FI8-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"heigh=
t:1px !important;width:1px !important;border-width:0 !important;margin-top:=
0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-le=
ft:0 !important;padding-top:0 !important;padding-bottom:0 !important;paddin=
g-right:0 !important;padding-left:0 !important;"/></body>
</html>
--c42cf5680c564b04a7016967c36f00bdc2b9466955fb630fb0058e9af8e9--
