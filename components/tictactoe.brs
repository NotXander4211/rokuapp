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
  m.board = ["","","","","","","","",""]
  m.turn = "X"
  m.gameOver = false
  m.selectedCell = 4
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
      return true
    end if
  end for
  return false
end function
