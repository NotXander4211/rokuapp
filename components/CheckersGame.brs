' ================================================================
'  Checkers game component
'  Uses image-based pieces, themed colours, and win effects.
' ================================================================

function init()
    m.top.setFocus(true)

    ' ── Node references ──
    m.gameBg        = m.top.findNode("gameBg")
    m.boardGroup    = m.top.findNode("boardGroup")
    m.piecesGroup   = m.top.findNode("piecesGroup")
    m.cursorNode    = m.top.findNode("cursor")
    m.selectionNode = m.top.findNode("selection")
    m.info          = m.top.findNode("info")
    m.gameTitle     = m.top.findNode("gameTitle")
    m.confettiGroup = m.top.findNode("confettiGroup")
    m.crownGroup    = m.top.findNode("crownGroup")

    ' ── Constants ──
    m.CELL       = 75
    m.PAD        = 10
    m.PIECE_SIZE = m.CELL - 2 * m.PAD

    ' ── Fonts ──
    m.gameTitle.font.size = 36
    m.info.font.size      = 20

    ' ── Default theme colours (Roku) ──
    m.themeBg         = "0x1A1A2EFF"
    m.themeText       = "0xFFFFFFFF"
    m.themeTextSec    = "0xBBBBBBFF"
    m.themeBoardLight = "0xDEB887FF"
    m.themeBoardDark  = "0x8B4513FF"
    m.themeCursor     = "0xFFD70066"
    m.themeSelection  = "0x00FF0066"
    m.themeAccent     = "0x662D91FF"
    m.themeWinColor   = "0x00FF00FF"

    ' ── Board state ──
    '   0 = empty
    '   1 = white piece   2 = white king
    '   3 = purple piece  4 = purple king
    m.board = []
    for r = 0 to 7
        row = []
        for c = 0 to 7
            row.Push(0)
        end for
        m.board.Push(row)
    end for

    ' ── Cursor / selection ──
    m.curRow         = 5
    m.curCol         = 0
    m.selRow         = -1
    m.selCol         = -1
    m.selected       = false
    m.jumpInProgress = false

    ' ── Turn: 1 = white, 3 = purple ──
    m.turn     = 1
    m.gameOver = false

    ' ── Effect bookkeeping ──
    m.confettiTimer     = invalid
    m.confettiParticles = []
    m.confettiTicks     = 0

    ' Profile defaults (overridden by onThemeChanged when devMode is on)
    m.devMode      = false
    m.p1Name       = "White"
    m.p2Name       = "Purple"
    m.p1Effect     = "Confetti"
    m.p2Effect     = "Confetti"
    m.winnerEffect = "Confetti"

    ' ── Build everything ──
    setupInitialBoard()
    drawSquares()
    refreshPieces()
    moveCursor()
end function

' ────────────────────────────────────────────────────────────
'  Theme change callback
' ────────────────────────────────────────────────────────────
sub onThemeChanged()
    theme = m.top.themeData
    if theme = invalid then return

    m.themeBg         = theme.bg
    m.themeText       = theme.text
    m.themeTextSec    = theme.textSec
    m.themeBoardLight = theme.boardLight
    m.themeBoardDark  = theme.boardDark
    m.themeCursor     = theme.cursorColor
    m.themeSelection  = theme.selection
    m.themeAccent     = theme.accent
    m.themeWinColor   = theme.winColor

    ' Dev mode: use profile names/effects; piece images are fixed so colors don't apply
    m.devMode = (theme.devMode = true)
    if m.devMode
        m.p1Name   = theme.p1.name
        m.p2Name   = theme.p2.name
        m.p1Effect = theme.p1.effect
        m.p2Effect = theme.p2.effect
    else
        m.p1Name   = "White"
        m.p2Name   = "Purple"
        m.p1Effect = m.top.winEffect
        m.p2Effect = m.top.winEffect
    end if

    ' Apply to existing nodes
    m.gameBg.color      = m.themeBg
    m.gameTitle.color   = m.themeText
    m.info.color        = m.themeTextSec
    m.cursorNode.color  = m.themeCursor
    if m.selected then m.selectionNode.color = m.themeSelection

    drawSquares()
    refreshPieces()
    updateInfo()
end sub

' ────────────────────────────────────────────────────────────
'  Initial piece placement
' ────────────────────────────────────────────────────────────
sub setupInitialBoard()
    for r = 0 to 7
        for c = 0 to 7
            if (r + c) mod 2 = 1
                if r <= 2
                    m.board[r][c] = 3   ' purple
                else if r >= 5
                    m.board[r][c] = 1   ' white
                else
                    m.board[r][c] = 0
                end if
            else
                m.board[r][c] = 0
            end if
        end for
    end for
end sub

' ────────────────────────────────────────────────────────────
'  Draw the 8x8 board squares
' ────────────────────────────────────────────────────────────
sub drawSquares()
    while m.boardGroup.getChildCount() > 0
        m.boardGroup.removeChildIndex(0)
    end while

    for r = 0 to 7
        for c = 0 to 7
            sq        = CreateObject("roSGNode", "Rectangle")
            sq.width  = m.CELL
            sq.height = m.CELL
            sq.translation = [c * m.CELL, r * m.CELL]
            if (r + c) mod 2 = 0
                sq.color = m.themeBoardLight
            else
                sq.color = m.themeBoardDark
            end if
            m.boardGroup.appendChild(sq)
        end for
    end for
end sub

' ────────────────────────────────────────────────────────────
'  Piece rendering (image-based)
' ────────────────────────────────────────────────────────────
sub refreshPieces()
    while m.piecesGroup.getChildCount() > 0
        m.piecesGroup.removeChildIndex(0)
    end while

    for r = 0 to 7
        for c = 0 to 7
            p = m.board[r][c]
            if p <> 0
                addPieceNode(r, c, p)
            end if
        end for
    end for
end sub

sub addPieceNode(r as Integer, c as Integer, piece as Integer)
    node        = CreateObject("roSGNode", "Poster")
    node.width  = m.PIECE_SIZE
    node.height = m.PIECE_SIZE
    node.translation = [c * m.CELL + m.PAD, r * m.CELL + m.PAD]

    if piece = 1
        node.uri = "pkg:/images/white_checker.png"
    else if piece = 2
        node.uri = "pkg:/images/white_checker_king.png"
    else if piece = 3
        node.uri = "pkg:/images/purple_checker.png"
    else if piece = 4
        node.uri = "pkg:/images/purple_checker_king.png"
    end if

    m.piecesGroup.appendChild(node)
end sub

' ────────────────────────────────────────────────────────────
'  Cursor helpers
' ────────────────────────────────────────────────────────────
sub moveCursor()
    m.cursorNode.translation = [m.curCol * m.CELL, m.curRow * m.CELL]
end sub

sub moveSelection()
    if m.selected
        m.selectionNode.translation = [m.selCol * m.CELL, m.selRow * m.CELL]
        m.selectionNode.color   = m.themeSelection
        m.selectionNode.visible = true
    else
        m.selectionNode.visible = false
    end if
end sub

' ────────────────────────────────────────────────────────────
'  Status text  (Purple / White)
' ────────────────────────────────────────────────────────────
sub updateInfo()
    if m.gameOver then return

    if m.turn = 1
        turnStr = m.p1Name
    else
        turnStr = m.p2Name
    end if

    if m.jumpInProgress
        m.info.text = turnStr + ": Continue jumping or OK to end  |  BACK = Home"
    else if m.selected
        m.info.text = turnStr + ": Move piece or OK to deselect  |  BACK = Home"
    else
        m.info.text = turnStr + "'s turn  |  OK = Select  |  BACK = Home"
    end if
end sub

' ────────────────────────────────────────────────────────────
'  Key handling
' ────────────────────────────────────────────────────────────
function onKeyEvent(key as String, press as Boolean) as Boolean
    if not press then return false

    if key = "back"
        cleanupEffects()
        m.top.exitGame = true
        return true
    end if

    if m.gameOver
        cleanupEffects()
        savedTheme  = m.top.themeData
        savedEffect = m.top.winEffect
        init()
        if savedTheme <> invalid
            m.top.themeData = savedTheme
        end if
        return true
    end if

    if key = "up" and m.curRow > 0
        m.curRow = m.curRow - 1
        moveCursor()
        return true
    else if key = "down" and m.curRow < 7
        m.curRow = m.curRow + 1
        moveCursor()
        return true
    else if key = "left" and m.curCol > 0
        m.curCol = m.curCol - 1
        moveCursor()
        return true
    else if key = "right" and m.curCol < 7
        m.curCol = m.curCol + 1
        moveCursor()
        return true
    else if key = "OK"
        handleOK()
        return true
    end if

    return false
end function

' ────────────────────────────────────────────────────────────
'  OK-press logic
' ────────────────────────────────────────────────────────────
sub handleOK()
    if m.selected
        ' Clicking the same piece
        if m.curRow = m.selRow and m.curCol = m.selCol
            if m.jumpInProgress
                endTurn()
            else
                deselect()
            end if
            return
        end if

        ' During multi-jump only captures are allowed
        if m.jumpInProgress
            result = tryCapture(m.selRow, m.selCol, m.curRow, m.curCol)
            if result
                if canJumpFrom(m.curRow, m.curCol)
                    m.selRow = m.curRow
                    m.selCol = m.curCol
                    moveSelection()
                    updateInfo()
                else
                    endTurn()
                end if
            else
                m.info.text = "Must jump or OK on piece to end turn!"
            end if
            return
        end if

        ' Normal move
        if trySimpleMove(m.selRow, m.selCol, m.curRow, m.curCol)
            endTurn()
            return
        end if

        ' Capture
        if tryCapture(m.selRow, m.selCol, m.curRow, m.curCol)
            if canJumpFrom(m.curRow, m.curCol)
                m.jumpInProgress = true
                m.selRow = m.curRow
                m.selCol = m.curCol
                moveSelection()
                updateInfo()
            else
                endTurn()
            end if
            return
        end if

        ' Re-select another own piece
        if isOwnPiece(m.board[m.curRow][m.curCol])
            m.selRow = m.curRow
            m.selCol = m.curCol
            moveSelection()
            updateInfo()
            return
        end if

        m.info.text = "Invalid move!"
    else
        ' Select a piece
        if isOwnPiece(m.board[m.curRow][m.curCol])
            m.selRow    = m.curRow
            m.selCol    = m.curCol
            m.selected  = true
            moveSelection()
            updateInfo()
        end if
    end if
end sub

sub deselect()
    m.selected       = false
    m.jumpInProgress = false
    m.selRow = -1
    m.selCol = -1
    moveSelection()
    updateInfo()
end sub

sub endTurn()
    deselect()
    if checkWin() then return
    if m.turn = 1
        m.turn = 3
    else
        m.turn = 1
    end if
    updateInfo()
end sub

' ────────────────────────────────────────────────────────────
'  Ownership check
' ────────────────────────────────────────────────────────────
function isOwnPiece(piece as Integer) as Boolean
    if m.turn = 1
        return (piece = 1 or piece = 2)
    else
        return (piece = 3 or piece = 4)
    end if
end function

' ────────────────────────────────────────────────────────────
'  Move helpers
' ────────────────────────────────────────────────────────────
function trySimpleMove(fR as Integer, fC as Integer, tR as Integer, tC as Integer) as Boolean
    if m.board[tR][tC] <> 0 then return false
    if (tR + tC) mod 2 <> 1 then return false

    dR    = tR - fR
    dC    = tC - fC
    piece = m.board[fR][fC]

    if iAbs(dR) <> 1 or iAbs(dC) <> 1 then return false
    if not isValidDirection(piece, dR) then return false

    m.board[tR][tC] = piece
    m.board[fR][fC] = 0
    promoteIfNeeded(tR, tC)
    refreshPieces()
    return true
end function

function tryCapture(fR as Integer, fC as Integer, tR as Integer, tC as Integer) as Boolean
    if m.board[tR][tC] <> 0 then return false
    if (tR + tC) mod 2 <> 1 then return false

    dR    = tR - fR
    dC    = tC - fC
    piece = m.board[fR][fC]

    if iAbs(dR) <> 2 or iAbs(dC) <> 2 then return false
    if not isValidDirection(piece, dR) then return false

    midR     = fR + dR / 2
    midC     = fC + dC / 2
    midPiece = m.board[midR][midC]

    if midPiece = 0 then return false
    if isOwnPiece(midPiece) then return false

    m.board[tR][tC]     = piece
    m.board[fR][fC]     = 0
    m.board[midR][midC] = 0
    promoteIfNeeded(tR, tC)
    refreshPieces()
    return true
end function

function isValidDirection(piece as Integer, dR as Integer) as Boolean
    if piece = 2 or piece = 4 then return true
    if piece = 1 and dR < 0 then return true
    if piece = 3 and dR > 0 then return true
    return false
end function

sub promoteIfNeeded(r as Integer, c as Integer)
    piece = m.board[r][c]
    if piece = 1 and r = 0
        m.board[r][c] = 2
    else if piece = 3 and r = 7
        m.board[r][c] = 4
    end if
end sub

function canJumpFrom(r as Integer, c as Integer) as Boolean
    piece = m.board[r][c]
    dirs  = [[-1, -1], [-1, 1], [1, -1], [1, 1]]

    for each d in dirs
        tR = r + 2 * d[0]
        tC = c + 2 * d[1]
        mR = r + d[0]
        mC = c + d[1]

        if tR >= 0 and tR <= 7 and tC >= 0 and tC <= 7
            if isValidDirection(piece, 2 * d[0])
                if m.board[tR][tC] = 0
                    midP = m.board[mR][mC]
                    if midP <> 0 and not isOwnPiece(midP)
                        return true
                    end if
                end if
            end if
        end if
    end for
    return false
end function

' ────────────────────────────────────────────────────────────
'  Win detection
' ────────────────────────────────────────────────────────────
function checkWin() as Boolean
    whiteCount  = 0
    purpleCount = 0
    for r = 0 to 7
        for c = 0 to 7
            p = m.board[r][c]
            if p = 1 or p = 2 then whiteCount  = whiteCount  + 1
            if p = 3 or p = 4 then purpleCount = purpleCount + 1
        end for
    end for

    winner = ""
    if purpleCount = 0
        winner = m.p1Name
        m.winnerEffect = m.p1Effect
    else if whiteCount = 0
        winner = m.p2Name
        m.winnerEffect = m.p2Effect
    end if

    if winner <> ""
        m.info.text = winner + " wins!  Press any key to restart"
        m.gameOver = true
        showWinEffect()
        return true
    end if
    return false
end function

' ════════════════════════════════════════════════════════════
'  WIN EFFECTS
' ════════════════════════════════════════════════════════════

sub showWinEffect()
    if m.winnerEffect = "Crown"
        showCrownEffect()
    else
        showConfettiEffect()
    end if
end sub

' ── Confetti ──────────────────────────────────────────────
sub showConfettiEffect()
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

' ── Crown popup ──────────────────────────────────────────
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
    winLabel.font.size    = 36
    m.crownGroup.appendChild(winLabel)
end sub

' ── Cleanup ──────────────────────────────────────────────
sub cleanupEffects()
    if m.confettiTimer <> invalid
        m.confettiTimer.control = "stop"
        m.confettiTimer = invalid
    end if

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
'  Utility
' ────────────────────────────────────────────────────────────
function iAbs(n as Integer) as Integer
    if n < 0 then return -n
    return n
end function
