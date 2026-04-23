Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:2da0:b0:b6d:5460:51a7 with SMTP id gt32csp240275ejc;
        Fri, 24 Oct 2025 21:54:53 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXeh4Gdy5Klh/kNWkDjEyVLvnBFep0ZSTFdtiiOmeBKzFNxLcZ4vPA/sPaUT/NCHex9FZqW6X2DJkLsU011@gmail.com
X-Google-Smtp-Source: AGHT+IG6JneQlslyzx726jGoIhXzU54e3jN7L0UwKJVulbWwPmsLxHEHaSTNdA/XvE0e7zH5CXGI
X-Received: by 2002:a17:902:d50b:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-290cbc3f1b3mr369563705ad.61.1761368093544;
        Fri, 24 Oct 2025 21:54:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1761368093; cv=pass;
        d=google.com; s=arc-20240605;
        b=XtVvJYKAb0IDPjmcrVZI2HxI+/L1th3rhD6fYc8Aed9mjvERXB9YQhD5vEhfLFU511
         pOvEeexvHgdnWKPgDNjlnmi8Bqks6CWYO4w+ulMZjiOV2RUBFchFzIjjlifvSQKFF2Xz
         Dt8PJp12oBCGr1goHHrR35iM2Pw2AjzwheqFUxc5O1j9TllZqgXtDxTzeQiTZOEgjzgg
         DMwJ0XqPZBZ72RaK+fPAEjpE6wjnL4gBalF/Nt6/2ksboaotnK8sBOtkZ359E5x7D1eP
         NW3Jm3RyzGhrgs0spiBv/9OB2G86rjKWp/DV7gqouZe72yR6yPcQK/lQsr7FbbXUOsPJ
         bv/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date
         :content-transfer-encoding:dkim-signature:feedback-id:dkim-signature
         :dkim-signature;
        bh=uY9sNec7HHxmwMCIdnlm4XJQYqWHfWo343AHI7CnMOY=;
        fh=ox7I1i++kaHXRMPypE3FYTKVj3vGvNaucXm71sqoyxE=;
        b=d6D5mm1e3p9tMo4nhlba3YHPh1TyDDnR9P28uytfiF2YAQUoDTwivpXCvjM+REMGoh
         aabWU/O+gDkZ2PepSBgWC2gF4w8yGtABiCGZ5sz+mUURLs7/UPZ9k+wmvPa4gLwG+EZJ
         mKISMoAr36YPPkzeb/8IkFoGgNYGVc7Mw1J6V7yGzcxMYhqsnUwtKmtreHOcOE+32Z0r
         BKM+EprHncrldy5DqIGZ8qFM3R38zC2/otIcKQ9zOgc/ZkIzaBoly7cHQdon3qZzGj5o
         cVur2Xgu9MzPDpiPBHhwcRT4VO6bHO9fJwSWPO0/5LwDbNVOxO0vL4uh38DJkilsIaLx
         XuhA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@cloudflare-email.net header.s=cf2024-1 header.b=h99py0i9;
       dkim=pass header.i=@skogsund.se header.s=cf2024-1 header.b=AdwgeZ73;
       dkim=pass header.i=@tm.openai.com header.s=s1 header.b=fVpjUUne;
       arc=pass (i=1 spf=pass spfdomain=em7877.tm.openai.com dkim=pass dkdomain=tm.openai.com dmarc=pass fromdomain=tm.openai.com);
       spf=pass (google.com: domain of cfbounces+ndrdrop@skogsund.se designates 104.30.8.175 as permitted sender) smtp.mailfrom=cfbounces+ndrdrop@skogsund.se;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=tm.openai.com
Return-Path: <cfbounces+ndrdrop@skogsund.se>
Received: from i-bhf.cloudflare-email.net (i-bhf.cloudflare-email.net. [104.30.8.175])
        by mx.google.com with ESMTPS id d9443c01a7336-2949aada82fsi4765095ad.288.2025.10.24.21.54.52
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 21:54:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of cfbounces+ndrdrop@skogsund.se designates 104.30.8.175 as permitted sender) client-ip=104.30.8.175;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloudflare-email.net header.s=cf2024-1 header.b=h99py0i9;
       dkim=pass header.i=@skogsund.se header.s=cf2024-1 header.b=AdwgeZ73;
       dkim=pass header.i=@tm.openai.com header.s=s1 header.b=fVpjUUne;
       arc=pass (i=1 spf=pass spfdomain=em7877.tm.openai.com dkim=pass dkdomain=tm.openai.com dmarc=pass fromdomain=tm.openai.com);
       spf=pass (google.com: domain of cfbounces+ndrdrop@skogsund.se designates 104.30.8.175 as permitted sender) smtp.mailfrom=cfbounces+ndrdrop@skogsund.se;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=tm.openai.com
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-email.net; c=relaxed/relaxed;
	h=To:Subject:From:Date:Feedback-ID:reply-to:cc:resent-date:resent-from
	:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1761368093; x=1761972893; bh=uY9sNec7HHxmwMCIdn
	lm4XJQYqWHfWo343AHI7CnMOY=; b=h99py0i9+qmfll7XzH4AIA4gzNBav5zdfZO23GVdpc6WN
	nQkYCKnaBHjrCzotgCHD58/48Z76Knf7bsmo03g3nxvc6XBWMPk5wO7rzKTcJNNd8Qd2bXSWz5L
	oEFNaGInOTS+zPqQn5L9ig62xGFe5un0z/3j6l4Y1cla+k2cqLnDmtzJ5fF2/w8YMnMHrD+9gBH
	xXAeTfxbRkxkQY0v/MwugGWygKQXcAtP+RmpzrUT+nnE8/4KrlyVO4blh2g5p7pvCqyML2xEnlp
	pXdawMYeXC05yrZo7vj94mYlkAjmFYB00hMJR5RF4YTE3QZrjg+SLKuAElFw7a4eHA0A1BLQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=skogsund.se; c=relaxed/relaxed;
	h=To:Subject:From:Date:Feedback-ID:reply-to:cc:resent-date:resent-from
	:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1761368093; x=1761972893; bh=uY9sNec7HHxmwMCIdn
	lm4XJQYqWHfWo343AHI7CnMOY=; b=AdwgeZ73+zvz8fADom/GVjjnROlBh5t8126k7iltgmjrb
	WkEYIRH8EG/E/7MRQBcvCqklUcJ9o2q4tX9kTalluHTTUdavHN9FL9KIlR5RWE5iAZKPAm0DyGa
	CcCLunLorzXgJTvvQPPgnvU0s86PiMwgmgDHHiF3Rjoosw2HD6+4H6hrONexw4dzV0iWnQthNh/
	kCJrE1epKnDbI6/9IJbGyu80LdRxjOQE/mLVuwTNBh9nYh5bmgzlDe5jaVinPibKiTJFRWXiBaY
	KDil09W9/7O6AVN0FjzA//k+WQZSJttNRNM+DkLn7cbaHmFKC5ze6TrugHX213J+Pekg389Q==;
X-Forwarded-To: emil.skogsund@gmail.com
X-Forwarded-For: emil@skogsund.se emil.skogsund@gmail.com
Feedback-ID: skogsund.se:1:1:Cloudflare
Received: from o13.ptr1681.openai.com (159.183.12.231)
        by cloudflare-email.net (cloudflare) id B1LtRqYDFOMJ
        for <emil@skogsund.se>; Sat, 25 Oct 2025 04:54:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-email.net; cv=none;
	b=D49ZyPNaRfNzALQqccvdLeKMTgoXdNRM+mxTd78nmUhIWpQY5eOX8D2ekL7R7DqKaXHdFU+qP
	c3k44VYxDt68SdsB8DdRWx/L8DeJkcPHPiEevCMxodCeBnMpRTl8lY130Y/sxrRubo2okt+vIN3
	Ymf2IIj3enbqwDPSk6UMzMGBgAV/isOWpqw6DJ8rFL185M8as79rb0r19svlgqsBg4DmEeL1Z3g
	t5R6twYsHZ13xDP1w9zCVb0jycFBUhdzD5/c7Gzl2NkeWQ+v5Rm+bYcyPdPx2gLywmb18Rc1zj3
	hlPNs5to1LWZQU3GdXEbIO5tFirC34ouk8uEt+0/fydg==;
ARC-Message-Signature: i=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-email.net; c=relaxed/relaxed;
	h=To:Subject:From:Date:reply-to:cc:resent-date:resent-from:resent-to
	:resent-cc:in-reply-to:references:list-id:list-help:list-subscribe
	:list-post:list-owner:list-archive; t=1761368092; x=1761972892; bh=uY9sNec7
	HHxmwMCIdnlm4XJQYqWHfWo343AHI7CnMOY=; b=VIJdVHhY8CHVONM8N1axAPqbuU7t259esT4
	GFcvCSGW6stFyVsiETcZxQxXP4O4JJEmoeokAPj6ej3VYm9RPYKXBBBdfTcrQ/LCKROfeEuX11I
	LDcf1PYVVbJiBvLwGeC+NMtqUYm918F+ky07VuH5DQMfEdblMOWCvd/wT62PrgB/BDC3Rn1uqB3
	Mkx3uWz859CGUHYtJlw3YVPGFBJ0YY7vMCEzOj5eWs5K6rZVT5NjE8guarCqB96ZM6wwTMGNGwF
	wnHCveGEtYLhMYVAogDhNSwitiaNtx592u+YALilif9fxGR68ZVFfZ+mHn2OsGlLy+fJGKG7KqK
	NKibSYA==;
ARC-Authentication-Results: i=1; mx.cloudflare.net;
	dkim=pass header.d=tm.openai.com header.s=s1 header.b=fVpjUUne;
	dmarc=pass header.from=tm.openai.com policy.dmarc=reject;
	spf=none (mx.cloudflare.net: no SPF records found for postmaster@o13.ptr1681.openai.com) smtp.helo=o13.ptr1681.openai.com;
	spf=pass (mx.cloudflare.net: domain of bounces+20216706-9b4f-emil=skogsund.se@em7877.tm.openai.com designates 159.183.12.231 as permitted sender) smtp.mailfrom=bounces+20216706-9b4f-emil=skogsund.se@em7877.tm.openai.com;
	arc=none smtp.remote-ip=159.183.12.231
Received-SPF: pass (mx.cloudflare.net: domain of bounces+20216706-9b4f-emil=skogsund.se@em7877.tm.openai.com designates 159.183.12.231 as permitted sender)
	receiver=mx.cloudflare.net; client-ip=159.183.12.231; envelope-from="bounces+20216706-9b4f-emil=skogsund.se@em7877.tm.openai.com"; helo=o13.ptr1681.openai.com;
Authentication-Results: mx.cloudflare.net;
	dkim=pass header.d=tm.openai.com header.s=s1 header.b=fVpjUUne;
	dmarc=pass header.from=tm.openai.com policy.dmarc=reject;
	spf=none (mx.cloudflare.net: no SPF records found for postmaster@o13.ptr1681.openai.com) smtp.helo=o13.ptr1681.openai.com;
	spf=pass (mx.cloudflare.net: domain of bounces+20216706-9b4f-emil=skogsund.se@em7877.tm.openai.com designates 159.183.12.231 as permitted sender) smtp.mailfrom=bounces+20216706-9b4f-emil=skogsund.se@em7877.tm.openai.com;
	arc=none smtp.remote-ip=159.183.12.231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tm.openai.com;
	h=content-transfer-encoding:content-type:date:from:mime-version:subject:
	to:cc:content-type:date:from:subject:to;
	s=s1; bh=uY9sNec7HHxmwMCIdnlm4XJQYqWHfWo343AHI7CnMOY=;
	b=fVpjUUnedFuYmMYoVCsDOhI0MD4gHAvDvcHAnKbsxCicf4eSCperMeDWuhIoWTI6U6E/
	+XkWInjCWUcRk4T/K8o6uSZ3EU3RGJgHU1xfvpsvEAWTb4ZLUKwt56emY7gicCjSSgKUAU
	iY36VLFAWkbWJtW+QV1Gf+xhZbn3nDb5OZGSWJ3sOOIfCyS8Ff4GI3YFi2/nGrRROZptZz
	9yMHfKTHIHdI6/taqiunnenUeahc1QdVIliCcAUzWAoldypgXrjmXbV7nmqGkVRjfv6hAe
	xI+8HJHe4+0Zvz48HeoWTRzTkgs2sOJAeRujA0zXSpKtYzijA0xtsNPX9tXF86FA==
Received: by recvd-868874bfdf-4nfd6 with SMTP id recvd-868874bfdf-4nfd6-1-68FC581A-19
	2025-10-25 04:54:50.563674155 +0000 UTC m=+6852734.027865782
Received: from MjAyMTY3MDY (unknown)
	by geopod-ismtpd-9 (SG) with HTTP
	id PPZxkN-RRX2WQXr8fgE-uw
	Sat, 25 Oct 2025 04:54:50.526 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Date: Sat, 25 Oct 2025 04:54:50 +0000 (UTC)
From: noreply@tm.openai.com
Mime-Version: 1.0
Message-ID: <PPZxkN-RRX2WQXr8fgE-uw@geopod-ismtpd-9>
Subject: Your OpenAI code is 517545
X-SG-EID: 
 =?us-ascii?Q?u001=2EwgPQEA+gt=2F9mQv4JaEv+7QzQlZ2sWTAFlaEr+UWceqKhDQJ+WiUf3YqCZ?=
 =?us-ascii?Q?3MtLlvIC=2FoHlD1K=2FRP+KM1PthJPGkeg=2F9z0ctfJ?=
 =?us-ascii?Q?cZ4=2FKuL0nUQvoJ=2FhGXKk5YPotRqQ1SfPfo=2FQ2Me?=
 =?us-ascii?Q?KurLuhaHLHT8jUBziQmd4VXecHnJJ6zNZQk+dqg?=
 =?us-ascii?Q?CETZxnUnDSU275ZgKiLI0XsBOmQjU6sVidQ+26G?=
 =?us-ascii?Q?A=3D=3D?=
X-SG-ID: 
 =?us-ascii?Q?u001=2ESdBcvi+Evd=2FbQef8eZF3BoMNuFmcP5rq+Py=2FzrrMdK6QuthCfWhsA2OXF?=
 =?us-ascii?Q?d2ogPal5ecNFS2d9sR6gemXdd8Z7haYPWzNeVm8?=
 =?us-ascii?Q?pN2N9SN6k4Eum9jYh4xkfkxsuh37bkeGjM=2FgfdM?=
 =?us-ascii?Q?gilzX54sIoSxw=2FXLKJt+zXJPh=2FRHPa9P5=2F0dXts?=
 =?us-ascii?Q?KHiAa1flnN+LKVflyjwsXq4QU2BcWFqz8IyLVQX?=
 =?us-ascii?Q?A=3D=3D?=
To: emil@skogsund.se
X-Entity-ID: u001.bVuJR+6WQkYgHBZFem2ybw==
X-TUID: Q9b542dfpidu

<!DOCTYPE html>
<html>
<head>
 =20
  <meta charset=3D"utf-8">
  <meta http-equiv=3D"x-ua-compatible" content=3D"ie=3Dedge">
  <title>Your OpenAI code is 517545</title>
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1">
  <style type=3D"text/css">
  /**
   * Google webfonts. Recommended to include the .woff version for cross-cl=
ient compatibility.
   */
  @media screen {
    @font-face {
      font-family: Colfax;
      src: url(https://openai-public.s3-us-west-2.amazonaws.com/beta/fonts/=
ColfaxAIRegular.woff2);
      font-weight: normal;
    }

    @font-face {
      font-family: Colfax;
      src: url(https://openai-public.s3-us-west-2.amazonaws.com/beta/fonts/=
ColfaxAIMedium.woff2);
      font-weight: bold;
    }
  }

  /**
   * Avoid browser level font resizing.
   * 1. Windows Mobile
   * 2. iOS / OSX
   */
  body,
  table,
  td,
  a {
    -ms-text-size-adjust: 100%; /* 1 */
    -webkit-text-size-adjust: 100%; /* 2 */
    font-family: Colfax, Helvetica, Arial, sans-serif;
  }

  /**
   * Remove extra space added to tables and cells in Outlook.
   */
  table,
  td {
    mso-table-rspace: 0pt;
    mso-table-lspace: 0pt;
  }

  /**
   * Better fluid images in Internet Explorer.
   */
  img {
    -ms-interpolation-mode: bicubic;
  }

  /**
   * Remove blue links for iOS devices.
   */
  a[x-apple-data-detectors] {
    font-family: inherit !important;
    font-size: inherit !important;
    font-weight: inherit !important;
    line-height: inherit !important;
    color: inherit !important;
    text-decoration: none !important;
  }

  /**
   * Fix centering issues in Android 4.4.
   */
  div[style*=3D"margin: 16px 0;"] {
    margin: 0 !important;
  }

  body {
    width: 100% !important;
    height: 100% !important;
    padding: 0 !important;
    margin: 0 !important;
  }

  /**
   * Collapse table borders to avoid space between cells.
   */
  table {
    border-collapse: collapse !important;
  }

  a {
    color: #10A37F;
  }

  img {
    height: auto;
    line-height: 100%;
    text-decoration: none;
    border: 0;
    outline: none;
  }

  h1 {
      font-size: 26px;
      line-height: 1.4;
      font-weight: 700;
      margin: 0;
  }
  h2 {
      font-size: 24px;
      line-height: 1.4;
      font-weight: 700;
      margin: 0;
  }
  p {
      margin: 0;
  }
  p + p {
      margin-top: 16px;
  }
  </style>

 =20
</head>
<body style=3D"background-color: #ffffff;">

  <div class=3D"preheader" style=3D"display: none; max-width: 0; max-height=
: 0; overflow: hidden; font-size: 1px; line-height: 1px; color: #fff; opaci=
ty: 0;">
      Enter this temporary verification code to continue: 517545.
  </div>

  <!-- start body -->
  <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"100%">
    <!-- start body block -->
    <tr>
      <td align=3D"center">
        <!--[if (gte mso 9)|(IE)]>
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" width=3D"600">
        <tr>
        <td align=3D"center" valign=3D"top" width=3D"600">
        <![endif]-->
        <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" style=3D"width: 560px;background-color:#fff;">
            <!-- header image -->
            <tr>
                <td valign=3D"top" style=3D"padding: 27px 20px 24px 15px;">
                    <table align=3D"left" width=3D"100%" border=3D"0" cellp=
adding=3D"0" cellspacing=3D"0" style=3D"min-width:100%;">
                        <tbody><tr>
                            <td valign=3D"top" style=3D"padding-top: 0; pad=
ding-bottom: 0; text-align:left;">
                                <img align=3D"left" alt=3D"" src=3D"https:/=
/cdn.openai.com/API/logo-assets/openai-logo-email-header-1.png" width=3D"56=
0" height=3D"168" style=3D"width:140px; max-width:100%; padding-bottom: 0; =
display: inline !important; vertical-align: bottom;">
                            </td>
                        </tr>
                        </tbody></table>
                </td>
            </tr>

         =20
<tr>
    <td align=3D"left" bgcolor=3D"#ffffff" style=3D"padding: 16px 24px; fon=
t-size: 32px; line-height: 40px;">
        <p>
            OpenAI Log-in Code
        </p>
    </td>
</tr>
<tr>
    <td align=3D"left" bgcolor=3D"#ffffff" style=3D"padding: 16px 24px; fon=
t-size: 16px; line-height: 24px;">
        <p>
            Hi there,
        </p>
        <p>
            We noticed a suspicious log-in on your account. If that was you=
, enter this code:
        </p>
        <h1>517545</h1>
        <p>
            If you were not trying to log in to OpenAI, please <a href=3D"h=
ttps://u20216706.ct.sendgrid.net/ls/click?upn=3Du001.IQLfsj4kk-2BK7JhymNusR=
MmfwoG2v3nTgHW39-2Fobue0v2VhH5-2BE0zo7ACY99-2FinDaFd7n4QXFQ88vaAvg4Yh-2FvnU=
DCf4-2BAFFfzo-2Fq7TrRncfLPouhbxwQ5rhmu-2BvEVX60ToEf_lRaxln83oV-2FfQGD2ugGGV=
nfJQd8CB87e2kqBNMlv1ZYMXwcvr6yQhlE6Xi1c-2FGKBJ6oS5nSpcEGDspcXeLLFkvUBC8f5eF=
2syaHFuDYlRqk1TJwtcfhl9jps5H4keOPFydhG7pRGAmbnAb2Bnnw12bvU4LCmOcrD1v-2FR3jw=
yQomHT7tImwY7kKplcCY4l06DhID-2FsBhbWexbjsrgNHIlW7WOJaNhuDL0JIWzyZD5WrqW4jh1=
XFIZeHuLfi93Kl543e9h0NFdrG2Qwt-2FaPPTk5ukioQdyznXcg3e8oQCRnr7AWbaaoCEYTFcg-=
2ByaPgB4DSCSdjJDWmRVbcpyKcpWk7dGWhmHiHf-2B-2Bk3xTdEFO2l3AT7EaKMIy7EvHwi45bX=
dv1sKpkmO6ErtEfACyBATblg-3D-3D">reset your password</a>.
        </p>
        <p>
            For more information about why you received this email, please =
see the help center article on <a href=3D"https://u20216706.ct.sendgrid.net=
/ls/click?upn=3Du001.IQLfsj4kk-2BK7JhymNusRMmfwoG2v3nTgHW39-2Fobue0s7ULBXAx=
de-2BKPwzW37FVj17FoKWOB-2F5TvVjpa-2BHt1UDY-2B4OCAXKKxfkFqM5ETjhOMt48em1y8Vi=
TYj0tTMyBaCYfxj4pNqyq5h-2BD-2BBl5VMXVDu9ly97-2FikfP8zqZGcu-2F8-3DymEt_lRaxl=
n83oV-2FfQGD2ugGGVnfJQd8CB87e2kqBNMlv1ZYMXwcvr6yQhlE6Xi1c-2FGKBJ6oS5nSpcEGD=
spcXeLLFkvUBC8f5eF2syaHFuDYlRqk1TJwtcfhl9jps5H4keOPFydhG7pRGAmbnAb2Bnnw12bv=
U4LCmOcrD1v-2FR3jwyQomHT7tImwY7kKplcCY4l06DhID-2FsBhbWexbjsrgNHIlW-2FnP8c-2=
B3XVQqN1QdUgZ5n3y2kOl0SRDr6KwzztkCqeDhAHf6tvsvuX5nEhZFKXU8yNq09PsTE5sP-2Fji=
z3UfnkXGJIC-2FSwQIhnKMLkHjemspU3Dy-2BeJiPksxw448T-2BcxRUPNdoCYoZ0kA5JHe3La4=
YtpbKSIFkpl9-2BJIC0KO5GjTbZAnY7pRP82m89P4kBlIWyQ-3D-3D">One-Time Passwords<=
/a>.
        </p>
        <p>
            Best,<br />
            OpenAI
        </p>
    </td>
</tr>



        </table>
        <!--[if (gte mso 9)|(IE)]>
        </td>
        </tr>
        </table>
        <![endif]-->
      </td>
    </tr>
    <!-- end body block -->

    <!-- start footer -->
    <tr>
      <td align=3D"center" style=3D"padding: 24px;">
        <!--[if (gte mso 9)|(IE)]>
        <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" width=3D"600">
        <tr>
        <td align=3D"center" valign=3D"top" width=3D"600">
        <![endif]-->
        <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"10=
0%" style=3D"max-width: 560px;">
           =20
<tr>
  <td align=3D"left" style=3D"padding: 4px 24px; font-size: 14px; line-heig=
ht: 20px; color: #666;">
    <p style=3D"margin: 0;">If you have any questions please contact us thr=
ough our <a href=3D"https://u20216706.ct.sendgrid.net/ls/click?upn=3Du001.I=
QLfsj4kk-2BK7JhymNusRMmfwoG2v3nTgHW39-2Fobue0vS8iPJK05Qsdjl1qKLmoz-2F3g-n_l=
Raxln83oV-2FfQGD2ugGGVnfJQd8CB87e2kqBNMlv1ZYMXwcvr6yQhlE6Xi1c-2FGKBJ6oS5nSp=
cEGDspcXeLLFkvUBC8f5eF2syaHFuDYlRqk1TJwtcfhl9jps5H4keOPFydhG7pRGAmbnAb2Bnnw=
12bvU4LCmOcrD1v-2FR3jwyQomHT7tImwY7kKplcCY4l06DhID-2FsBhbWexbjsrgNHIlWwHQRv=
y1HUZIDGvMFzjTUzDiUVFTFwyuns0LQh2XMOi5qR-2Fb6ParLd6wr-2F9N-2BxXqx0UBMYHXkWK=
fkMR3CMZgsJg8c97PhAU0lMXFq9J5sW8N1bwtbYIb-2BBHqVdOh40bnjN6DE3-2B-2F-2FvhclR=
tOhaSxSoxyWJtItNxEVAYtU71b0MMrttfJo3lW1QUyX3RTpk1yzg-3D-3D">help center</a>=
</p>
  </td>
</tr>

        </table>
        <!--[if (gte mso 9)|(IE)]>
        </td>
        </tr>
        </table>
        <![endif]-->
      </td>
    </tr>
    <!-- end footer -->

  </table>
  <!-- end body -->
  <div class=3D"debug-string" style=3D"display: none; max-width: 0; max-hei=
ght: 0; overflow: hidden; font-size: 1px; line-height: 1px; color: #ececf1;=
 opacity: 0;">
     =20
  </div>

<img src=3D"https://u20216706.ct.sendgrid.net/wf/open?upn=3Du001.Ann8UNz87C=
fAvNYm8Xa3MVSgvQa5vu1JMHczaNK6BV-2B0LQapUq9817Efl3Yl28H3-2BG71cRkeoMJRHRP0n=
hh4maChSvLsliw48WFW1vuYBkaNruBAIggb14UP2tmzneFiRUwVjkWVyNuaC9gYK4G6VnM3iLWG=
D3OgDnLmUiuJcGwG7ayXJ7nSdUX2Sy5Slu7ukrA5AX8WzfJ5D34sKq0NX-2FIH9IzSSrWFrHyFf=
S6-2BFvvCS7vhMshbbDUwx-2Fc7sBGjszuhvjXnd9sY0UQpgygTdkVY8lk9VXjgS56Bqx1TxXyk=
m-2F-2Bf-2FuF-2FW7wJvxXOolR2HkImo-2FagSjHEHO3fYiMAyLgAdI0FhtmDQhz6BUu0HOfuy=
OklkOab4WRbvpvwYdMWM6OwBJGWcfPhBRwtMCHvBw-3D-3D" alt=3D"" width=3D"1" heigh=
t=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !important;bo=
rder-width:0 !important;margin-top:0 !important;margin-bottom:0 !important;=
margin-right:0 !important;margin-left:0 !important;padding-top:0 !important=
;padding-bottom:0 !important;padding-right:0 !important;padding-left:0 !imp=
ortant;"/></body>
</html>

