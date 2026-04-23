Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:94cc:b0:ac7:e5d6:90a7 with SMTP id dn12csp1664666ejc;
        Mon, 7 Apr 2025 10:31:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH9KyCgFkbTGy5H4Du1Yno0HaB7ggOG+SltgzLV72WOCMNM4A7959m2wkjpFpkZXgseCjo
X-Received: by 2002:a17:90b:2d0d:b0:2fe:b735:87da with SMTP id 98e67ed59e1d1-306af5f1de3mr17057228a91.0.1744047061144;
        Mon, 07 Apr 2025 10:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744047061; cv=none;
        d=google.com; s=arc-20240605;
        b=dDLay1yDAvS1MGtGkQz/2YfRUro2fxCA4llPtpU0gkifO4wA2GlfLnoT7u+NTgMH9D
         WxS/itjjOhwHeo2EeAPtoTSxFE6YSQ46U4bTCB4szWlm6/E8kst+YPitzA8ZOiunfmXw
         V6geAakrd6d8FCYbadowFUArkeUC6JVd2OqobMdrVf+IBcU+2UjQ17E8nG3tCi21B+La
         /AJxJHfNuOY5sgkLEQFyLaLRS4Pwlb9FrUls0FXbvpApH91bR246FAazLCPV0sMkNXm3
         X+dci4dsEROOz7Mp7ohLc1e9BkQUu1TIuENAwpWWnkdo3rv5+14KYTPi4GfTk0a83E33
         SiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=ND13avBL5IwkNE5uhchHTuNHnMigbLdVb06ZYdUIj7U=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=llEQPgkPOB6uJd5RlABI13V7YHdSaiTCqdr0/IzsSvhSTlwb6xzlvlzOQ6HrjuRzCL
         uq9tLBzdSeZN8smvaMIdnVTszhMnUn/n9nd51bCmeR9YSPQfb4MRINGZWBQzqIln75ZY
         iNR8bmovsM1tNhU5ijOVgoUP7snqIP5E4ruG4eFIgx2/Dom3AOhLIg1nvdSfx4KxYmfG
         KeK9hcjiZ68Rrk6U+PQl0XCyY2XDzEyX6OIVne6yYEYYMdU6nbZb4RZT/zQSKo65Vdgw
         s8HQ90kMXLvQorG5kJS2I3Nt9TA+8eVhU2xBSoIKjCvdbSvlVMTvFIFNqIQPsmQ3AKF8
         6sLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=aoQ1nETR;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=uWDaLfIZ;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsb.outbound-mail.sendgrid.net (s.wfbtzhsb.outbound-mail.sendgrid.net. [159.183.224.107])
        by mx.google.com with ESMTPS id d9443c01a7336-22978a6a98bsi122804345ad.563.2025.04.07.10.31.00
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 10:31:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) client-ip=159.183.224.107;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=aoQ1nETR;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=uWDaLfIZ;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=ND13avBL5IwkNE5uhchHTuNHnMigbLdVb06ZYdUIj7U=;
	b=aoQ1nETReg5+/iXmQlw4tk2jM+avc108Sv2h5+8xZXDZvKpknWeVM3PA2PauMjI7CSBC
	o4F8Cuauxg8LBwId9kxp5eQ0F6czOvL+DxeeNdXW2ry8GXsQr1AsCfVzwlBD4uztuFOKWq
	wLIFor0j546KkIjPI/RsNIDeiHwxo+jJeow10FFk9rco/BsOcJUCKWl3KR/HTpii0RH/qr
	Fu8f6Ll5mqXT1yvCkxMvhrxq7XwHSH7p6IzPXhX2UU0m0tYUEEE51KanVpAWNvQzh9JP9P
	nD3N+GUVGP7Qwh3LiFA6Uvfqdbhx/PB0NP0Nm2MeDfYeU1ZLZ25MoJiDOIdcON5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=ND13avBL5IwkNE5uhchHTuNHnMigbLdVb06ZYdUIj7U=;
	b=uWDaLfIZ/h3L87yrCQAbS6+bH4QFA8RtjrfblFHUVyIMZpPztrzauqhjW/mqbHAC8/yd
	Z4+aOXVRaqmKr5gYBQU1C2sFGcy8o9lJxCG+ucCJxjHi6HSbDvhS/luaYgJvZDUtUJEN50
	ob6tnSnV7c4yuUrn59f8wDktJ1b4YbwuE=
Received: by recvd-8856c7f54-96jdm with SMTP id recvd-8856c7f54-96jdm-1-67F40BD2-22
	2025-04-07 17:30:58.164376679 +0000 UTC m=+1133932.290557028
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-15 (SG) with HTTP
	id 5zzOsdaJRcaDbNgC6rm7Zg
	Mon, 07 Apr 2025 17:30:58.116 +0000 (UTC)
Content-Type: multipart/alternative; boundary=5dfe1768900f45800b798c653489396e02f1fcd9df44bf14421c27f43a12
Date: Mon, 07 Apr 2025 17:30:58 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <5zzOsdaJRcaDbNgC6rm7Zg@geopod-ismtpd-15>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n53+o5RrJB=2FunUDE?=
 =?us-ascii?Q?Iwk13Ruz=2F4EtAPgaaFMKFktua8IR7Ou5micwAF2?=
 =?us-ascii?Q?=2FfumNRQbH3ch=2F1ACaYAcjC278jOVQPzZrnkSm+C?=
 =?us-ascii?Q?NA8KVcJqHoO=2FOayVJF0UfbE=2FN8TCEKN57vH4R9J?=
 =?us-ascii?Q?jyBjPmAWARD+bxmyPryudKvwTgfjlsQcDVlzP=2FO?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: bY+VuF7ZytUO

--5dfe1768900f45800b798c653489396e02f1fcd9df44bf14421c27f43a12
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0

Hacker News Digest
1. Show HN: Browser MCP =E2=80=93 Automate your browser using Cursor, Claud=
e, VS Code
This tool connects AI applications to your browser, allowing for automation=
 of tasks like form filling and data collection. It emphasizes speed, priva=
cy, and ease of use.
Top Comments:
Curious why an extension was chosen over remote debugging.
2. Decoding the 90s: Cryptography in Early Software Development
This article reflects on the vulnerabilities in early cryptographic impleme=
ntations, highlighting the mistakes made by developers and the evolution of=
 cryptography practices.
Top Comments:
Many in-house RC4 implementations were vulnerable due to poor practices.
Microsoft's use of CRC32 for password hashing was a significant flaw.
3. LLMs understand nullability
This post explores how large language models (LLMs) handle nullability in p=
rogramming, discussing their understanding and reasoning capabilities.
Top Comments:
Interesting insights into how LLMs reason about code.
Discussion on the implications of LLMs understanding programming concepts.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--5dfe1768900f45800b798c653489396e02f1fcd9df44bf14421c27f43a12
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8
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
    <h3>1. <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=3Du001.du=
okMj2A9CmwqP6J5tp-2BO2uZRz82QUTRZnkU2jFp230-3D2MRY_zKD9qStml-2FkjU46ulTqeWV=
srM3061nr98hteMD12SmAd0dS-2BmUgwp0Kzl6DmSYpXifpWYUBJy7wIqmF25jG6FKfrQ-2F1Vj=
y1kIz1oF-2BLndGlsj-2FcFulNnqRcHihwLfyoF5hQ3iwbXtvE2UYUOcZr2OF-2BMnB1lHriTU7=
2lOXNQO5EAS4ygiHBJ5H6nOG4jhEQT-2BDuKeF2EULW5SL6GYQLzxA-3D-3D">Show HN: Brow=
ser MCP =E2=80=93 Automate your browser using Cursor, Claude, VS Code</a></=
h3>
    <p>This tool connects AI applications to your browser, allowing for aut=
omation of tasks like form filling and data collection. It emphasizes speed=
, privacy, and ease of use.</p>
    <p><strong>Top Comments:</strong></p>
    <ul>
        <li>Curious why an extension was chosen over remote debugging.</li>
    </ul>

    <h3>2. <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=3Du001.du=
okMj2A9CmwqP6J5tp-2BO5Qi436mllpvQGrssWUsAN73T-2BXJVy1njQ4uhf8Zla4T6UmJfvaj1=
teMUIyLPh1-2B3A-3D-3Dlcbp_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAd0dS=
-2BmUgwp0Kzl6DmSYpXifpWYUBJy7wIqmF25jG6FK4-2Fgw9x4TfWAMXddRJKTcW5N1lPvzmZ-2=
BaMMfPeN-2BertO3GwdeK5FBIPWOKmfXDOSFrrBZlSO3f4vrlP3-2Biztv7brvlkBxTX6YaZn-2=
BP2CNLoNhFdPqBQ0NWk-2Bm9GgpIqbg-3D-3D">Decoding the 90s: Cryptography in Ea=
rly Software Development</a></h3>
    <p>This article reflects on the vulnerabilities in early cryptographic =
implementations, highlighting the mistakes made by developers and the evolu=
tion of cryptography practices.</p>
    <p><strong>Top Comments:</strong></p>
    <ul>
        <li>Many in-house RC4 implementations were vulnerable due to poor p=
ractices.</li>
        <li>Microsoft's use of CRC32 for password hashing was a significant=
 flaw.</li>
    </ul>

    <h3>3. <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=3Du001.du=
okMj2A9CmwqP6J5tp-2BO60rmtqQ9NC4h8XL6natU8vg2QzFJV7WX6Unq7MDg52x52t6_zKD9qS=
tml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAd0dS-2BmUgwp0Kzl6DmSYpXifpWYUBJy7wIq=
mF25jG6FKlCXAQgB76RUUdi0yzI2DHPsR1Qqj2GybOiWQsv44cwjlX-2Btj5poveBZ-2BoIB0qm=
uV6DL1EdfKcF1f91G9aSoNX3Owxr1QVfE1Sk3W11YDxtTu2n4-2BswB-2Fqp8BSQR-2BX9Ew-3D=
-3D">LLMs understand nullability</a></h3>
    <p>This post explores how large language models (LLMs) handle nullabili=
ty in programming, discussing their understanding and reasoning capabilitie=
s.</p>
    <p><strong>Top Comments:</strong></p>
    <ul>
        <li>Interesting insights into how LLMs reason about code.</li>
        <li>Discussion on the implications of LLMs understanding programmin=
g concepts.</li>
    </ul>

    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswmcQ2_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAd0dS-2BmUgwp0Kzl6DmS=
YpXifpWYUBJy7wIqmF25jG6FDegj4A2E2gd5feAeXU4sjOQ6V6v-2FKrXuN4M05fhQyYIv96U1-=
2BJwNOEwozxuUpM1af2W-2BFkfam-2B1dyHDP5DbnUFu3NCKXGlpe-2F4zfjGWI84wI-2Fk9uz5=
1rwoiOaLCURi0gg-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GIs7qg0oRSwyOKAc6hQgBDpqjW0DqxCwCM6tOKi0dngtx=
r0UOBTFsc60ppu3gY1gITBajPThLBNmY3KQkJHUXpV7SkzF3EdC1LFtP-2FFDCPDqS2O8qAGrQF=
W-2BDjYmvUxjq-2FwoYx8-2FV5y5GIsWJIGgyZn3MZVDcmb81NQ7gjaEB4ihIbhMVoHDo0-2B5h=
qFWTRcFmo-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"heigh=
t:1px !important;width:1px !important;border-width:0 !important;margin-top:=
0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-le=
ft:0 !important;padding-top:0 !important;padding-bottom:0 !important;paddin=
g-right:0 !important;padding-left:0 !important;"/></body>
</html>
--5dfe1768900f45800b798c653489396e02f1fcd9df44bf14421c27f43a12--
