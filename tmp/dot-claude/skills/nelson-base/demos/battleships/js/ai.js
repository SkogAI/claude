(function () {
  'use strict';

  var BOARD = 10;
  var SHIP_DEFS = [
    { name: 'Carrier', size: 5 }, { name: 'Battleship', size: 4 },
    { name: 'Cruiser', size: 3 }, { name: 'Submarine', size: 3 },
    { name: 'Destroyer', size: 2 }
  ];

  var DIFFICULTIES = ['recruit', 'cadet', 'officer', 'captain', 'admiral', 'adaptive'];

  var TIER_ORDER = ['recruit', 'cadet', 'officer', 'captain', 'admiral'];

  // Map legacy difficulty names to new tiers
  var LEGACY_MAP = { easy: 'cadet', normal: 'officer', hard: 'captain' };

  function resolveDifficulty(difficulty) {
    if (!difficulty) return 'officer';
    var d = difficulty.toLowerCase();
    if (LEGACY_MAP[d]) return LEGACY_MAP[d];
    if (d === 'adaptive') return 'adaptive';
    for (var i = 0; i < TIER_ORDER.length; i++) {
      if (TIER_ORDER[i] === d) return d;
    }
    return 'officer';
  }

  function tierIndex(tier) {
    for (var i = 0; i < TIER_ORDER.length; i++) {
      if (TIER_ORDER[i] === tier) return i;
    }
    return 2; // default to officer
  }

  function key(r, c) { return r + ',' + c; }
  function inBounds(r, c) { return r >= 0 && r < BOARD && c >= 0 && c < BOARD; }

  function emptyBoard() {
    var b = [];
    for (var r = 0; r < BOARD; r++) { var row = []; for (var c = 0; c < BOARD; c++) row.push(null); b.push(row); }
    return b;
  }

  function canPlace(board, size, row, col, horiz) {
    for (var i = 0; i < size; i++) {
      var r = horiz ? row : row + i;
      var c = horiz ? col + i : col;
      if (!inBounds(r, c) || board[r][c] !== null) return false;
    }
    return true;
  }

  function doPlace(board, name, size, row, col, horiz) {
    var positions = [];
    for (var i = 0; i < size; i++) {
      var r = horiz ? row : row + i;
      var c = horiz ? col + i : col;
      board[r][c] = 'ship';
      positions.push({ row: r, col: c });
    }
    return { name: name, size: size, positions: positions, hits: 0, sunk: false };
  }

  function placeRandom() {
    var board = emptyBoard(); var ships = [];
    for (var s = 0; s < SHIP_DEFS.length; s++) {
      var def = SHIP_DEFS[s]; var placed = false; var attempts = 0;
      while (!placed) {
        attempts++;
        if (attempts > 2000) { board = emptyBoard(); ships = []; s = -1; break; }
        var horiz = Math.random() < 0.5;
        var row = Math.floor(Math.random() * BOARD);
        var col = Math.floor(Math.random() * BOARD);
        if (canPlace(board, def.size, row, col, horiz)) { ships.push(doPlace(board, def.name, def.size, row, col, horiz)); placed = true; }
      }
    }
    return { board: board, ships: ships };
  }

  function placeSmart() {
    var board = emptyBoard(); var ships = [];
    for (var s = 0; s < SHIP_DEFS.length; s++) {
      var def = SHIP_DEFS[s]; var bestScore = -Infinity; var bestCandidates = [];
      for (var horiz = 0; horiz <= 1; horiz++) {
        for (var row = 0; row < BOARD; row++) {
          for (var col = 0; col < BOARD; col++) {
            if (!canPlace(board, def.size, row, col, !!horiz)) continue;
            var score = 0;
            for (var i = 0; i < def.size; i++) {
              var r = horiz ? row : row + i; var c = horiz ? col + i : col;
              score += Math.min(r, c, BOARD-1-r, BOARD-1-c);
              var dirs = [[-1,0],[1,0],[0,-1],[0,1],[-1,-1],[-1,1],[1,-1],[1,1]];
              for (var d = 0; d < dirs.length; d++) {
                var nr = r+dirs[d][0], nc = c+dirs[d][1];
                if (inBounds(nr, nc) && board[nr][nc] === 'ship') score -= 3;
              }
            }
            score += Math.random() * 2;
            if (score > bestScore) { bestScore = score; bestCandidates = [{ row: row, col: col, horiz: !!horiz }]; }
            else if (score === bestScore) bestCandidates.push({ row: row, col: col, horiz: !!horiz });
          }
        }
      }
      if (!bestCandidates.length) return placeRandom();
      var pick = bestCandidates[Math.floor(Math.random() * bestCandidates.length)];
      ships.push(doPlace(board, def.name, def.size, pick.row, pick.col, pick.horiz));
    }
    return { board: board, ships: ships };
  }

  // Admiral placement: smart placement with edge avoidance
  function placeAdmiral() {
    var board = emptyBoard(); var ships = [];
    for (var s = 0; s < SHIP_DEFS.length; s++) {
      var def = SHIP_DEFS[s]; var bestScore = -Infinity; var bestCandidates = [];
      for (var horiz = 0; horiz <= 1; horiz++) {
        for (var row = 0; row < BOARD; row++) {
          for (var col = 0; col < BOARD; col++) {
            if (!canPlace(board, def.size, row, col, !!horiz)) continue;
            var score = 0;
            for (var i = 0; i < def.size; i++) {
              var r = horiz ? row : row + i; var c = horiz ? col + i : col;
              // Strong edge avoidance: penalize cells on the border
              var edgeDist = Math.min(r, c, BOARD-1-r, BOARD-1-c);
              if (edgeDist === 0) score -= 5;
              else score += edgeDist * 2;
              // Heavy penalty for adjacent ships
              var dirs = [[-1,0],[1,0],[0,-1],[0,1],[-1,-1],[-1,1],[1,-1],[1,1]];
              for (var d = 0; d < dirs.length; d++) {
                var nr = r+dirs[d][0], nc = c+dirs[d][1];
                if (inBounds(nr, nc) && board[nr][nc] === 'ship') score -= 6;
              }
            }
            // Minimal randomization for Admiral
            score += Math.random() * 0.5;
            if (score > bestScore) { bestScore = score; bestCandidates = [{ row: row, col: col, horiz: !!horiz }]; }
            else if (score === bestScore) bestCandidates.push({ row: row, col: col, horiz: !!horiz });
          }
        }
      }
      if (!bestCandidates.length) return placeRandom();
      var pick = bestCandidates[Math.floor(Math.random() * bestCandidates.length)];
      ships.push(doPlace(board, def.name, def.size, pick.row, pick.col, pick.horiz));
    }
    return { board: board, ships: ships };
  }

  function createState(difficulty) {
    var resolved = resolveDifficulty(difficulty);
    var state = {
      difficulty: resolved,
      previousShots: {},
      hitQueue: [],
      lastHits: [],
      sunkShipSizes: [],
      shotCount: 0
    };
    // Adaptive difficulty tracking
    if (resolved === 'adaptive') {
      state.effectiveTier = 'officer';
      state.adaptiveTurnCounter = 0;
      state.playerConsecutiveHits = 0;
      state.playerSunkShips = 0;
      state.playerShots = 0;
      state.playerHits = 0;
    }
    return state;
  }

  function placeShips(difficulty) {
    var resolved = resolveDifficulty(difficulty);
    if (resolved === 'adaptive') resolved = 'officer';
    if (resolved === 'captain') return placeSmart();
    if (resolved === 'admiral') return placeAdmiral();
    return placeRandom();
  }

  function getEffectiveTier(aiState) {
    if (aiState.difficulty === 'adaptive') return aiState.effectiveTier || 'officer';
    return aiState.difficulty;
  }

  function updateAdaptive(aiState) {
    if (aiState.difficulty !== 'adaptive') return;
    aiState.adaptiveTurnCounter++;
    if (aiState.adaptiveTurnCounter % 5 !== 0) return;

    var currentIdx = tierIndex(aiState.effectiveTier);

    // If player hits 3+ consecutive shots, bump AI up
    if (aiState.playerConsecutiveHits >= 3 && currentIdx < TIER_ORDER.length - 1) {
      aiState.effectiveTier = TIER_ORDER[currentIdx + 1];
      aiState.playerConsecutiveHits = 0;
      return;
    }

    // If AI sinks 2+ player ships and player accuracy < 30%, bump AI down
    var playerAccuracy = aiState.playerShots > 0 ? (aiState.playerHits / aiState.playerShots) : 1;
    if (aiState.playerSunkShips >= 2 && playerAccuracy < 0.3 && currentIdx > 0) {
      aiState.effectiveTier = TIER_ORDER[currentIdx - 1];
      aiState.playerSunkShips = 0;
      return;
    }
  }

  function updateState(aiState, row, col, result) {
    aiState.previousShots[key(row, col)] = result;
    aiState.shotCount++;

    var tier = getEffectiveTier(aiState);

    if (result === 'hit') {
      aiState.lastHits.push({ row: row, col: col });
      if (tier === 'recruit') {
        // Recruit never pursues hits
      } else if (tier === 'cadet') {
        if (Math.random() < 0.5) addAdj(aiState, row, col);
      } else {
        addAdj(aiState, row, col);
        if (aiState.lastHits.length >= 2) prioritiseLine(aiState);
      }
    }
    if (result === 'sunk') {
      aiState.lastHits.push({ row: row, col: col });
      aiState.sunkShipSizes.push(aiState.lastHits.length);
      pruneAfterSink(aiState);
    }

    // Update adaptive counters (AI turn counter)
    if (aiState.difficulty === 'adaptive') {
      updateAdaptive(aiState);
    }
  }

  function addAdj(aiState, row, col) {
    var dirs = [{row:row-1,col:col},{row:row+1,col:col},{row:row,col:col-1},{row:row,col:col+1}];
    for (var d = 0; d < dirs.length; d++) {
      var r = dirs[d].row, c = dirs[d].col;
      if (!inBounds(r, c) || aiState.previousShots[key(r, c)]) continue;
      var found = false;
      for (var q = 0; q < aiState.hitQueue.length; q++) { if (aiState.hitQueue[q].row === r && aiState.hitQueue[q].col === c) { found = true; break; } }
      if (!found) aiState.hitQueue.push({ row: r, col: c });
    }
  }

  function prioritiseLine(aiState) {
    var hits = aiState.lastHits; if (hits.length < 2) return;
    var allSameRow = true, allSameCol = true;
    for (var i = 1; i < hits.length; i++) { if (hits[i].row !== hits[0].row) allSameRow = false; if (hits[i].col !== hits[0].col) allSameCol = false; }
    if (!allSameRow && !allSameCol) return;
    var priority = [], rest = [];
    for (var q = 0; q < aiState.hitQueue.length; q++) {
      var cell = aiState.hitQueue[q]; var onLine = false;
      if (allSameRow && cell.row === hits[0].row) onLine = true;
      if (allSameCol && cell.col === hits[0].col) onLine = true;
      (onLine ? priority : rest).push(cell);
    }
    aiState.hitQueue = priority.concat(rest);
  }

  function pruneAfterSink(aiState) {
    var sunkKeys = {};
    for (var i = 0; i < aiState.lastHits.length; i++) { var h = aiState.lastHits[i]; sunkKeys[key(h.row, h.col)] = true; }
    var newQueue = [];
    for (var q = 0; q < aiState.hitQueue.length; q++) { var c = aiState.hitQueue[q]; if (!aiState.previousShots[key(c.row, c.col)]) newQueue.push(c); }
    var filtered = [];
    for (var f = 0; f < newQueue.length; f++) {
      var cell = newQueue[f];
      var neighbours = [key(cell.row-1,cell.col),key(cell.row+1,cell.col),key(cell.row,cell.col-1),key(cell.row,cell.col+1)];
      var adjToUnsunk = false, adjToSunk = false;
      for (var n = 0; n < neighbours.length; n++) { if (aiState.previousShots[neighbours[n]] === 'hit' && !sunkKeys[neighbours[n]]) adjToUnsunk = true; if (sunkKeys[neighbours[n]]) adjToSunk = true; }
      if (!adjToSunk || adjToUnsunk) filtered.push(cell);
    }
    aiState.hitQueue = filtered;
    aiState.lastHits = [];
  }

  // ---------- Shot selection per tier ----------

  function getShot(aiState) {
    var tier = getEffectiveTier(aiState);
    if (tier === 'recruit') return getShotRecruit(aiState);
    if (tier === 'cadet') return getShotCadet(aiState);
    if (tier === 'officer') return getShotOfficer(aiState);
    if (tier === 'admiral') return getShotAdmiral(aiState);
    return getShotCaptain(aiState); // captain is default
  }

  // Recruit: pure random, never uses hitQueue
  function getShotRecruit(aiState) {
    var avail = [];
    for (var r = 0; r < BOARD; r++) {
      for (var c = 0; c < BOARD; c++) {
        if (!aiState.previousShots[key(r, c)]) avail.push({ row: r, col: c });
      }
    }
    return avail.length > 0 ? avail[Math.floor(Math.random() * avail.length)] : { row: 0, col: 0 };
  }

  // Cadet: random shots, 50% chance to pursue hits (same as old easy)
  function getShotCadet(aiState) {
    if (aiState.hitQueue.length > 0 && Math.random() < 0.5) {
      while (aiState.hitQueue.length > 0) { var t = aiState.hitQueue.shift(); if (!aiState.previousShots[key(t.row, t.col)]) return { row: t.row, col: t.col }; }
    }
    var avail = [];
    for (var r = 0; r < BOARD; r++) for (var c = 0; c < BOARD; c++) if (!aiState.previousShots[key(r, c)]) avail.push({ row: r, col: c });
    return avail.length > 0 ? avail[Math.floor(Math.random() * avail.length)] : { row: 0, col: 0 };
  }

  // Officer: checkerboard + full hit pursuit (same as old normal)
  function getShotOfficer(aiState) {
    while (aiState.hitQueue.length > 0) { var t = aiState.hitQueue.shift(); if (!aiState.previousShots[key(t.row, t.col)]) return { row: t.row, col: t.col }; }
    var cands = [], fallback = [];
    for (var r = 0; r < BOARD; r++) for (var c = 0; c < BOARD; c++) {
      if (aiState.previousShots[key(r, c)]) continue;
      ((r + c) % 2 === 0 ? cands : fallback).push({ row: r, col: c });
    }
    var pool = cands.length > 0 ? cands : fallback;
    return pool.length > 0 ? pool[Math.floor(Math.random() * pool.length)] : { row: 0, col: 0 };
  }

  // Captain: probability heatmap with slight randomization to feel human
  function getShotCaptain(aiState) {
    while (aiState.hitQueue.length > 0) { var t = aiState.hitQueue.shift(); if (!aiState.previousShots[key(t.row, t.col)]) return { row: t.row, col: t.col }; }
    var prob = buildProbMap(aiState, false);
    var bestProb = -1, bestCells = [];
    for (var r = 0; r < BOARD; r++) for (var c = 0; c < BOARD; c++) {
      if (aiState.previousShots[key(r, c)]) continue;
      if (prob[r][c] > bestProb) { bestProb = prob[r][c]; bestCells = [{ row: r, col: c }]; }
      else if (prob[r][c] === bestProb) bestCells.push({ row: r, col: c });
    }
    // Slight randomization: 15% chance to pick from top-5 instead of absolute best
    if (bestCells.length > 0 && Math.random() < 0.15) {
      var allCells = [];
      for (var r2 = 0; r2 < BOARD; r2++) for (var c2 = 0; c2 < BOARD; c2++) {
        if (!aiState.previousShots[key(r2, c2)]) allCells.push({ row: r2, col: c2, prob: prob[r2][c2] });
      }
      allCells.sort(function(a, b) { return b.prob - a.prob; });
      var topN = allCells.slice(0, Math.min(5, allCells.length));
      return topN[Math.floor(Math.random() * topN.length)];
    }
    return bestCells.length > 0 ? bestCells[Math.floor(Math.random() * bestCells.length)] : { row: 0, col: 0 };
  }

  // Admiral: optimal probability heatmap, aggressive line extension, minimal randomization
  function getShotAdmiral(aiState) {
    while (aiState.hitQueue.length > 0) { var t = aiState.hitQueue.shift(); if (!aiState.previousShots[key(t.row, t.col)]) return { row: t.row, col: t.col }; }
    var prob = buildProbMap(aiState, true);
    var bestProb = -1, bestCells = [];
    for (var r = 0; r < BOARD; r++) for (var c = 0; c < BOARD; c++) {
      if (aiState.previousShots[key(r, c)]) continue;
      if (prob[r][c] > bestProb) { bestProb = prob[r][c]; bestCells = [{ row: r, col: c }]; }
      else if (prob[r][c] === bestProb) bestCells.push({ row: r, col: c });
    }
    // Minimal randomization: only among cells tied for best
    return bestCells.length > 0 ? bestCells[Math.floor(Math.random() * bestCells.length)] : { row: 0, col: 0 };
  }

  // ---------- Probability map ----------

  function buildProbMap(aiState, aggressive) {
    var prob = []; for (var r = 0; r < BOARD; r++) { var row = []; for (var c = 0; c < BOARD; c++) row.push(0); prob.push(row); }
    var allSizes = [5,4,3,3,2]; var remaining = allSizes.slice();
    for (var si = 0; si < aiState.sunkShipSizes.length; si++) { var idx = remaining.indexOf(aiState.sunkShipSizes[si]); if (idx !== -1) remaining.splice(idx, 1); }
    for (var s = 0; s < remaining.length; s++) {
      var size = remaining[s];
      for (var r2 = 0; r2 < BOARD; r2++) for (var c2 = 0; c2 <= BOARD - size; c2++) {
        if (isValidP(aiState, size, r2, c2, true)) { var bonus = getBonus(aiState, size, r2, c2, true); for (var i = 0; i < size; i++) prob[r2][c2+i] += 1 + bonus; }
      }
      for (var r3 = 0; r3 <= BOARD - size; r3++) for (var c3 = 0; c3 < BOARD; c3++) {
        if (isValidP(aiState, size, r3, c3, false)) { var bonus2 = getBonus(aiState, size, r3, c3, false); for (var i2 = 0; i2 < size; i2++) prob[r3+i2][c3] += 1 + bonus2; }
      }
    }
    for (var r4 = 0; r4 < BOARD; r4++) for (var c4 = 0; c4 < BOARD; c4++) { if (aiState.previousShots[key(r4, c4)]) prob[r4][c4] = 0; }
    if (aiState.lastHits.length > 0) boostHits(aiState, prob, aggressive);
    return prob;
  }

  function isValidP(aiState, size, row, col, horiz) {
    for (var i = 0; i < size; i++) {
      var r = horiz ? row : row + i, c = horiz ? col + i : col;
      if (!inBounds(r, c)) return false;
      var res = aiState.previousShots[key(r, c)];
      if (res === 'miss' || res === 'sunk') return false;
    }
    return true;
  }

  function getBonus(aiState, size, row, col, horiz) {
    var bonus = 0;
    for (var i = 0; i < size; i++) { var r = horiz ? row : row+i, c = horiz ? col+i : col; if (aiState.previousShots[key(r, c)] === 'hit') bonus += 10; }
    return bonus;
  }

  function boostHits(aiState, prob, aggressive) {
    var adjBonus = aggressive ? 80 : 50;
    var lineBonus = aggressive ? 150 : 100;

    var hits = aiState.lastHits;
    var allSameRow = true, allSameCol = true;
    if (hits.length >= 2) { for (var i = 1; i < hits.length; i++) { if (hits[i].row !== hits[0].row) allSameRow = false; if (hits[i].col !== hits[0].col) allSameCol = false; } }
    else { allSameRow = false; allSameCol = false; }
    for (var h = 0; h < hits.length; h++) {
      var dirs;
      if (allSameRow) dirs = [[0,-1],[0,1]]; else if (allSameCol) dirs = [[-1,0],[1,0]]; else dirs = [[-1,0],[1,0],[0,-1],[0,1]];
      for (var d = 0; d < dirs.length; d++) {
        var nr = hits[h].row+dirs[d][0], nc = hits[h].col+dirs[d][1];
        if (inBounds(nr, nc) && !aiState.previousShots[key(nr, nc)]) prob[nr][nc] += adjBonus;
      }
    }
    if (hits.length >= 2 && (allSameRow || allSameCol)) {
      var minR=hits[0].row, maxR=hits[0].row, minC=hits[0].col, maxC=hits[0].col;
      for (var j=1;j<hits.length;j++) { if(hits[j].row<minR)minR=hits[j].row; if(hits[j].row>maxR)maxR=hits[j].row; if(hits[j].col<minC)minC=hits[j].col; if(hits[j].col>maxC)maxC=hits[j].col; }
      if (allSameRow) {
        if (minC-1>=0 && !aiState.previousShots[key(minR,minC-1)]) prob[minR][minC-1] += lineBonus;
        if (maxC+1<BOARD && !aiState.previousShots[key(maxR,maxC+1)]) prob[maxR][maxC+1] += lineBonus;
      } else {
        if (minR-1>=0 && !aiState.previousShots[key(minR-1,minC)]) prob[minR-1][minC] += lineBonus;
        if (maxR+1<BOARD && !aiState.previousShots[key(maxR+1,maxC)]) prob[maxR+1][maxC] += lineBonus;
      }
    }
  }

  window.AI = {
    createState: createState,
    getShot: getShot,
    updateState: updateState,
    placeShips: placeShips,
    DIFFICULTIES: DIFFICULTIES
  };
})();
