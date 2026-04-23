Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:9620:b0:ac7:e5d6:90a7 with SMTP id gb32csp376072ejc;
        Thu, 1 May 2025 10:31:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjAWNP9WAY4pTpU0zmrdPKErnJ4IiKSq/Nq8p6VJwetNEOn1vqImvUGfdeXTWUcF+8cJJV
X-Received: by 2002:a05:6808:6a8d:b0:401:e848:18b4 with SMTP id 5614622812f47-4034115038amr80107b6e.8.1746120682930;
        Thu, 01 May 2025 10:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746120682; cv=none;
        d=google.com; s=arc-20240605;
        b=BTX2Ni6qO+RrYLxgSkKwNS1fT+eKa5eLs1LzaQN7/j95/GDdxF16fixJ2b6RMO5UIN
         y2FOkRwGEnr+tjsG+sy6xF+9EddVxgjy5RO3Stf0pZygTKIljx14WapAr2zMfPZeW86s
         ADRGh3GsAG+rc+SRsNg0EdUYLwW/TRqvxDwHAR8kv6Hu6J8DC8Yif+ter2szMUmDyrl7
         e/6COZvZz1RHohBpHW7h5wxz3gdwxJo7NKfdSAw+9FG8sr3li9M8H3YrSmpoHmQMW5sG
         LqJNKMbPFEDAev8qAFQUxTKVnDDYCS9Y1CXnpqwrBWfxSwEsmTlWk4zqitCWWILraPCA
         vDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=rA4I9+33R8W2EqTbecYHnAYHTKZStVvPcsIOHdyQWP4=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=U0zn9gWEuNQklN26nUXz5IGL5lVOkPkPFAdvQC3knfiBK6ep7kWqha6ZR6BKwcZ1XE
         ouAVsX/E4fqJxx0KwMbeUm8kGzjcpoj+gOFh9xYqgr7FsWphkeCQ0zvP8czdayvJuSAW
         O+Yy2ZWkj2PCza6Zd3gTAhT5IjdqGCscs7L3RPysO1a/VJOjRZgNoAkqh9rTlS3Gi4wp
         mlaJBfRwwYrL+QDzbqofbN/s14W0Q6lmChc7oZFFDc1xzFTiCBDyj7R+lmQzdlfCTkVR
         hKVfOVFyC3lbwspmVXZj+UIJV0AMN5S5NzCd4ymLoS4eJeBOZMdqjSqgUQSkBJ78y2mq
         ULLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=iWOcP+gS;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=WBCd6wJa;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id 5614622812f47-4033dc61192si549165b6e.232.2025.05.01.10.31.22
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 10:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=iWOcP+gS;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=WBCd6wJa;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=rA4I9+33R8W2EqTbecYHnAYHTKZStVvPcsIOHdyQWP4=;
	b=iWOcP+gS3T3Fc9kjYpMeOeWtXvrEKjCY4Z7aoYySeOTWoEYiQgeSGiSPzt+f0RP3pd66
	tc23AOQhRtGR0F2AbJCPNMWYQ46qODJXRv+O8ixu9lJ5obOzzlIPoIkNHPykNCaWfIBjOH
	L9lJ39q+0AxhHyBn0dCdgrsZGbptoJf0rP8oOU59yoSbmwrI+kBbPY5AS/stTsUwwqC+4F
	yKJIEMosGTFtXZSrpQCrWLrO36W99pzaK375xcrRvWNkvzrTopA+5ED56ZdqQyURM3wUIB
	Kz+8GZHzTHMJvE5HmgkWzuhTKfOx33r2C7vZ2xRHZu98Nl9ayuFGZUQG6dANNWRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=rA4I9+33R8W2EqTbecYHnAYHTKZStVvPcsIOHdyQWP4=;
	b=WBCd6wJa0BL91kb3xR1b2Ib8qaDAhscWDNEWnpUeXrZdoViCbsBBzJp7xsn/RjJ1ks+r
	ap/nDwDe3al5iPWWZYpF4z+HN/2QkkNJL5FoD+4m2s3UBvyAak9xuCVnBkPHvv5HRdzu2M
	ayht60BzDwrhQGHHYfwmD1GXTKTnEqd7U=
Received: by recvd-65bb6cdcb5-p7669 with SMTP id recvd-65bb6cdcb5-p7669-1-6813AFEA-47
	2025-05-01 17:31:22.255366209 +0000 UTC m=+1970591.099848230
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-19 (SG) with HTTP
	id OtUqKtICReu28Qj3kC6D-A
	Thu, 01 May 2025 17:31:22.252 +0000 (UTC)
Content-Type: multipart/alternative; boundary=01b9f8a7cff2c9b365df19f3e83f6564ab5cfa4ea5af0c9d1917aebed445
Date: Thu, 01 May 2025 17:31:22 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <OtUqKtICReu28Qj3kC6D-A@geopod-ismtpd-19>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5HxeScC9xPhc2VN?=
 =?us-ascii?Q?2dTkxBKiRZGHZAiX17wavUNeFdDWfVUXylRfOEy?=
 =?us-ascii?Q?jJNw96u3Z911ZXE5Sd2012Bv41tQeQAMDJ4hIWv?=
 =?us-ascii?Q?WqTcrsHUlJt=2Fcw27tnJeGzxOVtZUT4ZraGuonfl?=
 =?us-ascii?Q?E3ndsm7kos=2FEGbD0mM8p3tyv3giLxBcrB175YDe?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: xwbJ3EMrNeHB

--01b9f8a7cff2c9b365df19f3e83f6564ab5cfa4ea5af0c9d1917aebed445
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Redis is open source again
Redis has reverted to an open-source license after a period of using the Se=
rver Side Public License (SSPL). The community response has been mixed, wit=
h some expressing relief and others feeling betrayed by the previous licens=
ing change. Key comments from the community highlight concerns about trust =
and the future of Redis in the open-source ecosystem.Top Comments:Many user=
s are skeptical about Redis's commitment to open source after the licensing=
 change.Some are considering alternatives like Valkey due to concerns over =
Redis's future.Others appreciate the return to open source but question whe=
ther trust can be rebuilt.2. Claude can now connect to your world
Anthropic has announced new integrations for Claude, allowing it to connect=
 with various applications and tools. This update enhances Claude's capabil=
ities, enabling it to conduct more complex research and provide comprehensi=
ve reports. The integration with popular services like Jira and Zapier is e=
xpected to streamline workflows for users.Top Comments:Users are excited ab=
out the potential for increased productivity with the new integrations.Some=
 express concerns about the complexity of setting up these integrations.Ove=
rall sentiment is positive, with many looking forward to testing the new fe=
atures.3. We identified a North Korean hacker who tried to get a job at Kra=
ken
Kraken's security team detailed their experience with a North Korean hacker=
 who applied for a job. The team used the hiring process to gather intellig=
ence on the hacker's tactics. The article emphasizes the importance of vigi=
lance in hiring practices, especially in the crypto industry.Top Comments:M=
any commenters are critical of the hiring process that allowed the hacker t=
o advance so far.Some suggest that companies need to improve their vetting =
processes to prevent similar incidents.There is a general consensus on the =
need for heightened security measures in the industry.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--01b9f8a7cff2c9b365df19f3e83f6564ab5cfa4ea5af0c9d1917aebed445
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Redis is open source aga=
in</h2><p>Redis has reverted to an open-source license after a period of us=
ing the Server Side Public License (SSPL). The community response has been =
mixed, with some expressing relief and others feeling betrayed by the previ=
ous licensing change. Key comments from the community highlight concerns ab=
out trust and the future of Redis in the open-source ecosystem.</p><h3>Top =
Comments:</h3><ul><li>Many users are skeptical about Redis's commitment to =
open source after the licensing change.</li><li>Some are considering altern=
atives like Valkey due to concerns over Redis's future.</li><li>Others appr=
eciate the return to open source but question whether trust can be rebuilt.=
</li></ul><h2>2. Claude can now connect to your world</h2><p>Anthropic has =
announced new integrations for Claude, allowing it to connect with various =
applications and tools. This update enhances Claude's capabilities, enablin=
g it to conduct more complex research and provide comprehensive reports. Th=
e integration with popular services like Jira and Zapier is expected to str=
eamline workflows for users.</p><h3>Top Comments:</h3><ul><li>Users are exc=
ited about the potential for increased productivity with the new integratio=
ns.</li><li>Some express concerns about the complexity of setting up these =
integrations.</li><li>Overall sentiment is positive, with many looking forw=
ard to testing the new features.</li></ul><h2>3. We identified a North Kore=
an hacker who tried to get a job at Kraken</h2><p>Kraken's security team de=
tailed their experience with a North Korean hacker who applied for a job. T=
he team used the hiring process to gather intelligence on the hacker's tact=
ics. The article emphasizes the importance of vigilance in hiring practices=
, especially in the crypto industry.</p><h3>Top Comments:</h3><ul><li>Many =
commenters are critical of the hiring process that allowed the hacker to ad=
vance so far.</li><li>Some suggest that companies need to improve their vet=
ting processes to prevent similar incidents.</li><li>There is a general con=
sensus on the need for heightened security measures in the industry.</li></=
ul><footer><p>This email has been sent by Toolhouse. You can change your de=
livery preferences at <a href=3D'http://url1228.toolhouseai.com/ls/click?up=
n=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2Bcm=
QdjMswQLYs_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBoEmUH8FKR3ScREbO4b1=
uY-2FTvUzdreeOTr8roy0KqaFlQil9Oq9mSZnhwYqJ7nAwE-2FcxamuzdxxGZbt-2Fu8Q86zumL=
DvBkHOCSFi35-2BPPmC941xfpt62tPV7Z4wzQVYz6KAF55bvxl5jyOwdxC-2F2eY-2BNJYhThux=
Cr88eTlBpFHsFg-3D-3D'>Toolhouse Settings</a>.</p></footer><img src=3D"http:=
//url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8=
oSKm62DliywF0GKyIBEl25v4IAfHi2LI-2FP2uXT0wreOSRTRaiqAENU05qrX9Sa7h5RXzQ7rSm=
Tno0ug1glzFaVr3Ng1gE5q7EjHeEufHhQW8tkYoRUpe-2BKNlmUTv8iFjjbPEeJC0T8V7YNN8M0=
x-2BL8fjAzQJxQw3-2FqvwIWBAOB2nMcOY-2Bq-2FduTp3An86C83EvWpa24jb-2BXimfAs-3D"=
 alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !import=
ant;width:1px !important;border-width:0 !important;margin-top:0 !important;=
margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !importa=
nt;padding-top:0 !important;padding-bottom:0 !important;padding-right:0 !im=
portant;padding-left:0 !important;"/></body></html>
--01b9f8a7cff2c9b365df19f3e83f6564ab5cfa4ea5af0c9d1917aebed445--
