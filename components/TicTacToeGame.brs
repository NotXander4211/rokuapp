' ================================================================
'  Tic-Tac-Toe game component
'  Themed colours and customisable win effects.
' ================================================================

function init()
    m.top.setFocus(true)

    ' ── Node references ──
    m.gameBg       = m.top.findNode("gameBg")
    m.cells        = []
    m.highlights   = []
    for i = 1 to 9
        m.cells.Push(m.top.findNode("cell" + i.ToStr()))
        m.highlights.Push(m.top.findNode("highlight" + i.ToStr()))
    end for
    m.info          = m.top.findNode("info")
    m.winLine       = m.top.findNode("winLine")
    m.winAnimation  = m.top.findNode("winAnimation")
    m.confettiGroup = m.top.findNode("confettiGroup")
    m.crownGroup    = m.top.findNode("crownGroup")

    ' Grid line references
    m.gridV1 = m.top.findNode("gridV1")
    m.gridV2 = m.top.findNode("gridV2")
    m.gridH1 = m.top.findNode("gridH1")
    m.gridH2 = m.top.findNode("gridH2")

    ' ── Default theme colours (Roku) ──
    m.themeText     = "0xFFFFFFFF"
    m.themeTextSec  = "0xCCCCCCFF"
    m.themeHighlight = "0xFFDD00FF"
    m.themePlayer1  = "0xFF6666FF"
    m.themePlayer2  = "0x6688FFFF"
    m.themeGridLine = "0x555577FF"
    m.themeWinColor = "0x00FF00FF"
    m.themeAccent   = "0x662D91FF"

    ' ── State ──
    m.board        = ["","","","","","","","",""]
    m.turn         = "X"
    m.gameOver     = false
    m.selectedCell = 4
    m.winningCombo = []

    ' Effect bookkeeping
    m.confettiTimer     = invalid
    m.confettiParticles = []
    m.confettiTicks     = 0

    ' Profile defaults (overridden by onThemeChanged when devMode is on)
    m.devMode      = false
    m.p1Name       = "X"
    m.p2Name       = "O"
    m.p1Effect     = "Confetti"
    m.p2Effect     = "Confetti"
    m.winnerEffect = "Confetti"

    ' ── Style cells ──
    for i = 0 to 8
        m.cells[i].font.size = 72
        m.cells[i].color     = m.themeText
    end for
    m.info.font.size = 24

    updateHighlight()
end function

' ────────────────────────────────────────────────────────────
'  Theme change callback
' ────────────────────────────────────────────────────────────
sub onThemeChanged()
    theme = m.top.themeData
    if theme = invalid then return

    m.themeText      = theme.text
    m.themeTextSec   = theme.textSec
    m.themeHighlight = theme.highlight
    m.themeGridLine  = theme.gridLine
    m.themeWinColor  = theme.winColor
    m.themeAccent    = theme.accent

    ' Dev mode: use profile names/colors; otherwise use theme defaults
    m.devMode = (theme.devMode = true)
    if m.devMode
        m.p1Name       = theme.p1.name
        m.p2Name       = theme.p2.name
        m.themePlayer1 = theme.p1.color
        m.themePlayer2 = theme.p2.color
        m.p1Effect     = theme.p1.effect
        m.p2Effect     = theme.p2.effect
    else
        m.p1Name       = "X"
        m.p2Name       = "O"
        m.themePlayer1 = theme.player1
        m.themePlayer2 = theme.player2
        m.p1Effect     = m.top.winEffect
        m.p2Effect     = m.top.winEffect
    end if

    ' Apply to nodes
    m.gameBg.color = theme.bg
    m.info.color   = m.themeText
    m.gridV1.color = m.themeGridLine
    m.gridV2.color = m.themeGridLine
    m.gridH1.color = m.themeGridLine
    m.gridH2.color = m.themeGridLine

    updateHighlightColors()
    renderBoard()
end sub

' ────────────────────────────────────────────────────────────
'  Update highlight border colours to match theme
' ────────────────────────────────────────────────────────────
sub updateHighlightColors()
    for i = 0 to 8
        group = m.highlights[i]
        for j = 0 to group.getChildCount() - 1
            child = group.getChild(j)
            child.color = m.themeHighlight
        end for
    end for
end sub

' ────────────────────────────────────────────────────────────
'  Remote input
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
        resetGame()
        return true
    end if

    if key = "up"
        if m.selectedCell > 2
            m.selectedCell = m.selectedCell - 3
            updateHighlight()
        end if
        return true
    else if key = "down"
        if m.selectedCell < 6
            m.selectedCell = m.selectedCell + 3
            updateHighlight()
        end if
        return true
    else if key = "left"
        if m.selectedCell mod 3 <> 0
            m.selectedCell = m.selectedCell - 1
            updateHighlight()
        end if
        return true
    else if key = "right"
        if m.selectedCell mod 3 <> 2
            m.selectedCell = m.selectedCell + 1
            updateHighlight()
        end if
        return true
    else if key = "OK"
        markCell(m.selectedCell)
        return true
    end if

    return false
end function

' ────────────────────────────────────────────────────────────
'  Rendering helpers
' ────────────────────────────────────────────────────────────
sub updateHighlight()
    for i = 0 to 8
        m.highlights[i].visible = false
    end for
    m.highlights[m.selectedCell].visible = true
end sub

sub renderBoard()
    for i = 0 to 8
        cellVal = m.board[i]
        if cellVal = ""
            m.cells[i].text  = ""
            m.cells[i].color = m.themeTextSec
        else
            m.cells[i].text = cellVal
            if cellVal = "X"
                m.cells[i].color = m.themePlayer1
            else
                m.cells[i].color = m.themePlayer2
            end if
        end if
    end for
    if not m.gameOver
        if m.turn = "X" then turnName = m.p1Name else turnName = m.p2Name
        m.info.text  = "Turn: " + turnName + "  |  Arrows + OK  |  BACK = Home"
        m.info.color = m.themeText
    end if
end sub

' ────────────────────────────────────────────────────────────
'  Game logic
' ────────────────────────────────────────────────────────────
sub markCell(idx as Integer)
    if m.gameOver then return
    if m.board[idx] <> ""
        if m.turn = "X" then turnName = m.p1Name else turnName = m.p2Name
        m.info.text = "Occupied!  Turn: " + turnName
        return
    end if

    m.board[idx] = m.turn
    renderBoard()

    if checkWin(m.turn)
        if m.turn = "X"
            winName = m.p1Name
            m.winnerEffect = m.p1Effect
        else
            winName = m.p2Name
            m.winnerEffect = m.p2Effect
        end if
        m.info.text = winName + " WINS!  Press any key to restart"
        m.gameOver = true
        for i = 0 to 8
            m.highlights[i].visible = false
        end for
        playWinAnimation()
        showWinEffect()
        return
    end if

    if isBoardFull()
        m.info.text = "DRAW!  Press any key to restart"
        m.gameOver = true
        for i = 0 to 8
            m.highlights[i].visible = false
        end for
        return
    end if

    if m.turn = "X" then m.turn = "O" else m.turn = "X"
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
        if m.board[c[0]] = p and m.board[c[1]] = p and m.board[c[2]] = p
            m.winningCombo = c
            return true
        end if
    end for
    return false
end function

' ────────────────────────────────────────────────────────────
'  Win line animation
' ────────────────────────────────────────────────────────────
sub playWinAnimation()
    if m.winningCombo.Count() = 0 then return

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

    startIdx  = m.winningCombo[0]
    endIdx    = m.winningCombo[2]
    startPos  = cellPositions[startIdx]
    endPos    = cellPositions[endIdx]
    startSize = cellSizes[startIdx]
    endSize   = cellSizes[endIdx]

    startX = startPos[0] + startSize[0] / 2
    startY = startPos[1] + startSize[1] / 2
    endX   = endPos[0]   + endSize[0]   / 2
    endY   = endPos[1]   + endSize[1]   / 2

    m.winLine.color = m.themeWinColor

    if startIdx = endIdx - 2 and startIdx mod 3 = 0
        ' Horizontal
        m.winLine.width       = 650
        m.winLine.height      = 8
        m.winLine.translation = [320, startY - 4]
    else if startIdx < 3 and endIdx > 5
        ' Vertical
        m.winLine.width       = 8
        m.winLine.height      = 450
        m.winLine.translation = [startX - 4, 140]
    else if startIdx = 0 and endIdx = 8
        ' Diagonal
        m.winLine.width       = 8
        m.winLine.height      = 500
        m.winLine.translation = [640, 90]
        m.winLine.rotation    = 0.637
    else if startIdx = 2 and endIdx = 6
        ' Anti-diagonal
        m.winLine.width       = 8
        m.winLine.height      = 500
        m.winLine.translation = [640, 90]
        m.winLine.rotation    = -0.637
    end if

    m.winLine.visible      = true
    m.winAnimation.control = "start"

    ' Highlight winning cells with accent colour
    for i = 0 to 2
        idx = m.winningCombo[i]
        m.cells[idx].color = m.themeAccent
    end for
end sub

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
'  Reset
' ────────────────────────────────────────────────────────────
sub resetGame()
    m.winLine.visible      = false
    m.winAnimation.control = "stop"
    savedTheme  = m.top.themeData
    savedEffect = m.top.winEffect
    init()
    if savedTheme <> invalid
        m.top.themeData = savedTheme
    end if
end sub
