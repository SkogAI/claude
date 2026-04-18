(function () {
  'use strict';

  var STORAGE_KEY = 'battleships_tutorial_complete';
  var STEP_COUNT = 7;

  var active = false;
  var currentStep = 0;
  var container = null;
  var overlayEl = null;
  var tooltipEl = null;
  var backdropEl = null;
  var styleEl = null;

  // --- Tutorial step definitions ---

  var steps = [
    {
      title: 'Welcome',
      text: 'Welcome to Battleships! This quick guide will show you the basics.',
      target: null,
      showSkip: true,
      finalButton: false
    },
    {
      title: 'Ship Placement',
      text: 'Click on your grid to place ships. Ships can\'t overlap or go off the board.',
      target: '#player-grid',
      showSkip: true,
      finalButton: false
    },
    {
      title: 'Rotation',
      text: 'Press R or click Rotate to switch between horizontal and vertical.',
      target: '#rotate-btn',
      showSkip: true,
      finalButton: false
    },
    {
      title: 'Auto Place',
      text: 'Or click Auto Place to randomly position all ships.',
      target: '#auto-place-btn',
      showSkip: true,
      finalButton: false
    },
    {
      title: 'Firing',
      text: 'Once placed, click on Enemy Waters to fire. Hits show in orange, misses in white.',
      target: '#enemy-grid',
      showSkip: true,
      finalButton: false
    },
    {
      title: 'Sinking',
      text: 'Sink all 5 enemy ships to win! Watch the fleet status panels to track damage.',
      target: '.bottom-panels',
      showSkip: true,
      finalButton: false
    },
    {
      title: 'Go!',
      text: 'Good luck, Captain! You\'re ready for battle.',
      target: null,
      showSkip: false,
      finalButton: true
    }
  ];

  // --- Inject styles ---

  function injectStyles() {
    if (styleEl) return;
    styleEl = document.createElement('style');
    styleEl.setAttribute('data-tutorial', 'true');
    styleEl.textContent = [
      '.tut-backdrop {',
      '  position: fixed;',
      '  inset: 0;',
      '  z-index: 10000;',
      '  pointer-events: auto;',
      '  transition: opacity 0.35s ease;',
      '}',

      '.tut-highlight-ring {',
      '  position: fixed;',
      '  z-index: 10001;',
      '  border-radius: 8px;',
      '  box-shadow: 0 0 0 9999px rgba(6, 14, 24, 0.82);',
      '  pointer-events: none;',
      '  transition: top 0.35s ease, left 0.35s ease, width 0.35s ease, height 0.35s ease;',
      '}',

      '.tut-highlight-ring::after {',
      '  content: "";',
      '  position: absolute;',
      '  inset: -3px;',
      '  border-radius: 10px;',
      '  border: 2px solid rgba(46, 204, 113, 0.5);',
      '  box-shadow: 0 0 18px rgba(46, 204, 113, 0.25);',
      '  animation: tut-pulse 2s ease-in-out infinite;',
      '}',

      '@keyframes tut-pulse {',
      '  0%, 100% { box-shadow: 0 0 18px rgba(46, 204, 113, 0.25); }',
      '  50%      { box-shadow: 0 0 28px rgba(46, 204, 113, 0.45); }',
      '}',

      '.tut-tooltip {',
      '  position: fixed;',
      '  z-index: 10002;',
      '  width: 340px;',
      '  max-width: calc(100vw - 32px);',
      '  background: rgba(27, 40, 56, 0.92);',
      '  backdrop-filter: blur(12px);',
      '  -webkit-backdrop-filter: blur(12px);',
      '  border: 1px solid rgba(74, 111, 165, 0.3);',
      '  border-radius: 8px;',
      '  padding: 20px 22px 16px;',
      '  box-shadow: 0 8px 40px rgba(0, 0, 0, 0.5), 0 0 20px rgba(74, 111, 165, 0.15);',
      '  color: #e0e1dd;',
      '  font-family: "SF Pro Display", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;',
      '  opacity: 0;',
      '  transform: translateY(8px);',
      '  transition: opacity 0.3s ease, transform 0.3s ease;',
      '  pointer-events: auto;',
      '}',

      '.tut-tooltip.tut-visible {',
      '  opacity: 1;',
      '  transform: translateY(0);',
      '}',

      '.tut-tooltip::before {',
      '  content: "";',
      '  position: absolute;',
      '  top: 0; left: 0; right: 0;',
      '  height: 1px;',
      '  background: linear-gradient(90deg, transparent, rgba(255,255,255,0.05), transparent);',
      '}',

      '.tut-arrow {',
      '  position: absolute;',
      '  width: 12px;',
      '  height: 12px;',
      '  background: rgba(27, 40, 56, 0.92);',
      '  border: 1px solid rgba(74, 111, 165, 0.3);',
      '  transform: rotate(45deg);',
      '  z-index: -1;',
      '}',

      '.tut-arrow-top    { top: -7px; left: 50%; margin-left: -6px; border-bottom: none; border-right: none; }',
      '.tut-arrow-bottom { bottom: -7px; left: 50%; margin-left: -6px; border-top: none; border-left: none; }',
      '.tut-arrow-left   { left: -7px; top: 50%; margin-top: -6px; border-top: none; border-right: none; }',
      '.tut-arrow-right  { right: -7px; top: 50%; margin-top: -6px; border-bottom: none; border-left: none; }',

      '.tut-step-indicator {',
      '  font-size: 0.7rem;',
      '  text-transform: uppercase;',
      '  letter-spacing: 0.1em;',
      '  color: #778da9;',
      '  margin-bottom: 8px;',
      '  font-weight: 600;',
      '}',

      '.tut-title {',
      '  font-size: 1.05rem;',
      '  font-weight: 700;',
      '  color: #e0e1dd;',
      '  margin-bottom: 6px;',
      '  letter-spacing: 0.02em;',
      '}',

      '.tut-text {',
      '  font-size: 0.88rem;',
      '  line-height: 1.55;',
      '  color: #a8dadc;',
      '  margin-bottom: 16px;',
      '}',

      '.tut-dots {',
      '  display: flex;',
      '  gap: 6px;',
      '  margin-bottom: 14px;',
      '}',

      '.tut-dot {',
      '  width: 7px;',
      '  height: 7px;',
      '  border-radius: 50%;',
      '  background: rgba(74, 111, 165, 0.3);',
      '  transition: background 0.25s ease;',
      '}',

      '.tut-dot.tut-dot-active {',
      '  background: #2ecc71;',
      '  box-shadow: 0 0 6px rgba(46, 204, 113, 0.4);',
      '}',

      '.tut-dot.tut-dot-done {',
      '  background: rgba(46, 204, 113, 0.4);',
      '}',

      '.tut-buttons {',
      '  display: flex;',
      '  align-items: center;',
      '  justify-content: space-between;',
      '  gap: 10px;',
      '}',

      '.tut-btn-next, .tut-btn-start {',
      '  padding: 8px 20px;',
      '  background: linear-gradient(135deg, #2ecc71, #27ae60);',
      '  color: #060e18;',
      '  border: none;',
      '  border-radius: 5px;',
      '  font-size: 0.85rem;',
      '  font-weight: 700;',
      '  font-family: inherit;',
      '  cursor: pointer;',
      '  text-transform: uppercase;',
      '  letter-spacing: 0.08em;',
      '  transition: transform 0.15s ease, box-shadow 0.15s ease;',
      '}',

      '.tut-btn-next:hover, .tut-btn-start:hover {',
      '  transform: translateY(-1px);',
      '  box-shadow: 0 4px 16px rgba(46, 204, 113, 0.35);',
      '}',

      '.tut-btn-next:active, .tut-btn-start:active {',
      '  transform: translateY(0) scale(0.97);',
      '}',

      '.tut-btn-skip {',
      '  padding: 6px 12px;',
      '  background: transparent;',
      '  color: #778da9;',
      '  border: none;',
      '  border-radius: 4px;',
      '  font-size: 0.78rem;',
      '  font-family: inherit;',
      '  cursor: pointer;',
      '  transition: color 0.15s ease;',
      '}',

      '.tut-btn-skip:hover {',
      '  color: #a8dadc;',
      '}'
    ].join('\n');
    document.head.appendChild(styleEl);
  }

  function removeStyles() {
    if (styleEl && styleEl.parentNode) {
      styleEl.parentNode.removeChild(styleEl);
    }
    styleEl = null;
  }

  // --- DOM construction ---

  function buildOverlay() {
    overlayEl = document.createElement('div');
    overlayEl.style.cssText = 'position:fixed;inset:0;z-index:9999;pointer-events:none;';

    // Backdrop (click absorber)
    backdropEl = document.createElement('div');
    backdropEl.className = 'tut-backdrop';
    overlayEl.appendChild(backdropEl);

    // Tooltip
    tooltipEl = document.createElement('div');
    tooltipEl.className = 'tut-tooltip';
    overlayEl.appendChild(tooltipEl);

    container.appendChild(overlayEl);
  }

  function destroyOverlay() {
    if (overlayEl && overlayEl.parentNode) {
      overlayEl.parentNode.removeChild(overlayEl);
    }
    overlayEl = null;
    tooltipEl = null;
    backdropEl = null;
    // Remove any leftover highlight ring
    var ring = document.querySelector('.tut-highlight-ring');
    if (ring && ring.parentNode) ring.parentNode.removeChild(ring);
  }

  // --- Highlight target element ---

  var ringEl = null;

  function showHighlight(targetSelector) {
    // Remove existing ring
    if (ringEl && ringEl.parentNode) ringEl.parentNode.removeChild(ringEl);
    ringEl = null;

    if (!targetSelector) {
      // No target: full-screen dim with no cutout
      backdropEl.style.background = 'rgba(6, 14, 24, 0.82)';
      return;
    }

    var target = document.querySelector(targetSelector);
    if (!target) {
      backdropEl.style.background = 'rgba(6, 14, 24, 0.82)';
      return;
    }

    // Transparent backdrop; the ring's massive box-shadow provides the dimming
    backdropEl.style.background = 'transparent';

    var rect = target.getBoundingClientRect();
    var pad = 6;

    ringEl = document.createElement('div');
    ringEl.className = 'tut-highlight-ring';
    ringEl.style.top = (rect.top - pad) + 'px';
    ringEl.style.left = (rect.left - pad) + 'px';
    ringEl.style.width = (rect.width + pad * 2) + 'px';
    ringEl.style.height = (rect.height + pad * 2) + 'px';
    overlayEl.appendChild(ringEl);
  }

  // --- Position tooltip relative to target ---

  function positionTooltip(targetSelector) {
    // Remove old arrow
    var oldArrow = tooltipEl.querySelector('.tut-arrow');
    if (oldArrow) tooltipEl.removeChild(oldArrow);

    var arrow = document.createElement('div');
    arrow.className = 'tut-arrow';

    if (!targetSelector) {
      // Centre on screen
      tooltipEl.style.top = '50%';
      tooltipEl.style.left = '50%';
      tooltipEl.style.transform = 'translate(-50%, -50%)';
      return;
    }

    var target = document.querySelector(targetSelector);
    if (!target) {
      tooltipEl.style.top = '50%';
      tooltipEl.style.left = '50%';
      tooltipEl.style.transform = 'translate(-50%, -50%)';
      return;
    }

    // Reset transform so we can measure
    tooltipEl.style.transform = '';
    tooltipEl.style.top = '0';
    tooltipEl.style.left = '0';

    var tRect = target.getBoundingClientRect();
    var ttW = tooltipEl.offsetWidth || 340;
    var ttH = tooltipEl.offsetHeight || 180;
    var margin = 16;
    var vpW = window.innerWidth;
    var vpH = window.innerHeight;

    var top, left, arrowClass;

    // Preferred: below the target
    if (tRect.bottom + margin + ttH < vpH) {
      top = tRect.bottom + margin;
      left = tRect.left + tRect.width / 2 - ttW / 2;
      arrowClass = 'tut-arrow-top';
    }
    // Above the target
    else if (tRect.top - margin - ttH > 0) {
      top = tRect.top - margin - ttH;
      left = tRect.left + tRect.width / 2 - ttW / 2;
      arrowClass = 'tut-arrow-bottom';
    }
    // Right of target
    else if (tRect.right + margin + ttW < vpW) {
      top = tRect.top + tRect.height / 2 - ttH / 2;
      left = tRect.right + margin;
      arrowClass = 'tut-arrow-left';
    }
    // Left of target
    else {
      top = tRect.top + tRect.height / 2 - ttH / 2;
      left = tRect.left - margin - ttW;
      arrowClass = 'tut-arrow-right';
    }

    // Clamp within viewport
    if (left < 8) left = 8;
    if (left + ttW > vpW - 8) left = vpW - 8 - ttW;
    if (top < 8) top = 8;
    if (top + ttH > vpH - 8) top = vpH - 8 - ttH;

    tooltipEl.style.top = top + 'px';
    tooltipEl.style.left = left + 'px';

    arrow.className = 'tut-arrow ' + arrowClass;
    tooltipEl.appendChild(arrow);
  }

  // --- Render current step ---

  function renderStep() {
    if (!tooltipEl) return;
    var step = steps[currentStep];

    // Fade out, update, fade in
    tooltipEl.classList.remove('tut-visible');

    setTimeout(function () {
      // Build dots
      var dotsHtml = '';
      for (var d = 0; d < STEP_COUNT; d++) {
        var cls = 'tut-dot';
        if (d === currentStep) cls += ' tut-dot-active';
        else if (d < currentStep) cls += ' tut-dot-done';
        dotsHtml += '<div class="' + cls + '"></div>';
      }

      var html = '';
      html += '<div class="tut-step-indicator">Step ' + (currentStep + 1) + ' of ' + STEP_COUNT + '</div>';
      html += '<div class="tut-title">' + escapeHtml(step.title) + '</div>';
      html += '<div class="tut-text">' + escapeHtml(step.text) + '</div>';
      html += '<div class="tut-dots">' + dotsHtml + '</div>';
      html += '<div class="tut-buttons">';

      if (step.showSkip) {
        html += '<button class="tut-btn-skip" data-action="skip">Skip Tutorial</button>';
      } else {
        html += '<span></span>';
      }

      if (step.finalButton) {
        html += '<button class="tut-btn-start" data-action="complete">Start Playing</button>';
      } else {
        html += '<button class="tut-btn-next" data-action="next">Next</button>';
      }

      html += '</div>';

      tooltipEl.innerHTML = html;

      // Bind button clicks
      var btns = tooltipEl.querySelectorAll('button[data-action]');
      for (var b = 0; b < btns.length; b++) {
        (function (btn) {
          btn.addEventListener('click', function (e) {
            e.stopPropagation();
            var action = btn.getAttribute('data-action');
            if (action === 'next') nextStep();
            else if (action === 'skip') skip();
            else if (action === 'complete') complete();
          });
        })(btns[b]);
      }

      showHighlight(step.target);
      positionTooltip(step.target);

      // Fade in
      setTimeout(function () {
        tooltipEl.classList.add('tut-visible');
      }, 30);
    }, active ? 180 : 0);
  }

  function escapeHtml(str) {
    var div = document.createElement('div');
    div.appendChild(document.createTextNode(str));
    return div.innerHTML;
  }

  // --- Public API ---

  function shouldShow() {
    try {
      return localStorage.getItem(STORAGE_KEY) !== 'true';
    } catch (e) {
      return false;
    }
  }

  function start(containerEl) {
    if (active) return;
    active = true;
    currentStep = 0;
    container = containerEl || document.body;
    injectStyles();
    buildOverlay();
    renderStep();
  }

  function skip() {
    markComplete();
    teardown();
  }

  function complete() {
    markComplete();
    teardown();
  }

  function markComplete() {
    try {
      localStorage.setItem(STORAGE_KEY, 'true');
    } catch (e) { /* storage unavailable */ }
  }

  function teardown() {
    if (!active) return;
    // Fade out tooltip
    if (tooltipEl) tooltipEl.classList.remove('tut-visible');
    setTimeout(function () {
      destroyOverlay();
      removeStyles();
      active = false;
      currentStep = 0;
      container = null;
    }, 300);
  }

  function isActive() {
    return active;
  }

  function nextStep() {
    if (!active) return;
    if (currentStep < STEP_COUNT - 1) {
      currentStep++;
      renderStep();
    } else {
      complete();
    }
  }

  function getCurrentStep() {
    return currentStep;
  }

  // --- Expose ---

  window.Tutorial = {
    shouldShow: shouldShow,
    start: start,
    skip: skip,
    complete: complete,
    isActive: isActive,
    nextStep: nextStep,
    getCurrentStep: getCurrentStep
  };
})();
