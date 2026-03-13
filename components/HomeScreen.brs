function init()
    m.top.setFocus(true)
    m.top.backgroundURI = ""
    m.top.backgroundColor = "0x1A1A2EFF"

    ' ── Node references ──
    m.menuGroup     = m.top.findNode("menuGroup")
    m.gameContainer = m.top.findNode("gameContainer")
    m.menuBg        = m.top.findNode("menuBg")
    m.title         = m.top.findNode("title")
    m.subtitle      = m.top.findNode("subtitle")
    m.footer        = m.top.findNode("footer")
    m.menuDivider   = m.top.findNode("menuDivider")

    ' Card backgrounds & accents
    m.cardTicBg         = m.top.findNode("cardTicBg")
    m.cardCheckersBg    = m.top.findNode("cardCheckersBg")
    m.cardConnect4Bg    = m.top.findNode("cardConnect4Bg")
    m.cardTicAccent     = m.top.findNode("cardTicAccent")
    m.cardCheckersAccent = m.top.findNode("cardCheckersAccent")
    m.cardConnect4Accent = m.top.findNode("cardConnect4Accent")
    m.cardTicTitle      = m.top.findNode("cardTicTitle")
    m.cardTicDesc       = m.top.findNode("cardTicDesc")
    m.cardCheckersTitle = m.top.findNode("cardCheckersTitle")
    m.cardCheckersDesc  = m.top.findNode("cardCheckersDesc")
    m.cardConnect4Title = m.top.findNode("cardConnect4Title")
    m.cardConnect4Desc  = m.top.findNode("cardConnect4Desc")

    ' Focus borders - Tic-Tac-Toe
    m.focusTicTop    = m.top.findNode("focusTicTop")
    m.focusTicBottom = m.top.findNode("focusTicBottom")
    m.focusTicLeft   = m.top.findNode("focusTicLeft")
    m.focusTicRight  = m.top.findNode("focusTicRight")

    ' Focus borders - Checkers
    m.focusCheckersTop    = m.top.findNode("focusCheckersTop")
    m.focusCheckersBottom = m.top.findNode("focusCheckersBottom")
    m.focusCheckersLeft   = m.top.findNode("focusCheckersLeft")
    m.focusCheckersRight  = m.top.findNode("focusCheckersRight")

    ' Focus borders - Connect 4
    m.focusConnect4Top    = m.top.findNode("focusConnect4Top")
    m.focusConnect4Bottom = m.top.findNode("focusConnect4Bottom")
    m.focusConnect4Left   = m.top.findNode("focusConnect4Left")
    m.focusConnect4Right  = m.top.findNode("focusConnect4Right")

    ' Theme selector
    m.themeSelectorBg    = m.top.findNode("themeSelectorBg")
    m.themeSelectorLabel = m.top.findNode("themeSelectorLabel")
    m.themeValueLabel    = m.top.findNode("themeValueLabel")
    m.themeArrowL        = m.top.findNode("themeArrowL")
    m.themeArrowR        = m.top.findNode("themeArrowR")
    m.themeBorderTop     = m.top.findNode("themeBorderTop")
    m.themeBorderBot     = m.top.findNode("themeBorderBot")
    m.themeBorderLeft    = m.top.findNode("themeBorderLeft")
    m.themeBorderRight   = m.top.findNode("themeBorderRight")

    ' Effect selector
    m.effectSelectorBg    = m.top.findNode("effectSelectorBg")
    m.effectSelectorLabel = m.top.findNode("effectSelectorLabel")
    m.effectValueLabel    = m.top.findNode("effectValueLabel")
    m.effectArrowL        = m.top.findNode("effectArrowL")
    m.effectArrowR        = m.top.findNode("effectArrowR")
    m.effectBorderTop     = m.top.findNode("effectBorderTop")
    m.effectBorderBot     = m.top.findNode("effectBorderBot")
    m.effectBorderLeft    = m.top.findNode("effectBorderLeft")
    m.effectBorderRight   = m.top.findNode("effectBorderRight")

    ' ── Font sizes ──
    m.title.font.size              = 48
    m.subtitle.font.size           = 20
    m.footer.font.size             = 16
    m.cardTicTitle.font.size       = 28
    m.cardTicDesc.font.size        = 18
    m.cardCheckersTitle.font.size  = 28
    m.cardCheckersDesc.font.size   = 18
    m.cardConnect4Title.font.size  = 28
    m.cardConnect4Desc.font.size   = 18
    m.themeSelectorLabel.font.size = 20
    m.themeValueLabel.font.size    = 22
    m.themeArrowL.font.size        = 22
    m.themeArrowR.font.size        = 22
    m.effectSelectorLabel.font.size = 20
    m.effectValueLabel.font.size   = 22
    m.effectArrowL.font.size       = 22
    m.effectArrowR.font.size       = 22

    ' ── State ──
    m.selectedCard = 0      ' 0 = Tic-Tac-Toe, 1 = Checkers
    m.currentGame  = invalid
    m.inGame       = false
    m.focusRow     = 0      ' 0 = cards, 1 = theme, 2 = effect

    ' ── Themes & effects ──
    m.themes      = getThemes()
    m.themeIndex  = 0
    m.effectNames = ["Confetti", "Crown"]
    m.effectIndex = 0

    applyHomeTheme()
    updateFocus()
end function

' ════════════════════════════════════════════════════════════
'  Theme definitions
' ════════════════════════════════════════════════════════════
function getThemes() as Object
    themes = []

    ' -- Roku (default) --
    roku = {}
    roku.name          = "Roku"
    roku.bg            = "0x1A1A2EFF"
    roku.cardBg        = "0x252545FF"
    roku.cardBgFocused = "0x303060FF"
    roku.accent        = "0x662D91FF"
    roku.text          = "0xFFFFFFFF"
    roku.textSec       = "0x8888AAFF"
    roku.divider       = "0x333355FF"
    roku.gridLine      = "0x555577FF"
    roku.highlight     = "0xFFD70066"
    roku.selection     = "0x00FF0066"
    roku.player1       = "0xFF6666FF"
    roku.player2       = "0x6688FFFF"
    roku.boardLight    = "0xDEB887FF"
    roku.boardDark     = "0x8B4513FF"
    roku.winColor      = "0x00FF00FF"
    roku.cursorColor   = "0xFFD70066"
    themes.Push(roku)

    ' -- Dark --
    dark = {}
    dark.name          = "Dark"
    dark.bg            = "0x0D0D0DFF"
    dark.cardBg        = "0x1A1A1AFF"
    dark.cardBgFocused = "0x2A2A2AFF"
    dark.accent        = "0xBB86FCFF"
    dark.text          = "0xE0E0E0FF"
    dark.textSec       = "0x777777FF"
    dark.divider       = "0x2A2A2AFF"
    dark.gridLine      = "0x444444FF"
    dark.highlight     = "0xBB86FC66"
    dark.selection     = "0x03DAC666"
    dark.player1       = "0xCF6679FF"
    dark.player2       = "0x03DAC6FF"
    dark.boardLight    = "0x3E3E3EFF"
    dark.boardDark     = "0x1A1A1AFF"
    dark.winColor      = "0xBB86FCFF"
    dark.cursorColor   = "0xBB86FC66"
    themes.Push(dark)

    ' -- Light --
    light = {}
    light.name          = "Light"
    light.bg            = "0xEEEEF2FF"
    light.cardBg        = "0xFFFFFFFF"
    light.cardBgFocused = "0xE0D8F0FF"
    light.accent        = "0x6200EEFF"
    light.text          = "0x1A1A1AFF"
    light.textSec       = "0x666666FF"
    light.divider       = "0xCCCCCCFF"
    light.gridLine      = "0x999999FF"
    light.highlight     = "0x6200EE66"
    light.selection     = "0x03DAC666"
    light.player1       = "0xD32F2FFF"
    light.player2       = "0x1565C0FF"
    light.boardLight    = "0xFFE0B2FF"
    light.boardDark     = "0xBF360CFF"
    light.winColor      = "0x4CAF50FF"
    light.cursorColor   = "0x6200EE66"
    themes.Push(light)

    return themes
end function

function getCurrentTheme() as Object
    return m.themes[m.themeIndex]
end function

' ════════════════════════════════════════════════════════════
'  Apply theme colours to the home screen
' ════════════════════════════════════════════════════════════
sub applyHomeTheme()
    t = getCurrentTheme()

    m.top.backgroundColor = t.bg
    m.menuBg.color        = t.bg
    m.title.color         = t.text
    m.subtitle.color      = t.textSec
    m.footer.color        = t.textSec
    m.menuDivider.color   = t.divider

    m.cardTicAccent.color      = t.accent
    m.cardCheckersAccent.color = t.accent
    m.cardConnect4Accent.color = t.accent
    m.cardTicTitle.color       = t.text
    m.cardTicDesc.color        = t.textSec
    m.cardCheckersTitle.color  = t.text
    m.cardCheckersDesc.color   = t.textSec
    m.cardConnect4Title.color  = t.text
    m.cardConnect4Desc.color   = t.textSec

    m.themeSelectorBg.color     = t.cardBg
    m.effectSelectorBg.color    = t.cardBg
    m.themeSelectorLabel.color  = t.textSec
    m.effectSelectorLabel.color = t.textSec
    m.themeValueLabel.color     = t.text
    m.effectValueLabel.color    = t.text
    m.themeArrowL.color         = t.textSec
    m.themeArrowR.color         = t.textSec
    m.effectArrowL.color        = t.textSec
    m.effectArrowR.color        = t.textSec

    m.themeValueLabel.text  = t.name
    m.effectValueLabel.text = m.effectNames[m.effectIndex]
end sub

' ════════════════════════════════════════════════════════════
'  Visual focus management (3 rows)
' ════════════════════════════════════════════════════════════
sub updateFocus()
    t           = getCurrentTheme()
    transparent = "0x00000000"

    ' -- Cards --
    if m.focusRow = 0
        if m.selectedCard = 0
            m.cardTicBg.color      = t.cardBgFocused
            m.cardCheckersBg.color = t.cardBg
            m.cardConnect4Bg.color = t.cardBg
            setBorderColor("tic", t.accent)
            setBorderColor("checkers", transparent)
            setBorderColor("connect4", transparent)
        else if m.selectedCard = 1
            m.cardTicBg.color      = t.cardBg
            m.cardCheckersBg.color = t.cardBgFocused
            m.cardConnect4Bg.color = t.cardBg
            setBorderColor("tic", transparent)
            setBorderColor("checkers", t.accent)
            setBorderColor("connect4", transparent)
        else
            m.cardTicBg.color      = t.cardBg
            m.cardCheckersBg.color = t.cardBg
            m.cardConnect4Bg.color = t.cardBgFocused
            setBorderColor("tic", transparent)
            setBorderColor("checkers", transparent)
            setBorderColor("connect4", t.accent)
        end if
    else
        m.cardTicBg.color      = t.cardBg
        m.cardCheckersBg.color = t.cardBg
        m.cardConnect4Bg.color = t.cardBg
        setBorderColor("tic", transparent)
        setBorderColor("checkers", transparent)
        setBorderColor("connect4", transparent)
    end if

    ' -- Theme row --
    if m.focusRow = 1
        setRowBorder("theme", t.accent)
    else
        setRowBorder("theme", transparent)
    end if

    ' -- Effect row --
    if m.focusRow = 2
        setRowBorder("effect", t.accent)
    else
        setRowBorder("effect", transparent)
    end if
end sub

sub setBorderColor(card as String, color as String)
    if card = "tic"
        m.focusTicTop.color    = color
        m.focusTicBottom.color = color
        m.focusTicLeft.color   = color
        m.focusTicRight.color  = color
    else if card = "checkers"
        m.focusCheckersTop.color    = color
        m.focusCheckersBottom.color = color
        m.focusCheckersLeft.color   = color
        m.focusCheckersRight.color  = color
    else if card = "connect4"
        m.focusConnect4Top.color    = color
        m.focusConnect4Bottom.color = color
        m.focusConnect4Left.color   = color
        m.focusConnect4Right.color  = color
    end if
end sub

sub setRowBorder(row as String, color as String)
    if row = "theme"
        m.themeBorderTop.color   = color
        m.themeBorderBot.color   = color
        m.themeBorderLeft.color  = color
        m.themeBorderRight.color = color
    else
        m.effectBorderTop.color   = color
        m.effectBorderBot.color   = color
        m.effectBorderLeft.color  = color
        m.effectBorderRight.color = color
    end if
end sub

' ════════════════════════════════════════════════════════════
'  Key handling
' ════════════════════════════════════════════════════════════
function onKeyEvent(key as String, press as Boolean) as Boolean
    if not press then return false
    if m.inGame then return false

    if key = "up"
        if m.focusRow > 0
            m.focusRow = m.focusRow - 1
            updateFocus()
        end if
        return true

    else if key = "down"
        if m.focusRow < 2
            m.focusRow = m.focusRow + 1
            updateFocus()
        end if
        return true

    else if key = "left"
        if m.focusRow = 0
            if m.selectedCard > 0
                m.selectedCard = m.selectedCard - 1
                updateFocus()
            end if
        else if m.focusRow = 1
            m.themeIndex = m.themeIndex - 1
            if m.themeIndex < 0 then m.themeIndex = m.themes.Count() - 1
            applyHomeTheme()
            updateFocus()
        else if m.focusRow = 2
            m.effectIndex = m.effectIndex - 1
            if m.effectIndex < 0 then m.effectIndex = m.effectNames.Count() - 1
            m.effectValueLabel.text = m.effectNames[m.effectIndex]
        end if
        return true

    else if key = "right"
        if m.focusRow = 0
            if m.selectedCard < 2
                m.selectedCard = m.selectedCard + 1
                updateFocus()
            end if
        else if m.focusRow = 1
            m.themeIndex = m.themeIndex + 1
            if m.themeIndex >= m.themes.Count() then m.themeIndex = 0
            applyHomeTheme()
            updateFocus()
        else if m.focusRow = 2
            m.effectIndex = m.effectIndex + 1
            if m.effectIndex >= m.effectNames.Count() then m.effectIndex = 0
            m.effectValueLabel.text = m.effectNames[m.effectIndex]
        end if
        return true

    else if key = "OK"
        if m.focusRow = 0
            if m.selectedCard = 0
                launchGame("TicTacToeGame")
            else if m.selectedCard = 1
                launchGame("CheckersGame")
            else if m.selectedCard = 2
                launchGame("Connect4Game")
            end if
        end if
        return true
    end if

    return false
end function

' ════════════════════════════════════════════════════════════
'  Launch / exit games
' ════════════════════════════════════════════════════════════
sub launchGame(gameName as String)
    m.menuGroup.visible     = false
    m.gameContainer.visible = true

    gameNode = CreateObject("roSGNode", gameName)
    gameNode.themeData = getCurrentTheme()
    gameNode.winEffect = m.effectNames[m.effectIndex]
    gameNode.observeField("exitGame", "onExitGame")
    m.gameContainer.appendChild(gameNode)
    gameNode.setFocus(true)

    m.currentGame = gameNode
    m.inGame      = true
end sub

sub onExitGame()
    if m.currentGame <> invalid
        m.gameContainer.removeChild(m.currentGame)
        m.currentGame = invalid
    end if

    m.gameContainer.visible = false
    m.menuGroup.visible     = true
    m.inGame = false
    m.top.setFocus(true)
    updateFocus()
end sub
