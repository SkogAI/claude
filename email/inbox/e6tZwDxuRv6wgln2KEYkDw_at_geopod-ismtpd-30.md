Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp4560241ejc;
        Fri, 25 Apr 2025 10:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvxdvO749l3CSuWxDaGIoTQVXIHXKyMTVP9Pw5ehRwe0dGIm1/tS9jI2BQpyxOtQNTt7Ew
X-Received: by 2002:a05:6a21:7312:b0:1e1:9e9f:ae4 with SMTP id adf61e73a8af0-2045b5b352emr4947768637.13.1745602276227;
        Fri, 25 Apr 2025 10:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745602276; cv=none;
        d=google.com; s=arc-20240605;
        b=iZgDWfX3VvGLs0Zo/X/r6+p3zrD8uyHTQHTYZQtNZhiMCrpEKgdUE/Ir4mbZVHPJcD
         BvvmrqKsL0iaxHNJzWpzKRUENZiDh6mpdtn7IIxhZWHMk3id2jWt3OzFsrDIJ8DcwmJU
         kJtKUSBGbQWaAAAScDxQ6DgAspdg1toIychN17qDMzMptGilsnzoZDkG9RMdI/K48llT
         QaPdvYcVihOdbooR9rKImOXtVBwQlk/biBSgN+ldDDsIIMXkEJU6aj5iC7Cst/5Mddjt
         Kk58BzlzCYe5K/1/j2Yqv3HwEbJ0gT3vkfVRzI2ez25QtCBAAj2dEFyO8jYzgXntfffY
         5UWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=s66Tc7XH/UGNd27YvCh6z0EI4dGPkigmJH5RnpFv1mQ=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=E/MxXhxfJH22qqiFmet8WuSiF5jwe9y362huREzd2BnKS50/QL6+J8RH35H3p0HWeO
         oUt1MraFrP3uWPB756wCJtqwto7iAMgNJLjo2SXpKmX4baRES4Fz1B3ejJ5vuCHzc+64
         IemKYhoDIDjVEZUu8SOJ96zx/2LHE88GUg48SquGOD/tWoJ3fOUggkAo/ktl5b8ZotKz
         n3KigAySt6s4c+4HUKQhv45OgSFEw0059eENFaLFnWR2z8bn9fWiDzMoio085OvbX69H
         Osu0cxFSewNMVK3Uz63dKofSB3YWVN4FnpMncsVXfjtIrUeLq4h+L92GgiNWG3lvIC2l
         dWkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=r3CdcFsP;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=GI6wVzuP;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id d2e1a72fcca58-73e25a28a9bsi5960543b3a.197.2025.04.25.10.31.15
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 10:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=r3CdcFsP;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=GI6wVzuP;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=s66Tc7XH/UGNd27YvCh6z0EI4dGPkigmJH5RnpFv1mQ=;
	b=r3CdcFsPiKtt3RfSn/bdXez4Trc1aX5c60vXFV3qp3t8aR9cX+cztEH+8MJhbcLIphz1
	ZCbBISSs7RLmdV0K3NRk7/4B6+ARTFY3+nBgjsTdhNGOFcX99y0WktPIxK0Jl+5OWWB02j
	p+a7XTSQ9vSnFOhpXnjDrAKvDoWzi7YAoxBTA3zQeSSjiEszZR3Hm+eZzaxJ//D+kapJfq
	P1zR7Rkn5p5HZneJkQGD6j323NBDHUXjUa5MbB//WZYuzNHDDyhdQrPRPwmRKYc3NeY3KG
	4xxESr6+G4BBfnEGwT5v/1GJ3VgY3OivZROoT8uQEaLusQwDKAjqMpJjk/1+vFng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=s66Tc7XH/UGNd27YvCh6z0EI4dGPkigmJH5RnpFv1mQ=;
	b=GI6wVzuPYFHlE8uP5SdP/Xdo2hmyID3UZgPlbvNwo6tMbx/vEYtXdWSbeLvlrnrtymDD
	GKwlpaVqCNYhRg3dNprZn36PgzDxzNTY2tq7ix38MtNeU66eZ8qGs3MwJc/Q+NmEYbTKVq
	+ECblTiggLdk8HZ5KO7WHGMkKiRorpT8g=
Received: by recvd-84ff9c6c5c-f6x7w with SMTP id recvd-84ff9c6c5c-f6x7w-1-680BC6E2-BC
	2025-04-25 17:31:14.961627772 +0000 UTC m=+1452000.088102301
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-30 (SG) with HTTP
	id e6tZwDxuRv6wgln2KEYkDw
	Fri, 25 Apr 2025 17:31:14.917 +0000 (UTC)
Content-Type: multipart/alternative; boundary=276563c2cae60a067bb68fad12eae091e99f36b9020ccc2d4843f9a0ff60
Date: Fri, 25 Apr 2025 17:31:15 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <e6tZwDxuRv6wgln2KEYkDw@geopod-ismtpd-30>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4i2KbwJvErfOLQV?=
 =?us-ascii?Q?3Uli+BllHL4OVpJiuwe=2FAXb+Ytg2JhuKN=2FiF9Am?=
 =?us-ascii?Q?yOasy+FWznb6SgWSwRrXmZkfYdbNz4srqZcxqBY?=
 =?us-ascii?Q?cIf9XyrlOKhT99dhrZboywbJ03HrGz288jIIO0L?=
 =?us-ascii?Q?M5ZU56uMlq4EP4Vuj6ZYhKQFaKSnvgQl3CxTBCk?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: H3vkL2i0OTbr

--276563c2cae60a067bb68fad12eae091e99f36b9020ccc2d4843f9a0ff60
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0

Your Hacker News Digest1. Writing "/etc/hosts" breaks the Substack editor
Unfortunately, I couldn't access the content of this article.2. Show HN: Ma=
gnitude =E2=80=93 open-source, AI-native test framework for web apps
Unfortunately, I couldn't access the content of this article.3. Eurorack Kn=
ob Idea
This article discusses a new concept for a Eurorack module that allows knob=
s to be replaced with patch cables, enabling a more flexible and compact sy=
nthesizer setup. The author reflects on the challenges of miniaturization i=
n modular synths and the potential for innovation in design.Comments Summar=
y:
The comments reflect a mix of enthusiasm and skepticism about the practical=
ity of the idea. Many users appreciate the creativity but express concerns =
about usability and the need for physical feedback in synthesizer controls.=
 Some suggest that while the concept is interesting, it may not address the=
 core issues faced by modular synth users.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--276563c2cae60a067bb68fad12eae091e99f36b9020ccc2d4843f9a0ff60
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Writing "/etc/hosts" bre=
aks the Substack editor</h2><p>Unfortunately, I couldn't access the content=
 of this article.</p><h2>2. Show HN: Magnitude =E2=80=93 open-source, AI-na=
tive test framework for web apps</h2><p>Unfortunately, I couldn't access th=
e content of this article.</p><h2>3. Eurorack Knob Idea</h2><p>This article=
 discusses a new concept for a Eurorack module that allows knobs to be repl=
aced with patch cables, enabling a more flexible and compact synthesizer se=
tup. The author reflects on the challenges of miniaturization in modular sy=
nths and the potential for innovation in design.</p><h3>Comments Summary:</=
h3><p>The comments reflect a mix of enthusiasm and skepticism about the pra=
cticality of the idea. Many users appreciate the creativity but express con=
cerns about usability and the need for physical feedback in synthesizer con=
trols. Some suggest that while the concept is interesting, it may not addre=
ss the core issues faced by modular synth users.</p><footer><p>This email h=
as been sent by Toolhouse. You can change your delivery preferences at <a h=
ref=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5=
tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswk19D_zKD9qStml-2FkjU=
46ulTqeWVsrM3061nr98hteMD12SmDS-2Fu-2FpDD5Q2JIbKDqbeCYvTe-2BRa7g0np5OXeH-2F=
F9idcftZ4hsiysoPk1AF67OEEt0VTNkUqZFXcaZdc-2Fr2lEHKXZShPCh2okqG3ZswZG8Hckq0-=
2Bdq1bIreFTYn8yWnVXpuaOeWHO-2FWiIXqUq2n37RD0lW4R5tPUtZKiRsHRCAs8A-3D-3D'>To=
olhouse Settings</a>.</p></footer><img src=3D"http://url1228.toolhouseai.co=
m/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GK0tPbej9Ir=
-2FrbLOHIUM1xNW9YZw5PfbHZxA7FVoA22Pf7JLyeEYM6A-2BZyrvimDmEaZGZ0NiJJZVlBPuJk=
cjD-2BMQsFGIaY3tGcaQ-2FNTypA1Gr7UiAtmnpBaoHy3TGIRJ8aVIxy9YC4LcXwcGWO3I7GHMO=
GPZ13TMyI3MrIvwMLWgo-2BeAAhW52iup5LIsLCcFyQ-3D" alt=3D"" width=3D"1" height=
=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !important;bor=
der-width:0 !important;margin-top:0 !important;margin-bottom:0 !important;m=
argin-right:0 !important;margin-left:0 !important;padding-top:0 !important;=
padding-bottom:0 !important;padding-right:0 !important;padding-left:0 !impo=
rtant;"/></body></html>
--276563c2cae60a067bb68fad12eae091e99f36b9020ccc2d4843f9a0ff60--
