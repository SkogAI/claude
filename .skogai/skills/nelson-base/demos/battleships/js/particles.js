window.Particles = (function () {
  'use strict';

  var canvas = document.createElement('canvas');
  canvas.id = 'particle-canvas';
  document.body.appendChild(canvas);
  var ctx = canvas.getContext('2d');

  function resize() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
  }
  resize();
  window.addEventListener('resize', resize);

  var POOL_SIZE = 500;
  var pool = new Array(POOL_SIZE);
  var activeCount = 0;
  var animating = false;

  for (var i = 0; i < POOL_SIZE; i++) {
    pool[i] = {
      active: false, x: 0, y: 0, vx: 0, vy: 0,
      life: 0, maxLife: 0, size: 0, sizeEnd: 0,
      color: '', alpha: 1, type: 'circle',
      ringRadius: 0, ringMaxRadius: 0, gravity: 0,
      rotation: 0, rotationSpeed: 0, drag: 0
    };
  }

  function acquire() {
    if (activeCount >= POOL_SIZE) return null;
    for (var i = 0; i < POOL_SIZE; i++) {
      if (!pool[i].active) { pool[i].active = true; activeCount++; return pool[i]; }
    }
    return null;
  }

  function release(p) { p.active = false; activeCount--; }

  var lastTime = 0;

  function loop(timestamp) {
    if (activeCount <= 0) { animating = false; ctx.clearRect(0, 0, canvas.width, canvas.height); return; }
    var dt = lastTime ? Math.min((timestamp - lastTime) / 1000, 0.05) : 0.016;
    lastTime = timestamp;
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    for (var i = 0; i < POOL_SIZE; i++) {
      var p = pool[i];
      if (!p.active) continue;
      p.life -= dt;
      if (p.life <= 0) { release(p); continue; }
      var progress = 1 - (p.life / p.maxLife);

      /* Apply drag if present */
      if (p.drag) {
        var dragFactor = 1 - p.drag * dt;
        p.vx *= dragFactor;
        p.vy *= dragFactor;
      }

      p.vy += p.gravity * dt;
      p.x += p.vx * dt;
      p.y += p.vy * dt;
      p.alpha = p.life / p.maxLife;

      /* Update rotation for spinning particles */
      p.rotation += p.rotationSpeed * dt;

      if (p.type === 'ring') {
        var radius = p.ringRadius + (p.ringMaxRadius - p.ringRadius) * progress;
        ctx.beginPath();
        ctx.arc(p.x, p.y, radius, 0, Math.PI * 2);
        ctx.strokeStyle = p.color;
        ctx.globalAlpha = p.alpha * 0.6;
        ctx.lineWidth = 2 * (1 - progress);
        ctx.stroke();
        ctx.globalAlpha = 1;
      } else if (p.type === 'debris') {
        /* Rectangular spinning debris fragment */
        var dw = p.size + (p.sizeEnd - p.size) * progress;
        var dh = dw * 0.5;
        ctx.save();
        ctx.translate(p.x, p.y);
        ctx.rotate(p.rotation);
        ctx.globalAlpha = p.alpha;
        ctx.fillStyle = p.color;
        ctx.fillRect(-dw / 2, -dh / 2, dw, dh);
        ctx.globalAlpha = 1;
        ctx.restore();
      } else {
        var size = p.size + (p.sizeEnd - p.size) * progress;
        ctx.beginPath();
        ctx.arc(p.x, p.y, Math.max(size, 0.5), 0, Math.PI * 2);
        ctx.fillStyle = p.color;
        ctx.globalAlpha = p.alpha;
        ctx.fill();
        ctx.globalAlpha = 1;
      }
    }
    requestAnimationFrame(loop);
  }

  function ensureAnimating() {
    if (!animating) { animating = true; lastTime = 0; requestAnimationFrame(loop); }
  }

  var shakeTimer = null;

  function screenShake(duration, intensity) {
    var container = document.querySelector('.game-container');
    if (!container) return;
    var start = performance.now();
    function shake(now) {
      var elapsed = now - start;
      if (elapsed > duration) { container.style.transform = ''; return; }
      var decay = 1 - (elapsed / duration);
      var ox = (Math.random() * 2 - 1) * intensity * decay;
      var oy = (Math.random() * 2 - 1) * intensity * decay;
      container.style.transform = 'translate(' + ox + 'px, ' + oy + 'px)';
      requestAnimationFrame(shake);
    }
    if (shakeTimer) cancelAnimationFrame(shakeTimer);
    shakeTimer = requestAnimationFrame(shake);
  }

  function rand(min, max) { return min + Math.random() * (max - min); }

  /* --- Existing effects --- */

  function splash(x, y) {
    var colors = ['#4fc3f7', '#e1f5fe', '#ffffff'];
    for (var i = 0; i < 18; i++) {
      var p = acquire(); if (!p) break;
      var angle = -Math.PI / 2 + rand(-0.8, 0.8);
      var speed = rand(80, 220);
      p.x = x + rand(-4, 4); p.y = y;
      p.vx = Math.cos(angle) * speed; p.vy = Math.sin(angle) * speed;
      p.gravity = 350; p.life = rand(0.4, 0.9); p.maxLife = p.life;
      p.size = rand(2, 5); p.sizeEnd = 0.5;
      p.color = colors[Math.floor(Math.random() * colors.length)]; p.type = 'circle';
      p.rotation = 0; p.rotationSpeed = 0; p.drag = 0;
    }
    var ring = acquire();
    if (ring) {
      ring.x = x; ring.y = y; ring.vx = 0; ring.vy = 0; ring.gravity = 0;
      ring.life = 0.6; ring.maxLife = 0.6; ring.size = 0; ring.sizeEnd = 0;
      ring.color = '#4fc3f7'; ring.type = 'ring'; ring.ringRadius = 3; ring.ringMaxRadius = 30;
      ring.rotation = 0; ring.rotationSpeed = 0; ring.drag = 0;
    }
    ensureAnimating();
  }

  function fire(x, y) {
    var colors = ['#ff6d00', '#ff3d00', '#ffab00'];
    for (var f = 0; f < 4; f++) {
      var fp = acquire(); if (!fp) break;
      fp.x = x + rand(-3, 3); fp.y = y + rand(-3, 3);
      fp.vx = rand(-20, 20); fp.vy = rand(-30, -10); fp.gravity = 0;
      fp.life = rand(0.15, 0.3); fp.maxLife = fp.life;
      fp.size = rand(6, 10); fp.sizeEnd = 1;
      fp.color = f < 2 ? '#ffffff' : '#fff59d'; fp.type = 'circle';
      fp.rotation = 0; fp.rotationSpeed = 0; fp.drag = 0;
    }
    for (var i = 0; i < 22; i++) {
      var p = acquire(); if (!p) break;
      var angle = -Math.PI / 2 + rand(-1.0, 1.0);
      var speed = rand(40, 160);
      p.x = x + rand(-6, 6); p.y = y + rand(-4, 4);
      p.vx = Math.cos(angle) * speed; p.vy = Math.sin(angle) * speed;
      p.gravity = -20; p.life = rand(0.5, 1.2); p.maxLife = p.life;
      p.size = rand(2, 5); p.sizeEnd = 0.5;
      p.color = colors[Math.floor(Math.random() * colors.length)]; p.type = 'circle';
      p.rotation = 0; p.rotationSpeed = 0; p.drag = 0;
    }
    ensureAnimating();
  }

  function explode(x, y) {
    var burstColors = ['#ff1744', '#ff6d00', '#ffd600', '#ff3d00', '#ffab00'];
    var smokeColors = ['#616161', '#757575', '#9e9e9e', '#bdbdbd'];
    for (var f = 0; f < 5; f++) {
      var fp = acquire(); if (!fp) break;
      fp.x = x + rand(-4, 4); fp.y = y + rand(-4, 4);
      fp.vx = rand(-15, 15); fp.vy = rand(-15, 15); fp.gravity = 0;
      fp.life = rand(0.1, 0.25); fp.maxLife = fp.life;
      fp.size = rand(10, 16); fp.sizeEnd = 2; fp.color = '#ffffff'; fp.type = 'circle';
      fp.rotation = 0; fp.rotationSpeed = 0; fp.drag = 0;
    }
    for (var i = 0; i < 40; i++) {
      var p = acquire(); if (!p) break;
      var angle = Math.random() * Math.PI * 2;
      var speed = rand(80, 300);
      p.x = x + rand(-6, 6); p.y = y + rand(-6, 6);
      p.vx = Math.cos(angle) * speed; p.vy = Math.sin(angle) * speed;
      p.gravity = 150; p.life = rand(0.6, 1.4); p.maxLife = p.life;
      p.size = rand(3, 7); p.sizeEnd = 0.5;
      p.color = burstColors[Math.floor(Math.random() * burstColors.length)]; p.type = 'circle';
      p.rotation = 0; p.rotationSpeed = 0; p.drag = 0;
    }
    for (var s = 0; s < 12; s++) {
      var sp = acquire(); if (!sp) break;
      sp.x = x + rand(-10, 10); sp.y = y + rand(-10, 10);
      sp.vx = rand(-25, 25); sp.vy = rand(-60, -20); sp.gravity = -10;
      sp.life = rand(1.0, 2.0); sp.maxLife = sp.life;
      sp.size = rand(6, 12); sp.sizeEnd = rand(14, 22);
      sp.color = smokeColors[Math.floor(Math.random() * smokeColors.length)]; sp.type = 'circle';
      sp.rotation = 0; sp.rotationSpeed = 0; sp.drag = 0;
    }
    screenShake(300, 8);
    ensureAnimating();
  }

  /* --- New effect: debris — metallic spinning fragments for sinking ships --- */

  function debris(x, y) {
    var metalColors = ['#90a4ae', '#b0bec5', '#78909c', '#607d8b', '#cfd8dc', '#a0a0a0'];
    var sparkColors = ['#ffab00', '#ff6d00', '#ffffff'];

    /* Heavy metallic debris fragments that spin and fall */
    for (var i = 0; i < 25; i++) {
      var p = acquire(); if (!p) break;
      var angle = Math.random() * Math.PI * 2;
      var speed = rand(60, 250);
      p.x = x + rand(-8, 8); p.y = y + rand(-8, 8);
      p.vx = Math.cos(angle) * speed; p.vy = Math.sin(angle) * speed - rand(40, 100);
      p.gravity = 280; p.life = rand(0.8, 1.8); p.maxLife = p.life;
      p.size = rand(3, 8); p.sizeEnd = rand(1, 3);
      p.color = metalColors[Math.floor(Math.random() * metalColors.length)];
      p.type = 'debris';
      p.rotation = rand(0, Math.PI * 2);
      p.rotationSpeed = rand(-12, 12);
      p.drag = 0.3;
    }

    /* Hot sparks flying out */
    for (var j = 0; j < 15; j++) {
      var sp = acquire(); if (!sp) break;
      var sAngle = Math.random() * Math.PI * 2;
      var sSpeed = rand(120, 350);
      sp.x = x + rand(-4, 4); sp.y = y + rand(-4, 4);
      sp.vx = Math.cos(sAngle) * sSpeed; sp.vy = Math.sin(sAngle) * sSpeed;
      sp.gravity = 200; sp.life = rand(0.3, 0.8); sp.maxLife = sp.life;
      sp.size = rand(1, 3); sp.sizeEnd = 0.5;
      sp.color = sparkColors[Math.floor(Math.random() * sparkColors.length)];
      sp.type = 'circle';
      sp.rotation = 0; sp.rotationSpeed = 0; sp.drag = 0;
    }

    /* Central flash */
    for (var k = 0; k < 3; k++) {
      var fl = acquire(); if (!fl) break;
      fl.x = x + rand(-3, 3); fl.y = y + rand(-3, 3);
      fl.vx = rand(-10, 10); fl.vy = rand(-10, 10); fl.gravity = 0;
      fl.life = rand(0.08, 0.18); fl.maxLife = fl.life;
      fl.size = rand(12, 18); fl.sizeEnd = 3;
      fl.color = '#ffffff'; fl.type = 'circle';
      fl.rotation = 0; fl.rotationSpeed = 0; fl.drag = 0;
    }

    screenShake(400, 10);
    ensureAnimating();
  }

  /* --- New effect: wake — gentle water disturbance for misses --- */

  function wake(x, y) {
    var wakeColors = ['#b3e5fc', '#e1f5fe', '#ffffff', '#81d4fa'];

    /* Small slow-drifting bubbles/foam particles */
    for (var i = 0; i < 10; i++) {
      var p = acquire(); if (!p) break;
      var angle = rand(-Math.PI, Math.PI);
      var speed = rand(8, 35);
      p.x = x + rand(-6, 6); p.y = y + rand(-6, 6);
      p.vx = Math.cos(angle) * speed; p.vy = Math.sin(angle) * speed - rand(5, 15);
      p.gravity = -8; p.life = rand(0.6, 1.4); p.maxLife = p.life;
      p.size = rand(1.5, 4); p.sizeEnd = rand(0.5, 1.5);
      p.color = wakeColors[Math.floor(Math.random() * wakeColors.length)];
      p.type = 'circle';
      p.rotation = 0; p.rotationSpeed = 0; p.drag = 1.5;
    }

    /* Expanding ring ripple */
    var ring = acquire();
    if (ring) {
      ring.x = x; ring.y = y; ring.vx = 0; ring.vy = 0; ring.gravity = 0;
      ring.life = 0.8; ring.maxLife = 0.8; ring.size = 0; ring.sizeEnd = 0;
      ring.color = '#b3e5fc'; ring.type = 'ring'; ring.ringRadius = 2; ring.ringMaxRadius = 25;
      ring.rotation = 0; ring.rotationSpeed = 0; ring.drag = 0;
    }

    /* Second slower ring */
    var ring2 = acquire();
    if (ring2) {
      ring2.x = x; ring2.y = y; ring2.vx = 0; ring2.vy = 0; ring2.gravity = 0;
      ring2.life = 1.0; ring2.maxLife = 1.0; ring2.size = 0; ring2.sizeEnd = 0;
      ring2.color = '#e1f5fe'; ring2.type = 'ring'; ring2.ringRadius = 4; ring2.ringMaxRadius = 35;
      ring2.rotation = 0; ring2.rotationSpeed = 0; ring2.drag = 0;
    }

    ensureAnimating();
  }

  /* --- New effect: smoke — dark rising particles for after hits --- */

  function smoke(x, y) {
    var smokeColors = ['#424242', '#616161', '#757575', '#545454', '#4e4e4e'];

    for (var i = 0; i < 14; i++) {
      var p = acquire(); if (!p) break;
      p.x = x + rand(-8, 8); p.y = y + rand(-4, 4);
      p.vx = rand(-15, 15); p.vy = rand(-50, -20);
      p.gravity = -15; /* Rises slowly */
      p.life = rand(1.0, 2.2); p.maxLife = p.life;
      p.size = rand(4, 8); p.sizeEnd = rand(12, 20); /* Expands as it rises */
      p.color = smokeColors[Math.floor(Math.random() * smokeColors.length)];
      p.type = 'circle';
      p.rotation = 0; p.rotationSpeed = 0;
      p.drag = 0.8; /* Slows down as it rises */
    }

    /* A few darker core wisps closer to source */
    for (var j = 0; j < 4; j++) {
      var cp = acquire(); if (!cp) break;
      cp.x = x + rand(-3, 3); cp.y = y + rand(-2, 2);
      cp.vx = rand(-8, 8); cp.vy = rand(-35, -15);
      cp.gravity = -10;
      cp.life = rand(0.6, 1.2); cp.maxLife = cp.life;
      cp.size = rand(6, 10); cp.sizeEnd = rand(10, 16);
      cp.color = '#333333';
      cp.type = 'circle';
      cp.rotation = 0; cp.rotationSpeed = 0; cp.drag = 1.0;
    }

    ensureAnimating();
  }

  /* --- New effect: torpedoTrail — animated streak from source to target --- */

  function torpedoTrail(x1, y1, x2, y2) {
    var colors = ['#4fc3f7', '#e1f5fe', '#ffffff'];
    var dx = x2 - x1;
    var dy = y2 - y1;
    var dist = Math.sqrt(dx * dx + dy * dy);
    var steps = Math.max(12, Math.floor(dist / 8));
    var duration = 500; /* ms total travel time */

    for (var i = 0; i < steps; i++) {
      (function (index) {
        setTimeout(function () {
          var t = index / (steps - 1);
          var px = x1 + dx * t;
          var py = y1 + dy * t;
          for (var j = 0; j < 3; j++) {
            var p = acquire(); if (!p) return;
            var spread = rand(-6, 6);
            var perpX = -dy / dist * spread;
            var perpY = dx / dist * spread;
            p.x = px + perpX + rand(-2, 2);
            p.y = py + perpY + rand(-2, 2);
            p.vx = rand(-15, 15);
            p.vy = rand(-15, 15);
            p.gravity = 0;
            p.life = rand(0.2, 0.5);
            p.maxLife = p.life;
            p.size = rand(1.5, 4);
            p.sizeEnd = 0.5;
            p.color = colors[Math.floor(Math.random() * colors.length)];
            p.type = 'circle';
            p.rotation = 0;
            p.rotationSpeed = 0;
            p.drag = 1.0;
          }
          ensureAnimating();
        }, (index / steps) * duration);
      })(i);
    }
  }

  /* --- New effect: radarSweep — rotating green line sweep --- */

  function radarSweep(centerX, centerY, radius) {
    var sweepDuration = 2000; /* ms */
    var totalSteps = 60;
    var angleStep = (Math.PI * 2) / totalSteps;

    for (var s = 0; s < totalSteps; s++) {
      (function (step) {
        setTimeout(function () {
          var angle = step * angleStep;
          var lineParticles = 8;
          for (var i = 0; i < lineParticles; i++) {
            var p = acquire(); if (!p) return;
            var r = (i / lineParticles) * radius;
            p.x = centerX + Math.cos(angle) * r;
            p.y = centerY + Math.sin(angle) * r;
            p.vx = Math.cos(angle) * rand(2, 8);
            p.vy = Math.sin(angle) * rand(2, 8);
            p.gravity = 0;
            p.life = rand(0.3, 0.6);
            p.maxLife = p.life;
            p.size = rand(1.5, 3);
            p.sizeEnd = 0.5;
            p.color = 'rgba(46,204,113,0.6)';
            p.type = 'circle';
            p.rotation = 0;
            p.rotationSpeed = 0;
            p.drag = 0.5;
          }
          ensureAnimating();
        }, (step / totalSteps) * sweepDuration);
      })(s);
    }
  }

  /* --- New effect: sonarPing — expanding concentric rings --- */

  function sonarPing(x, y) {
    var ringDelays = [0, 300, 600, 900];
    var colors = ['#2ecc71', '#27ae60', '#2ecc71', '#27ae60'];

    for (var i = 0; i < ringDelays.length; i++) {
      (function (index) {
        setTimeout(function () {
          var ring = acquire(); if (!ring) return;
          ring.x = x;
          ring.y = y;
          ring.vx = 0;
          ring.vy = 0;
          ring.gravity = 0;
          ring.life = 0.8;
          ring.maxLife = 0.8;
          ring.size = 0;
          ring.sizeEnd = 0;
          ring.color = colors[index];
          ring.type = 'ring';
          ring.ringRadius = 4;
          ring.ringMaxRadius = 50 + index * 15;
          ring.rotation = 0;
          ring.rotationSpeed = 0;
          ring.drag = 0;
          ensureAnimating();
        }, ringDelays[index]);
      })(i);
    }

    /* Central pulse particles */
    for (var j = 0; j < 6; j++) {
      var p = acquire(); if (!p) break;
      var angle = (j / 6) * Math.PI * 2;
      p.x = x;
      p.y = y;
      p.vx = Math.cos(angle) * rand(10, 25);
      p.vy = Math.sin(angle) * rand(10, 25);
      p.gravity = 0;
      p.life = rand(0.4, 0.8);
      p.maxLife = p.life;
      p.size = rand(2, 4);
      p.sizeEnd = 0.5;
      p.color = '#2ecc71';
      p.type = 'circle';
      p.rotation = 0;
      p.rotationSpeed = 0;
      p.drag = 1.5;
    }
    ensureAnimating();
  }

  /* --- New effect: airstrike — falling particles then explosion --- */

  function airstrike(x, y) {
    var streakColors = ['#ff6d00', '#ffab00', '#ffffff', '#ff3d00'];
    var startY = -40; /* above viewport */
    var fallDuration = 600; /* ms before impact */
    var streakCount = 8;

    for (var i = 0; i < streakCount; i++) {
      (function (index) {
        setTimeout(function () {
          var p = acquire(); if (!p) return;
          p.x = x + rand(-15, 15);
          p.y = startY + rand(-20, 0);
          var totalDist = y - p.y;
          p.vx = rand(-10, 10);
          p.vy = totalDist / (fallDuration / 1000 * 0.6);
          p.gravity = 400;
          p.life = rand(0.5, 0.8);
          p.maxLife = p.life;
          p.size = rand(2, 4);
          p.sizeEnd = 1;
          p.color = streakColors[Math.floor(Math.random() * streakColors.length)];
          p.type = 'circle';
          p.rotation = 0;
          p.rotationSpeed = 0;
          p.drag = 0;

          /* Trailing sparks behind each streak */
          for (var t = 0; t < 3; t++) {
            var tp = acquire(); if (!tp) break;
            tp.x = p.x + rand(-3, 3);
            tp.y = p.y + rand(0, 20);
            tp.vx = rand(-5, 5);
            tp.vy = p.vy * 0.3;
            tp.gravity = 100;
            tp.life = rand(0.2, 0.4);
            tp.maxLife = tp.life;
            tp.size = rand(1, 2);
            tp.sizeEnd = 0.5;
            tp.color = '#ffab00';
            tp.type = 'circle';
            tp.rotation = 0;
            tp.rotationSpeed = 0;
            tp.drag = 0.5;
          }
          ensureAnimating();
        }, index * 40);
      })(i);
    }

    /* Explosion at impact point after fall */
    setTimeout(function () {
      explode(x, y);
    }, fallDuration);
  }

  /* --- New effect: sinking — bubbles rising, debris sinking --- */

  function sinking(x, y) {
    var metalColors = ['#90a4ae', '#b0bec5', '#78909c', '#607d8b'];
    var bubbleColors = ['#b3e5fc', '#e1f5fe', '#81d4fa'];

    /* Metallic debris sinking downward */
    for (var i = 0; i < 12; i++) {
      var d = acquire(); if (!d) break;
      d.x = x + rand(-12, 12);
      d.y = y + rand(-6, 6);
      d.vx = rand(-15, 15);
      d.vy = rand(20, 80);
      d.gravity = 60;
      d.life = rand(1.2, 2.0);
      d.maxLife = d.life;
      d.size = rand(2, 6);
      d.sizeEnd = rand(1, 2);
      d.color = metalColors[Math.floor(Math.random() * metalColors.length)];
      d.type = 'debris';
      d.rotation = rand(0, Math.PI * 2);
      d.rotationSpeed = rand(-6, 6);
      d.drag = 0.8;
    }

    /* Bubbles rising from the sinking point */
    for (var b = 0; b < 20; b++) {
      (function (index) {
        setTimeout(function () {
          var p = acquire(); if (!p) return;
          p.x = x + rand(-10, 10);
          p.y = y + rand(-4, 8);
          p.vx = rand(-8, 8);
          p.vy = rand(-80, -30);
          p.gravity = -20;
          p.life = rand(0.6, 1.5);
          p.maxLife = p.life;
          p.size = rand(1.5, 5);
          p.sizeEnd = rand(0.5, 2);
          p.color = bubbleColors[Math.floor(Math.random() * bubbleColors.length)];
          p.type = 'circle';
          p.rotation = 0;
          p.rotationSpeed = 0;
          p.drag = 1.2;
          ensureAnimating();
        }, index * 80);
      })(b);
    }

    /* Slow expanding rings at surface */
    for (var r = 0; r < 3; r++) {
      (function (index) {
        setTimeout(function () {
          var ring = acquire(); if (!ring) return;
          ring.x = x + rand(-4, 4);
          ring.y = y;
          ring.vx = 0;
          ring.vy = 0;
          ring.gravity = 0;
          ring.life = 1.0;
          ring.maxLife = 1.0;
          ring.size = 0;
          ring.sizeEnd = 0;
          ring.color = '#81d4fa';
          ring.type = 'ring';
          ring.ringRadius = 3;
          ring.ringMaxRadius = 35 + index * 10;
          ring.rotation = 0;
          ring.rotationSpeed = 0;
          ring.drag = 0;
          ensureAnimating();
        }, index * 400);
      })(r);
    }

    ensureAnimating();
  }

  return {
    splash: splash, fire: fire, explode: explode, debris: debris, wake: wake, smoke: smoke,
    torpedoTrail: torpedoTrail, radarSweep: radarSweep, sonarPing: sonarPing,
    airstrike: airstrike, sinking: sinking
  };
})();
