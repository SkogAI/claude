Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:fa0f:b0:a9a:6c:3f83 with SMTP id lo15csp1380522ejb;
        Sat, 19 Oct 2024 04:05:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOGU78M4uy+3aXZ0KSwhgOhlK9csc1DLNZhzIB/5Q0MdSgtpqNO7OYBq1i8RymsoFQfp3R
X-Received: by 2002:a05:690c:6c86:b0:6e2:a250:a1bc with SMTP id 00721157ae682-6e5a3f0cf2bmr80415197b3.22.1729335958675;
        Sat, 19 Oct 2024 04:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729335958; cv=none;
        d=google.com; s=arc-20240605;
        b=ExiEP9Y2bb3MWPwm4Dybh8pedC5iLME/8P5dVvdc/4NaZ16Rzexy648Cjzw3EnKTgh
         NVccTvGe3yWDDrgInJSLt4HtQcyXOYBL7DStAILe32EnaMmXw+szEwjAknTwsKRocz48
         SBz38JMcoLD50a7ObBTaogDVzjCqdEzr2MQ7vTaSnI/2ENJiiozCzUMK4LCPAtR4h93R
         bSDyVN8+o/TomC5MxvxZAg++CSly/lAcGXnPoKXDUr+tbdCxDCXs+29vb39CNrNc8aIM
         VA5qyBmTJc0YJ0J5UxLLXxoCULmiQre189qA6ezdQd2y8aoCHRyH3yh2bsH2ynKvZUwv
         fT5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:feedback-id:message-id:to:reply-to:subject:date:from
         :dkim-signature:dkim-signature;
        bh=Clnt5WlmU7fU6F2H9mQO2LCSgOQodmyFKEkuya3NweE=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=HUwytT+rMYmnB5Kiubb4QR5MFkWfCsBJcSz/QTNVDYJrfMHpzWWzJ8BMQ2IMpJw7w8
         j/1Buk5cExQpYOMIFiRwjpWimWyjhDddcMZ9TN6QSTWlqBwC3NYwttdqKpk6QNgnaFdY
         gu7F5pkb30nVfdDuOZ5m9/8kiQeGTnrwpbQf20A4WYv09HBNrihZzNBhoEfYS8BYmzi1
         0Eu6rTMbpBgHlA14iY49qhwuJpskudcBWq/U8GKLELWXFZ0wxtKzvOmKTZf+1v815a6n
         PjZLB263sOWXusFXn0xmakc0UBPW8tnrkgvauROmXnHBSLQ6qhGPt+LXS0T6ECEqcsek
         rpqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@pm.mtasv.net header.s=pm20241004 header.b=LaWcqtWM;
       dkim=pass header.i=@serpapi.com header.s=20221124224534pm header.b=DWnMNJ3X;
       spf=pass (google.com: domain of pm_bounces@pm-bounces.serpapi.com designates 104.245.209.248 as permitted sender) smtp.mailfrom=pm_bounces@pm-bounces.serpapi.com
Return-Path: <pm_bounces@pm-bounces.serpapi.com>
Received: from mta248b-ord.mtasv.net (mta248b-ord.mtasv.net. [104.245.209.248])
        by mx.google.com with ESMTPS id 00721157ae682-6e5c00e4f55si28219737b3.138.2024.10.19.04.05.58
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 04:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pm_bounces@pm-bounces.serpapi.com designates 104.245.209.248 as permitted sender) client-ip=104.245.209.248;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@pm.mtasv.net header.s=pm20241004 header.b=LaWcqtWM;
       dkim=pass header.i=@serpapi.com header.s=20221124224534pm header.b=DWnMNJ3X;
       spf=pass (google.com: domain of pm_bounces@pm-bounces.serpapi.com designates 104.245.209.248 as permitted sender) smtp.mailfrom=pm_bounces@pm-bounces.serpapi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pm20241004; d=pm.mtasv.net;
 h=From:Date:Subject:Reply-To:To:Message-Id:Feedback-ID:MIME-Version:
 Content-Type:Date:From:Message-ID:Reply-To:Sender:Subject:To:CC; t=1729335958;
 x=1729422358;
 bh=Clnt5WlmU7fU6F2H9mQO2LCSgOQodmyFKEkuya3NweE=;
 b=LaWcqtWMe7gHxk8uiXCiA2v2BIu68anzNviuvLbCbp/N/4/WpJPzo4WHaaK3zwbCsjxcoO1RlFsG
   XQzUPgEU5Ep6RePqmv4t/+aLWpCaMYUrmFyxFY5ijDjf9y38XSR/KL0z4QJKi5Jjohxzp70zOGgW
   4DF97a7Iqq+fo+NQIFZg5ZSmhSow0NCiQqSEruBTUJjkp8TKVW6QvG30jGpDD5Mod+3RzUVEwob2
   OMFAVPwvJRvvV6yfY0aN2EcXeH5eS20fWiyiwlOWfy8PzAUOMhzL4tah33iOC00mrqGEjSsVuv9x
   FoQy8MKBQ28vYlvi1vBLz2q7reAtRTg9GD23iQ==
Received: by mta248b-ord.mtasv.net id h2e99a3864o6 for <emil.skogsund@gmail.com>; Sat, 19 Oct 2024 07:05:57 -0400 (envelope-from <pm_bounces@pm-bounces.serpapi.com>)
X-PM-IP: 104.245.209.248
X-IADB-IP: 104.245.209.248
X-IADB-IP-REVERSE: 248.209.245.104
DKIM-Signature: v=1; a=rsa-sha256; d=serpapi.com; s=20221124224534pm;
	c=relaxed/relaxed; i=no-reply@serpapi.com; t=1729335957; x=1729508757;
	h=date:date:from:from:message-id:reply-to:reply-to:sender:subject:subject:to:
	to:cc:feedback-id:mime-version:content-type;
	bh=Clnt5WlmU7fU6F2H9mQO2LCSgOQodmyFKEkuya3NweE=;
	b=DWnMNJ3XDd0uk+en+1br2LA1Net+Zz39VzBM0tTDWzWLLQOdWVI8iGSMnkI/YO9hRJoWZO8krsx
	bqthzChFaDAS+hqKVJpUgMvlkDrsLgo/9e7gZYsqMZ7L/1IM7rWw3ihtym+BA4cZR7PgP3F3pz+pq
	waDjIhqAg9juqHkzLTA=
From: no-reply@serpapi.com
Date: Sat, 19 Oct 2024 11:05:57 +0000
Subject: Confirmation instructions
Reply-To: no-reply@serpapi.com
To: emil.skogsund@gmail.com
Message-Id: <8072efcd-aae6-46b7-8d5f-24eb4f70d458@serpapi.com>
Feedback-ID: s9849154-Y29uZmlybWF0aW9uX2luc3RydWN0aW9ucw==:s9849154:a255437:postmark
X-Complaints-To: abuse@postmarkapp.com
X-PM-Message-Id: 0b087cf1-949f-47af-a4a5-4f9d25200863
X-PM-Tag: confirmation_instructions
X-PM-RCPT: |bTB8MjU1NDM3fDk4NDkxNTR8ZW1pbC5za29nc3VuZEBnbWFpbC5jb20=|
X-PM-Message-Options: v1;1.YHrKHfTrWyEhS-XJOKdkNQ.Gb5fTU0zJBHY5j7KtAtrQe2-MQ_OW7c18L5JbiBbv17flX640qcV-XCUjtlctaHKZzybyJaUyeY7pb2XgMFs0QcENqTEI504n-9Cr33j-9UEepItsLCt2TotQ5s9mliEyNFzDxqL3D-cTCS8u6QXsmdzx5bbhaCdkwORFARUfuNeq_CWbIbsKy_GV4mvw_vW
MIME-Version: 1.0
X-PM-MTA-Pool: transactional-3
Content-Type: multipart/alternative;
	boundary=mk3-16f6988b10a443d6966fdb8d11febfda; charset=UTF-8
X-TUID: qPMMdl6O0oAa

--mk3-16f6988b10a443d6966fdb8d11febfda
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Welcome emil.skogsund@gmail.com!

You can confirm your email through the link below:

https://serpapi.com/users/confirmation?confirmation_token=3D4LaCzKTAx4Nwdax=
tGizf

Thank you!
SerpApi Team


--mk3-16f6988b10a443d6966fdb8d11febfda
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8=
" />
    <!--Force Outlook clients to render with a better MS engine.-->
    <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3DEdge">
    <style>
      body {
        font-family: Arial, sans-serif;
        line-height: 1.7;
      }

      @media (min-width: 600px) {
        body > table > tbody {
          min-width: 600px;
        }
      }

      .footer {
        padding: 12px 0;
        text-align: center;
      }

      .footer a,
      .footer p {
        font-size: 13px;
      }

      a {
        color: #0275d8;
        text-decoration: none;
      }

      a:hover {
        text-decoration: underline;
      }

      .footer p {
        color: #8f8f8f;
      }

      .middot-space {
        padding-left: 5px;
        padding-right: 5px;
      }

      .button {
        position: relative;
        display: inline-block;
        color: #fff !important;
        border: none;
        padding: 10px 30px;
        background-color: #377FEA;
        text-align: center;
        text-decoration: none;
        font-weight: bold;
        transition: background-size 0.20s ease-in-out;
        border-radius: 9999px;
        line-height: 1.15;
        cursor: pointer;
      }

      .button:focus,
      .button:active,
      .button:hover {
        color: #fff !important;
        outline: none;
        text-decoration: none;
      }

      .button:hover {
        box-shadow: rgba(50, 50, 93, 0.2) 0px 6px 12px -2px, rgba(0, 0, 0, =
0.25) 0px 3px 7px -3px;
      }

      .button:active {
        box-shadow: none;
      }

      h1.email-title {
        background-color: #f7fafc;
        border-bottom: 1px solid #dfe1e6;
        padding: 0.5rem 1rem;
        font-weight: bold;
        margin: 0;
        font-size: 26px;
        text-align: center;
      }

      .serpapi-logo-wrapper {
        line-height: 1;
      }

      .error {
        color: #c0392b;
        font-weight: bold;
      }
    </style>
  </head>

  <body>
    <table style=3D"margin: 0 auto; max-width: 600px;">
      <tbody>
        <tr>
          <td class=3D"serpapi-logo-wrapper" style=3D"padding-top: 50px; pa=
dding-bottom: 5px;">
            <img class=3D"serpapi-logo" width=3D"75" src=3D"https://serpapi=
.com/assets/SerpApi-gentle-small-white-bg.png" alt=3D"SerpApi">
          </td>
        </tr>
        <tr>
          <td style=3D"border: 1px solid #dfe1e6; border-radius: 10px;">
              <h1 class=3D"email-title">Confirmation instructions
</h1>
            <div style=3D"text-align: center; padding: 1.5rem;">
             =20
<table>
  <tbody>
    <tr>
      <td>
        <div style=3D"font-size: 15px;">
          <p>Welcome emil.skogsund@gmail.com!</p>
          <p>You can confirm your email through the link below:</p>
          <p style=3D"padding: 16px 0">
            <a class=3D"button button-blue" target=3D"_blank" href=3D"https=
://serpapi.com/users/confirmation?confirmation_token=3D4LaCzKTAx4NwdaxtGizf=
">
              <!--[if mso]><i style=3D"letter-spacing:30px;mso-text-raise:2=
0px;">&nbsp;</i><![endif]-->
              <span style=3D"mso-text-raise:10px;">Confirm your email</span=
>
              <!--[if mso]><i style=3D"letter-spacing:30px;">&nbsp;</i><![e=
ndif]-->
</a>          </p>
          <p style=3D"margin: 0">
            Thank you!<br>
            SerpApi Team
          </p>
        </div>
      </td>
    </tr>
  </tbody>
</table>

            </div>
          </td>
        </tr>
        <tr>
          <td>
            <table class=3D"footer" style=3D"width: 100%">
              <tr>
                <td>
                  <a target=3D"_blank" href=3D"https://serpapi.com/dashboar=
d">View your account</a>
                  <span class=3D"middot-space">&middot;</span>
                  <a target=3D"_blank" href=3D"https://serpapi.com/#contact=
">Contact us</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p>SerpApi, LLC<span class=3D"middot-space">&middot;</spa=
n>5540 N Lamar Blvd #12<span class=3D"middot-space">&middot;</span>Austin, =
TX 78751</p>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </tbody>
    </table>
  <img src=3D"https://ea.pstmrk.it/open?m=3Dv3_1.C_dEoRfp7Ykh8IMGXme6nA.dee=
5vTqSK4lkCWgaPEGAQUZN_Nx-G44zTUrGkA1JWYHWfeVbq71YLrH1BKn-gAoo2asBHgQY_cVlqJ=
Pa8HdO1aIqZBrFsyI9jKX9KA7CHu70BKwBBzAWp8r-CwrxbFhcOn7vnWdCO6m9pIj2L3DZ7kzjr=
4RRWgbysvYKGwUlAtj4p6bt91r9o6Vi7i4Cnryncx2hkobykhRTnteQdMLgc7ZLUOWwy3Y5R79d=
SLFkFeUdJl2H5Fs8O02XqDeAj5GIfBoRIUcs3_i5rasIceEBDVSTVp6KIc1BTaDGAoUYAjj9fuz=
nu6FubN6WD39hmomssP9ELjJqkEjSLl8OqNKh15GsKs8kB5BVD-6qiweGranTlBYuI0AD4XbCoY=
6Aqqp6Nca_yWs4h9D8tZOcGweHsyP2qXs0zxK4g04rsl-f-GHgDfaVM5HZA2kbiKKO3Ho_z_L1j=
Qh0fuUM85ByvoAXc52hCDyZoLwnkHDZiF7Jlh4ZbpqRJilc9x3KWgoI2Lzn" width=3D"1" he=
ight=3D"1" border=3D"0" alt=3D"" /></body>
</html>

--mk3-16f6988b10a443d6966fdb8d11febfda--
