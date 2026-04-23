Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp6137232ejc;
        Mon, 28 Apr 2025 10:31:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO1T9tTntXTt74ASwVuLvMihCUSJIgIMEmksiV5Bzq4hzLVTeedBOHFGvNB1po5oqEmKyb
X-Received: by 2002:a05:620a:4542:b0:7c5:3e22:6167 with SMTP id af79cd13be357-7c9606fab4cmr2049110185a.23.1745861467635;
        Mon, 28 Apr 2025 10:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745861467; cv=none;
        d=google.com; s=arc-20240605;
        b=RcaPHO0WVdKo38m/5uW5+grSa/jAlt24Y/I8BjBe9aQGKdtKYbwFfzpzC/C6C4FGbX
         u7UyJfFsE5EdX+/L+PIwUbWtkr9ggGpYtM0sCyo0R3wSo5PrTXSPbXPEQBRhmWw+bTdf
         ytsidZ7WK0TOUQg+Rj2aHgNtfHXG34kkCzSct5i4dplJRnL/0491d7wq9/SwNlwgo4kc
         8zgX7BwEwPn5BVreNmxAS4eg2UUEDi0PT6w1b+FszpQF7EREhyHbJfBp5hnEvAFsSJRp
         jESWrezwtS9IobkmN3xeniHRrEWM6PCLehU/DjFr+KL6BQYF+CplMnKrUyfCd4vwjk1d
         hTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=kbrWqGmPS/Mmmh4KcJ7e9IAqFuUiIc7oOFd49YvHtxs=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=FwduMCfwmuxfPIO/rXQPBDZaMV4XmBNC/Ol/x5ob2Bzn9z1ytnCKPaqP7pbjdHIFr7
         tRIr87aG/wd2gP/szcCLDPB3sIIkjED3S//XaJ3ZA6caczHxupc7TGvS1WQCJUw8qXtw
         gV822W1GYDSo8f+HDDsEgaLkk2Apf0fqmQOyX+JcK+8yvV5fQx+9LRu8UhgigS/ChBLz
         OSf2YqtpBe7vgkbAe+EmjuXCU/MAH4GTELR6Cmmly7zQLF5QTXe+pZs7h425a4BgmiFv
         0+9ops2h4n/Y/Lh0klKLcaMiBhp3rwxTvlW79gABuTmmaZNbaZ0jIF+M2iMIoPeKpPtF
         nAJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=W5Sg52mV;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=gti2cAVc;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id af79cd13be357-7c958ea293asi1022903385a.413.2025.04.28.10.31.06
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:31:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=W5Sg52mV;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=gti2cAVc;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=kbrWqGmPS/Mmmh4KcJ7e9IAqFuUiIc7oOFd49YvHtxs=;
	b=W5Sg52mVlY3SsF7qZwK1NF2G5WjlfUcfAAR/Ba+USdp97q/jId1DPPT4iKKfTGaPyzxa
	YmT2mcU7Ez9qtpLhhGqS6WnjZPgEbkc7coN+JsJtdbuK3qNK6GKkQx01ia8s1OgwpZM6jd
	MAaIJzW/tk8meX3s6tTfdeeE5OywvNdsXrk57PwgfRsyYVw2q5L1S5a/5bhQeoP6NSOZb1
	IMQENvGjumwwR9SeI2wNXZL237YuOWHGXPfqz2KU+v1ktY1NMsca6c3po1/pIIhZlvb7WI
	vZ4EI6nYUKNOkE/N+oyx1+liS7cY9+b5sfQvuZotdELTmJzwzrMQLdpyigSWoHag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=kbrWqGmPS/Mmmh4KcJ7e9IAqFuUiIc7oOFd49YvHtxs=;
	b=gti2cAVcIoAELALQjcrFaQYbeRmoZgu7UZWCWUMu2x9xxk9RVuNrardeXFNUaDTod0gA
	AzoiHXXvrJLSt9SWUDRavmELIOoTG8ibnDokl/M5d6Q2mgDNkXr0QMyxzlfQ9ceHPESaKg
	a1gLJmcZYGW8di/3OPDL6BTHAPD/aZKDE=
Received: by recvd-57d69887f8-8gzdb with SMTP id recvd-57d69887f8-8gzdb-1-680FBB59-6C
	2025-04-28 17:31:05.435824584 +0000 UTC m=+1711341.711195337
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-32 (SG) with HTTP
	id 51OyDDY7RPuVX5lsjbkIhg
	Mon, 28 Apr 2025 17:31:05.418 +0000 (UTC)
Content-Type: multipart/alternative; boundary=e789c56b5db4145e1dd3d8660dd28056efcdf1f5cddc5b0c3d71e7300aed
Date: Mon, 28 Apr 2025 17:31:05 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <51OyDDY7RPuVX5lsjbkIhg@geopod-ismtpd-32>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7I2iGeu+b759vDu?=
 =?us-ascii?Q?zWgGIapMajjaE+Lu4cpHWFB3mfcOiGjV40qFHVl?=
 =?us-ascii?Q?a63VSa98fSHr9BQuZn0Q29P20ieyXzP2aprcJSB?=
 =?us-ascii?Q?Wkp2HjREgJ01rmBrbqe061PTStWYiTUHIWEo=2FHB?=
 =?us-ascii?Q?HzvgC6JTDEwutgliTNJW1nSjirvThmIMvlqg1PS?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: WAar4F5K26IP

--e789c56b5db4145e1dd3d8660dd28056efcdf1f5cddc5b0c3d71e7300aed
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Show HN: I built a hardware processor that runs P=
ython
PyXL is a custom hardware processor that executes Python directly without u=
sing a traditional interpreter or virtual machine. It compiles Python to a =
custom assembly designed for direct hardware execution, achieving a GPIO ro=
und-trip toggle in 480ns compared to 14-25 microseconds on MicroPython Pybo=
ard.Comments Summary:
The comments reflect excitement about the potential of PyXL, with users dis=
cussing its implications for real-time control systems and embedded applica=
tions. There is a general sentiment of curiosity and support for the projec=
t.2. Reports of widespread power cuts in Spain and Portugal
Power outages have affected major cities in Spain and Portugal, causing cha=
os in transportation and daily life. The Spanish Prime Minister confirmed t=
hat the cause of the outage is still unknown, and efforts are underway to r=
estore power.Comments Summary:
Comments express concern about the impact of the outages on daily life, wit=
h many sharing personal experiences of the chaos. There is a mix of frustra=
tion and understanding, with some users discussing the technical aspects of=
 power grid management and recovery.3. Show HN: A pure WebGL image editor w=
ith filters, crop and perspective correction
This project is an open-source WebGL image editor that allows users to appl=
y filters, crop images, and make perspective corrections. The developer aim=
s to provide a community-driven solution.Comments Summary:
Users are generally supportive, providing feedback on features and suggesti=
ng improvements. There is a positive sentiment towards the open-source natu=
re of the project, with discussions about its usability and potential enhan=
cements.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--e789c56b5db4145e1dd3d8660dd28056efcdf1f5cddc5b0c3d71e7300aed
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Show HN: I built a hardw=
are processor that runs Python</h2><p>PyXL is a custom hardware processor t=
hat executes Python directly without using a traditional interpreter or vir=
tual machine. It compiles Python to a custom assembly designed for direct h=
ardware execution, achieving a GPIO round-trip toggle in 480ns compared to =
14-25 microseconds on MicroPython Pyboard.</p><h3>Comments Summary:</h3><p>=
The comments reflect excitement about the potential of PyXL, with users dis=
cussing its implications for real-time control systems and embedded applica=
tions. There is a general sentiment of curiosity and support for the projec=
t.</p><h2>2. Reports of widespread power cuts in Spain and Portugal</h2><p>=
Power outages have affected major cities in Spain and Portugal, causing cha=
os in transportation and daily life. The Spanish Prime Minister confirmed t=
hat the cause of the outage is still unknown, and efforts are underway to r=
estore power.</p><h3>Comments Summary:</h3><p>Comments express concern abou=
t the impact of the outages on daily life, with many sharing personal exper=
iences of the chaos. There is a mix of frustration and understanding, with =
some users discussing the technical aspects of power grid management and re=
covery.</p><h2>3. Show HN: A pure WebGL image editor with filters, crop and=
 perspective correction</h2><p>This project is an open-source WebGL image e=
ditor that allows users to apply filters, crop images, and make perspective=
 corrections. The developer aims to provide a community-driven solution.</p=
><h3>Comments Summary:</h3><p>Users are generally supportive, providing fee=
dback on features and suggesting improvements. There is a positive sentimen=
t towards the open-source nature of the project, with discussions about its=
 usability and potential enhancements.</p><footer><p>This email has been se=
nt by Toolhouse. You can change your delivery preferences at <a href=3D'htt=
p://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1=
I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswbJ7u_zKD9qStml-2FkjU46ulTqeWVs=
rM3061nr98hteMD12SmC3NBmJ-2FNWbpykhy6njB2GFfV-2Bvy4a3OeNaqMboX6z3KC6utR9VS1=
N8Z-2BlrcqH1CCTVT8TIOjU7Ycx5q83Tx4nwI8njDvu2xB8qqBHGCvF3kVz1ZLIf3Ce9lVbEyMC=
HK2ehe4ATakkgQbLUGYKWm2e6OhVTHhAEDNumvVy9fx37ng-3D-3D'>Toolhouse Settings</=
a>.</p></footer><img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du0=
01.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GINIak00vWTQeuv1Q633Qhi56uyGP=
AcH6eiH-2FVNCd21v0PlBqGvZw7dXrUXNCeU3f16hcRAZuCXDQkZ9Gc6bVnB85DqZx9PgVS9d1V=
09Rf0JMQqo4-2FryxQpaHoq2d2kGwedz0rhrJ1HNfjGRHbSGJhvG8WTgZTJOc-2FlbXtfFyCmLP=
uJmWC9XUdityvkgaR4jpc-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" st=
yle=3D"height:1px !important;width:1px !important;border-width:0 !important=
;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !importa=
nt;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !impo=
rtant;padding-right:0 !important;padding-left:0 !important;"/></body></html=
>
--e789c56b5db4145e1dd3d8660dd28056efcdf1f5cddc5b0c3d71e7300aed--
