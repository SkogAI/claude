(function () {
  'use strict';

  // ----- DOM references -----
  var statusEl       = document.getElementById('status-message');
  var placementPanel = document.getElementById('placement-panel');
  var rotateBtn      = document.getElementById('rotate-btn');
  var autoPlaceBtn   = document.getElementById('auto-place-btn');
  var playerGrid     = document.getElementById('player-grid');
  var enemyGrid      = document.getElementById('enemy-grid');
  var overlay        = document.getElementById('game-over-overlay');
  var overBox        = document.getElementById('game-over-box');
  var overMsg        = document.getElementById('game-over-message');
  var overStats      = document.getElementById('game-over-stats');
  var overButtons    = document.getElementById('game-over-buttons');
  var playAgainBtn   = document.getElementById('play-again-btn');
  var shipOptions    = document.querySelectorAll('.ship-option');
  var difficultySelect = document.getElementById('difficulty-select');
  var soundToggle    = document.getElementById('sound-toggle');
  var playerFleetList = document.getElementById('player-fleet-list');
  var enemyFleetList  = document.getElementById('enemy-fleet-list');
  var logEntries     = document.getElementById('log-entries');

  // Weapons/Fog DOM references
  var weaponsPanelEl   = document.getElementById('weapons-panel');
  var directionPickerEl = document.getElementById('direction-picker');

  // New DOM references
  var modeSelectScreen = document.getElementById('mode-select-screen');
  var startGameBtn   = document.getElementById('start-game-btn');
  var modeCards      = document.querySelectorAll('.mode-card');
  var pauseOverlay   = document.getElementById('pause-overlay');
  var pauseBtn       = document.getElementById('pause-btn');
  var resumeBtn      = document.getElementById('resume-btn');
  var settingsBtn    = document.getElementById('settings-btn');
  var settingsPanel  = document.getElementById('settings-panel');
  var settingsCloseBtn = document.getElementById('settings-close-btn');
  var settingsVolume = document.getElementById('settings-volume');
  var settingsVolumeValue = document.getElementById('settings-volume-value');
  var settingsSound  = document.getElementById('settings-sound');
  var settingsAnimation = document.getElementById('settings-animation');
  var settingsColorblind = document.getElementById('settings-colorblind');
  var settingsHighContrast = document.getElementById('settings-highcontrast');
  var settingsReducedMotion = document.getElementById('settings-reducedmotion');
  var difficultyRow  = document.getElementById('difficulty-row');
  var achievementsList = document.getElementById('achievements-list');
  var achievementsToastArea = document.getElementById('achievement-toast-area');

  // ----- Game state -----
  var phase = 'modeselect'; // 'modeselect' | 'placement' | 'battle' | 'gameover' | 'paused'
  var previousPhase = 'battle'; // used when pausing
  var playerBoard, playerShips, enemyBoard, enemyShips, aiState;
  var horizontal = true;
  var locked = false;
  var turnNumber = 0;
  var playerShotCount = 0;
  var playerHitCount = 0;
  var enemyShotCount = 0;
  var soundEnabled = true;

  // Mode & difficulty
  var selectedMode = 'classic';
  var selectedDifficulty = 'officer';
  var currentMode = null; // Modes object
  var campaignState = null;

  // Salvo state
  var salvoShotsRemaining = 0;
  var salvoTurnActive = false;

  // Weapons & Fog of War state
  var weaponsState = null;
  var fogState = null;
  var pendingWeaponClick = null; // {row, col} for torpedo awaiting direction

  var shipDefs = [
    { key: 'carrier',    name: 'Carrier',    size: 5 },
    { key: 'battleship', name: 'Battleship', size: 4 },
    { key: 'cruiser',    name: 'Cruiser',    size: 3 },
    { key: 'submarine',  name: 'Submarine',  size: 3 },
    { key: 'destroyer',  name: 'Destroyer',  size: 2 }
  ];
  var currentShipIndex = 0;
  var placedShips = {};

  // Keyboard navigation state
  var kbRow = 0, kbCol = 0;
  var kbMode = false;
  var kbFiring = false;

  // ----- Build grids programmatically -----
  function buildGrid(gridEl) {
    gridEl.innerHTML = '';
    // Corner
    var corner = document.createElement('div');
    corner.className = 'label corner';
    gridEl.appendChild(corner);
    // Column headers A-J
    for (var c = 0; c < 10; c++) {
      var ch = document.createElement('div');
      ch.className = 'label col-header';
      ch.textContent = Engine.COLUMNS[c];
      gridEl.appendChild(ch);
    }
    // Rows 1-10
    for (var r = 0; r < 10; r++) {
      var rh = document.createElement('div');
      rh.className = 'label row-header';
      rh.textContent = (r + 1).toString();
      gridEl.appendChild(rh);
      for (var c2 = 0; c2 < 10; c2++) {
        var cell = document.createElement('div');
        cell.className = 'cell';
        cell.setAttribute('data-row', r);
        cell.setAttribute('data-col', c2);
        cell.setAttribute('role', 'gridcell');
        cell.setAttribute('aria-label', Engine.COLUMNS[c2] + (r + 1));
        gridEl.appendChild(cell);
      }
    }
  }

  buildGrid(playerGrid);
  buildGrid(enemyGrid);

  // ----- Helpers -----
  function getCell(grid, row, col) {
    return grid.querySelector('.cell[data-row="' + row + '"][data-col="' + col + '"]');
  }

  function setStatus(msg, type) {
    statusEl.textContent = msg;
    statusEl.className = '';
    statusEl.id = 'status-message';
    if (type) statusEl.classList.add('status-' + type);
  }

  function currentShipDef() {
    if (currentShipIndex >= shipDefs.length) return null;
    return shipDefs[currentShipIndex];
  }

  function getShipCells(size, row, col, horiz) {
    var cells = [];
    for (var i = 0; i < size; i++) {
      cells.push({ row: horiz ? row : row + i, col: horiz ? col + i : col });
    }
    return cells;
  }

  function applyShipClasses(grid, ship) {
    var orient = ship.horizontal ? 'h' : 'v';
    var typeName = ship.name.toLowerCase();
    for (var i = 0; i < ship.positions.length; i++) {
      var pos = ship.positions[i];
      var el = getCell(grid, pos.row, pos.col);
      if (!el) continue;
      el.classList.add('ship', 'ship-' + typeName);
      if (i === 0) {
        el.classList.add('ship-bow-' + orient);
      } else if (i === ship.positions.length - 1) {
        el.classList.add('ship-stern-' + orient);
      } else {
        el.classList.add('ship-hull-' + orient);
      }
    }
  }

  function countSurviving(ships) {
    var count = 0;
    for (var i = 0; i < ships.length; i++) {
      if (!ships[i].sunk) count++;
    }
    return count;
  }

  // ----- Sound -----
  function initSound() {
    if (soundEnabled) SFX.init();
  }

  soundToggle.addEventListener('click', function () {
    soundEnabled = !soundEnabled;
    soundToggle.textContent = 'Sound: ' + (soundEnabled ? 'ON' : 'OFF');
    soundToggle.classList.toggle('muted', !soundEnabled);
    SFX.setMuted(!soundEnabled);
    Settings.setSoundEnabled(soundEnabled);
    if (soundEnabled) SFX.init();
  });

  // ----- Settings integration -----
  function applySettings() {
    var all = Settings.getAll();

    // Colorblind mode
    if (all.colorblindMode) {
      document.body.classList.add('colorblind-mode');
    } else {
      document.body.classList.remove('colorblind-mode');
    }

    // High contrast
    if (all.highContrast) {
      document.body.classList.add('high-contrast');
    } else {
      document.body.classList.remove('high-contrast');
    }

    // Reduced motion — we add a class even though CSS handles prefers-reduced-motion
    if (all.reducedMotion) {
      document.body.classList.add('reduced-motion');
    } else {
      document.body.classList.remove('reduced-motion');
    }

    // Sound
    soundEnabled = all.soundEnabled;
    soundToggle.textContent = 'Sound: ' + (soundEnabled ? 'ON' : 'OFF');
    soundToggle.classList.toggle('muted', !soundEnabled);
    SFX.setVolume(all.volume / 100);
    SFX.setMuted(!soundEnabled);

    // Update settings panel UI
    settingsVolume.value = all.volume;
    settingsVolumeValue.textContent = all.volume;
    settingsSound.checked = all.soundEnabled;
    settingsAnimation.value = all.animationSpeed;
    settingsColorblind.checked = all.colorblindMode;
    settingsHighContrast.checked = all.highContrast;
    settingsReducedMotion.checked = all.reducedMotion;

    // Difficulty
    if (all.difficulty) {
      difficultySelect.value = all.difficulty;
      selectedDifficulty = all.difficulty;
    }
    // Mode
    if (all.gameMode) {
      selectedMode = all.gameMode;
      updateModeCardSelection();
    }
  }

  // Settings panel controls
  settingsBtn.addEventListener('click', function () {
    var visible = settingsPanel.style.display !== 'none';
    settingsPanel.style.display = visible ? 'none' : '';
  });

  settingsCloseBtn.addEventListener('click', function () {
    settingsPanel.style.display = 'none';
  });

  settingsVolume.addEventListener('input', function () {
    var val = parseInt(settingsVolume.value, 10);
    settingsVolumeValue.textContent = val;
    Settings.setVolume(val);
    SFX.setVolume(val / 100);
  });

  settingsSound.addEventListener('change', function () {
    Settings.setSoundEnabled(settingsSound.checked);
    soundEnabled = settingsSound.checked;
    soundToggle.textContent = 'Sound: ' + (soundEnabled ? 'ON' : 'OFF');
    soundToggle.classList.toggle('muted', !soundEnabled);
    SFX.setMuted(!soundEnabled);
    if (soundEnabled) SFX.init();
  });

  settingsAnimation.addEventListener('change', function () {
    Settings.setAnimationSpeed(settingsAnimation.value);
  });

  settingsColorblind.addEventListener('change', function () {
    Settings.setColorblindMode(settingsColorblind.checked);
    if (settingsColorblind.checked) {
      document.body.classList.add('colorblind-mode');
    } else {
      document.body.classList.remove('colorblind-mode');
    }
  });

  settingsHighContrast.addEventListener('change', function () {
    Settings.setHighContrast(settingsHighContrast.checked);
    if (settingsHighContrast.checked) {
      document.body.classList.add('high-contrast');
    } else {
      document.body.classList.remove('high-contrast');
    }
  });

  settingsReducedMotion.addEventListener('change', function () {
    Settings.setReducedMotion(settingsReducedMotion.checked);
    if (settingsReducedMotion.checked) {
      document.body.classList.add('reduced-motion');
    } else {
      document.body.classList.remove('reduced-motion');
    }
  });

  // Register Settings.onChange callbacks for real-time changes
  Settings.onChange('volume', function (val) {
    SFX.setVolume(val / 100);
    settingsVolume.value = val;
    settingsVolumeValue.textContent = val;
  });

  Settings.onChange('soundEnabled', function (val) {
    soundEnabled = val;
    soundToggle.textContent = 'Sound: ' + (val ? 'ON' : 'OFF');
    soundToggle.classList.toggle('muted', !val);
    SFX.setMuted(!val);
    settingsSound.checked = val;
  });

  Settings.onChange('colorblindMode', function (val) {
    document.body.classList.toggle('colorblind-mode', val);
    settingsColorblind.checked = val;
  });

  Settings.onChange('highContrast', function (val) {
    document.body.classList.toggle('high-contrast', val);
    settingsHighContrast.checked = val;
  });

  Settings.onChange('reducedMotion', function (val) {
    document.body.classList.toggle('reduced-motion', val);
    settingsReducedMotion.checked = val;
  });

  // ----- Mode selection -----
  function updateModeCardSelection() {
    for (var i = 0; i < modeCards.length; i++) {
      var card = modeCards[i];
      var mode = card.getAttribute('data-mode');
      if (mode === selectedMode) {
        card.style.borderColor = 'var(--signal-green)';
        card.style.boxShadow = '0 0 15px rgba(46,204,113,0.2),inset 0 0 15px rgba(46,204,113,0.1)';
      } else {
        card.style.borderColor = 'var(--glass-border)';
        card.style.boxShadow = 'none';
      }
    }
    // Hide difficulty row in campaign mode (it auto-selects)
    if (selectedMode === 'campaign') {
      difficultyRow.style.display = 'none';
    } else {
      difficultyRow.style.display = '';
    }
  }

  for (var mi = 0; mi < modeCards.length; mi++) {
    (function (card) {
      card.addEventListener('click', function () {
        selectedMode = card.getAttribute('data-mode');
        updateModeCardSelection();
      });
    })(modeCards[mi]);
  }

  difficultySelect.addEventListener('change', function () {
    selectedDifficulty = difficultySelect.value;
  });

  startGameBtn.addEventListener('click', function () {
    initSound();
    // Save selections to settings
    Settings.set('gameMode', selectedMode);
    if (selectedMode !== 'campaign') {
      Settings.set('difficulty', selectedDifficulty);
    }

    // Set up the mode
    currentMode = Modes.get(selectedMode);

    // Campaign setup
    if (selectedMode === 'campaign') {
      campaignState = Modes.CAMPAIGN.campaign.createState();
      var round = Modes.CAMPAIGN.campaign.getCurrentRound(campaignState);
      if (round) {
        selectedDifficulty = round.difficulty;
      }
    } else {
      campaignState = null;
    }

    // Hide mode select, show placement
    modeSelectScreen.style.display = 'none';
    phase = 'placement';
    placementPanel.classList.remove('hidden');
    resetPlacement();
    initDragPlacement();
    setStatus('Place your ' + shipDefs[0].name + ' (' + shipDefs[0].size + ' cells)');

    // Show campaign round info if applicable
    if (selectedMode === 'campaign' && campaignState) {
      var roundInfo = Modes.CAMPAIGN.campaign.getCurrentRound(campaignState);
      if (roundInfo) {
        setStatus('Round ' + roundInfo.round + ': ' + roundInfo.title + ' — Place your ships!');
      }
    }
  });

  // ----- Fleet status panels -----
  function buildFleetStatus(container, ships, isEnemy) {
    container.innerHTML = '';
    for (var i = 0; i < ships.length; i++) {
      var ship = ships[i];
      var div = document.createElement('div');
      div.className = 'ship-status';
      div.setAttribute('data-ship', ship.name.toLowerCase());

      var nameSpan = document.createElement('span');
      nameSpan.className = 'ship-name';
      nameSpan.textContent = ship.name;

      var bar = document.createElement('div');
      bar.className = 'health-bar';
      var fill = document.createElement('div');
      fill.className = 'health-bar-fill';
      fill.style.width = '100%';
      bar.appendChild(fill);

      div.appendChild(nameSpan);
      div.appendChild(bar);
      container.appendChild(div);
    }
  }

  function updateFleetStatus(container, ships) {
    for (var i = 0; i < ships.length; i++) {
      var ship = ships[i];
      var div = container.querySelector('[data-ship="' + ship.name.toLowerCase() + '"]');
      if (!div) continue;
      var fill = div.querySelector('.health-bar-fill');
      var remaining = ship.size - ship.hits;
      var pct = (remaining / ship.size) * 100;
      fill.style.width = pct + '%';

      fill.className = 'health-bar-fill';
      if (ship.sunk) {
        fill.classList.add('dead');
        div.classList.add('sunk-status');
      } else if (pct <= 33) {
        fill.classList.add('critical');
      } else if (pct <= 66) {
        fill.classList.add('warning');
      }
    }
  }

  // ----- Combat log -----
  function addLog(msg, type) {
    var entry = document.createElement('div');
    entry.className = 'log-entry' + (type ? ' ' + type : '');
    var turnSpan = document.createElement('span');
    turnSpan.className = 'turn-number';
    turnSpan.textContent = '[' + turnNumber + ']';
    entry.appendChild(turnSpan);
    entry.appendChild(document.createTextNode(' ' + msg));
    logEntries.appendChild(entry);
    logEntries.scrollTop = logEntries.scrollHeight;
  }

  // ----- Placement preview -----
  var previewCells = [];

  function clearPreview() {
    for (var i = 0; i < previewCells.length; i++) {
      previewCells[i].classList.remove('preview-valid', 'preview-invalid');
    }
    previewCells = [];
  }

  function showPreview(row, col) {
    clearPreview();
    var def = currentShipDef();
    if (!def) return;
    var valid = Engine.canPlaceShip(playerBoard, def.size, row, col, horizontal);
    var cells = getShipCells(def.size, row, col, horizontal);
    var cls = valid ? 'preview-valid' : 'preview-invalid';
    for (var i = 0; i < cells.length; i++) {
      var r = cells[i].row, c = cells[i].col;
      if (r >= 0 && r < 10 && c >= 0 && c < 10) {
        var el = getCell(playerGrid, r, c);
        if (el) { el.classList.add(cls); previewCells.push(el); }
      }
    }
  }

  // ----- Ship option selection -----
  function selectShipOption(index) {
    for (var i = 0; i < shipOptions.length; i++) shipOptions[i].classList.remove('active');
    if (index < shipOptions.length) shipOptions[index].classList.add('active');
  }

  function markShipPlaced(index) {
    if (index < shipOptions.length) {
      shipOptions[index].classList.add('placed');
      shipOptions[index].classList.remove('active');
    }
  }

  for (var si = 0; si < shipOptions.length; si++) {
    (function (idx) {
      shipOptions[idx].addEventListener('click', function () {
        if (phase !== 'placement') return;
        if (placedShips[shipDefs[idx].key]) return;
        currentShipIndex = idx;
        selectShipOption(idx);
        setStatus('Place your ' + shipDefs[idx].name + ' (' + shipDefs[idx].size + ' cells)');
      });
    })(si);
  }

  // ----- Player grid: placement -----
  var pCells = playerGrid.querySelectorAll('.cell');
  for (var pi = 0; pi < pCells.length; pi++) {
    (function (cell) {
      cell.addEventListener('mouseenter', function () {
        if (phase !== 'placement') return;
        showPreview(parseInt(cell.getAttribute('data-row'), 10), parseInt(cell.getAttribute('data-col'), 10));
      });
      cell.addEventListener('mouseleave', function () { if (phase === 'placement') clearPreview(); });
      cell.addEventListener('click', function () {
        if (phase !== 'placement') return;
        initSound();
        var def = currentShipDef();
        if (!def) return;
        var row = parseInt(cell.getAttribute('data-row'), 10);
        var col = parseInt(cell.getAttribute('data-col'), 10);
        var result = Engine.placeShip(playerBoard, playerShips, def.name, def.size, row, col, horizontal);
        if (result === null) return;
        clearPreview();
        SFX.place();
        applyShipClasses(playerGrid, playerShips[playerShips.length - 1]);
        placedShips[def.key] = true;
        markShipPlaced(currentShipIndex);
        var foundNext = false;
        for (var n = 0; n < shipDefs.length; n++) {
          if (!placedShips[shipDefs[n].key]) {
            currentShipIndex = n;
            selectShipOption(n);
            setStatus('Place your ' + shipDefs[n].name + ' (' + shipDefs[n].size + ' cells)');
            foundNext = true;
            break;
          }
        }
        if (!foundNext) startBattle();
      });
    })(pCells[pi]);
  }

  // ----- Undo ship placement (right-click) -----
  playerGrid.addEventListener('contextmenu', function (e) {
    if (phase !== 'placement') return;
    e.preventDefault();
    var target = e.target;
    if (!target.classList.contains('cell')) return;
    var row = parseInt(target.getAttribute('data-row'), 10);
    var col = parseInt(target.getAttribute('data-col'), 10);
    if (playerBoard[row][col] !== 'ship') return;

    var ship = Engine.getShipAt(playerShips, row, col);
    if (!ship) return;

    for (var i = 0; i < ship.positions.length; i++) {
      var pos = ship.positions[i];
      playerBoard[pos.row][pos.col] = null;
      var cell = getCell(playerGrid, pos.row, pos.col);
      if (cell) cell.classList.remove('ship', 'ship-bow-h', 'ship-bow-v', 'ship-hull-h', 'ship-hull-v', 'ship-stern-h', 'ship-stern-v', 'ship-carrier', 'ship-battleship', 'ship-cruiser', 'ship-submarine', 'ship-destroyer');
    }

    var shipIdx = playerShips.indexOf(ship);
    if (shipIdx !== -1) playerShips.splice(shipIdx, 1);

    for (var d = 0; d < shipDefs.length; d++) {
      if (shipDefs[d].name === ship.name) {
        placedShips[shipDefs[d].key] = false;
        shipOptions[d].classList.remove('placed');
        currentShipIndex = d;
        selectShipOption(d);
        setStatus('Place your ' + shipDefs[d].name + ' (' + shipDefs[d].size + ' cells)');
        break;
      }
    }
    clearPreview();
  });

  // ----- Rotate -----
  rotateBtn.addEventListener('click', function () {
    horizontal = !horizontal;
    rotateBtn.textContent = horizontal ? 'Rotate (R)' : 'Rotate (R) \u2014 Vertical';
  });

  // ----- Keyboard navigation helpers -----
  function updateCursor() {
    var prev = enemyGrid.querySelector('.kb-cursor');
    if (prev) prev.classList.remove('kb-cursor');
    if (!kbMode || phase !== 'battle') return;
    var cell = getCell(enemyGrid, kbRow, kbCol);
    if (cell) cell.classList.add('kb-cursor');
  }

  function moveCursor(dr, dc) {
    var r = kbRow + dr;
    var c = kbCol + dc;
    while (r >= 0 && r < 10 && c >= 0 && c < 10) {
      if (enemyBoard[r][c] !== 'hit' && enemyBoard[r][c] !== 'miss') {
        kbRow = r; kbCol = c; updateCursor(); return;
      }
      r += dr; c += dc;
    }
  }

  function fireAtCursor() {
    var cell = getCell(enemyGrid, kbRow, kbCol);
    if (cell) { kbFiring = true; cell.click(); kbFiring = false; }
  }

  document.addEventListener('keydown', function (e) {
    if ((e.key === 'r' || e.key === 'R') && phase === 'placement') {
      horizontal = !horizontal;
      rotateBtn.textContent = horizontal ? 'Rotate (R)' : 'Rotate (R) \u2014 Vertical';
    }

    // Escape toggles pause during battle
    if (e.key === 'Escape') {
      if (phase === 'battle') {
        pauseGame();
        return;
      } else if (phase === 'paused') {
        resumeGame();
        return;
      }
      // Also close settings if open
      if (settingsPanel.style.display !== 'none') {
        settingsPanel.style.display = 'none';
        return;
      }
      if (phase === 'battle' && kbMode) {
        kbMode = false; updateCursor();
      }
    }

    if (phase === 'battle' && !locked) {
      if (e.key === 'Tab') {
        e.preventDefault(); kbMode = !kbMode; updateCursor();
      } else if (kbMode) {
        if (e.key === 'ArrowUp') { e.preventDefault(); moveCursor(-1, 0); }
        else if (e.key === 'ArrowDown') { e.preventDefault(); moveCursor(1, 0); }
        else if (e.key === 'ArrowLeft') { e.preventDefault(); moveCursor(0, -1); }
        else if (e.key === 'ArrowRight') { e.preventDefault(); moveCursor(0, 1); }
        else if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); fireAtCursor(); }
      }
    }
  });

  // ----- Auto Place -----
  autoPlaceBtn.addEventListener('click', function () {
    if (phase !== 'placement') return;
    initSound();
    // Reset board
    playerBoard = Engine.createBoard();
    playerShips = [];
    placedShips = {};
    // Clear visual
    var allCells = playerGrid.querySelectorAll('.cell');
    for (var i = 0; i < allCells.length; i++) {
      allCells[i].classList.remove('ship', 'ship-bow-h', 'ship-bow-v', 'ship-hull-h', 'ship-hull-v', 'ship-stern-h', 'ship-stern-v', 'ship-carrier', 'ship-battleship', 'ship-cruiser', 'ship-submarine', 'ship-destroyer');
    }
    // Random place
    var result = Engine.randomPlacement();
    playerBoard = result.board;
    playerShips = result.ships;
    // Show ships
    for (var s = 0; s < playerShips.length; s++) {
      var ship = playerShips[s];
      if (typeof ship.horizontal === 'undefined') {
        ship.horizontal = ship.positions.length <= 1 || ship.positions[0].row === ship.positions[1].row;
      }
      applyShipClasses(playerGrid, ship);
      // Mark option as placed
      for (var d = 0; d < shipDefs.length; d++) {
        if (shipDefs[d].name === ship.name) { placedShips[shipDefs[d].key] = true; markShipPlaced(d); break; }
      }
    }
    SFX.place();
    startBattle();
  });

  // ----- Drag-and-drop placement -----
  function initDragPlacement() {
    DragPlacement.init(playerGrid, placementPanel, {
      onPlace: function (shipKey, shipName, size, row, col, horiz) {
        var result = Engine.placeShip(playerBoard, playerShips, shipName, size, row, col, horiz);
        if (result === null) return;
        SFX.place();
        applyShipClasses(playerGrid, playerShips[playerShips.length - 1]);
        placedShips[shipKey] = true;
        DragPlacement.markPlaced(shipKey);
        // Mark ship option in panel
        for (var d = 0; d < shipDefs.length; d++) {
          if (shipDefs[d].key === shipKey) { markShipPlaced(d); break; }
        }
        // Find next unplaced ship
        var foundNext = false;
        for (var n = 0; n < shipDefs.length; n++) {
          if (!placedShips[shipDefs[n].key]) {
            currentShipIndex = n;
            selectShipOption(n);
            setStatus('Place your ' + shipDefs[n].name + ' (' + shipDefs[n].size + ' cells)');
            foundNext = true;
            break;
          }
        }
        if (!foundNext) startBattle();
      },
      canPlace: function (size, row, col, horiz) {
        return Engine.canPlaceShip(playerBoard, size, row, col, horiz);
      },
      onRotate: function () {
        horizontal = !horizontal;
        rotateBtn.textContent = horizontal ? 'Rotate (R)' : 'Rotate (R) \u2014 Vertical';
      },
      getHorizontal: function () { return horizontal; }
    });
  }

  // ----- Weapons panel helpers -----
  function updateWeaponsPanel() {
    if (!weaponsState) return;
    var btns = weaponsPanelEl.querySelectorAll('.weapon-btn');
    for (var i = 0; i < btns.length; i++) {
      var btn = btns[i];
      var type = btn.getAttribute('data-weapon');
      var usesEl = btn.querySelector('.weapon-uses');
      if (weaponsState[type]) {
        usesEl.textContent = weaponsState[type].uses;
        if (weaponsState[type].uses <= 0) {
          btn.classList.add('exhausted');
          btn.classList.remove('active');
        } else {
          btn.classList.remove('exhausted');
        }
      }
      // Highlight active weapon
      if (weaponsState.active === type) {
        btn.classList.add('active');
      } else {
        btn.classList.remove('active');
      }
    }
  }

  function hideWeaponsPanel() {
    weaponsPanelEl.style.display = 'none';
    directionPickerEl.style.display = 'none';
    pendingWeaponClick = null;
  }

  // ----- Weapon button click handlers -----
  (function () {
    var btns = weaponsPanelEl.querySelectorAll('.weapon-btn');
    for (var i = 0; i < btns.length; i++) {
      (function (btn) {
        btn.addEventListener('click', function () {
          if (phase !== 'battle' || locked || !weaponsState) return;
          var type = btn.getAttribute('data-weapon');
          if (weaponsState[type].uses <= 0) return;

          // Toggle weapon off if already active
          if (weaponsState.active === type) {
            Weapons.deactivate(weaponsState);
            directionPickerEl.style.display = 'none';
            pendingWeaponClick = null;
            updateWeaponsPanel();
            setStatus("Turn " + turnNumber + " \u2014 Fire at enemy waters!");
            return;
          }

          var info = Weapons.activate(weaponsState, type);
          if (!info) return;
          SFX.weaponSelect();
          updateWeaponsPanel();
          setStatus("Turn " + turnNumber + " \u2014 " + info.type.charAt(0).toUpperCase() + info.type.slice(1) + " active! Click enemy waters.");
        });
      })(btns[i]);
    }
  })();

  // ----- Direction picker handlers -----
  (function () {
    var dirBtns = directionPickerEl.querySelectorAll('.direction-btn');
    for (var i = 0; i < dirBtns.length; i++) {
      (function (btn) {
        btn.addEventListener('click', function () {
          var dir = btn.getAttribute('data-direction');
          if (dir === 'cancel') {
            directionPickerEl.style.display = 'none';
            if (weaponsState) Weapons.deactivate(weaponsState);
            pendingWeaponClick = null;
            updateWeaponsPanel();
            setStatus("Turn " + turnNumber + " \u2014 Fire at enemy waters!");
            locked = false;
            return;
          }
          if (!pendingWeaponClick || !weaponsState) return;
          directionPickerEl.style.display = 'none';
          executeWeapon(pendingWeaponClick.row, pendingWeaponClick.col, dir);
          pendingWeaponClick = null;
        });
      })(dirBtns[i]);
    }
  })();

  // ----- Execute weapon after direction (if needed) -----
  function executeWeapon(row, col, direction) {
    var result = Weapons.execute(weaponsState, enemyBoard, enemyShips, row, col, direction);
    if (!result) { locked = false; return; }

    updateWeaponsPanel();

    if (result.type === 'torpedo') {
      SFX.torpedo();
      // Animate torpedo trail
      var startCell = getCell(enemyGrid, row, col);
      if (startCell) {
        var sRect = startCell.getBoundingClientRect();
        var cx = sRect.left + sRect.width / 2;
        var cy = sRect.top + sRect.height / 2;
        // Find end cell
        var lastCell = result.cells[result.cells.length - 1];
        var endEl = getCell(enemyGrid, lastCell.row, lastCell.col);
        if (endEl) {
          var eRect = endEl.getBoundingClientRect();
          Particles.torpedoTrail(cx, cy, eRect.left + eRect.width / 2, eRect.top + eRect.height / 2);
        }
      }
      processWeaponCells(result.cells, true);
    } else if (result.type === 'airstrike') {
      SFX.airstrike();
      // Airstrike particle at center
      var centerEl = getCell(enemyGrid, row, col);
      if (centerEl) {
        var cRect = centerEl.getBoundingClientRect();
        Particles.airstrike(cRect.left + cRect.width / 2, cRect.top + cRect.height / 2);
      }
      processWeaponCells(result.cells, true);
    } else if (result.type === 'sonar') {
      SFX.sonarPing();
      // Sonar particle at center
      var sonarEl = getCell(enemyGrid, row, col);
      if (sonarEl) {
        var sonarRect = sonarEl.getBoundingClientRect();
        Particles.sonarPing(sonarRect.left + sonarRect.width / 2, sonarRect.top + sonarRect.height / 2);
      }
      // Sonar doesn't fire shots — just reveals info visually
      for (var i = 0; i < result.cells.length; i++) {
        var sc = result.cells[i];
        var scEl = getCell(enemyGrid, sc.row, sc.col);
        if (scEl) {
          scEl.classList.add('sonar-revealed');
          if (sc.hasShip) {
            scEl.classList.add('sonar-ship');
          }
        }
      }
      // Fog of War: sonar reveals 5x5 area
      if (fogState) {
        FogOfWar.revealArea(fogState, row, col, 2);
        FogOfWar.applyFog(enemyGrid, fogState);
        SFX.fogReveal();
      }
      addLog('Sonar scan at ' + Engine.formatCoord(row, col) + ' \u2014 area scanned!', '');
      // Sonar doesn't end the turn — player still fires normally
      locked = false;
      return;
    }
  }

  function processWeaponCells(cells, endsTurn) {
    var hitCount = 0;
    var sunkNames = [];
    for (var i = 0; i < cells.length; i++) {
      var c = cells[i];
      if (c.alreadyFired) continue;
      var cellEl = getCell(enemyGrid, c.row, c.col);
      if (!cellEl) continue;

      if (c.result === 'sunk') {
        cellEl.classList.remove('hit', 'miss');
        cellEl.classList.add('sunk');
        var sunkShip = Engine.getShipAt(enemyShips, c.row, c.col);
        if (sunkShip) {
          for (var p = 0; p < sunkShip.positions.length; p++) {
            var sunkCellEl = getCell(enemyGrid, sunkShip.positions[p].row, sunkShip.positions[p].col);
            if (sunkCellEl) { sunkCellEl.classList.remove('hit', 'miss'); sunkCellEl.classList.add('sunk'); }
          }
          if (sunkNames.indexOf(sunkShip.name) === -1) {
            sunkNames.push(sunkShip.name);
            SFX.shipSinking();
            var sRect = cellEl.getBoundingClientRect();
            Particles.sinking(sRect.left + sRect.width / 2, sRect.top + sRect.height / 2);
          }
        }
        hitCount++;
        playerHitCount++;
        playerShotCount++;
        Stats.scoreHit();
        if (sunkShip) Stats.scoreSink(sunkShip.positions.length);
      } else if (c.result === 'hit') {
        cellEl.classList.add('hit');
        hitCount++;
        playerHitCount++;
        playerShotCount++;
        Stats.scoreHit();
      } else if (c.result === 'miss') {
        cellEl.classList.add('miss');
        playerShotCount++;
        Stats.scoreMiss();
      }

      // Fog of War: reveal around each fired cell
      if (fogState) {
        FogOfWar.reveal(fogState, c.row, c.col);
      }
    }

    if (fogState) {
      FogOfWar.applyFog(enemyGrid, fogState);
      SFX.fogReveal();
    }

    updateScoreDisplay();
    updateFleetStatus(enemyFleetList, enemyShips);

    var coordStr = Engine.formatCoord(cells[0].row, cells[0].col);
    if (sunkNames.length > 0) {
      setStatus("Weapon strike \u2014 SUNK " + sunkNames.join(', ') + "!", 'sunk');
      addLog('Weapon strike at ' + coordStr + ' \u2014 SUNK ' + sunkNames.join(', ') + '!', 'sunk');
    } else if (hitCount > 0) {
      setStatus("Weapon strike \u2014 " + hitCount + " hit(s)!", 'hit');
      addLog('Weapon strike at ' + coordStr + ' \u2014 ' + hitCount + ' hit(s)!', 'hit');
    } else {
      setStatus("Weapon strike \u2014 all miss!", 'miss');
      addLog('Weapon strike at ' + coordStr + ' \u2014 all miss', 'miss');
    }

    if (Engine.isGameOver(enemyShips)) {
      phase = 'gameover';
      showGameOver(true);
      return;
    }

    if (endsTurn) {
      setTimeout(function () { doAITurn(); }, 600);
    }
  }

  // ----- Battle phase -----
  function startBattle() {
    phase = 'battle';
    placementPanel.classList.add('hidden');
    pauseBtn.style.display = '';

    // Clean up drag placement
    DragPlacement.destroy();

    // Initialize weapons
    weaponsState = Weapons.create();
    updateWeaponsPanel();
    weaponsPanelEl.style.display = '';

    // Initialize Fog of War if applicable
    if (selectedMode === 'fogofwar') {
      fogState = FogOfWar.createState(10);
      FogOfWar.applyFog(enemyGrid, fogState);
    } else {
      fogState = null;
    }

    // Determine the effective difficulty for AI
    var effectiveDifficulty = selectedDifficulty;
    if (selectedMode === 'campaign' && campaignState) {
      var round = Modes.CAMPAIGN.campaign.getCurrentRound(campaignState);
      if (round) {
        effectiveDifficulty = round.difficulty;
      }
    }

    var aiResult = AI.placeShips(effectiveDifficulty);
    enemyBoard = aiResult.board;
    enemyShips = aiResult.ships;
    aiState = AI.createState(effectiveDifficulty);
    turnNumber = 1;
    playerShotCount = 0;
    playerHitCount = 0;
    enemyShotCount = 0;
    salvoShotsRemaining = 0;
    salvoTurnActive = false;

    Stats.load();
    Stats.resetCurrentScore();
    updateScoreDisplay();
    updateStatsPanel();
    document.getElementById('live-score').style.display = '';

    buildFleetStatus(playerFleetList, playerShips, false);
    buildFleetStatus(enemyFleetList, enemyShips, true);

    // Start ambient audio
    SFX.startAmbient();

    // Begin first turn
    beginPlayerTurn();
  }

  function beginPlayerTurn() {
    locked = false;

    // Play turn start sound
    SFX.turnStart();

    // Set up salvo shots
    if (selectedMode === 'salvo' && currentMode) {
      salvoShotsRemaining = currentMode.shotsPerTurn(playerShips);
      salvoTurnActive = true;
      setStatus("Turn " + turnNumber + " \u2014 Fire! Shots remaining: " + salvoShotsRemaining);
    } else {
      salvoShotsRemaining = 1;
      salvoTurnActive = false;
      setStatus("Turn " + turnNumber + " \u2014 Fire at enemy waters!");
    }

    if (selectedMode === 'campaign' && campaignState) {
      var round = Modes.CAMPAIGN.campaign.getCurrentRound(campaignState);
      if (round) {
        addLog('Round ' + round.round + ': ' + round.title + ' \u2014 Turn ' + turnNumber, '');
      }
    } else if (turnNumber === 1) {
      var diffLabel = effectiveDifficultyLabel();
      addLog('Battle stations! Mode: ' + capitalize(selectedMode) + ' | Difficulty: ' + diffLabel, '');
    }
  }

  function effectiveDifficultyLabel() {
    if (selectedMode === 'campaign' && campaignState) {
      var round = Modes.CAMPAIGN.campaign.getCurrentRound(campaignState);
      return round ? capitalize(round.difficulty) : capitalize(selectedDifficulty);
    }
    return capitalize(selectedDifficulty);
  }

  function capitalize(str) {
    return str.charAt(0).toUpperCase() + str.slice(1);
  }

  // ----- Enemy grid: battle clicks -----
  var eCells = enemyGrid.querySelectorAll('.cell');
  for (var ei = 0; ei < eCells.length; ei++) {
    (function (cell) {
      cell.addEventListener('mouseenter', function () {
        if (phase === 'battle' && !locked && !cell.classList.contains('hit') && !cell.classList.contains('miss') && !cell.classList.contains('sunk')) {
          SFX.hover();
        }
      });
      cell.addEventListener('click', function () {
        handleEnemyCellClick(cell);
      });
    })(eCells[ei]);
  }

  // ----- Centralised enemy cell click handler -----
  function handleEnemyCellClick(cell) {
    if (phase !== 'battle' || locked) return;
    if (kbMode && !kbFiring) { kbMode = false; updateCursor(); }
    var row = parseInt(cell.getAttribute('data-row'), 10);
    var col = parseInt(cell.getAttribute('data-col'), 10);
    if (cell.classList.contains('hit') || cell.classList.contains('miss') || cell.classList.contains('sunk')) return;

    // --- Weapon active? ---
    if (weaponsState && Weapons.isActive(weaponsState)) {
      locked = true;
      var activeType = weaponsState.active;

      if (activeType === 'torpedo') {
        // Torpedo needs direction — show picker
        pendingWeaponClick = { row: row, col: col };
        directionPickerEl.style.display = '';
        return;
      }
      // Airstrike and sonar execute immediately
      executeWeapon(row, col, null);
      return;
    }

    // --- Normal shot logic ---
    // In salvo mode, don't lock until all shots are fired
    if (selectedMode !== 'salvo') {
      locked = true;
    }

    playerShotCount++;

    var shot = Engine.processShot(enemyBoard, enemyShips, row, col);
    if (shot.alreadyFired) { if (selectedMode !== 'salvo') locked = false; playerShotCount--; return; }

    var coord = Engine.formatCoord(row, col);
    var _rect;

    if (shot.result === 'sunk') {
      SFX.sunk();
      var sunkShip = Engine.getShipAt(enemyShips, row, col);
      if (sunkShip) {
        for (var p = 0; p < sunkShip.positions.length; p++) {
          var sunkCell = getCell(enemyGrid, sunkShip.positions[p].row, sunkShip.positions[p].col);
          if (sunkCell) { sunkCell.classList.remove('hit', 'miss'); sunkCell.classList.add('sunk'); }
        }
        SFX.shipSinking();
        _rect = cell.getBoundingClientRect();
        Particles.sinking(_rect.left + _rect.width / 2, _rect.top + _rect.height / 2);
      }
      _rect = cell.getBoundingClientRect();
      Particles.debris(_rect.left + _rect.width / 2, _rect.top + _rect.height / 2);
      playerHitCount++;
      Stats.scoreHit();
      var sunkShipForScore = Engine.getShipAt(enemyShips, row, col);
      if (sunkShipForScore) Stats.scoreSink(sunkShipForScore.positions.length);
      updateScoreDisplay();
      setStatus("You sunk their " + shot.shipName + "!", 'sunk');
      addLog('You fired ' + coord + ' \u2014 SUNK ' + shot.shipName + '!', 'sunk');
    } else if (shot.result === 'hit') {
      SFX.hit();
      cell.classList.add('hit');
      _rect = cell.getBoundingClientRect();
      Particles.fire(_rect.left + _rect.width / 2, _rect.top + _rect.height / 2);
      setTimeout(function () {
        var r2 = cell.getBoundingClientRect();
        Particles.smoke(r2.left + r2.width / 2, r2.top + r2.height / 2);
      }, 200);
      playerHitCount++;
      Stats.scoreHit();
      updateScoreDisplay();
      setStatus("Hit at " + coord + "!", 'hit');
      addLog('You fired ' + coord + ' \u2014 HIT!', 'hit');
    } else {
      SFX.miss();
      cell.classList.add('miss');
      _rect = cell.getBoundingClientRect();
      Particles.splash(_rect.left + _rect.width / 2, _rect.top + _rect.height / 2);
      Particles.wake(_rect.left + _rect.width / 2, _rect.top + _rect.height / 2);
      Stats.scoreMiss();
      updateScoreDisplay();
      setStatus("Miss at " + coord, 'miss');
      addLog('You fired ' + coord + ' \u2014 miss', 'miss');
    }

    // Fog of War: reveal around the fired cell
    if (fogState) {
      FogOfWar.reveal(fogState, row, col);
      FogOfWar.applyFog(enemyGrid, fogState);
      SFX.fogReveal();
    }

    updateFleetStatus(enemyFleetList, enemyShips);

    if (Engine.isGameOver(enemyShips)) {
      phase = 'gameover';
      showGameOver(true);
      return;
    }

    // Salvo mode: decrement shots
    if (selectedMode === 'salvo') {
      salvoShotsRemaining--;
      if (salvoShotsRemaining > 0) {
        setStatus("Turn " + turnNumber + " \u2014 Shots remaining: " + salvoShotsRemaining);
        return;
      }
      locked = true;
      setTimeout(function () { doAISalvoTurn(); }, 600);
    } else {
      setTimeout(function () { doAITurn(); }, 600);
    }
  }

  // ----- AI turn (single shot) -----
  function doAITurn() {
    processAIShot();

    if (Engine.isGameOver(playerShips)) {
      phase = 'gameover';
      showGameOver(false);
      return;
    }

    turnNumber++;
    setTimeout(function () {
      beginPlayerTurn();
    }, 400);
  }

  // ----- AI salvo turn (multiple shots) -----
  function doAISalvoTurn() {
    var aiShots = currentMode ? currentMode.aiShotsPerTurn(enemyShips) : 1;
    var shotIndex = 0;

    function fireNext() {
      if (shotIndex >= aiShots || Engine.isGameOver(playerShips)) {
        if (Engine.isGameOver(playerShips)) {
          phase = 'gameover';
          showGameOver(false);
          return;
        }
        turnNumber++;
        setTimeout(function () {
          beginPlayerTurn();
        }, 400);
        return;
      }

      processAIShot();
      shotIndex++;

      if (Engine.isGameOver(playerShips)) {
        phase = 'gameover';
        showGameOver(false);
        return;
      }

      setTimeout(fireNext, 400);
    }

    fireNext();
  }

  // ----- Process single AI shot -----
  function processAIShot() {
    var target = AI.getShot(aiState);
    var shot = Engine.processShot(playerBoard, playerShips, target.row, target.col);
    AI.updateState(aiState, target.row, target.col, shot.result);
    enemyShotCount++;

    var coord = Engine.formatCoord(target.row, target.col);
    var cell = getCell(playerGrid, target.row, target.col);
    var _rect;

    if (shot.result === 'sunk') {
      SFX.sunk();
      var sunkShip = Engine.getShipAt(playerShips, target.row, target.col);
      if (sunkShip) {
        for (var p = 0; p < sunkShip.positions.length; p++) {
          var sunkCell = getCell(playerGrid, sunkShip.positions[p].row, sunkShip.positions[p].col);
          if (sunkCell) { sunkCell.classList.remove('ship', 'hit', 'miss'); sunkCell.classList.add('sunk'); }
        }
      }
      if (cell) {
        _rect = cell.getBoundingClientRect();
        Particles.debris(_rect.left + _rect.width / 2, _rect.top + _rect.height / 2);
      }
      setStatus("Enemy sunk your " + shot.shipName + "!", 'sunk');
      addLog('Enemy fired ' + coord + ' \u2014 SUNK your ' + shot.shipName + '!', 'sunk');
    } else if (shot.result === 'hit') {
      SFX.hit();
      if (cell) { cell.classList.remove('ship'); cell.classList.add('hit'); }
      if (cell) {
        _rect = cell.getBoundingClientRect();
        Particles.fire(_rect.left + _rect.width / 2, _rect.top + _rect.height / 2);
        setTimeout(function () {
          var r2 = cell.getBoundingClientRect();
          Particles.smoke(r2.left + r2.width / 2, r2.top + r2.height / 2);
        }, 200);
      }
      setStatus("Enemy hit your " + shot.shipName + "!", 'hit');
      addLog('Enemy fired ' + coord + ' \u2014 HIT your ' + shot.shipName + '!', 'hit');
    } else {
      SFX.miss();
      if (cell) cell.classList.add('miss');
      if (cell) {
        _rect = cell.getBoundingClientRect();
        Particles.splash(_rect.left + _rect.width / 2, _rect.top + _rect.height / 2);
        Particles.wake(_rect.left + _rect.width / 2, _rect.top + _rect.height / 2);
      }
      setStatus("Enemy missed at " + coord, 'miss');
      addLog('Enemy fired ' + coord + ' \u2014 miss', 'miss');
    }

    updateFleetStatus(playerFleetList, playerShips);
  }

  // ----- Pause / Resume -----
  function pauseGame() {
    if (phase !== 'battle') return;
    previousPhase = 'battle';
    phase = 'paused';
    pauseOverlay.style.display = 'flex';
  }

  function resumeGame() {
    if (phase !== 'paused') return;
    phase = previousPhase;
    pauseOverlay.style.display = 'none';
  }

  pauseBtn.addEventListener('click', function () {
    if (phase === 'battle') pauseGame();
  });

  resumeBtn.addEventListener('click', function () {
    if (phase === 'paused') resumeGame();
  });

  // ----- Game over -----
  function showGameOver(playerWon) {
    locked = true;
    pauseBtn.style.display = 'none';
    hideWeaponsPanel();

    // Fog of War: reveal all on game over
    if (fogState) {
      FogOfWar.revealAll(fogState);
      FogOfWar.applyFog(enemyGrid, fogState);
    }

    // Stop ambient audio
    SFX.stopAmbient();

    if (playerWon) {
      SFX.victory();
      overMsg.textContent = "Victory!";
      overBox.className = 'game-over-box victory';
    } else {
      SFX.defeat();
      overMsg.textContent = "Defeat!";
      overBox.className = 'game-over-box defeat';
    }

    var accuracy = playerShotCount > 0 ? Math.round((playerHitCount / playerShotCount) * 100) : 0;
    var scoreMultiplier = currentMode ? currentMode.scoreMultiplier : 1;
    var finalScore = Stats.scoreGameEnd(playerWon, accuracy, turnNumber);

    // Apply mode score multiplier
    if (scoreMultiplier !== 1) {
      // finalScore already computed, we note it in display
    }

    Stats.recordGame(playerWon, accuracy, playerShotCount, playerHitCount);
    updateStatsPanel();

    var enemySunk = 0;
    for (var i = 0; i < enemyShips.length; i++) { if (enemyShips[i].sunk) enemySunk++; }
    var playerSunk = 0;
    for (var j = 0; j < playerShips.length; j++) { if (playerShips[j].sunk) playerSunk++; }

    overStats.innerHTML =
      '<div class="stat-row"><span class="stat-label">Score</span><span class="stat-value" style="color:var(--signal-gold)">' + finalScore.toLocaleString() + '</span></div>' +
      '<div class="stat-row"><span class="stat-label">Mode</span><span class="stat-value">' + capitalize(selectedMode) + '</span></div>' +
      '<div class="stat-row"><span class="stat-label">Turns</span><span class="stat-value">' + turnNumber + '</span></div>' +
      '<div class="stat-row"><span class="stat-label">Your Shots</span><span class="stat-value">' + playerShotCount + '</span></div>' +
      '<div class="stat-row"><span class="stat-label">Accuracy</span><span class="stat-value">' + accuracy + '%</span></div>' +
      '<div class="stat-row"><span class="stat-label">Enemy Ships Sunk</span><span class="stat-value">' + enemySunk + '/5</span></div>' +
      '<div class="stat-row"><span class="stat-label">Your Ships Lost</span><span class="stat-value">' + playerSunk + '/5</span></div>' +
      '<div class="stat-row"><span class="stat-label">Difficulty</span><span class="stat-value">' + effectiveDifficultyLabel() + '</span></div>';

    // Check achievements
    checkAchievements(playerWon, accuracy, playerSunk);

    // Build buttons based on mode
    overButtons.innerHTML = '';

    if (selectedMode === 'campaign' && campaignState) {
      if (playerWon) {
        Modes.CAMPAIGN.campaign.advanceRound(campaignState, finalScore);
        if (Modes.CAMPAIGN.campaign.isComplete(campaignState)) {
          // Campaign victory
          overMsg.textContent = "Campaign Victory!";
          overStats.innerHTML += '<div class="stat-row"><span class="stat-label">Total Campaign Score</span><span class="stat-value" style="color:var(--signal-gold)">' + campaignState.totalScore.toLocaleString() + '</span></div>';
          var newGameBtn = createOverButton('New Campaign', function () { resetToModeSelect(); });
          overButtons.appendChild(newGameBtn);
        } else {
          var nextRound = Modes.CAMPAIGN.campaign.getCurrentRound(campaignState);
          overStats.innerHTML += '<div class="stat-row"><span class="stat-label">Next</span><span class="stat-value">' + (nextRound ? nextRound.title : '') + '</span></div>';
          var nextBtn = createOverButton('Next Round', function () { startCampaignRound(); });
          overButtons.appendChild(nextBtn);
          var abandonBtn = createOverButton('Abandon Campaign', function () { resetToModeSelect(); });
          abandonBtn.style.background = 'rgba(44,62,80,0.7)';
          abandonBtn.style.color = 'var(--text-primary)';
          abandonBtn.style.border = '1px solid var(--glass-border)';
          overButtons.appendChild(abandonBtn);
        }
      } else {
        Modes.CAMPAIGN.campaign.recordLoss(campaignState);
        var retryBtn = createOverButton('Retry Round', function () { startCampaignRound(); });
        overButtons.appendChild(retryBtn);
        var abandonBtn2 = createOverButton('Abandon Campaign', function () { resetToModeSelect(); });
        abandonBtn2.style.background = 'rgba(44,62,80,0.7)';
        abandonBtn2.style.color = 'var(--text-primary)';
        abandonBtn2.style.border = '1px solid var(--glass-border)';
        overButtons.appendChild(abandonBtn2);
      }
    } else {
      var playBtn = createOverButton('Play Again', function () { resetToModeSelect(); });
      overButtons.appendChild(playBtn);
    }

    overlay.classList.add('visible');

    // Reveal un-hit enemy ship positions
    for (var s = 0; s < enemyShips.length; s++) {
      var ship = enemyShips[s];
      for (var p = 0; p < ship.positions.length; p++) {
        var pos = ship.positions[p];
        if (enemyBoard[pos.row][pos.col] === 'ship') {
          var revealCell = getCell(enemyGrid, pos.row, pos.col);
          if (revealCell) revealCell.classList.add('revealed');
        }
      }
    }
  }

  function createOverButton(text, handler) {
    var btn = document.createElement('button');
    btn.textContent = text;
    btn.setAttribute('aria-label', text);
    btn.style.cssText = 'padding:0.75rem 2.5rem;font-size:1rem;font-weight:700;color:var(--ocean-abyss);background:linear-gradient(135deg,var(--signal-green),var(--signal-green-dark));border:none;border-radius:6px;cursor:pointer;text-transform:uppercase;letter-spacing:0.1em;font-family:inherit;transition:all 0.3s ease;margin-top:0.5rem;';
    btn.addEventListener('click', handler);
    return btn;
  }

  // ----- Campaign round start -----
  function startCampaignRound() {
    overlay.classList.remove('visible');

    var round = Modes.CAMPAIGN.campaign.getCurrentRound(campaignState);
    if (!round) {
      resetToModeSelect();
      return;
    }
    selectedDifficulty = round.difficulty;

    // Reset placement
    phase = 'placement';
    placementPanel.classList.remove('hidden');
    hideWeaponsPanel();
    resetPlacement();
    initDragPlacement();
    setStatus('Round ' + round.round + ': ' + round.title + ' \u2014 Place your ships!');
  }

  // ----- Achievement checking -----
  function checkAchievements(playerWon, accuracy, playerShipsLost) {
    var statsData = Stats.getStats();
    var gameState = {
      playerWon: playerWon,
      accuracy: accuracy,
      turns: turnNumber,
      playerShipsLost: playerShipsLost,
      enemyShipsSunk: 0,
      difficulty: selectedDifficulty,
      mode: selectedMode,
      winStreak: statsData.current_win_streak,
      gamesPlayed: statsData.games_played,
      campaignComplete: false
    };

    // Count enemy sunk
    for (var i = 0; i < enemyShips.length; i++) {
      if (enemyShips[i].sunk) gameState.enemyShipsSunk++;
    }

    // Campaign complete?
    if (selectedMode === 'campaign' && campaignState && Modes.CAMPAIGN.campaign.isComplete(campaignState)) {
      gameState.campaignComplete = true;
    }

    var newAchievements = Achievements.check(gameState);
    if (newAchievements.length > 0) {
      for (var a = 0; a < newAchievements.length; a++) {
        showAchievementToast(newAchievements[a]);
      }
      SFX.achievement();
    }

    updateAchievementsPanel();
  }

  function showAchievementToast(achievementKey) {
    var def = Achievements.getDefinition(achievementKey);
    if (!def) return;

    var toast = document.createElement('div');
    toast.style.cssText = 'pointer-events:auto;padding:0.8rem 1.2rem;background:var(--glass-bg);border:1px solid var(--signal-gold);border-radius:8px;backdrop-filter:blur(12px);-webkit-backdrop-filter:blur(12px);box-shadow:0 4px 20px rgba(241,196,15,0.3);display:flex;align-items:center;gap:0.6rem;animation:fadeIn 0.4s ease-out;max-width:300px;';
    toast.innerHTML = '<span style="font-size:1.5rem;">' + def.icon + '</span><div><div style="font-size:0.7rem;text-transform:uppercase;letter-spacing:0.1em;color:var(--signal-gold);font-weight:700;">Achievement Unlocked</div><div style="font-size:0.85rem;color:var(--text-primary);font-weight:600;">' + def.name + '</div></div>';
    achievementsToastArea.appendChild(toast);

    setTimeout(function () {
      toast.style.opacity = '0';
      toast.style.transition = 'opacity 0.4s ease';
      setTimeout(function () {
        if (toast.parentNode) toast.parentNode.removeChild(toast);
      }, 400);
    }, 4000);
  }

  function updateAchievementsPanel() {
    var allDefs = Achievements.getAll();
    var unlocked = Achievements.getUnlocked();
    var unlockedSet = {};
    for (var u = 0; u < unlocked.length; u++) {
      unlockedSet[unlocked[u]] = true;
    }

    achievementsList.innerHTML = '';
    for (var i = 0; i < allDefs.length; i++) {
      var def = allDefs[i];
      var isUnlocked = unlockedSet[def.key];
      var el = document.createElement('div');
      el.style.cssText = 'display:flex;align-items:center;gap:0.4rem;padding:0.4rem 0.6rem;background:' + (isUnlocked ? 'rgba(46,204,113,0.1)' : 'rgba(30,58,95,0.4)') + ';border:1px solid ' + (isUnlocked ? 'rgba(46,204,113,0.3)' : 'var(--glass-border)') + ';border-radius:6px;font-size:0.78rem;' + (isUnlocked ? '' : 'opacity:0.4;');
      el.title = def.description;
      el.innerHTML = '<span style="font-size:1.1rem;">' + def.icon + '</span><span style="color:var(--text-primary);font-weight:' + (isUnlocked ? '600' : '400') + ';">' + def.name + '</span>';
      achievementsList.appendChild(el);
    }
  }

  // Achievements panel toggle
  document.getElementById('achievements-panel-header').addEventListener('click', function () {
    var body = document.getElementById('achievements-panel-body');
    var arrow = this.querySelector('.stats-toggle-arrow');
    var isOpen = body.style.display !== 'none';
    body.style.display = isOpen ? 'none' : '';
    arrow.textContent = isOpen ? '\u25B6' : '\u25BC';
  });

  // ----- Stats UI helpers -----
  function updateScoreDisplay() {
    var el = document.getElementById('score-value');
    var container = document.getElementById('live-score');
    if (el) {
      el.textContent = Stats.getCurrentScore().toLocaleString();
      container.classList.remove('score-flash');
      void container.offsetWidth;
      container.classList.add('score-flash');
    }
  }

  function updateStatsPanel() {
    var s = Stats.getStats();
    var winRate = s.games_played > 0 ? Math.round((s.wins / s.games_played) * 100) : 0;
    document.getElementById('stat-games-played').textContent = s.games_played;
    document.getElementById('stat-win-rate').textContent = winRate + '%';
    document.getElementById('stat-best-accuracy').textContent = s.best_accuracy + '%';
    document.getElementById('stat-win-streak').textContent = s.best_win_streak;
    document.getElementById('stat-highest-score').textContent = s.highest_score.toLocaleString();
  }

  // Stats panel toggle
  document.getElementById('stats-panel-header').addEventListener('click', function () {
    var body = document.getElementById('stats-panel-body');
    var arrow = this.querySelector('.stats-toggle-arrow');
    var isOpen = body.style.display !== 'none';
    body.style.display = isOpen ? 'none' : '';
    arrow.textContent = isOpen ? '\u25B6' : '\u25BC';
  });

  // Reset stats button
  document.getElementById('reset-stats-btn').addEventListener('click', function () {
    if (confirm('Reset all career statistics? This cannot be undone.')) {
      Stats.reset();
      updateStatsPanel();
    }
  });

  // ----- Reset to mode select (Play Again) -----
  function resetToModeSelect() {
    overlay.classList.remove('visible');
    pauseBtn.style.display = 'none';
    phase = 'modeselect';
    locked = false;
    campaignState = null;
    salvoShotsRemaining = 0;
    salvoTurnActive = false;
    kbMode = false;
    kbRow = 0;
    kbCol = 0;
    weaponsState = null;
    fogState = null;
    pendingWeaponClick = null;
    hideWeaponsPanel();

    // Clear grids
    buildGrid(playerGrid);
    buildGrid(enemyGrid);

    // Re-attach cell listeners for player grid
    reattachPlayerGridListeners();
    reattachEnemyGridListeners();

    // Clear fleet status
    playerFleetList.innerHTML = '';
    enemyFleetList.innerHTML = '';

    // Clear log
    logEntries.innerHTML = '';

    // Hide placement panel
    placementPanel.classList.add('hidden');

    // Reset ship options
    for (var i = 0; i < shipOptions.length; i++) {
      shipOptions[i].classList.remove('placed', 'active');
    }
    if (shipOptions.length > 0) shipOptions[0].classList.add('active');

    // Hide score
    document.getElementById('live-score').style.display = 'none';

    // Show mode select screen
    modeSelectScreen.style.display = '';
    setStatus('Place your ships to begin');

    // Update mode card selection
    updateModeCardSelection();
  }

  function resetPlacement() {
    playerBoard = Engine.createBoard();
    playerShips = [];
    placedShips = {};
    currentShipIndex = 0;
    horizontal = true;
    rotateBtn.textContent = 'Rotate (R)';

    // Clear player grid visuals
    var allCells = playerGrid.querySelectorAll('.cell');
    for (var i = 0; i < allCells.length; i++) {
      allCells[i].classList.remove('ship', 'ship-bow-h', 'ship-bow-v', 'ship-hull-h', 'ship-hull-v', 'ship-stern-h', 'ship-stern-v', 'ship-carrier', 'ship-battleship', 'ship-cruiser', 'ship-submarine', 'ship-destroyer', 'hit', 'miss', 'sunk', 'revealed');
    }

    // Reset ship options
    for (var j = 0; j < shipOptions.length; j++) {
      shipOptions[j].classList.remove('placed', 'active');
    }
    if (shipOptions.length > 0) shipOptions[0].classList.add('active');
  }

  // Re-attach event listeners after grid rebuild
  function reattachPlayerGridListeners() {
    var cells = playerGrid.querySelectorAll('.cell');
    for (var i = 0; i < cells.length; i++) {
      (function (cell) {
        cell.addEventListener('mouseenter', function () {
          if (phase !== 'placement') return;
          showPreview(parseInt(cell.getAttribute('data-row'), 10), parseInt(cell.getAttribute('data-col'), 10));
        });
        cell.addEventListener('mouseleave', function () { if (phase === 'placement') clearPreview(); });
        cell.addEventListener('click', function () {
          if (phase !== 'placement') return;
          initSound();
          var def = currentShipDef();
          if (!def) return;
          var row = parseInt(cell.getAttribute('data-row'), 10);
          var col = parseInt(cell.getAttribute('data-col'), 10);
          var result = Engine.placeShip(playerBoard, playerShips, def.name, def.size, row, col, horizontal);
          if (result === null) return;
          clearPreview();
          SFX.place();
          applyShipClasses(playerGrid, playerShips[playerShips.length - 1]);
          placedShips[def.key] = true;
          markShipPlaced(currentShipIndex);
          var foundNext = false;
          for (var n = 0; n < shipDefs.length; n++) {
            if (!placedShips[shipDefs[n].key]) {
              currentShipIndex = n;
              selectShipOption(n);
              setStatus('Place your ' + shipDefs[n].name + ' (' + shipDefs[n].size + ' cells)');
              foundNext = true;
              break;
            }
          }
          if (!foundNext) startBattle();
        });
      })(cells[i]);
    }
  }

  function reattachEnemyGridListeners() {
    var cells = enemyGrid.querySelectorAll('.cell');
    for (var i = 0; i < cells.length; i++) {
      (function (cell) {
        cell.addEventListener('mouseenter', function () {
          if (phase === 'battle' && !locked && !cell.classList.contains('hit') && !cell.classList.contains('miss') && !cell.classList.contains('sunk')) {
            SFX.hover();
          }
        });
        cell.addEventListener('click', function () {
          handleEnemyCellClick(cell);
        });
      })(cells[i]);
    }
  }

  // ----- Tutorial integration -----
  function checkTutorial() {
    if (Tutorial.shouldShow()) {
      Tutorial.start(document.body);
    }
  }

  // ----- Init -----
  // Apply settings from persistence
  applySettings();

  // Load stats on page load
  Stats.load();
  updateStatsPanel();
  updateAchievementsPanel();

  // Initialize placement board (will be reset when entering placement)
  playerBoard = Engine.createBoard();
  playerShips = [];

  // Start in mode select phase
  phase = 'modeselect';
  placementPanel.classList.add('hidden');

  // Show tutorial if first time
  checkTutorial();
})();
