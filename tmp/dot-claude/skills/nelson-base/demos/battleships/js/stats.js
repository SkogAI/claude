(function () {
  'use strict';

  var STORAGE_KEY = 'battleships_stats';

  var defaultStats = {
    games_played: 0,
    wins: 0,
    losses: 0,
    best_accuracy: 0,
    worst_accuracy: 100,
    total_shots: 0,
    total_hits: 0,
    current_win_streak: 0,
    best_win_streak: 0,
    highest_score: 0
  };

  var POINTS_HIT = 100;
  var POINTS_MISS = -25;
  var BONUS_SINK_MULTIPLIER = 500;
  var PERFECT_ACCURACY_BONUS = 5000;
  var SPEED_BONUS_PER_TURN = 50;
  var SPEED_BONUS_THRESHOLD = 50;

  var stats = null;
  var currentScore = 0;

  function load() {
    try {
      var raw = localStorage.getItem(STORAGE_KEY);
      if (raw) {
        var parsed = JSON.parse(raw);
        stats = {};
        for (var key in defaultStats) {
          stats[key] = parsed[key] !== undefined ? parsed[key] : defaultStats[key];
        }
      } else {
        stats = JSON.parse(JSON.stringify(defaultStats));
      }
    } catch (e) {
      stats = JSON.parse(JSON.stringify(defaultStats));
    }
    return stats;
  }

  function save() {
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(stats));
    } catch (e) {}
  }

  function reset() {
    stats = JSON.parse(JSON.stringify(defaultStats));
    save();
  }

  function getStats() {
    if (!stats) load();
    return stats;
  }

  function getCurrentScore() { return currentScore; }
  function resetCurrentScore() { currentScore = 0; }

  function scoreHit() { currentScore += POINTS_HIT; return currentScore; }

  function scoreMiss() {
    currentScore += POINTS_MISS;
    if (currentScore < 0) currentScore = 0;
    return currentScore;
  }

  function scoreSink(shipSize) {
    currentScore += BONUS_SINK_MULTIPLIER * shipSize;
    return currentScore;
  }

  function scoreGameEnd(playerWon, accuracy, turnNumber) {
    if (playerWon && turnNumber < SPEED_BONUS_THRESHOLD) {
      currentScore += SPEED_BONUS_PER_TURN * (SPEED_BONUS_THRESHOLD - turnNumber);
    }
    if (playerWon && accuracy >= 90) {
      currentScore += PERFECT_ACCURACY_BONUS;
    }
    return currentScore;
  }

  function recordGame(playerWon, accuracy, shotCount, hitCount) {
    if (!stats) load();
    stats.games_played++;
    stats.total_shots += shotCount;
    stats.total_hits += hitCount;
    if (playerWon) {
      stats.wins++;
      stats.current_win_streak++;
      if (stats.current_win_streak > stats.best_win_streak) stats.best_win_streak = stats.current_win_streak;
    } else {
      stats.losses++;
      stats.current_win_streak = 0;
    }
    if (accuracy > stats.best_accuracy) stats.best_accuracy = accuracy;
    if (stats.games_played === 1 || accuracy < stats.worst_accuracy) stats.worst_accuracy = accuracy;
    if (currentScore > stats.highest_score) stats.highest_score = currentScore;
    save();
    return stats;
  }

  window.Stats = {
    load: load, save: save, reset: reset, getStats: getStats,
    getCurrentScore: getCurrentScore, resetCurrentScore: resetCurrentScore,
    scoreHit: scoreHit, scoreMiss: scoreMiss, scoreSink: scoreSink,
    scoreGameEnd: scoreGameEnd, recordGame: recordGame
  };
})();
