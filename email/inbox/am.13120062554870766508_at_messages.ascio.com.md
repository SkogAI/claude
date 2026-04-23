Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:9445:b0:aa6:6dbf:d2fb with SMTP id dl5csp4416084ejc;
        Mon, 23 Dec 2024 23:06:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBSU8+RqFucBd/C/HQeFcQcEz/Wf7pD0ZqjmrRwNX4HLc/vr3Bwioof/UPFun1KKNH0c8d
X-Received: by 2002:a17:907:940c:b0:aa6:82ea:69d6 with SMTP id a640c23a62f3a-aac2ad9e63dmr1788958766b.18.1735024000512;
        Mon, 23 Dec 2024 23:06:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735024000; cv=none;
        d=google.com; s=arc-20240605;
        b=VzbhrdrHMtGZ9eDr3Gy88we9V6BYEwSVfjbBwmdb7GbmNREeEKeRBfNvCyAQTTd+Fh
         zpx2Lpb9z9ObM/mryBhPzqEcoJ2483wiTkW7NhjlrlVOw88UqQYJ/xieqgttUcuEhl7+
         o6vo1ON2zdN0o3ULRTKCUN7vmLTE0vw1eG6TjQCoFdvoxIjdSRz/SLRjPwVNN6vUMzEN
         naPMKqP6vrHPTIIHOLc7RWbsRmsRZdvw2Ecd4wIY7Bse7MTxDqgvZM10yQOKvedhqdIa
         l2Svol6yW1FBv2cd7lVZWPeNHopsIvK55bbZhe7RaDfYXGFe75/Sk9XH7h8OUlvqOd6t
         myBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:subject:date:to:from:mime-version
         :message-id:dkim-signature;
        bh=kWVjX5k1EJVGNvEOjnKyb0aIGbjh+uNoYIoffzUEEZE=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=YUX/5SZu/7P/6wcdqK57X3tChEPOz7OiaNJUu2DYIQSXpT3icufS74g33FYfzYuF9T
         M6Jzi3bsfHUzqIOz41F61f5nEjt9mkp7UARo2yO3h7waB0K4wF/n1uE9u8xCi97QhimF
         WadZy+wmOD5zQtJHQLvalIHjjeM93GL1i9mmyU3Ae91A6y71RWI+L59MHZ/ur6NEXMcr
         EGghDBX/dlvdmRbj4lR84Xb7E1XOj6/sUKFv5yWPsDNg+l9tXKuhd+RGj/uiY1Wwld7Y
         0phwbkyCYPHqHqT3M7F184QPG/9Dny8Qkm4FyK8hs/ukq05o/8DL2fwpRCMp0XNMZW78
         ZIwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ascio.com header.s=fra2_dkim0 header.b=KiS4BpsA;
       spf=pass (google.com: domain of noreply@ascio.com designates 212.123.41.227 as permitted sender) smtp.mailfrom=noreply@ascio.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ascio.com
Return-Path: <noreply@ascio.com>
Received: from smtprelay.ascio.com (smtprelay.ascio.com. [212.123.41.227])
        by mx.google.com with ESMTPS id a640c23a62f3a-aac0eff2468si689119766b.345.2024.12.23.23.06.40
        for <emil.skogsund@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2024 23:06:40 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@ascio.com designates 212.123.41.227 as permitted sender) client-ip=212.123.41.227;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ascio.com header.s=fra2_dkim0 header.b=KiS4BpsA;
       spf=pass (google.com: domain of noreply@ascio.com designates 212.123.41.227 as permitted sender) smtp.mailfrom=noreply@ascio.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ascio.com
Received: from fra0vwgws01 (unknown [10.2.62.254])
	by smtprelay01.fra2.tucows.net (Postfix) with ESMTP id 4FC1F1000088
	for <emil.skogsund@gmail.com>; Tue, 24 Dec 2024 02:06:40 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ascio.com;
	s=fra2_dkim0; t=1735024000;
	bh=EXw44ozfPoQC0s+idEhkQuvJZ7so83QvDofirDN18UM=;
	h=From:To:Date:Subject:From;
	b=KiS4BpsAEQREpV2reiLLqzbUoF9imqb/+AfIUz6DnaH3cqC8j1e4FI4BL0ChV71Te
	 PGDCQJdUDVPr1WZqkqDxavhs730o5NNyS0uZJpx5QeviPs0z9TfnCfFyM0WRrWEHVy
	 43TfGGR4paIYZ8ocDJr6LotZZwX/r5gJRgq/AWeE=
Message-ID: <am.13120062554870766508@messages.ascio.com>
X-Sent-By: MG/1.0
MIME-Version: 1.0
From: "noreply@ascio.com" <noreply@ascio.com>
To: emil.skogsund@gmail.com
Date: 24 Dec 2024 07:06:40 +0000
Subject: Create your Company Brand by Designing Logo and Website
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: drfx4KBUN0nn

<html>=0D=0A     <header>=0D=0A          <title></title>=0D=0A   =
       <style type=3D"text/css">=0D=0A            body {=0D=0A   =
             font: normal 15px Verdana, Arial, sans-serif;=0D=0A =
               margin-top: 25px;=0D=0A                margin-left=
: 25px;=0D=0A                margin-right: 25px;=0D=0A           =
 }=0D=0A          </style>=0D=0A     </header>=0D=0A=0D=0A     <b=
ody>=0D=0A        <p>Dear Registrant,</p>=0D=0A        <p>=0D=0A =
             As part of our requirement to maintain the ability o=
f users to contact the registrant of a domain we are forwarding y=
ou =0D=0A              this message that has been submitted throu=
gh our online contact form.=0D=0A        </p>=0D=0A        <p>You=
r details have not been disclosed to the requestor and we will no=
t review or store this message.</p>=0D=0A        <hr/>=0D=0A     =
   <p>Regarding domain: <strong>skogix.online</strong></p>=0D=0A =
       <p>Do you need a logo or a website made? We are a team of =
logo & website designers / developers and work for clients global=
ly.=C2=A0 Our logos cost USD 75 only for 4 different designs to c=
hoose from with unlimited revisions while=C2=A0professional websi=
te designing starts from USD 399=C2=A0only</p>=0D=0A        <br/>=
=0D=0A=0D=0A        <strong>Reply To: </strong><a href=3D"mailto:=
logo-website.desiging@zermaiyyo.info">Celina Jones</a>=0D=0A    <=
/body>=0D=0A</html>

