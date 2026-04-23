Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp6137157ejc;
        Mon, 28 Apr 2025 10:31:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnkrFRHrEbeDcaMHgTjFaLVPi4WrCXOVyQ4wr4ON40rKx4/cyKeU4UnW/BMixzv6ruyVWK
X-Received: by 2002:a05:6a21:399:b0:1f5:7df9:f13c with SMTP id adf61e73a8af0-2046a7549c6mr12719180637.41.1745861463326;
        Mon, 28 Apr 2025 10:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745861463; cv=none;
        d=google.com; s=arc-20240605;
        b=NjrjbSw4ctURDLK/T/wq7N4okA18DGJ6db4FBHjNzXTVJsHf7AgEwr/ypXW6mhsaNh
         1CXibntkFS7uJBpbIb0C5bA4Um3Tcitt/G1FKAjcL5SLtUVtbLv69Q3hflZcDINOuhRq
         9qE9P3i4S9K/vTyXhNJyowbBF6t1xm9xCZwHL/zA3zmmndoxky79W4H9m9gBVFvmECnn
         mABrOKdCtoVnWrMlyraf8oMnRT0kh5U77Ce6aD6IsouZkxtcmsDrb36dYeeIDAeSt42Y
         OpY+q0nNDPkALTWZAfE4KEnFao8rmRicP/Z+f20nSsC0GP7OAhUbnuTc+h0qG8uBZug0
         +MPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=n3OkOuqZTo8TiTXLu6V1juwvIsOgt9LU3xK8W9Lhr4c=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=OcID+ms+0ErufF2LsZhW8KB/HGZKhZ720LQuKAn2aCafHYID4CkMjnfB1gJBSL/k5N
         XPgZx0HwBywLQ6JK2OLod5ct8c7p0GgVcVXOx1dhMXz2A0DnknZ3DgZAKI2laaodn6HJ
         3KodWNPBpMQgR1NtFYF8sFX28JVRZonvry1ih6Svy5d8E4i+zMAIlYI0ppQDTD+q8Cf9
         Z/qJOvShUoQ4oM6uhfKfX8CAdnBiU3mI6Hw94pe2FUoSTqOQAHM4ezaNyCnhKifg/4e5
         N+0tqG4HaDuqRvejvCwaIFhgy1eYKyvLVBxuyR6zFqjDRKdtdy0i7c7r4qjBzBMk+iJG
         haCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=q8XBvZVw;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Phkcdd5J;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsb.outbound-mail.sendgrid.net (s.wfbtzhsb.outbound-mail.sendgrid.net. [159.183.224.107])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b1bb378a9a9si6110037a12.17.2025.04.28.10.31.02
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:31:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) client-ip=159.183.224.107;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=q8XBvZVw;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Phkcdd5J;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=n3OkOuqZTo8TiTXLu6V1juwvIsOgt9LU3xK8W9Lhr4c=;
	b=q8XBvZVwD5P7bZhnPM315i3rw3LUyNvWNvIY2nCIbDzDaSNbn76BP6daUEb3YxXAgZEV
	Lg2WNuUbTzZEfC76E8xTapwLQtOTwurQxT0COtmwjaZGmL78hgb8QCcLUpI1L57YuHDHwm
	HrZGh9Xyzkz2W5xsYHmNkB1cBgbgLFvaBBOvOSF2Hp22RNg2lycf6BeiFmyV3iiTxUUxEY
	oYzUXjC218PB/4EPPJCYcrK3yi7Rw6ppwTsu1Q4wBA3FbcMZht0DsZkhrDpEBCfFLhYg0Z
	q9bQdtD1fw0cDyOAKTbH8GlOVOJUoTY6vjos1Ji/Ez/JDM8ZnNgdLoD0R9En5ERg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=n3OkOuqZTo8TiTXLu6V1juwvIsOgt9LU3xK8W9Lhr4c=;
	b=Phkcdd5JUQL7kUPXUMgkCSydBkhHLmpLkMZsw1coUCdSF1MjR4t3xGkf2xdMu/56QqsV
	NlI0xKxZsFKw/yWV64tEbyCjxkIA6oAPeU8bMcHYzzYOE/gAdMO0CYPyWaz+sM9+H0/Udi
	PBPO0ivhoG6ZuqABnwSPdInFc7lAYq5LA=
Received: by recvd-84ff9c6c5c-6vhxb with SMTP id recvd-84ff9c6c5c-6vhxb-1-680FBB54-1A
	2025-04-28 17:31:00.146134315 +0000 UTC m=+1711237.677250836
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-10 (SG) with HTTP
	id m_H8rMZJQTqv4WFJ52P7Hg
	Mon, 28 Apr 2025 17:31:00.110 +0000 (UTC)
Content-Type: multipart/alternative; boundary=f1c66bb6451bd32018ff3d9971adb57eff66bd5a8de7d9aab12ae0168110
Date: Mon, 28 Apr 2025 17:31:00 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <m_H8rMZJQTqv4WFJ52P7Hg@geopod-ismtpd-10>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n6snXjHaHO07mMTm?=
 =?us-ascii?Q?j51Xy+4VpiogNlL7NTHZpv0fi0AbBRDDILUK9Qf?=
 =?us-ascii?Q?6QQCaFoaABoSzKEcHOx8JXzGQiyGPcUJZszCdWM?=
 =?us-ascii?Q?WiBowlAeXMlXDZQuI4cKvZ2Jh3ZIZ2042fI2bzU?=
 =?us-ascii?Q?H7CAI6el0B0EX8hVA6tSVQqr7hrNR4uJGpzP8Zi?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: hZH8RzUPqI9y

--f1c66bb6451bd32018ff3d9971adb57eff66bd5a8de7d9aab12ae0168110
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
Comments discuss the technical aspects of the processor, its performance co=
mpared to existing solutions, and the implications for real-time applicatio=
ns. Overall sentiment is positive, with excitement about the potential of r=
unning Python in hardware.2. Reports of widespread power cuts in Spain and =
Portugal
Power outages have affected major cities in Spain and Portugal, causing cha=
os in transportation and daily life. The cause is still under investigation=
, with officials urging the public to remain calm.Comments Summary:
Comments reflect a mix of concern and frustration, with many sharing person=
al experiences during the outage. There is a general sentiment of disbelief=
 regarding the scale of the outage and discussions about the reliability of=
 the power grid.3. Show HN: A pure WebGL image editor with filters, crop an=
d perspective correction
This project is an open-source WebGL image editor that allows users to appl=
y filters, crop images, and correct perspectives. The goal is to provide a =
community-driven solution.Comments Summary:
Users are excited about the project, providing feedback on features and usa=
bility. Suggestions include adding sample images for testing and improving =
the cropping feature. The overall sentiment is supportive and constructive.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--f1c66bb6451bd32018ff3d9971adb57eff66bd5a8de7d9aab12ae0168110
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Show HN: I built a hardw=
are processor that runs Python</h2><p>PyXL is a custom hardware processor t=
hat executes Python directly without using a traditional interpreter or vir=
tual machine. It compiles Python to a custom assembly designed for direct h=
ardware execution, achieving a GPIO round-trip toggle in 480ns compared to =
14-25 microseconds on MicroPython Pyboard.</p><h3>Comments Summary:</h3><p>=
Comments discuss the technical aspects of the processor, its performance co=
mpared to existing solutions, and the implications for real-time applicatio=
ns. Overall sentiment is positive, with excitement about the potential of r=
unning Python in hardware.</p><h2>2. Reports of widespread power cuts in Sp=
ain and Portugal</h2><p>Power outages have affected major cities in Spain a=
nd Portugal, causing chaos in transportation and daily life. The cause is s=
till under investigation, with officials urging the public to remain calm.<=
/p><h3>Comments Summary:</h3><p>Comments reflect a mix of concern and frust=
ration, with many sharing personal experiences during the outage. There is =
a general sentiment of disbelief regarding the scale of the outage and disc=
ussions about the reliability of the power grid.</p><h2>3. Show HN: A pure =
WebGL image editor with filters, crop and perspective correction</h2><p>Thi=
s project is an open-source WebGL image editor that allows users to apply f=
ilters, crop images, and correct perspectives. The goal is to provide a com=
munity-driven solution.</p><h3>Comments Summary:</h3><p>Users are excited a=
bout the project, providing feedback on features and usability. Suggestions=
 include adding sample images for testing and improving the cropping featur=
e. The overall sentiment is supportive and constructive.</p><footer><p>This=
 email has been sent by Toolhouse. You can change your delivery preferences=
 at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9=
CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMsw7mHA_zKD9qSt=
ml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmA5231-2BRbd-2ByO0rJiW6pYKwCXlkQyvChn45=
3h-2FqZKq-2Bn6PFO5GkmHjqOK3B4xdOAm7OOwpkyNJ6ojHlZVfIqmOyM3ArsqQeekax8lYb9Ph=
bRC6VZqhwnuSeN883Cl07sZi2zMVrpckIbuGFZ6sfA0NDO131pdSWUe-2BNy-2FLIGRAwIQ-3D-=
3D'>Toolhouse Settings</a>.</p></footer><img src=3D"http://url1228.toolhous=
eai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GKWNz=
82-2FeWxHNfq4yFEWPkjcl-2FwXBY-2BJJTPQfnt1jIhuZEBoi1XAUdOoPWzOj3y4ClyaY7Yu-2=
By544eDAkXQCq5z0pYRD92OodmFjPTtsGhvNrElPoopqfrKyOpSBOMUX1eYV1TwE3PdETqdNy3x=
p7vldX-2B3Ut1-2Fngjh-2BIV8nCuiS81-2B1uXI35mHwSiHbCFmrz0-3D" alt=3D"" width=
=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !=
important;border-width:0 !important;margin-top:0 !important;margin-bottom:0=
 !important;margin-right:0 !important;margin-left:0 !important;padding-top:=
0 !important;padding-bottom:0 !important;padding-right:0 !important;padding=
-left:0 !important;"/></body></html>
--f1c66bb6451bd32018ff3d9971adb57eff66bd5a8de7d9aab12ae0168110--
