function init()
    m.top.setFocus(true)

    ' Node references
    m.gameBg        = m.top.findNode("gameBg")
    m.info          = m.top.findNode("info")
    m.boardBg       = m.top.findNode("boardBg")
    m.boardGroup    = m.top.findNode("boardGroup")
    m.cellsGroup    = m.top.findNode("cellsGroup")
    m.cursorGroup   = m.top.findNode("cursorGroup")
    m.cursorIcon    = m.top.findNode("cursorIcon")
    m.winLabel      = m.top.findNode("winLabel")
    m.confettiGroup = m.top.findNode("confettiGroup")
    m.crownGroup    = m.top.findNode("crownGroup")

    ' Hide effects initially
    m.confettiGroup.visible = false
    m.crownGroup.visible    = false

    ' Default theme / palette (forced purple/teal)
    m.themeText      = "0xFFFFFFFF"
    m.themePlayer1   = "0x007EA7FF" ' dark blue
    m.themePlayer2   = "0x80CED7FF" ' light blue
    m.themeBg        = "0x1A1A2EFF"
    m.themeBoard     = "0x3333A0FF"
    m.themeHighlight = "0xFFDD00FF"
    m.themeWinColor  = "0x00FF00FF"
    m.player1Name  = "Dark Blue"
    m.player2Name  = "Light Blue"

    ' Profile defaults
    m.devMode      = false
    m.p1Effect     = "Confetti"
    m.p2Effect     = "Confetti"
    m.winnerEffect = "Confetti"

    m.info.font     = NewFont("pkg:/fonts/Audiowide-Regular.ttf", 36)
    m.winLabel.font = NewFont("pkg:/fonts/Audiowide-Regular.ttf", 48)
    m.top.findNode("footer").font = NewFont("pkg:/fonts/ChakraPetch-Regular.ttf", 18)

    ' Game State
    m.cols = 7
    m.rows = 6
    m.cellSize = 80
    m.padding = 10
    m.board = []
    m.pieceNodes = []
    m.confettiTimer = invalid
    m.confettiParticles = []
    m.confettiTicks = 0
    m.dropTimer = invalid
    m.dropNode = invalid
    m.isDropping = false
    m.dropTargetY = 0
    m.dropCol = 0
    m.dropRow = 0
    m.dropPlayer = 1

    ' Build empty board model
    for r = 0 to m.rows - 1
        rowArr = []
        for c = 0 to m.cols - 1
            rowArr.Push(0)
        end for
        m.board.Push(rowArr)
    end for

    ' Create piece nodes (visual grid)
    for r = 0 to m.rows - 1
        for c = 0 to m.cols - 1
            rect = CreateObject("roSGNode", "Rectangle")
            rect.width = m.cellSize - (m.padding * 2)
            rect.height = m.cellSize - (m.padding * 2)
            rect.translation = [c * m.cellSize + m.padding, r * m.cellSize + m.padding]
            rect.color = "0x111133FF" ' Empty slot color
            m.cellsGroup.appendChild(rect)
            m.pieceNodes.Push(rect)
        end for
    end for

    m.selectedCol = 3
    m.turn = 1
    m.gameOver = false
    m.winLabel.visible = false

    updateCursor()
end function

sub onThemeChanged()
    theme = m.top.themeData
    if theme = invalid then return

    m.themeText      = theme.text
    m.themeBg        = theme.bg
    m.themeBoard     = theme.gridLine
    m.themeHighlight = theme.highlight
    m.themeWinColor  = theme.winColor

    ' Dev mode: use profile names/colors; otherwise default purple/teal palette
    m.devMode = (theme.devMode = true)
    if m.devMode
        m.player1Name  = theme.p1.name
        m.player2Name  = theme.p2.name
        m.themePlayer1 = theme.p1.color
        m.themePlayer2 = theme.p2.color
        m.p1Effect     = theme.p1.effect
        m.p2Effect     = theme.p2.effect
    else
        m.player1Name  = "Dark Blue"
        m.player2Name  = "Light Blue"
        m.themePlayer1 = "0x007EA7FF"
        m.themePlayer2 = "0x80CED7FF"
        m.p1Effect     = m.top.winEffect
        m.p2Effect     = m.top.winEffect
    end if

    m.gameBg.color     = m.themeBg
    m.info.color       = m.themeText
    m.boardBg.color    = m.themeBoard
    m.cursorIcon.color = m.themeHighlight
    m.winLabel.color   = m.themeWinColor

    refreshBoard()
    updateInfo()
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if not press then return false

    if key = "back"
        cleanupEffects()
        m.top.exitGame = true
        return true
    end if

    if m.gameOver
        if key = "OK"
            resetGame()
        end if
        return true
    end if

    ' Block input while a piece is animating down
    if m.isDropping then return true

    if key = "left"
        if m.selectedCol > 0
            m.selectedCol = m.selectedCol - 1
            updateCursor()
        end if
        return true
    else if key = "right"
        if m.selectedCol < m.cols - 1
            m.selectedCol = m.selectedCol + 1
            updateCursor()
        end if
        return true
    else if key = "OK"
        dropPiece()
        return true
    end if

    return false
end function

sub updateCursor()
    m.cursorGroup.translation = [360 + m.selectedCol * m.cellSize, 85]
end sub

sub updateInfo()
    if m.turn = 1
        m.info.text = m.player1Name + "'s Turn"
        m.info.color = m.themePlayer1
        m.cursorIcon.color = m.themePlayer1
    else
        m.info.text = m.player2Name + "'s Turn"
        m.info.color = m.themePlayer2
        m.cursorIcon.color = m.themePlayer2
    end if
end sub

sub refreshBoard()
    for r = 0 to m.rows - 1
        for c = 0 to m.cols - 1
            idx = r * m.cols + c
            val = m.board[r][c]
            if val = 1
                m.pieceNodes[idx].color = m.themePlayer1
            else if val = 2
                m.pieceNodes[idx].color = m.themePlayer2
            else
                m.pieceNodes[idx].color = "0x111133FF"
            end if
        end for
    end for
end sub

sub dropPiece()
    c = m.selectedCol
    ' Find lowest empty row (highest index)
    placedRow = -1
    for r = m.rows - 1 to 0 step -1
        if m.board[r][c] = 0
            placedRow = r
            exit for
        end if
    end for

    if placedRow = -1 then return ' Column full

    ' Animate falling piece instead of snapping
    startDropAnimation(placedRow, c, m.turn)
end sub

function checkWin(r as Integer, c as Integer, player as Integer) as Boolean
    dirs = [
        [0, 1],  ' horizontal
        [1, 0],  ' vertical
        [1, 1],  ' diagonal /
        [1, -1]  ' diagonal \
    ]

    for each dir in dirs
        count = 1
        
        ' Go forward
        currR = r + dir[0]
        currC = c + dir[1]
        while currR >= 0 and currR < m.rows and currC >= 0 and currC < m.cols and m.board[currR][currC] = player
            count++
            currR = currR + dir[0]
            currC = currC + dir[1]
        end while
        
        ' Go backward
        currR = r - dir[0]
        currC = c - dir[1]
        while currR >= 0 and currR < m.rows and currC >= 0 and currC < m.cols and m.board[currR][currC] = player
            count++
            currR = currR - dir[0]
            currC = currC - dir[1]
        end while

        if count >= 4 then return true
    end for

    return false
end function

function isBoardFull() as Boolean
    for c = 0 to m.cols - 1
        if m.board[0][c] = 0 then return false
    end for
    return true
end function

' Animate a piece falling into place
sub startDropAnimation(row as Integer, col as Integer, player as Integer)
    ' Prevent concurrent drops
    m.isDropping = true
    m.dropRow    = row
    m.dropCol    = col
    m.dropPlayer = player

    ' Clear any prior drop
    if m.dropTimer <> invalid
        m.dropTimer.control = "stop"
    end if
    if m.dropNode <> invalid and m.dropNode.getParent() <> invalid
        m.dropNode.getParent().removeChild(m.dropNode)
    end if

    ' Create a temporary falling piece inside boardGroup coordinates
    piece = CreateObject("roSGNode", "Rectangle")
    piece.width  = m.cellSize - (m.padding * 2)
    piece.height = m.cellSize - (m.padding * 2)
    if player = 1 then
        piece.color = m.themePlayer1
    else
        piece.color = m.themePlayer2
    end if
    startX = col * m.cellSize + m.padding
    startY = -m.cellSize ' start just above the board
    piece.translation = [startX, startY]
    m.boardGroup.appendChild(piece)

    m.dropNode   = piece
    m.dropVy     = 0.0
    m.dropGravity = 6.0
    m.dropTargetY = row * m.cellSize + m.padding

    m.dropTimer = CreateObject("roSGNode", "Timer")
    m.dropTimer.duration = 0.02
    m.dropTimer.repeat   = true
    m.dropTimer.observeField("fire", "onDropTick")
    m.dropTimer.control  = "start"
end sub

sub onDropTick()
    if m.dropNode = invalid then return

    m.dropVy = m.dropVy + m.dropGravity
    newY = m.dropNode.translation[1] + m.dropVy
    if newY >= m.dropTargetY
        newY = m.dropTargetY
    end if
    m.dropNode.translation = [m.dropNode.translation[0], newY]

    ' Landed
    if newY = m.dropTargetY
        m.dropTimer.control = "stop"
        m.dropTimer = invalid

        ' Commit board state and remove temp node
        m.board[m.dropRow][m.dropCol] = m.dropPlayer
        if m.dropNode.getParent() <> invalid
            m.boardGroup.removeChild(m.dropNode)
        end if
        m.dropNode = invalid
        m.isDropping = false

        refreshBoard()
        finalizePlacement(m.dropRow, m.dropCol, m.dropPlayer)
    end if
end sub

sub finalizePlacement(row as Integer, col as Integer, player as Integer)
    if checkWin(row, col, player)
        m.gameOver = true
        if player = 2
            winnerName = m.player2Name
            m.winnerEffect = m.p2Effect
        else
            winnerName = m.player1Name
            m.winnerEffect = m.p1Effect
        end if
        m.info.text = winnerName + " Wins!"
        m.info.color = m.themeWinColor
        m.winLabel.text = "Press OK to play again"
        m.winLabel.visible = true
        showWinEffect()
        return
    end if

    if isBoardFull()
        m.gameOver = true
        m.info.text = "It's a Draw!"
        m.info.color = m.themeText
        m.winLabel.text = "Press OK to play again"
        m.winLabel.visible = true
        return
    end if

    ' Next turn
    m.turn = 3 - player
    updateInfo()
end sub

sub resetGame()
    cleanupEffects()

    if m.dropTimer <> invalid
        m.dropTimer.control = "stop"
        m.dropTimer = invalid
    end if
    if m.dropNode <> invalid and m.dropNode.getParent() <> invalid
        m.dropNode.getParent().removeChild(m.dropNode)
    end if
    m.dropNode = invalid
    m.isDropping = false

    for r = 0 to m.rows - 1
        for c = 0 to m.cols - 1
            m.board[r][c] = 0
        end for
    end for

    m.gameOver = false
    m.turn = 1
    m.winLabel.visible = false
    m.info.color = m.themePlayer1
    m.selectedCol = 3
    updateCursor()

    refreshBoard()
    updateInfo()
end sub

sub showWinEffect()
    if m.winnerEffect = "Crown"
        showCrownEffect()
    else
        showConfettiEffect()
    end if
end sub

sub showConfettiEffect()
    if m.confettiTimer <> invalid
        m.confettiTimer.control = "stop"
    end if

    while m.confettiGroup.getChildCount() > 0
        m.confettiGroup.removeChildIndex(0)
    end while

    m.confettiGroup.visible = true
    m.confettiParticles = []
    colors = ["0xFF4444FF", "0x44FF44FF", "0x4444FFFF", "0xFFFF44FF", "0xFF44FFFF", "0x44FFFFFF", "0xFF8800FF", "0x662D91FF", "0xFF6699FF", "0x00FF99FF"]

    for i = 0 to 59
        p        = CreateObject("roSGNode", "Rectangle")
        w        = 8 + (i mod 6) * 3
        h        = 5 + ((i + 2) mod 5) * 3
        p.width  = w
        p.height = h
        p.color  = colors[i mod colors.Count()]
        p.opacity = 0.95
        startX   = 30 + (i * 20) mod 1220
        startY   = -(i * 17 mod 300) - 10
        p.translation = [startX, startY]
        m.confettiGroup.appendChild(p)

        pd      = {}
        pd.node = p
        pd.x    = startX
        pd.y    = startY
        pd.vy   = 6.0 + (i mod 7) * 1.5
        pd.vx   = -2.5 + (i mod 6) * 1.0
        pd.wa   = (i mod 10) * 0.628
        pd.ws   = 0.08 + (i mod 4) * 0.02
        pd.wamp = 1.5 + (i mod 3) * 0.8
        pd.rot  = 0
        pd.vr   = 0.05 + (i mod 5) * 0.03
        m.confettiParticles.Push(pd)
    end for

    m.confettiTimer = CreateObject("roSGNode", "Timer")
    m.confettiTimer.duration = 0.04
    m.confettiTimer.repeat   = true
    m.confettiTimer.observeField("fire", "onConfettiTick")
    m.confettiTimer.control  = "start"
    m.confettiTicks = 0
end sub

sub onConfettiTick()
    m.confettiTicks = m.confettiTicks + 1
    for each p in m.confettiParticles
        p.wa  = p.wa + p.ws
        p.y   = p.y + p.vy
        p.x   = p.x + p.vx + Sin(p.wa) * p.wamp
        p.rot = p.rot + p.vr
        p.node.translation = [p.x, p.y]
        p.node.rotation    = p.rot
        if p.y > 750
            p.y = -20
            p.x = 30 + Rnd(1220)
        end if
    end for
    if m.confettiTicks > 200
        m.confettiTimer.control = "stop"
        m.confettiTimer = invalid
        while m.confettiGroup.getChildCount() > 0
            m.confettiGroup.removeChildIndex(0)
        end while
        m.confettiGroup.visible = false
    end if
end sub

sub showCrownEffect()
    m.crownGroup.visible = true

    ' Dark overlay
    overlay        = CreateObject("roSGNode", "Rectangle")
    overlay.width  = 1280
    overlay.height = 720
    overlay.color  = "0x00000099"
    m.crownGroup.appendChild(overlay)

    ' Gold card
    card        = CreateObject("roSGNode", "Rectangle")
    card.width  = 320
    card.height = 260
    card.translation = [480, 230]
    card.color  = "0xFFD700FF"
    m.crownGroup.appendChild(card)

    ' Inner card
    inner        = CreateObject("roSGNode", "Rectangle")
    inner.width  = 300
    inner.height = 240
    inner.translation = [490, 240]
    inner.color  = "0xFFF8E1FF"
    m.crownGroup.appendChild(inner)

    ' Crown shape - base
    crBase        = CreateObject("roSGNode", "Rectangle")
    crBase.width  = 160
    crBase.height = 25
    crBase.translation = [560, 355]
    crBase.color  = "0xFFD700FF"
    m.crownGroup.appendChild(crBase)

    ' Crown shape - band
    crBand        = CreateObject("roSGNode", "Rectangle")
    crBand.width  = 160
    crBand.height = 30
    crBand.translation = [560, 325]
    crBand.color  = "0xFFD700FF"
    m.crownGroup.appendChild(crBand)

    ' Crown points
    crPtL        = CreateObject("roSGNode", "Rectangle")
    crPtL.width  = 22
    crPtL.height = 40
    crPtL.translation = [573, 285]
    crPtL.color  = "0xFFD700FF"
    m.crownGroup.appendChild(crPtL)

    crPtC        = CreateObject("roSGNode", "Rectangle")
    crPtC.width  = 22
    crPtC.height = 50
    crPtC.translation = [629, 275]
    crPtC.color  = "0xFFD700FF"
    m.crownGroup.appendChild(crPtC)

    crPtR        = CreateObject("roSGNode", "Rectangle")
    crPtR.width  = 22
    crPtR.height = 40
    crPtR.translation = [685, 285]
    crPtR.color  = "0xFFD700FF"
    m.crownGroup.appendChild(crPtR)

    ' Jewels on band
    j1        = CreateObject("roSGNode", "Rectangle")
    j1.width  = 10
    j1.height = 10
    j1.translation = [588, 335]
    j1.color  = "0xFF0000FF"
    m.crownGroup.appendChild(j1)

    j2        = CreateObject("roSGNode", "Rectangle")
    j2.width  = 10
    j2.height = 10
    j2.translation = [635, 335]
    j2.color  = "0x0044FFFF"
    m.crownGroup.appendChild(j2)

    j3        = CreateObject("roSGNode", "Rectangle")
    j3.width  = 10
    j3.height = 10
    j3.translation = [682, 335]
    j3.color  = "0xFF0000FF"
    m.crownGroup.appendChild(j3)

    ' "WINNER!" label
    winLabel              = CreateObject("roSGNode", "Label")
    winLabel.text         = "WINNER!"
    winLabel.width        = 300
    winLabel.height       = 50
    winLabel.translation  = [490, 400]
    winLabel.horizAlign   = "center"
    winLabel.vertAlign    = "center"
    winLabel.color        = "0xB8860BFF"
    winLabel.font         = NewFont("pkg:/fonts/Audiowide-Regular.ttf", 36)
    m.crownGroup.appendChild(winLabel)
end sub

sub cleanupEffects()
    if m.confettiTimer <> invalid
        m.confettiTimer.control = "stop"
        m.confettiTimer = invalid
    end if

    if m.dropTimer <> invalid
        m.dropTimer.control = "stop"
        m.dropTimer = invalid
    end if
    if m.dropNode <> invalid and m.dropNode.getParent() <> invalid
        m.dropNode.getParent().removeChild(m.dropNode)
    end if
    m.dropNode = invalid
    m.isDropping = false

    while m.confettiGroup.getChildCount() > 0
        m.confettiGroup.removeChildIndex(0)
    end while
    m.confettiGroup.visible = false

    while m.crownGroup.getChildCount() > 0
        m.crownGroup.removeChildIndex(0)
    end while
    m.crownGroup.visible = false
end sub

' ────────────────────────────────────────────────────────────
'  Build a Font node from a packaged TrueType file + size.
' ────────────────────────────────────────────────────────────
function NewFont(uri as string, size as integer) as object
    f = createObject("roSGNode", "Font")
    f.uri  = uri
    f.size = size
    return f
end function
