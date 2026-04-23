Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:6206:b0:abc:2b0f:5fd9 with SMTP id si6csp606743ejc;
        Sat, 22 Feb 2025 09:31:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPJOsPRQrSb/WD/tspc/5ORxKDssweIQwlf5bXjeAXEbkian8IymamZiUzZ3hXZCXLARHT
X-Received: by 2002:a05:6830:8d2:b0:727:2751:6b93 with SMTP id 46e09a7af769-7274c25bcedmr6666746a34.20.1740245510641;
        Sat, 22 Feb 2025 09:31:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740245510; cv=none;
        d=google.com; s=arc-20240605;
        b=Y1mpZfkNV70jn4fOE3hl+z2iRtVFmqtJbE5AK+vWfF5VEx70FkAwbz+NVtvloHZFgk
         f4iwGDNqbjL/T0k0pBvHCcbzWuvWv8SE2bUfFlxAnUghpQuZeUc4a30cukILdQY09i34
         R/Od++y3OtYPVjKIwlNrLAaqka3jYmypg/hgkqJ8hQJ4qJwb9Mb2RG1LvzaG3Zw8t6ff
         o6CDMkcFKN0ZBu7cP+ov4F1LdTUt12kuB6jYQFtaPbm/hUHBcjaKwp3dnSAO265VZxA9
         KYqZgLw2P48XW2s3Eh15GGV5Ai4uJD/cD1LUw56RIgZ8gPBCbQEJfbr2d6oRGyRTzbUF
         beCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=5fYFFbiBeDDSQf4g5zWSJ/iRclQX4xzrRe9z7yX6MEg=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Rac9BugvLtO+FI+QQTQhOd7Aml/RPKaVDRHQ0ZKzfv/QoAGA50u0TZ8m6xRtT4iQT/
         f0CLPPVx8VlhDGcZeN9WhSdXg4oH+2MWab6ri94+nRNs3TKyAB6YWAGfIC2oUq05rofa
         Raxt5kBq28njB9D/0RFL53aXgFD1c2rKcrRWoDjZwvJ2TQ1sVSLc8IrXFVSV5WVuIPVt
         peUuc5ETdjqS4+yTd/5pwg/IqXTt1WEZ0tTPVvg0IRDswDep+P2dVZDVg1QqwM5ln4pt
         TSsdFBC39eN0vsrGw81s6Hk3LHKN8R8PiD1h3+tRNCH2NWvTE5fPOFlrDcdt1ZqJjnDo
         f4EQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=AyOlnLuH;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=pUZK3lwt;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id 46e09a7af769-7273ac17cb8si7883304a34.220.2025.02.22.09.31.50
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 09:31:50 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=AyOlnLuH;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=pUZK3lwt;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=5fYFFbiBeDDSQf4g5zWSJ/iRclQX4xzrRe9z7yX6MEg=;
	b=AyOlnLuHU7IzZeYZkpY7qaZU32tAA7E9FlcJm1vazvC3h+zaGsvS1Syb6UuhPDETzyAU
	TzlrJEBn/UqbX6kkMNkGTYgv3s/+Wxqa5SJFvfG6XlQwnrDbGc6IwdUrlN5k5mkgAxeo2v
	CaKWlwD0kfrd9cVo71EgMN6MdOT2zJsksNe7VS7J7g54upyeR8lkhaq0MPG58h/AjB1RmJ
	KULRJuBNeO2zFW+P5JoXJ8+L6Kk8oMdufmWJ47WLWaUllIlFwAgSBJU+jFhX4Gpw4WMJTh
	SabdRXwq4OoeKrN2BCqJrtKLp9I7TMMvYc/xhFl8WD/KqQMOY5flHsJCFtz2uyVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=5fYFFbiBeDDSQf4g5zWSJ/iRclQX4xzrRe9z7yX6MEg=;
	b=pUZK3lwtZYZm8AMFemaA9mNEWXT+I0WwfB2UlNq21pKZ5NNUJqNtqvcUetfCh38VYdVm
	5l0urKgdFxZkB2GkplVSWC2A4WiUgMElU02yll6pM2+po9BqJsDuWnPw8u+bafZciNvbYa
	uPSOG6O3+vpqO6OA6jTeeDlTRJZIKou1o=
Received: by recvd-5f54b5d587-9frct with SMTP id recvd-5f54b5d587-9frct-1-67BA0A05-5
	2025-02-22 17:31:49.087111687 +0000 UTC m=+8626107.217449699
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-31 (SG) with HTTP
	id e11lne9rSB-1mWbKgprnBw
	Sat, 22 Feb 2025 17:31:49.004 +0000 (UTC)
Content-Type: multipart/alternative; boundary=e6d86b032f09287b524eede7ec5c7c277a12c79016bf58810f21d40b6bde
Date: Sat, 22 Feb 2025 17:31:49 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <e11lne9rSB-1mWbKgprnBw@geopod-ismtpd-31>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n6YJoCjq4VNtRsrD?=
 =?us-ascii?Q?ehOFe6hpYpCVTH6rI0SrVHXKCoV3A758cjV3nbr?=
 =?us-ascii?Q?FL2fmZZH+Uo99xpptrFF7y9YvcwUwlv787mlsH5?=
 =?us-ascii?Q?Fv2kNUcOui+9ftm2OIc+HVO8+Tzs1tjKGPblUuM?=
 =?us-ascii?Q?4pV2171VJhUE6rpzY6FlmwTbZh3MYITYpn3GCc0?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: feYEsnUifgu3

--e6d86b032f09287b524eede7ec5c7c277a12c79016bf58810f21d40b6bde
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
Unfortunately, I was unable to retrieve the latest articles and comments fr=
om Hacker News due to technical issues. Please check the Hacker News websit=
e for the most recent updates.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at this link.
--e6d86b032f09287b524eede7ec5c7c277a12c79016bf58810f21d40b6bde
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><p>Unfortunately, I was unable =
to retrieve the latest articles and comments from Hacker News due to techni=
cal issues. Please check the <a href=3D'http://url1228.toolhouseai.com/ls/c=
lick?upn=3Du001.duokMj2A9CmwqP6J5tp-2BOy85ZAQig46O0Rb-2BEW4GD5mcp-2Fdm5EoDf=
uYaMJTIpyB6PUHv_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmC4sNLSb117FrR9s=
eV2L4QvsWg4ZVcp4CQfnZlANYJ5FagwLNsagJoYrdhRd5-2BFDqY5M0boYjjXBkbemIwRm3lBby=
IIZTNX51mQeMQZ74Tz03Wu2WLOH5TqsYvOlTVXkgAPElXILOVORD6dta0jv7B4iqH2mXI1-2F-2=
BYAj4-2F0pA8tnw-3D-3D'>Hacker News</a> website for the most recent updates.=
</p><footer><p>This email has been sent by Toolhouse. You can change your d=
elivery preferences at <a href=3D'http://url1228.toolhouseai.com/ls/click?u=
pn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2Bc=
mQdjMswy1Wz_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmC4sNLSb117FrR9seV2L=
4QvsWg4ZVcp4CQfnZlANYJ5FXBjI9MNp8WhSlIbNLzRj4Zj89OnHUrGA2-2FmY6zJYRRzyJNhNf=
Bkso5bxVW5KJWgKJfFmufHC2iCcLa-2FnOe-2FFKNysudcaOPFambKvJ5-2FIwNzqTDB-2FWTSK=
Gwqx7eNnUeCug-3D-3D'>this link</a>.</p></footer><img src=3D"http://url1228.=
toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62Dliy=
wF0GKCiq107tGQmBfZvSNz4pcf-2F-2BSHJSXvNQROXPg-2FHI1NjzSN3L-2BCsHan8SQpvTBOY=
qPyjGe3WbxFO2iiRMXpDOUqQl5QUZqVibYZLOlxopLciitJ-2Ff0CqJY0uUS5gqOOsWM-2FXjlo=
nO8xHSmZbr5x7I6aYRLXQT5rVrNVPSH0H-2BNwWQbpDm9LLQb73G-2Fxp63EZrc-3D" alt=3D"=
" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;widt=
h:1px !important;border-width:0 !important;margin-top:0 !important;margin-b=
ottom:0 !important;margin-right:0 !important;margin-left:0 !important;paddi=
ng-top:0 !important;padding-bottom:0 !important;padding-right:0 !important;=
padding-left:0 !important;"/></body></html>
--e6d86b032f09287b524eede7ec5c7c277a12c79016bf58810f21d40b6bde--
