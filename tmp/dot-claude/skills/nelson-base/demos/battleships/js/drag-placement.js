(function () {
  'use strict';

  // ----- State -----
  var playerGrid = null;
  var placementPanel = null;
  var options = {};
  var ghost = null;
  var draggingShip = null;   // { key, name, size, element }
  var horizontal = true;
  var highlightedCells = [];
  var listeners = [];        // track listeners for cleanup
  var touchState = null;     // { ship, startX, startY, identifier }
  var initialized = false;

  // ----- Helpers -----
  function getCell(grid, row, col) {
    return grid.querySelector('.cell[data-row="' + row + '"][data-col="' + col + '"]');
  }

  function getCellSize() {
    var cell = playerGrid ? playerGrid.querySelector('.cell') : null;
    if (cell) {
      var rect = cell.getBoundingClientRect();
      return { w: rect.width, h: rect.height };
    }
    return { w: 40, h: 40 };
  }

  function getCellFromPoint(x, y) {
    var cells = playerGrid.querySelectorAll('.cell');
    for (var i = 0; i < cells.length; i++) {
      var rect = cells[i].getBoundingClientRect();
      if (x >= rect.left && x <= rect.right && y >= rect.top && y <= rect.bottom) {
        return {
          row: parseInt(cells[i].getAttribute('data-row'), 10),
          col: parseInt(cells[i].getAttribute('data-col'), 10),
          element: cells[i]
        };
      }
    }
    return null;
  }

  function addListener(el, event, handler, opts) {
    el.addEventListener(event, handler, opts || false);
    listeners.push({ el: el, event: event, handler: handler, opts: opts || false });
  }

  // ----- Ghost element -----
  function createGhost(size) {
    removeGhost();
    ghost = document.createElement('div');
    ghost.className = 'drag-ghost' + (horizontal ? '' : ' vertical');
    for (var i = 0; i < size; i++) {
      var cell = document.createElement('div');
      cell.className = 'drag-ghost-cell';
      ghost.appendChild(cell);
    }
    document.body.appendChild(ghost);
  }

  function updateGhostPosition(x, y) {
    if (!ghost) return;
    var cs = getCellSize();
    if (horizontal) {
      ghost.style.left = (x - cs.w / 2) + 'px';
      ghost.style.top = (y - cs.h / 2) + 'px';
    } else {
      ghost.style.left = (x - cs.w / 2) + 'px';
      ghost.style.top = (y - cs.h / 2) + 'px';
    }
  }

  function updateGhostOrientation() {
    if (!ghost) return;
    if (horizontal) {
      ghost.classList.remove('vertical');
    } else {
      ghost.classList.add('vertical');
    }
  }

  function removeGhost() {
    if (ghost && ghost.parentNode) {
      ghost.parentNode.removeChild(ghost);
    }
    ghost = null;
  }

  // ----- Drop zone highlighting -----
  function clearHighlights() {
    for (var i = 0; i < highlightedCells.length; i++) {
      highlightedCells[i].classList.remove('drop-valid', 'drop-invalid', 'drop-hover');
    }
    highlightedCells = [];
  }

  function showDropZone(row, col, size, horiz, hoverRow, hoverCol) {
    clearHighlights();
    if (!draggingShip) return;

    var canPlace = options.canPlace ? options.canPlace(size, row, col, horiz) : true;
    var cls = canPlace ? 'drop-valid' : 'drop-invalid';

    for (var i = 0; i < size; i++) {
      var r = horiz ? row : row + i;
      var c = horiz ? col + i : col;
      if (r < 0 || r >= 10 || c < 0 || c >= 10) continue;
      var el = getCell(playerGrid, r, c);
      if (el) {
        el.classList.add(cls);
        if (r === hoverRow && c === hoverCol) {
          el.classList.add('drop-hover');
        }
        highlightedCells.push(el);
      }
    }
  }

  // ----- HTML5 Drag & Drop -----
  function onDragStart(e) {
    var target = e.currentTarget;
    var shipKey = target.getAttribute('data-ship');
    var shipSize = parseInt(target.getAttribute('data-size'), 10);
    var shipName = target.textContent.replace(/\s*\(\d+\)\s*$/, '').trim();

    if (target.classList.contains('placed')) {
      e.preventDefault();
      return;
    }

    draggingShip = { key: shipKey, name: shipName, size: shipSize, element: target };

    // Read current orientation from the game
    if (options.getHorizontal) {
      horizontal = options.getHorizontal();
    }

    // Set drag data
    e.dataTransfer.effectAllowed = 'move';
    e.dataTransfer.setData('text/plain', shipKey);

    // Create invisible drag image (we use our own ghost)
    var img = document.createElement('div');
    img.style.width = '1px';
    img.style.height = '1px';
    img.style.opacity = '0.01';
    img.style.position = 'fixed';
    img.style.top = '-9999px';
    document.body.appendChild(img);
    e.dataTransfer.setDragImage(img, 0, 0);
    setTimeout(function () {
      if (img.parentNode) img.parentNode.removeChild(img);
    }, 0);

    target.classList.add('dragging');
    createGhost(shipSize);
    updateGhostPosition(e.clientX, e.clientY);
  }

  function onDrag(e) {
    if (!draggingShip || !ghost) return;
    // Some browsers fire drag with 0,0 at end
    if (e.clientX === 0 && e.clientY === 0) return;
    updateGhostPosition(e.clientX, e.clientY);

    var cellInfo = getCellFromPoint(e.clientX, e.clientY);
    if (cellInfo) {
      showDropZone(cellInfo.row, cellInfo.col, draggingShip.size, horizontal, cellInfo.row, cellInfo.col);
    } else {
      clearHighlights();
    }
  }

  function onDragEnd(e) {
    if (draggingShip && draggingShip.element) {
      draggingShip.element.classList.remove('dragging');
    }
    clearHighlights();
    removeGhost();
    draggingShip = null;
  }

  function onGridDragOver(e) {
    if (!draggingShip) return;
    e.preventDefault();
    e.dataTransfer.dropEffect = 'move';
  }

  function onGridDrop(e) {
    e.preventDefault();
    if (!draggingShip) return;

    var cellInfo = getCellFromPoint(e.clientX, e.clientY);
    if (!cellInfo) return;

    var canPlace = options.canPlace ? options.canPlace(draggingShip.size, cellInfo.row, cellInfo.col, horizontal) : true;
    if (canPlace && options.onPlace) {
      options.onPlace(draggingShip.key, draggingShip.name, draggingShip.size, cellInfo.row, cellInfo.col, horizontal);
    }

    clearHighlights();
    removeGhost();
    if (draggingShip && draggingShip.element) {
      draggingShip.element.classList.remove('dragging');
    }
    draggingShip = null;
  }

  // ----- Rotation during drag (keydown) -----
  function onKeyDown(e) {
    if (!draggingShip && !touchState) return;
    if (e.key === 'r' || e.key === 'R') {
      horizontal = !horizontal;
      updateGhostOrientation();
      if (options.onRotate) options.onRotate();
    }
  }

  // ----- Touch support -----
  function onTouchStart(e) {
    var target = e.currentTarget;
    if (target.classList.contains('placed')) return;

    var touch = e.touches[0];
    var shipKey = target.getAttribute('data-ship');
    var shipSize = parseInt(target.getAttribute('data-size'), 10);
    var shipName = target.textContent.replace(/\s*\(\d+\)\s*$/, '').trim();

    if (options.getHorizontal) {
      horizontal = options.getHorizontal();
    }

    touchState = {
      ship: { key: shipKey, name: shipName, size: shipSize, element: target },
      startX: touch.clientX,
      startY: touch.clientY,
      identifier: touch.identifier,
      dragging: false
    };
  }

  function onTouchMove(e) {
    if (!touchState) return;
    var touch = null;
    for (var i = 0; i < e.touches.length; i++) {
      if (e.touches[i].identifier === touchState.identifier) {
        touch = e.touches[i];
        break;
      }
    }
    if (!touch) return;

    var dx = touch.clientX - touchState.startX;
    var dy = touch.clientY - touchState.startY;

    // Start drag after small threshold
    if (!touchState.dragging && (Math.abs(dx) > 10 || Math.abs(dy) > 10)) {
      touchState.dragging = true;
      draggingShip = touchState.ship;
      touchState.ship.element.classList.add('dragging');
      createGhost(touchState.ship.size);
    }

    if (touchState.dragging) {
      e.preventDefault();
      updateGhostPosition(touch.clientX, touch.clientY);

      var cellInfo = getCellFromPoint(touch.clientX, touch.clientY);
      if (cellInfo) {
        showDropZone(cellInfo.row, cellInfo.col, draggingShip.size, horizontal, cellInfo.row, cellInfo.col);
      } else {
        clearHighlights();
      }
    }
  }

  function onTouchEnd(e) {
    if (!touchState) return;

    if (touchState.dragging && draggingShip) {
      // Find the last touch position from changedTouches
      var touch = null;
      for (var i = 0; i < e.changedTouches.length; i++) {
        if (e.changedTouches[i].identifier === touchState.identifier) {
          touch = e.changedTouches[i];
          break;
        }
      }

      if (touch) {
        var cellInfo = getCellFromPoint(touch.clientX, touch.clientY);
        if (cellInfo) {
          var canPlace = options.canPlace ? options.canPlace(draggingShip.size, cellInfo.row, cellInfo.col, horizontal) : true;
          if (canPlace && options.onPlace) {
            options.onPlace(draggingShip.key, draggingShip.name, draggingShip.size, cellInfo.row, cellInfo.col, horizontal);
          }
        }
      }

      draggingShip.element.classList.remove('dragging');
      clearHighlights();
      removeGhost();
      draggingShip = null;
    }

    touchState = null;
  }

  // ----- Right-click rotation during drag -----
  function onContextMenu(e) {
    if (draggingShip || touchState) {
      e.preventDefault();
      horizontal = !horizontal;
      updateGhostOrientation();
      if (options.onRotate) options.onRotate();
    }
  }

  // ----- Public API -----
  function init(grid, panel, opts) {
    if (initialized) destroy();

    playerGrid = grid;
    placementPanel = panel;
    options = opts || {};

    // Check for HTML5 drag-and-drop support
    var supportsDrag = ('draggable' in document.createElement('div'));

    var shipEls = panel.querySelectorAll('.ship-option');
    for (var i = 0; i < shipEls.length; i++) {
      var el = shipEls[i];

      if (el.classList.contains('placed')) continue;

      // Enable HTML5 drag
      if (supportsDrag) {
        el.setAttribute('draggable', 'true');
        addListener(el, 'dragstart', onDragStart);
        addListener(el, 'drag', onDrag);
        addListener(el, 'dragend', onDragEnd);
      }

      // Touch events for mobile
      addListener(el, 'touchstart', onTouchStart, { passive: true });
      addListener(el, 'touchmove', onTouchMove, { passive: false });
      addListener(el, 'touchend', onTouchEnd);
    }

    // Grid drop zone
    if (supportsDrag) {
      addListener(grid, 'dragover', onGridDragOver);
      addListener(grid, 'drop', onGridDrop);
    }

    // Rotation via keyboard
    addListener(document, 'keydown', onKeyDown);

    // Right-click rotation while dragging
    addListener(document, 'contextmenu', onContextMenu);

    initialized = true;
  }

  function setHorizontal(val) {
    horizontal = !!val;
    updateGhostOrientation();
  }

  function markPlaced(shipKey) {
    if (!placementPanel) return;
    var el = placementPanel.querySelector('.ship-option[data-ship="' + shipKey + '"]');
    if (el) {
      el.setAttribute('draggable', 'false');
      el.classList.remove('dragging');
    }
  }

  function reset() {
    if (!placementPanel) return;
    var shipEls = placementPanel.querySelectorAll('.ship-option');
    for (var i = 0; i < shipEls.length; i++) {
      shipEls[i].setAttribute('draggable', 'true');
      shipEls[i].classList.remove('dragging');
    }
    clearHighlights();
    removeGhost();
    draggingShip = null;
    touchState = null;
  }

  function destroy() {
    for (var i = 0; i < listeners.length; i++) {
      var l = listeners[i];
      l.el.removeEventListener(l.event, l.handler, l.opts);
    }
    listeners = [];
    clearHighlights();
    removeGhost();

    if (placementPanel) {
      var shipEls = placementPanel.querySelectorAll('.ship-option');
      for (var j = 0; j < shipEls.length; j++) {
        shipEls[j].removeAttribute('draggable');
        shipEls[j].classList.remove('dragging');
      }
    }

    playerGrid = null;
    placementPanel = null;
    options = {};
    draggingShip = null;
    touchState = null;
    initialized = false;
  }

  // ----- Expose -----
  window.DragPlacement = {
    init: init,
    setHorizontal: setHorizontal,
    markPlaced: markPlaced,
    reset: reset,
    destroy: destroy
  };
})();
