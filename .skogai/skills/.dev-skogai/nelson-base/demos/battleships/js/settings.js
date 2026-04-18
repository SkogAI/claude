(function () {
  'use strict';

  var STORAGE_KEY = 'battleships_settings';

  var defaults = {
    volume: 50,
    soundEnabled: true,
    animationSpeed: 'normal',
    colorblindMode: false,
    highContrast: false,
    reducedMotion: false,
    showTutorial: true,
    difficulty: 'officer',
    gameMode: 'classic'
  };

  var settings = null;
  var listeners = {};

  // --- Persistence ---

  function load() {
    try {
      var raw = localStorage.getItem(STORAGE_KEY);
      if (raw) {
        var parsed = JSON.parse(raw);
        settings = {};
        for (var key in defaults) {
          if (defaults.hasOwnProperty(key)) {
            settings[key] = parsed.hasOwnProperty(key) ? parsed[key] : defaults[key];
          }
        }
      } else {
        settings = copyDefaults();
      }
    } catch (e) {
      settings = copyDefaults();
    }
  }

  function save() {
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(settings));
    } catch (e) { /* storage full or unavailable */ }
  }

  function copyDefaults() {
    return JSON.parse(JSON.stringify(defaults));
  }

  function ensureLoaded() {
    if (!settings) load();
  }

  // --- Change callbacks ---

  function fireCallbacks(key, value) {
    if (!listeners[key]) return;
    for (var i = 0; i < listeners[key].length; i++) {
      try {
        listeners[key][i](value, key);
      } catch (e) { /* swallow callback errors */ }
    }
  }

  // --- Core API ---

  function get(key) {
    ensureLoaded();
    if (settings.hasOwnProperty(key)) return settings[key];
    if (defaults.hasOwnProperty(key)) return defaults[key];
    return undefined;
  }

  function set(key, value) {
    ensureLoaded();
    var old = settings[key];
    settings[key] = value;
    save();
    if (old !== value) {
      fireCallbacks(key, value);
    }
  }

  function getAll() {
    ensureLoaded();
    return JSON.parse(JSON.stringify(settings));
  }

  function reset() {
    settings = copyDefaults();
    save();
    // Fire callbacks for every key so the game can react to full reset
    for (var key in settings) {
      if (settings.hasOwnProperty(key)) {
        fireCallbacks(key, settings[key]);
      }
    }
  }

  function onChange(key, callback) {
    if (typeof callback !== 'function') return;
    if (!listeners[key]) listeners[key] = [];
    listeners[key].push(callback);
  }

  // --- Convenience accessors ---

  function getVolume() { return get('volume'); }
  function setVolume(level) {
    var clamped = Math.max(0, Math.min(100, Number(level) || 0));
    set('volume', clamped);
  }

  function isSoundEnabled() { return !!get('soundEnabled'); }
  function setSoundEnabled(bool) { set('soundEnabled', !!bool); }

  function getAnimationSpeed() { return get('animationSpeed'); }
  function setAnimationSpeed(speed) {
    var valid = { slow: true, normal: true, fast: true };
    if (valid[speed]) {
      set('animationSpeed', speed);
    }
  }

  function isColorblindMode() { return !!get('colorblindMode'); }
  function setColorblindMode(bool) { set('colorblindMode', !!bool); }

  function isHighContrast() { return !!get('highContrast'); }
  function setHighContrast(bool) { set('highContrast', !!bool); }

  function isReducedMotion() { return !!get('reducedMotion'); }
  function setReducedMotion(bool) { set('reducedMotion', !!bool); }

  // --- Expose ---

  window.Settings = {
    get: get,
    set: set,
    getAll: getAll,
    reset: reset,
    onChange: onChange,
    getVolume: getVolume,
    setVolume: setVolume,
    isSoundEnabled: isSoundEnabled,
    setSoundEnabled: setSoundEnabled,
    getAnimationSpeed: getAnimationSpeed,
    setAnimationSpeed: setAnimationSpeed,
    isColorblindMode: isColorblindMode,
    setColorblindMode: setColorblindMode,
    isHighContrast: isHighContrast,
    setHighContrast: setHighContrast,
    isReducedMotion: isReducedMotion,
    setReducedMotion: setReducedMotion
  };
})();
