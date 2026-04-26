(function () {
  'use strict';

  var WEAPON_DEFS = {
    torpedo: { name: 'Torpedo', icon: '\u{1F4A5}', maxUses: 2, needsDirection: true, areaSize: null },
    airstrike: { name: 'Airstrike', icon: '\u{2708}\uFE0F', maxUses: 1, needsDirection: false, areaSize: 3 },
    sonar: { name: 'Sonar Ping', icon: '\u{1F4E1}', maxUses: 2, needsDirection: false, areaSize: 3 }
  };

  function create() {
    return {
      torpedo: { uses: WEAPON_DEFS.torpedo.maxUses, maxUses: WEAPON_DEFS.torpedo.maxUses },
      airstrike: { uses: WEAPON_DEFS.airstrike.maxUses, maxUses: WEAPON_DEFS.airstrike.maxUses },
      sonar: { uses: WEAPON_DEFS.sonar.maxUses, maxUses: WEAPON_DEFS.sonar.maxUses },
      active: null
    };
  }

  function getAvailable(state) {
    var result = [];
    var types = ['torpedo', 'airstrike', 'sonar'];
    for (var i = 0; i < types.length; i++) {
      var type = types[i];
      if (state[type].uses > 0) {
        var def = WEAPON_DEFS[type];
        result.push({
          type: type,
          name: def.name,
          icon: def.icon,
          uses: state[type].uses,
          maxUses: state[type].maxUses
        });
      }
    }
    return result;
  }

  function activate(state, weaponType) {
    if (!WEAPON_DEFS[weaponType]) return null;
    if (state[weaponType].uses <= 0) return null;
    state.active = weaponType;
    var def = WEAPON_DEFS[weaponType];
    return {
      type: weaponType,
      needsDirection: def.needsDirection,
      areaSize: def.areaSize
    };
  }

  function deactivate(state) {
    state.active = null;
  }

  function isActive(state) {
    return state.active !== null;
  }

  function getAreaCells(row, col, size) {
    var cells = [];
    var offset = Math.floor(size / 2);
    var boardSize = Engine.BOARD_SIZE;
    for (var r = row - offset; r <= row + offset; r++) {
      for (var c = col - offset; c <= col + offset; c++) {
        if (r >= 0 && r < boardSize && c >= 0 && c < boardSize) {
          cells.push({ row: r, col: c });
        }
      }
    }
    return cells;
  }

  function getLineCells(row, col, direction) {
    var cells = [];
    var boardSize = Engine.BOARD_SIZE;
    if (direction === 'horizontal') {
      for (var c = 0; c < boardSize; c++) {
        cells.push({ row: row, col: c });
      }
    } else {
      for (var r = 0; r < boardSize; r++) {
        cells.push({ row: r, col: col });
      }
    }
    return cells;
  }

  function execute(state, board, ships, row, col, direction) {
    var weaponType = state.active;
    if (!weaponType) return null;
    if (state[weaponType].uses <= 0) return null;

    var result = { type: weaponType, cells: [] };

    if (weaponType === 'torpedo') {
      var lineCells = getLineCells(row, col, direction);
      for (var i = 0; i < lineCells.length; i++) {
        var lc = lineCells[i];
        var shot = Engine.processShot(board, ships, lc.row, lc.col);
        result.cells.push({ row: lc.row, col: lc.col, result: shot.result, shipName: shot.shipName, alreadyFired: shot.alreadyFired });
      }
    } else if (weaponType === 'airstrike') {
      var areaCells = getAreaCells(row, col, 3);
      for (var j = 0; j < areaCells.length; j++) {
        var ac = areaCells[j];
        var aShot = Engine.processShot(board, ships, ac.row, ac.col);
        result.cells.push({ row: ac.row, col: ac.col, result: aShot.result, shipName: aShot.shipName, alreadyFired: aShot.alreadyFired });
      }
    } else if (weaponType === 'sonar') {
      var sonarCells = getAreaCells(row, col, 3);
      for (var k = 0; k < sonarCells.length; k++) {
        var sc = sonarCells[k];
        var cellValue = board[sc.row][sc.col];
        var hasShip = cellValue === 'ship';
        result.cells.push({ row: sc.row, col: sc.col, hasShip: hasShip });
      }
    }

    state[weaponType].uses--;
    state.active = null;

    return result;
  }

  window.Weapons = {
    create: create,
    getAvailable: getAvailable,
    activate: activate,
    deactivate: deactivate,
    isActive: isActive,
    execute: execute
  };
})();
