(function () {
  'use strict';

  // ---------------------------------------------------------------
  // Fog of War Module
  // ---------------------------------------------------------------
  // Manages fog state for the enemy grid in Fog of War mode.
  // Cells start fogged; firing reveals the target cell and its
  // 8 neighbours (3x3 area). Sonar integration can reveal larger
  // areas via revealArea().
  //
  // Depends on: nothing (pure data / DOM-class module)
  // ---------------------------------------------------------------

  /**
   * Create a fresh fog state — a 2D boolean array where
   * false = fogged and true = revealed.
   */
  function createState(gridSize) {
    gridSize = gridSize || 10;
    var state = [];
    for (var r = 0; r < gridSize; r++) {
      var row = [];
      for (var c = 0; c < gridSize; c++) {
        row.push(false);
      }
      state.push(row);
    }
    return state;
  }

  /**
   * Reveal a cell and its 8 neighbours (3x3 area).
   * Returns an array of {row, col} for cells that were newly revealed.
   */
  function reveal(state, row, col) {
    return revealArea(state, row, col, 1);
  }

  /**
   * Reveal a larger area centred on (row, col).
   * radius=1 gives 3x3, radius=2 gives 5x5, etc.
   * Returns an array of {row, col} for cells that were newly revealed.
   */
  function revealArea(state, row, col, radius) {
    radius = (typeof radius === 'number') ? radius : 1;
    var size = state.length;
    var newly = [];

    for (var dr = -radius; dr <= radius; dr++) {
      for (var dc = -radius; dc <= radius; dc++) {
        var r = row + dr;
        var c = col + dc;
        if (r >= 0 && r < size && c >= 0 && c < size && !state[r][c]) {
          state[r][c] = true;
          newly.push({ row: r, col: c });
        }
      }
    }

    return newly;
  }

  /**
   * Check whether a cell is revealed (fog lifted).
   */
  function isRevealed(state, row, col) {
    if (row < 0 || row >= state.length || col < 0 || col >= state.length) {
      return false;
    }
    return !!state[row][col];
  }

  /**
   * Apply fog classes to a grid element.
   * Adds 'fogged' to unrevealed cells, removes it from revealed cells.
   * Adds a brief 'fog-revealing' animation class to newly-revealed cells.
   */
  function applyFog(gridEl, state) {
    var cells = gridEl.querySelectorAll('.cell[data-row][data-col]');
    for (var i = 0; i < cells.length; i++) {
      var cell = cells[i];
      var r = parseInt(cell.getAttribute('data-row'), 10);
      var c = parseInt(cell.getAttribute('data-col'), 10);

      if (state[r] && state[r][c]) {
        // Revealed
        if (cell.classList.contains('fogged')) {
          cell.classList.remove('fogged');
          cell.classList.add('fog-revealing');
          // Remove the animation class after it plays
          (function (el) {
            setTimeout(function () {
              el.classList.remove('fog-revealing');
            }, 500);
          })(cell);
        }
      } else {
        // Fogged
        if (!cell.classList.contains('fogged')) {
          cell.classList.add('fogged');
        }
      }
    }
  }

  /**
   * Count how many cells have been revealed.
   */
  function countRevealed(state) {
    var count = 0;
    for (var r = 0; r < state.length; r++) {
      for (var c = 0; c < state[r].length; c++) {
        if (state[r][c]) count++;
      }
    }
    return count;
  }

  /**
   * Reveal all cells (e.g. on game over).
   */
  function revealAll(state) {
    for (var r = 0; r < state.length; r++) {
      for (var c = 0; c < state[r].length; c++) {
        state[r][c] = true;
      }
    }
  }

  // =============================================================
  // Public API
  // =============================================================
  window.FogOfWar = {
    createState:   createState,
    reveal:        reveal,
    revealArea:    revealArea,
    isRevealed:    isRevealed,
    applyFog:      applyFog,
    countRevealed: countRevealed,
    revealAll:     revealAll
  };
})();
