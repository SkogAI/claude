Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:1594:b0:ab6:fa07:db4 with SMTP id cf20csp596918ejc;
        Fri, 31 Jan 2025 09:32:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4Cq6iJhgYMdckCPsT/dZaxUT3oVU9CYaWhoQ/RFM8Hchox5v6teUkcfBBPY3EVygr25Ii
X-Received: by 2002:a05:6102:5e8b:b0:4af:e5fd:77fc with SMTP id ada2fe7eead31-4b9a4ebe487mr12450911137.3.1738344736605;
        Fri, 31 Jan 2025 09:32:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738344736; cv=none;
        d=google.com; s=arc-20240605;
        b=U2NmuHsTVEMvZfZzCMeX7SO62SggzXDEHb/4n9ePweqaEBCQioZ0hwVdOfAh+ckZb/
         xK/IYeH8EYLsZYnqmU+TB6drSjacaZA93BQSEoEIf3od9H+d7+VyU2VTAXwPgMuDA4EQ
         69h/yWHvha/9DYYIRXQuiF9mj3h3fo4rD688vDweuTkI8NIJKytf43VB2AfWdFQ6/hsw
         brN1OPEIIGl3E+PZXElwBtXEU0e+ZAjnKe0RXGS1tZZiLGrFoJZ0loB3zGEbAi2kbf9n
         iAovrU3BG2Huqr5Rh6HlTBv/PqRPIuzBq+VAGgJL+1ACm9Cqse8jAmlqBQnxuj/aXHbM
         k/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=4NH3q8Jj8i4EJcF+SZGq1kkzBIA/Lwf6nX015rAylKc=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=HJ1Abj0ASQuxAXF6GATBr553NF6IPILaSlmapm0yfBGMGIkMqj6IFASAJZbyu2hRkJ
         +s765F1HteJS9r2OPnCnFDn2NwWPDMKFsxyVEWKqsTA9b8XwFnTWug2Gp1LhpLT0uCJ8
         1PkGYk3yQTigicdUC2Je1GbPLJe2DEXVJOsF5CHAre5KWGjL/KAWzOUd+PNtWl+528Re
         W7yiducW7gJKBjADpdg8s8p2rUvyL/fRXwnppV3mND+nS8kBFwzqaB2JDYrG09EXOC6x
         5amt121C++Zl+RBRWfIjP5oQQTYei8dPmKGf50C5hX8tvl6VS5Tne7aGIyLOlvZVjvQD
         yItw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=fv8WqCLk;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=ijDAwsKL;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhst.outbound-mail.sendgrid.net (s.wfbtzhst.outbound-mail.sendgrid.net. [159.183.224.103])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b9bad869a0si927542137.339.2025.01.31.09.32.15
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 09:32:16 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) client-ip=159.183.224.103;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=fv8WqCLk;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=ijDAwsKL;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.103 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=4NH3q8Jj8i4EJcF+SZGq1kkzBIA/Lwf6nX015rAylKc=;
	b=fv8WqCLkrgwtq+jHq0zf0txalsvgB4El/8g6X9TJeXwk858cQR4NYxRn9xDv/7YMI470
	oebnIKgw2bXn+mvO1M5kUVrz9U8SkpSr9mYc3lOY7Eqwam27vVj0NxXjsAbfbgzaV7PS3H
	jROB09bkKKnEttUre4GsXaD7Fr3IWVoxrdbLA5plGe61l6Ht1FaGTD1gkZQqW+9p9wX2xn
	qOHugfOAYJTrelXiZBml451RHCLogK4nCBhmzeTLtZSKP7ZMTYn0gRIPyAIKzuJaKAbSz4
	4TNK/AfsBdGP7Ch/AE/HmJ+iGe1XXCk74E6YtLc4GvKEK3TKN/JwHefXlOYkBs9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=4NH3q8Jj8i4EJcF+SZGq1kkzBIA/Lwf6nX015rAylKc=;
	b=ijDAwsKLqwc2zQZzpMSe5B62JcpTS50Q5xj2CUl0qL0GdHUaq9A9dZtcNjNyuE7DImed
	7o6BOIUI/JO6ujDTrguKDIPrS+u1jbSKqz6KgNmZGnZJmALow1jYW2TLmRIqKWxeASCBFK
	Mg68EdC4mtB+yVbXGw2he3ZpcBQLDu3sk=
Received: by recvd-5f9ffdf494-b2t2l with SMTP id recvd-5f9ffdf494-b2t2l-1-679D091E-1F
	2025-01-31 17:32:14.359526052 +0000 UTC m=+6725731.735168404
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-11 (SG) with HTTP
	id 5x4jaOhYQuius3vRqE7h6g
	Fri, 31 Jan 2025 17:32:14.337 +0000 (UTC)
Content-Type: multipart/alternative; boundary=446ef2c9d820c331c0ae88c0ead31c89a9c62de1bf2a01ad38d68fd35499
Date: Fri, 31 Jan 2025 17:32:14 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <5x4jaOhYQuius3vRqE7h6g@geopod-ismtpd-11>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7e17sKy=2FXSbhMG5?=
 =?us-ascii?Q?4kyHjXYjN5oOqdgIAdradjeViIlQSPjSB3=2FoLU1?=
 =?us-ascii?Q?JDbZNLgdteJpOCR84bHZqyVpGidyl1iaJBMJsiz?=
 =?us-ascii?Q?RrQHEH2i1joLXURrEmfwXgmPl2PSRICWtSftp6F?=
 =?us-ascii?Q?OZQ+Y6VSqZtJexaBwaCEd6n240SzCS6Pbr1PQG8?=
 =?us-ascii?Q?w=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 4aMEY7ej0f8L

--446ef2c9d820c331c0ae88c0ead31c89a9c62de1bf2a01ad38d68fd35499
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
--446ef2c9d820c331c0ae88c0ead31c89a9c62de1bf2a01ad38d68fd35499
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
djMswccjK_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDe-2BOZHjHzI1D-2BtJdV=
cHHEYGidpj231w1-2FT228ZQxw7gmSuoq-2BRgkqu2kpGl0UxqanGOAARQqjh7WKULZrnknnR9B=
6TVyT9XtBaRGGZcMkHpjCVpQw21ICDLmq5fAdsuWTUpJAy4Fd9gT13NuxZtI208YKDWaAW6WyoB=
qg0X86v8A-3D-3D">https://app.toolhouse.ai/settings</a></p>
</footer>

<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GJqz6RwooRtgcGPniefo07CZ0MESNpu3H1eYviJAG7tfX=
2wZy3NQ6DzTX2Wp0LvItYoAo7m-2B-2Bec3PJVH1kb7gosRTC-2FLTBwfT0wFizV1x-2BlASgXj=
ltu67rC0Iy821iEdFyRh6O4GjI6hW8fI9110dIveiUYUmORnnsM5Ombq9ie7-2BR57-2BDAq1W2=
MBasDErLSr0-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"hei=
ght:1px !important;width:1px !important;border-width:0 !important;margin-to=
p:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-=
left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padd=
ing-right:0 !important;padding-left:0 !important;"/></body>
</html>
--446ef2c9d820c331c0ae88c0ead31c89a9c62de1bf2a01ad38d68fd35499--
