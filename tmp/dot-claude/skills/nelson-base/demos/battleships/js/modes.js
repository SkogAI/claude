(function () {
  'use strict';

  // ---------------------------------------------------------------
  // Game Mode definitions for Battleships
  // ---------------------------------------------------------------
  // Each mode is an object describing the rules, shots-per-turn
  // logic, scoring multiplier, and optional campaign configuration.
  //
  // Depends on: nothing (pure data / logic module)
  // ---------------------------------------------------------------

  // --- Helper: count surviving (unsunk) ships ---
  function countSurvivingShips(ships) {
    var count = 0;
    for (var i = 0; i < ships.length; i++) {
      if (!ships[i].sunk) count++;
    }
    return count;
  }

  // --- Map campaign difficulty names to AI difficulty values ---
  // The AI module only recognises 'easy', 'normal', and 'hard'.
  var difficultyMap = {
    recruit:  'easy',
    cadet:    'easy',
    officer:  'normal',
    captain:  'hard',
    admiral:  'hard'
  };

  function mapDifficulty(campaignDifficulty) {
    return difficultyMap[campaignDifficulty] || 'normal';
  }

  // =============================================================
  // Classic Mode
  // =============================================================
  var CLASSIC = {
    key: 'classic',
    name: 'Classic',
    description: 'Standard battleships \u2014 one shot per turn.',
    icon: '\u2693',

    shotsPerTurn: function () { return 1; },
    aiShotsPerTurn: function () { return 1; },

    campaign: null,
    scoreMultiplier: 1.0
  };

  // =============================================================
  // Salvo Mode
  // =============================================================
  var SALVO = {
    key: 'salvo',
    name: 'Salvo',
    description: 'Fire one shot per surviving ship each turn.',
    icon: '\uD83D\uDCA5',

    shotsPerTurn: function (playerShips) {
      return countSurvivingShips(playerShips);
    },
    aiShotsPerTurn: function (aiShips) {
      return countSurvivingShips(aiShips);
    },

    campaign: null,
    scoreMultiplier: 1.5
  };

  // =============================================================
  // Campaign Mode
  // =============================================================
  var campaignRounds = [
    { round: 1, difficulty: 'recruit',  title: 'Patrol Duty',      description: 'An easy start against untrained opponents.' },
    { round: 2, difficulty: 'cadet',    title: 'Coastal Skirmish',  description: 'The enemy is learning.' },
    { round: 3, difficulty: 'officer',  title: 'Open Waters',       description: 'A capable foe awaits.' },
    { round: 4, difficulty: 'captain',  title: 'The Gauntlet',      description: 'Enemy captains mean business.' },
    { round: 5, difficulty: 'admiral',  title: 'Fleet Action',      description: 'The ultimate test of naval command.' }
  ];

  var CAMPAIGN = {
    key: 'campaign',
    name: 'Campaign',
    description: 'Five battles of escalating difficulty. Prove your worth from Patrol Duty to Fleet Action.',
    icon: '\uD83C\uDF1F',

    shotsPerTurn: function () { return 1; },
    aiShotsPerTurn: function () { return 1; },

    campaign: {
      rounds: campaignRounds,

      /**
       * Return the round object for the current round.
       * Returns null if the campaign is complete.
       */
      getCurrentRound: function (campaignState) {
        var idx = campaignState.currentRound;
        if (idx < 0 || idx >= campaignRounds.length) return null;
        return campaignRounds[idx];
      },

      /**
       * Advance to the next round after a win.
       * Adds the round score and increments the counter.
       * Returns the updated state (mutated in-place).
       */
      advanceRound: function (campaignState, roundScore) {
        campaignState.wins++;
        campaignState.totalScore += (typeof roundScore === 'number' ? roundScore : 0);
        campaignState.currentRound++;
        return campaignState;
      },

      /**
       * Record a loss in the current campaign round.
       * The round does NOT advance; the player may retry.
       */
      recordLoss: function (campaignState) {
        campaignState.losses++;
        return campaignState;
      },

      /**
       * True when all five rounds have been won.
       */
      isComplete: function (campaignState) {
        return campaignState.currentRound >= campaignRounds.length;
      },

      /**
       * Create a fresh campaign state.
       */
      createState: function () {
        return { currentRound: 0, wins: 0, losses: 0, totalScore: 0 };
      },

      /**
       * Map a campaign difficulty name to the AI difficulty
       * the engine actually understands ('easy'|'normal'|'hard').
       */
      mapDifficulty: mapDifficulty
    },

    scoreMultiplier: 2.0
  };

  // =============================================================
  // Fog of War Mode
  // =============================================================
  var FOG_OF_WAR = {
    key: 'fogofwar',
    name: 'Fog of War',
    description: 'Enemy waters are shrouded in fog \u2014 firing reveals nearby cells. Navigate blind.',
    icon: '\uD83C\uDF2B\uFE0F',

    shotsPerTurn: function () { return 1; },
    aiShotsPerTurn: function () { return 1; },

    campaign: null,
    scoreMultiplier: 1.75
  };

  // =============================================================
  // Registry helpers
  // =============================================================
  var registry = {
    classic:  CLASSIC,
    salvo:    SALVO,
    campaign: CAMPAIGN,
    fogofwar: FOG_OF_WAR
  };

  function list() {
    return ['classic', 'salvo', 'campaign', 'fogofwar'];
  }

  function get(modeKey) {
    return registry[modeKey] || null;
  }

  // =============================================================
  // Public API
  // =============================================================
  window.Modes = {
    list:       list,
    get:        get,
    CLASSIC:    CLASSIC,
    SALVO:      SALVO,
    CAMPAIGN:   CAMPAIGN,
    FOG_OF_WAR: FOG_OF_WAR
  };
})();
