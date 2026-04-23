Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:1594:b0:ab6:fa07:db4 with SMTP id cf20csp1154231ejc;
        Sat, 1 Feb 2025 09:32:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4cfIq4GxRHm3ozjqQAjM5Bp+j8b2Z8Ju2Y2mBqtIHypRbWxeFsE3sOUKjkyBM3PvXRFou
X-Received: by 2002:a05:620a:6081:b0:7b6:f1be:4f68 with SMTP id af79cd13be357-7bffcda57femr2524982685a.46.1738431148722;
        Sat, 01 Feb 2025 09:32:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738431148; cv=none;
        d=google.com; s=arc-20240605;
        b=MPKxyRFCZEd9QROfECAXcd96uvsy1YfIfF8wLUsq3AwEgBH7XeornxFAtT6HKVBmRL
         Byw0HB4MUtMBAfqmw94XH+a8Z6HgRXqEYK2M/uNob+HLEqQNsu2wdbh7VLbt2vnkffUj
         51/pKRtGLZ6Syh1typml5OHsYDt1YO5KCsreuLrxHfhHzt7NLkoKiN6nj94Df7vGzoex
         BvfGrvN9QiUzesZRE/Hnvp62XmdaT0fiuebe8mGuBsU1OK+wHCT+Qp9V2cBHmlYDv6A/
         PRucubAqYwzQdSO9ccnH7TxfB6wf3O8afSeKYURC8xCVc4ObM5PPg4Zuu3qeN5qXWdki
         XFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=D7gxTdoVox/J/FJ75B4smx94LLIK/6KwWA9otuRQ+kc=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=DOo1wZD2XKbqpGZK1rugoJR7X21Fa/2OkI+ZKK8n12tExOLrtxFJiu4Nj3JD7KEFTk
         DZBVaQG5uf4whEVeS/MJZHk45zFut2zMfqNdxpotOjWFEVOTE68nCOCv16amVEU/dUCY
         ML+329H8c/6NHN+13uE3FTg7ufWj5PrJO5WvcShQliGwbLwarFZGYnpFoFb1Q/F8fFLs
         ZYWR25cWi+VbLQTSukegwIZ/YiBVRwpWydww66VQlzBxM3w3K1cEHI2AWhf0lLSDF91F
         jeYeRXe8bJWg7nLIEGKfhoWA5jUzN6nxt1jOF4adfekJgDw20A33SIF1rP//Io/rd0Dj
         tyng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=JOAED7Zj;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=wV3hguE9;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.121.119 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wrqvtwtt.outbound-mail.sendgrid.net (s.wrqvtwtt.outbound-mail.sendgrid.net. [149.72.121.119])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8bf4afsi244417185a.35.2025.02.01.09.32.28
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 09:32:28 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.121.119 as permitted sender) client-ip=149.72.121.119;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=JOAED7Zj;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=wV3hguE9;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 149.72.121.119 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=D7gxTdoVox/J/FJ75B4smx94LLIK/6KwWA9otuRQ+kc=;
	b=JOAED7ZjCJEZuXrC1Jky2+57WiAkLp+EtZalze+pRLrydOy7JU/ULwMmDxr6Nv2i+nQP
	cfOfyg8lj1J55CWRF4TDJ/E1p3kDgZnZEYDUH5Cvspl8hFNDe/8pBD5ir4WllkBJYS9pGz
	+kzKYvxVr6NTiV76flz2e9RxF/4lyb0/mI8sPyEiUynksJSa+plJQq+8KVusb60s/qxk6k
	91QZkBD5/HFTL21kL3ZSp1QDO0KDT5AJZazmT6xhnSMYcEGWH22YSXIdLdq0k2WF+83md8
	AipsQpSEwY71Z9FWXka+TrY1YIBDWcMxqCxtO/rdvNAc7Zeseqoi6Ihq5G/ui+sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=D7gxTdoVox/J/FJ75B4smx94LLIK/6KwWA9otuRQ+kc=;
	b=wV3hguE9pomHUIxOP8qf/CqXK2bvAwGdrhaErU3EIknbHtzw2aFddB8ManDQz87VBAVW
	hE3+eIYA5vQVlVo4KiDR2YooJegxLVOz9aiz058rOmO5+DGfHLVuObblZp3fT8ndcb41pE
	+ffY+rZYSjST7XWmE0oD/KVKIQfcWm/uE=
Received: by recvd-5c8ccdbd88-zc62f with SMTP id recvd-5c8ccdbd88-zc62f-1-679E5AAC-1
	2025-02-01 17:32:28.007843503 +0000 UTC m=+6811777.000665371
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-29 (SG) with HTTP
	id DtKQ_S9eT0CJA9XgyGc0pQ
	Sat, 01 Feb 2025 17:32:27.886 +0000 (UTC)
Content-Type: multipart/alternative; boundary=f9103b87c9272ac1307620110b683bccd210bcb0d6e0a05500db04273c78
Date: Sat, 01 Feb 2025 17:32:28 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <DtKQ_S9eT0CJA9XgyGc0pQ@geopod-ismtpd-29>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4Y9bPlLyL5qsXGm?=
 =?us-ascii?Q?71scKwTZyQwP+OoZXKeWvGxyS=2FOn+0fUdPss2sU?=
 =?us-ascii?Q?FaTvoBpDGFJMYXG5DeWMEw7Cpse7EFBLJX2+cq0?=
 =?us-ascii?Q?TTB9p=2FoQDquuLVBQypQN=2FyMRB3xGMaPuj9tXvMz?=
 =?us-ascii?Q?fijq8AmT=2FV0sYGWr6uCoG4ee0nsR6Cf=2F1HXAN9k?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: yUY4uac17qp+

--f9103b87c9272ac1307620110b683bccd210bcb0d6e0a05500db04273c78
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Eden Ahbez: The Strangest Hit Songwriter
A fascinating deep dive into the life of Eden Ahbez, the composer of the 19=
48 hit "Nature Boy" performed by Nat King Cole. Ahbez was a unique characte=
r who lived an unconventional lifestyle, including sleeping outdoors and un=
der the Hollywood sign. The article explores how he was possibly the first =
hippie, predating the movement by decades.
Key Discussion Points:
Many readers discovered that the song was featured prominently in Baz Luhrm=
ann's "Moulin Rouge!"
Interesting discussion about the song's musical composition, including its =
unusual chord progression
Historical context about possible inspiration from a Yiddish theater song "=
Shvayg, mayn harts"
2. Making Local LLM Voice Assistant Faster with RAG
A technical article about improving the performance of a local LLM-based vo=
ice assistant using RAG (Retrieval Augmented Generation). The author descri=
bes how they optimized their home assistant by reducing context length and =
implementing smart retrieval of relevant information.
Key Discussion Points:
Discussion about the authenticity of Llama 3 model mentioned in the article
Suggestions for potential optimizations using precomputed responses for com=
mon queries
Comments about the LLM's response style and personality
3. Face of Ancient Australian 'Giga-Goose' Revealed
Scientists have discovered a well-preserved skull of Genyornis newtoni, a m=
assive flightless bird that lived in ancient Australia. Standing over two m=
eters tall and weighing up to 240 kg, this "giga-goose" went extinct shortl=
y after humans arrived in Australia.
Key Discussion Points:
Extensive debate about the true cause of extinction - climate change vs. hu=
man impact
Discussion about the timing of human arrival in Australia and population si=
zes
Interesting observations about the term "giga-goose" and its recent emergen=
ce in scientific literature
This email has been sent by Toolhouse. To change your delivery preferences,=
 please visit https://app.toolhouse.ai/settings
--f9103b87c9272ac1307620110b683bccd210bcb0d6e0a05500db04273c78
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<!DOCTYPE html>
<html>
<body style=3D"font-family: Arial, sans-serif; max-width: 800px; margin: 0 =
auto; padding: 20px;">

<h1 style=3D"color: #ff6600;">Hacker News Digest</h1>

<div style=3D"margin-bottom: 40px;">
    <h2>1. Eden Ahbez: The Strangest Hit Songwriter</h2>
    <p>A fascinating deep dive into the life of Eden Ahbez, the composer of=
 the 1948 hit "Nature Boy" performed by Nat King Cole. Ahbez was a unique c=
haracter who lived an unconventional lifestyle, including sleeping outdoors=
 and under the Hollywood sign. The article explores how he was possibly the=
 first hippie, predating the movement by decades.</p>
   =20
    <p><strong>Key Discussion Points:</strong></p>
    <ul>
        <li>Many readers discovered that the song was featured prominently =
in Baz Luhrmann's "Moulin Rouge!"</li>
        <li>Interesting discussion about the song's musical composition, in=
cluding its unusual chord progression</li>
        <li>Historical context about possible inspiration from a Yiddish th=
eater song "Shvayg, mayn harts"</li>
    </ul>
</div>

<div style=3D"margin-bottom: 40px;">
    <h2>2. Making Local LLM Voice Assistant Faster with RAG</h2>
    <p>A technical article about improving the performance of a local LLM-b=
ased voice assistant using RAG (Retrieval Augmented Generation). The author=
 describes how they optimized their home assistant by reducing context leng=
th and implementing smart retrieval of relevant information.</p>
   =20
    <p><strong>Key Discussion Points:</strong></p>
    <ul>
        <li>Discussion about the authenticity of Llama 3 model mentioned in=
 the article</li>
        <li>Suggestions for potential optimizations using precomputed respo=
nses for common queries</li>
        <li>Comments about the LLM's response style and personality</li>
    </ul>
</div>

<div style=3D"margin-bottom: 40px;">
    <h2>3. Face of Ancient Australian 'Giga-Goose' Revealed</h2>
    <p>Scientists have discovered a well-preserved skull of Genyornis newto=
ni, a massive flightless bird that lived in ancient Australia. Standing ove=
r two meters tall and weighing up to 240 kg, this "giga-goose" went extinct=
 shortly after humans arrived in Australia.</p>
   =20
    <p><strong>Key Discussion Points:</strong></p>
    <ul>
        <li>Extensive debate about the true cause of extinction - climate c=
hange vs. human impact</li>
        <li>Discussion about the timing of human arrival in Australia and p=
opulation sizes</li>
        <li>Interesting observations about the term "giga-goose" and its re=
cent emergence in scientific literature</li>
    </ul>
</div>

<hr style=3D"margin: 40px 0;">

<footer style=3D"font-size: 12px; color: #666;">
    <p>This email has been sent by Toolhouse. To change your delivery prefe=
rences, please visit <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswbfp5_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmB6lGuEu8eT71B-2BHiOba=
jNVgDPSd9kq3XbTS80joA9O6wqvA-2BlckhKNgj5JzQYbdJa8Tpvg2adO9uiuIkDSN0fTBOf2yS=
hepep2nPURrp1CMQxKDKj4Raj5JMqS0y8YTaN9xJoIFQXFJ02gqn5I8d3lpXtJYvNlMTKhcV7UI=
-2BDZnw-3D-3D">https://app.toolhouse.ai/settings</a></p>
</footer>

<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GJaevo6U1iH-2B86WFsB-2BTx7xPJCjgmKovQagxnmVqR=
4IZZNQr-2Ft9TS7xU8BKJf-2FkF8YyL5Q-2BY9CeUqw4mYwROM5o7fF7YWNuRq3xkA2VAYZQGgf=
Nj-2Fm1etLk-2Bgs2y5-2BGDknsURiudCFUyauQpZHNww6gwjCjmnFtoVeBjFiNztcm6LKAgH3l=
ynGZacu9Zn-2B46M4-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=
=3D"height:1px !important;width:1px !important;border-width:0 !important;ma=
rgin-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;=
margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !importa=
nt;padding-right:0 !important;padding-left:0 !important;"/></body>
</html>
--f9103b87c9272ac1307620110b683bccd210bcb0d6e0a05500db04273c78--
