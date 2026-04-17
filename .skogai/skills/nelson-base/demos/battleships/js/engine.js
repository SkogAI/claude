(function () {
  'use strict';

  var BOARD_SIZE = 10;
  var COLUMNS = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];

  var SHIPS = {
    Carrier:    { name: 'Carrier',    size: 5 },
    Battleship: { name: 'Battleship', size: 4 },
    Cruiser:    { name: 'Cruiser',    size: 3 },
    Submarine:  { name: 'Submarine',  size: 3 },
    Destroyer:  { name: 'Destroyer',  size: 2 }
  };

  function createBoard() {
    var board = [];
    for (var r = 0; r < BOARD_SIZE; r++) {
      var row = [];
      for (var c = 0; c < BOARD_SIZE; c++) { row.push(null); }
      board.push(row);
    }
    return board;
  }

  function canPlaceShip(board, size, row, col, horizontal) {
    if (typeof size !== 'number' || size < 1) return false;
    if (typeof row !== 'number' || typeof col !== 'number') return false;
    for (var i = 0; i < size; i++) {
      var r = horizontal ? row : row + i;
      var c = horizontal ? col + i : col;
      if (r < 0 || r >= BOARD_SIZE || c < 0 || c >= BOARD_SIZE) return false;
      if (board[r][c] !== null) return false;
    }
    return true;
  }

  function placeShip(board, ships, shipName, size, row, col, horizontal) {
    if (!canPlaceShip(board, size, row, col, horizontal)) return null;
    var positions = [];
    for (var i = 0; i < size; i++) {
      var r = horizontal ? row : row + i;
      var c = horizontal ? col + i : col;
      board[r][c] = 'ship';
      positions.push({ row: r, col: c });
    }
    ships.push({ name: shipName, size: size, positions: positions, hits: 0, sunk: false, horizontal: horizontal });
    return { board: board, ships: ships };
  }

  function getShipAt(ships, row, col) {
    for (var i = 0; i < ships.length; i++) {
      var positions = ships[i].positions;
      for (var j = 0; j < positions.length; j++) {
        if (positions[j].row === row && positions[j].col === col) return ships[i];
      }
    }
    return null;
  }

  function randomPlacement() {
    var board = createBoard();
    var ships = [];
    var shipDefs = [
      { name: 'Carrier', size: 5 }, { name: 'Battleship', size: 4 },
      { name: 'Cruiser', size: 3 }, { name: 'Submarine', size: 3 },
      { name: 'Destroyer', size: 2 }
    ];
    for (var s = 0; s < shipDefs.length; s++) {
      var placed = false;
      var attempts = 0;
      while (!placed) {
        attempts++;
        if (attempts > 1000) { board = createBoard(); ships = []; s = -1; break; }
        var horizontal = Math.random() < 0.5;
        var row = Math.floor(Math.random() * BOARD_SIZE);
        var col = Math.floor(Math.random() * BOARD_SIZE);
        var result = placeShip(board, ships, shipDefs[s].name, shipDefs[s].size, row, col, horizontal);
        if (result !== null) placed = true;
      }
    }
    return { board: board, ships: ships };
  }

  function processShot(board, ships, row, col) {
    if (row < 0 || row >= BOARD_SIZE || col < 0 || col >= BOARD_SIZE) return { result: 'miss' };
    var cell = board[row][col];
    if (cell === 'hit' || cell === 'miss') return { result: cell, alreadyFired: true };
    if (cell === 'ship') {
      board[row][col] = 'hit';
      var ship = getShipAt(ships, row, col);
      if (ship) {
        ship.hits++;
        if (ship.hits >= ship.size) { ship.sunk = true; return { result: 'sunk', shipName: ship.name }; }
        return { result: 'hit', shipName: ship.name };
      }
      return { result: 'hit' };
    }
    board[row][col] = 'miss';
    return { result: 'miss' };
  }

  function isGameOver(ships) {
    if (!ships || ships.length === 0) return false;
    for (var i = 0; i < ships.length; i++) { if (!ships[i].sunk) return false; }
    return true;
  }

  function colToIndex(letter) {
    if (typeof letter !== 'string' || letter.length === 0) return NaN;
    var index = letter.toUpperCase().charCodeAt(0) - 65;
    if (index < 0 || index >= BOARD_SIZE) return NaN;
    return index;
  }

  function indexToCol(index) {
    if (typeof index !== 'number' || index < 0 || index >= BOARD_SIZE) return '';
    return String.fromCharCode(65 + index);
  }

  function formatCoord(row, col) {
    var colLetter = indexToCol(col);
    if (colLetter === '') return '';
    return colLetter + (row + 1);
  }

  window.Engine = {
    BOARD_SIZE: BOARD_SIZE, COLUMNS: COLUMNS, SHIPS: SHIPS,
    createBoard: createBoard, canPlaceShip: canPlaceShip, placeShip: placeShip,
    getShipAt: getShipAt, randomPlacement: randomPlacement,
    processShot: processShot, isGameOver: isGameOver,
    colToIndex: colToIndex, indexToCol: indexToCol, formatCoord: formatCoord
  };
})();
