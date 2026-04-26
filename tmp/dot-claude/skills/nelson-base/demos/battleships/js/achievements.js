(function () {
  'use strict';

  // ---------------------------------------------------------------
  // Achievement / medal system for Battleships
  // ---------------------------------------------------------------
  // Tracks player accomplishments and persists unlocked keys in
  // localStorage.  Each achievement has a check() function that
  // receives a gameState snapshot and returns true when the
  // condition is met.
  //
  // Depends on: nothing (pure data / logic module; mode names are
  //             plain strings so no hard import of Modes is needed)
  // ---------------------------------------------------------------

  var STORAGE_KEY = 'battleships_achievements';

  // =============================================================
  // Achievement definitions
  // =============================================================
  var definitions = [
    {
      key: 'first_blood',
      name: 'First Blood',
      description: 'Sink your first enemy ship.',
      icon: '\uD83C\uDFAF',
      tier: 'bronze',
      check: function (gs) { return gs.enemyShipsSunk > 0; }
    },
    {
      key: 'sharpshooter',
      name: 'Sharpshooter',
      description: 'Win a game with 60%+ accuracy.',
      icon: '\uD83D\uDD2B',
      tier: 'silver',
      check: function (gs) { return gs.playerWon && gs.accuracy >= 60; }
    },
    {
      key: 'perfect_storm',
      name: 'Perfect Storm',
      description: 'Win a game with 90%+ accuracy.',
      icon: '\u26A1',
      tier: 'gold',
      check: function (gs) { return gs.playerWon && gs.accuracy >= 90; }
    },
    {
      key: 'speed_demon',
      name: 'Speed Demon',
      description: 'Win a game in under 40 turns.',
      icon: '\u23F1\uFE0F',
      tier: 'silver',
      check: function (gs) { return gs.playerWon && gs.turns < 40; }
    },
    {
      key: 'clean_sweep',
      name: 'Clean Sweep',
      description: 'Win without losing a single ship.',
      icon: '\uD83E\uDDF9',
      tier: 'gold',
      check: function (gs) { return gs.playerWon && gs.playerShipsLost === 0; }
    },
    {
      key: 'admirals_pride',
      name: "Admiral's Pride",
      description: 'Win on Admiral difficulty.',
      icon: '\uD83C\uDF96\uFE0F',
      tier: 'gold',
      check: function (gs) { return gs.playerWon && gs.difficulty === 'admiral'; }
    },
    {
      key: 'campaign_victor',
      name: 'Campaign Victor',
      description: 'Complete all 5 campaign rounds.',
      icon: '\uD83C\uDFC6',
      tier: 'platinum',
      check: function (gs) { return gs.campaignComplete === true; }
    },
    {
      key: 'salvo_master',
      name: 'Salvo Master',
      description: 'Win a game in Salvo mode.',
      icon: '\uD83D\uDCA3',
      tier: 'silver',
      check: function (gs) { return gs.playerWon && gs.mode === 'salvo'; }
    },
    {
      key: 'hat_trick',
      name: 'Hat Trick',
      description: 'Win 3 games in a row.',
      icon: '\uD83C\uDFA9',
      tier: 'silver',
      check: function (gs) { return gs.winStreak >= 3; }
    },
    {
      key: 'seasoned_captain',
      name: 'Seasoned Captain',
      description: 'Play 10 games.',
      icon: '\u2693',
      tier: 'bronze',
      check: function (gs) { return gs.gamesPlayed >= 10; }
    },
    {
      key: 'fleet_admiral',
      name: 'Fleet Admiral',
      description: 'Play 50 games.',
      icon: '\u2B50',
      tier: 'gold',
      check: function (gs) { return gs.gamesPlayed >= 50; }
    },
    {
      key: 'lucky_shot',
      name: 'Lucky Shot',
      description: 'Win a game with under 30% accuracy.',
      icon: '\uD83C\uDF40',
      tier: 'silver',
      check: function (gs) { return gs.playerWon && gs.accuracy < 30; }
    }
  ];

  // Build a quick lookup map by key
  var defMap = {};
  for (var i = 0; i < definitions.length; i++) {
    defMap[definitions[i].key] = definitions[i];
  }

  // =============================================================
  // Persistence helpers
  // =============================================================
  function loadUnlocked() {
    try {
      var raw = localStorage.getItem(STORAGE_KEY);
      if (raw) {
        var parsed = JSON.parse(raw);
        if (Object.prototype.toString.call(parsed) === '[object Array]') {
          return parsed;
        }
      }
    } catch (e) { /* swallow */ }
    return [];
  }

  function saveUnlocked(keys) {
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(keys));
    } catch (e) { /* swallow */ }
  }

  // =============================================================
  // Public API
  // =============================================================

  /**
   * Return a shallow copy of every achievement definition.
   */
  function getAll() {
    return definitions.slice();
  }

  /**
   * Return the array of unlocked achievement keys from storage.
   */
  function getUnlocked() {
    return loadUnlocked();
  }

  /**
   * Check all achievements against the supplied gameState.
   * Returns an array of achievement keys that were *newly* unlocked
   * during this call (already-unlocked achievements are skipped).
   * Newly unlocked keys are persisted automatically.
   */
  function check(gameState) {
    var unlocked = loadUnlocked();
    var unlockedSet = {};
    for (var u = 0; u < unlocked.length; u++) {
      unlockedSet[unlocked[u]] = true;
    }

    var newlyUnlocked = [];
    for (var d = 0; d < definitions.length; d++) {
      var def = definitions[d];
      if (unlockedSet[def.key]) continue;
      try {
        if (def.check(gameState)) {
          newlyUnlocked.push(def.key);
          unlocked.push(def.key);
          unlockedSet[def.key] = true;
        }
      } catch (e) { /* guard against bad gameState shapes */ }
    }

    if (newlyUnlocked.length > 0) {
      saveUnlocked(unlocked);
    }
    return newlyUnlocked;
  }

  /**
   * Manually unlock an achievement by key (useful for testing).
   * Returns true if newly unlocked, false if already unlocked or
   * the key is unrecognised.
   */
  function unlock(key) {
    if (!defMap[key]) return false;
    var unlocked = loadUnlocked();
    for (var i = 0; i < unlocked.length; i++) {
      if (unlocked[i] === key) return false;
    }
    unlocked.push(key);
    saveUnlocked(unlocked);
    return true;
  }

  /**
   * Clear all unlocked achievements from storage.
   */
  function reset() {
    saveUnlocked([]);
  }

  /**
   * Check whether a single achievement is currently unlocked.
   */
  function isUnlocked(key) {
    var unlocked = loadUnlocked();
    for (var i = 0; i < unlocked.length; i++) {
      if (unlocked[i] === key) return true;
    }
    return false;
  }

  /**
   * Return the full definition object for a given achievement key,
   * or null if the key is unrecognised.
   */
  function getDefinition(key) {
    return defMap[key] || null;
  }

  window.Achievements = {
    getAll:         getAll,
    getUnlocked:    getUnlocked,
    check:          check,
    unlock:         unlock,
    reset:          reset,
    isUnlocked:     isUnlocked,
    getDefinition:  getDefinition
  };
})();
