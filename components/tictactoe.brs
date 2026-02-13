function init()
  m.top.setFocus(true)
  m.cells = []
  m.highlights = []
  m.cells.Push(m.top.findNode("cell1"))
  m.cells.Push(m.top.findNode("cell2"))
  m.cells.Push(m.top.findNode("cell3"))
  m.cells.Push(m.top.findNode("cell4"))
  m.cells.Push(m.top.findNode("cell5"))
  m.cells.Push(m.top.findNode("cell6"))
  m.cells.Push(m.top.findNode("cell7"))
  m.cells.Push(m.top.findNode("cell8"))
  m.cells.Push(m.top.findNode("cell9"))
  m.highlights.Push(m.top.findNode("highlight1"))
  m.highlights.Push(m.top.findNode("highlight2"))
  m.highlights.Push(m.top.findNode("highlight3"))
  m.highlights.Push(m.top.findNode("highlight4"))
  m.highlights.Push(m.top.findNode("highlight5"))
  m.highlights.Push(m.top.findNode("highlight6"))
  m.highlights.Push(m.top.findNode("highlight7"))
  m.highlights.Push(m.top.findNode("highlight8"))
  m.highlights.Push(m.top.findNode("highlight9"))
  m.info = m.top.findNode("info")
  m.winLine = m.top.findNode("winLine")
  m.winAnimation = m.top.findNode("winAnimation")
  m.board = ["","","","","","","",""]
  m.turn = "X"
  m.gameOver = false
  m.selectedCell = 4
  m.winningCombo = []
  for i = 0 to 8
    m.cells[i].font.size = 72
    m.cells[i].color = "0xFFFFFFFF"
  end for
  renderBoard()
  updateHighlight()
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
  if not press then return false
  if m.gameOver then
    init()
    return true
  end if
  if key = "up" then
    if m.selectedCell > 2 then
      m.selectedCell = m.selectedCell - 3
      updateHighlight()
    end if
    return true
  elseif key = "down" then
    if m.selectedCell < 6 then
      m.selectedCell = m.selectedCell + 3
      updateHighlight()
    end if
    return true
  elseif key = "left" then
    if m.selectedCell mod 3 <> 0 then
      m.selectedCell = m.selectedCell - 1
      updateHighlight()
    end if
    return true
  elseif key = "right" then
    if m.selectedCell mod 3 <> 2 then
      m.selectedCell = m.selectedCell + 1
      updateHighlight()
    end if
    return true
  elseif key = "OK" then
    markCell(m.selectedCell)
    return true
  elseif key = "back" then
    init()
    return true
  end if
  return false
end function

sub updateHighlight()
  for i = 0 to 8
    m.highlights[i].visible = false
  end for
  m.highlights[m.selectedCell].visible = true
end sub

sub renderBoard()
  for i = 0 to 8
    cellVal = m.board[i]
    if cellVal = "" then
      m.cells[i].text = ""
      m.cells[i].color = "0xAAAAAAFF"
    else
      m.cells[i].text = cellVal
      if cellVal = "X" then
        m.cells[i].color = "0xFF4444FF"
      else
        m.cells[i].color = "0x4444FFFF"
      end if
    end if
  end for
  if not m.gameOver then
    m.info.text = "Turn: " + m.turn + " | Arrows + OK"
  end if
end sub

sub markCell(idx as Integer)
  if m.gameOver then return
  if m.board[idx] <> "" then
    m.info.text = "Occupied! Turn: " + m.turn
    return
  end if
  m.board[idx] = m.turn
  renderBoard()
  if checkWin(m.turn) then
    m.info.text = m.turn + " WINS! Press any button"
    m.gameOver = true
    for i = 0 to 8
      m.highlights[i].visible = false
    end for
    playWinAnimation()
    return
  end if
  if isBoardFull() then
    m.info.text = "DRAW! Press any button"
    m.gameOver = true
    for i = 0 to 8
      m.highlights[i].visible = false
    end for
    return
  end if
  if m.turn = "X" then
    m.turn = "O"
  else
    m.turn = "X"
  end if
  renderBoard()
end sub

function isBoardFull() as Boolean
  for i = 0 to 8
    if m.board[i] = "" then return false
  end for
  return true
end function

function checkWin(p as String) as Boolean
  combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  for each c in combos
    if m.board[c[0]] = p and m.board[c[1]] = p and m.board[c[2]] = p then
      m.winningCombo = c
      return true
    end if
  end for
  return false
end function

sub playWinAnimation()
  if m.winningCombo.Count() = 0 then return
  
  ' Calculate line position and size based on winning combo
  cellPositions = [
    [320, 140], [537, 140], [754, 140],
    [320, 294], [537, 294], [754, 294],
    [320, 444], [537, 444], [754, 444]
  ]
  cellSizes = [
    [213, 150], [217, 150], [216, 150],
    [213, 150], [217, 150], [216, 150],
    [213, 146], [217, 146], [216, 146]
  ]
  
  start_idx = m.winningCombo[0]
  end_idx = m.winningCombo[2]
  
  startPos = cellPositions[start_idx]
  endPos = cellPositions[end_idx]
  startSize = cellSizes[start_idx]
  endSize = cellSizes[end_idx]
  
  ' Calculate center points
  startX = startPos[0] + startSize[0] / 2
  startY = startPos[1] + startSize[1] / 2
  endX = endPos[0] + endSize[0] / 2
  endY = endPos[1] + endSize[1] / 2
  
  ' Calculate line dimensions
  if start_idx = end_idx - 2 and start_idx mod 3 = 0 then
    ' Horizontal line
    m.winLine.width = 650
    m.winLine.height = 8
    m.winLine.translation = [320, startY - 4]
  else if start_idx < 3 and end_idx > 5 then
    ' Vertical line
    m.winLine.width = 8
    m.winLine.height = 450
    m.winLine.translation = [startX - 4, 140]
  else if start_idx = 0 and end_idx = 8 then
    ' Diagonal \ 
    m.winLine.width = 8
    m.winLine.height = 500
    m.winLine.translation = [640, 90]
    m.winLine.rotation = 0.637
  else if start_idx = 2 and end_idx = 6 then
    ' Diagonal /
    m.winLine.width = 8
    m.winLine.height = 500
    m.winLine.translation = [640, 90]
    m.winLine.rotation = -0.637
  end if
  
  m.winLine.visible = true
  
  ' Create pulsing animation
  m.winAnimation.control = "start"
  
  ' Animate winning cells
  for i = 0 to 2
    idx = m.winningCombo[i]
    originalColor = m.cells[idx].color
    animateWinningCell(idx)
  end for
end sub

sub animateWinningCell(idx as Integer)
  ' Create a pulsing effect by manipulating the cell color
  m.cells[idx].color = "0xFFFF00FF"
end sub
