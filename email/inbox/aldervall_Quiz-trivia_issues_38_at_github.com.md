MIME-Version: 1.0
From: Ic0n <notifications@github.com>
To: aldervall/Quiz-trivia <Quiz-trivia@noreply.github.com>
Date: Thu, 26 Feb 2026 19:36:08 -0800
Subject: [aldervall/Quiz-trivia] quiz (Issue #38)
Message-ID: <aldervall/Quiz-trivia/issues/38@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69a111284baca_c51110194246"; charset="UTF-8"

aldervall created an issue (aldervall/Quiz-trivia#38)

### Describe the bug

> quiz-trivia@1.0.0 start
> node server.js

[dotenv@17.3.1] injecting env (2) from .env -- tip: ⚙  specify custom .env file path with { path: '/custom/path/.env' }

🎮 Game Night server running!

  Landing page: https://quiz.aldervall.se/
  Join a room:  https://quiz.aldervall.se/group/XXXX

Using local DB: 10 questions [easy]
/opt/Quiz-trivia/server.js:311
      handleDisconnect(ws, room, maybeCleanupRoom);
      ^

ReferenceError: handleDisconnect is not defined
    at WebSocket.<anonymous> (/opt/Quiz-trivia/server.js:311:7)
    at WebSocket.emit (node:events:529:35)
    at WebSocket.emitClose (/opt/Quiz-trivia/node_modules/ws/lib/websocket.js:273:10)
    at Socket.socketOnClose (/opt/Quiz-trivia/node_modules/ws/lib/websocket.js:1346:15)
    at Socket.emit (node:events:517:28)
    at TCP.<anonymous> (node:net:351:12)

Node.js v18.20.4


### Steps to reproduce

> quiz-trivia@1.0.0 start
> node server.js

[dotenv@17.3.1] injecting env (2) from .env -- tip: ⚙  specify custom .env file path with { path: '/custom/path/.env' }

🎮 Game Night server running!

  Landing page: https://quiz.aldervall.se/
  Join a room:  https://quiz.aldervall.se/group/XXXX

Using local DB: 10 questions [easy]
/opt/Quiz-trivia/server.js:311
      handleDisconnect(ws, room, maybeCleanupRoom);
      ^

ReferenceError: handleDisconnect is not defined
    at WebSocket.<anonymous> (/opt/Quiz-trivia/server.js:311:7)
    at WebSocket.emit (node:events:529:35)
    at WebSocket.emitClose (/opt/Quiz-trivia/node_modules/ws/lib/websocket.js:273:10)
    at Socket.socketOnClose (/opt/Quiz-trivia/node_modules/ws/lib/websocket.js:1346:15)
    at Socket.emit (node:events:517:28)
    at TCP.<anonymous> (node:net:351:12)

Node.js v18.20.4


### Expected behaviour

> quiz-trivia@1.0.0 start
> node server.js

[dotenv@17.3.1] injecting env (2) from .env -- tip: ⚙  specify custom .env file path with { path: '/custom/path/.env' }

🎮 Game Night server running!

  Landing page: https://quiz.aldervall.se/
  Join a room:  https://quiz.aldervall.se/group/XXXX

Using local DB: 10 questions [easy]
/opt/Quiz-trivia/server.js:311
      handleDisconnect(ws, room, maybeCleanupRoom);
      ^

ReferenceError: handleDisconnect is not defined
    at WebSocket.<anonymous> (/opt/Quiz-trivia/server.js:311:7)
    at WebSocket.emit (node:events:529:35)
    at WebSocket.emitClose (/opt/Quiz-trivia/node_modules/ws/lib/websocket.js:273:10)
    at Socket.socketOnClose (/opt/Quiz-trivia/node_modules/ws/lib/websocket.js:1346:15)
    at Socket.emit (node:events:517:28)
    at TCP.<anonymous> (node:net:351:12)

Node.js v18.20.4


### Environment

_No response_

### Relevant logs or screenshots

_No response_

-- 
Reply to this email directly or view it on GitHub:
https://github.com/aldervall/Quiz-trivia/issues/38
You are receiving this because you are subscribed to this thread.

Message ID: <aldervall/Quiz-trivia/issues/38@github.com>