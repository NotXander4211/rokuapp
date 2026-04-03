function init()
    m.top.setFocus(true)
    m.top.backgroundURI = ""
    m.top.backgroundColor = "0x1A1A2EFF"

    ' ── Node references: shell ──
    m.menuGroup     = m.top.findNode("menuGroup")
    m.gameContainer = m.top.findNode("gameContainer")
    m.menuBg        = m.top.findNode("menuBg")
    m.topBar        = m.top.findNode("topBar")
    m.topTitle      = m.top.findNode("topTitle")
    m.panelDivider  = m.top.findNode("panelDivider")

    ' ── Detail panel ──
    m.detailBg         = m.top.findNode("detailBg")
    m.detailAccentBar  = m.top.findNode("detailAccentBar")
    m.detailGameTitle  = m.top.findNode("detailGameTitle")
    m.detailTagline    = m.top.findNode("detailTagline")
    m.statDiffLabel    = m.top.findNode("statDiffLabel")
    m.statDiffValue    = m.top.findNode("statDiffValue")
    m.statDiffText     = m.top.findNode("statDiffText")
    m.statLenLabel     = m.top.findNode("statLenLabel")
    m.statLenValue     = m.top.findNode("statLenValue")
    m.statPlayersLabel = m.top.findNode("statPlayersLabel")
    m.statPlayersValue = m.top.findNode("statPlayersValue")
    m.detailDiv1       = m.top.findNode("detailDiv1")
    m.detailDiv2       = m.top.findNode("detailDiv2")
    m.howToPlayTitle   = m.top.findNode("howToPlayTitle")
    m.howTo1           = m.top.findNode("howTo1")
    m.howTo2           = m.top.findNode("howTo2")
    m.howTo3           = m.top.findNode("howTo3")
    m.detailPlayHint   = m.top.findNode("detailPlayHint")
    m.detailNavHint    = m.top.findNode("detailNavHint")

    ' ── Game list panel ──
    m.listBg        = m.top.findNode("listBg")
    m.listHeader    = m.top.findNode("listHeader")
    m.listHeaderDiv = m.top.findNode("listHeaderDiv")

    ' Entry 0
    m.entry0Bg           = m.top.findNode("entry0Bg")
    m.entry0Accent       = m.top.findNode("entry0Accent")
    m.entry0Title        = m.top.findNode("entry0Title")
    m.entry0Stars        = m.top.findNode("entry0Stars")
    m.entry0Diff         = m.top.findNode("entry0Diff")
    m.entry0Length       = m.top.findNode("entry0Length")
    m.entry0BorderTop    = m.top.findNode("entry0BorderTop")
    m.entry0BorderBottom = m.top.findNode("entry0BorderBottom")
    m.entry0BorderLeft   = m.top.findNode("entry0BorderLeft")
    m.entry0BorderRight  = m.top.findNode("entry0BorderRight")

    ' Entry 1
    m.entry1Bg           = m.top.findNode("entry1Bg")
    m.entry1Accent       = m.top.findNode("entry1Accent")
    m.entry1Title        = m.top.findNode("entry1Title")
    m.entry1Stars        = m.top.findNode("entry1Stars")
    m.entry1Diff         = m.top.findNode("entry1Diff")
    m.entry1Length       = m.top.findNode("entry1Length")
    m.entry1BorderTop    = m.top.findNode("entry1BorderTop")
    m.entry1BorderBottom = m.top.findNode("entry1BorderBottom")
    m.entry1BorderLeft   = m.top.findNode("entry1BorderLeft")
    m.entry1BorderRight  = m.top.findNode("entry1BorderRight")

    ' Entry 2
    m.entry2Bg           = m.top.findNode("entry2Bg")
    m.entry2Accent       = m.top.findNode("entry2Accent")
    m.entry2Title        = m.top.findNode("entry2Title")
    m.entry2Stars        = m.top.findNode("entry2Stars")
    m.entry2Diff         = m.top.findNode("entry2Diff")
    m.entry2Length       = m.top.findNode("entry2Length")
    m.entry2BorderTop    = m.top.findNode("entry2BorderTop")
    m.entry2BorderBottom = m.top.findNode("entry2BorderBottom")
    m.entry2BorderLeft   = m.top.findNode("entry2BorderLeft")
    m.entry2BorderRight  = m.top.findNode("entry2BorderRight")

    ' ── Settings overlay nodes ──
    m.settingsOverlay  = m.top.findNode("settingsOverlay")
    m.sThemeRowBg      = m.top.findNode("sThemeRowBg")
    m.sThemeAccent     = m.top.findNode("sThemeAccent")
    m.sThemeValue      = m.top.findNode("sThemeValue")
    m.sThemeArrowL     = m.top.findNode("sThemeArrowL")
    m.sThemeArrowR     = m.top.findNode("sThemeArrowR")
    m.sEffectRowBg     = m.top.findNode("sEffectRowBg")
    m.sEffectAccent    = m.top.findNode("sEffectAccent")
    m.sEffectValue     = m.top.findNode("sEffectValue")
    m.sEffectArrowL    = m.top.findNode("sEffectArrowL")
    m.sEffectArrowR    = m.top.findNode("sEffectArrowR")
    m.sDevRowBg        = m.top.findNode("sDevRowBg")
    m.sDevAccent       = m.top.findNode("sDevAccent")
    m.sDevValue        = m.top.findNode("sDevValue")
    m.sDiv2            = m.top.findNode("sDiv2")
    m.sP1Row           = m.top.findNode("sP1Row")
    m.sP1RowBg         = m.top.findNode("sP1RowBg")
    m.sP1Accent        = m.top.findNode("sP1Accent")
    m.sP1NamePreview   = m.top.findNode("sP1NamePreview")
    m.sP2Row           = m.top.findNode("sP2Row")
    m.sP2RowBg         = m.top.findNode("sP2RowBg")
    m.sP2Accent        = m.top.findNode("sP2Accent")
    m.sP2NamePreview   = m.top.findNode("sP2NamePreview")

    ' ── Profile overlay nodes ──
    m.profileOverlay  = m.top.findNode("profileOverlay")
    m.profileTopTitle = m.top.findNode("profileTopTitle")
    m.pNameRowBg      = m.top.findNode("pNameRowBg")
    m.pNameAccent     = m.top.findNode("pNameAccent")
    m.pNameValue      = m.top.findNode("pNameValue")
    m.pColorRowBg     = m.top.findNode("pColorRowBg")
    m.pColorAccent    = m.top.findNode("pColorAccent")
    m.pColorSwatch    = m.top.findNode("pColorSwatch")
    m.pColorValue     = m.top.findNode("pColorValue")
    m.pEffectRowBg    = m.top.findNode("pEffectRowBg")
    m.pEffectAccent   = m.top.findNode("pEffectAccent")
    m.pEffectValue    = m.top.findNode("pEffectValue")

    ' ── Font sizes: detail panel ──
    m.topTitle.font.size         = 22
    m.detailGameTitle.font.size  = 46
    m.detailTagline.font.size    = 17
    m.statDiffLabel.font.size    = 13
    m.statDiffValue.font.size    = 22
    m.statDiffText.font.size     = 14
    m.statLenLabel.font.size     = 13
    m.statLenValue.font.size     = 20
    m.statPlayersLabel.font.size = 13
    m.statPlayersValue.font.size = 20
    m.howToPlayTitle.font.size   = 13
    m.howTo1.font.size           = 17
    m.howTo2.font.size           = 17
    m.howTo3.font.size           = 17
    m.detailPlayHint.font.size   = 20
    m.detailNavHint.font.size    = 13
    m.listHeader.font.size       = 16
    m.entry0Title.font.size  = 24 : m.entry0Stars.font.size  = 18
    m.entry0Diff.font.size   = 14 : m.entry0Length.font.size = 14
    m.entry1Title.font.size  = 24 : m.entry1Stars.font.size  = 18
    m.entry1Diff.font.size   = 14 : m.entry1Length.font.size = 14
    m.entry2Title.font.size  = 24 : m.entry2Stars.font.size  = 18
    m.entry2Diff.font.size   = 14 : m.entry2Length.font.size = 14

    ' ── Font sizes: settings overlay ──
    m.top.findNode("settingsTopTitle").font.size = 22
    m.top.findNode("sThemeLabel").font.size   = 18
    m.sThemeArrowL.font.size                  = 20
    m.sThemeValue.font.size                   = 18
    m.sThemeArrowR.font.size                  = 20
    m.top.findNode("sEffectLabel").font.size  = 18
    m.sEffectArrowL.font.size                 = 20
    m.sEffectValue.font.size                  = 18
    m.sEffectArrowR.font.size                 = 20
    m.top.findNode("sDevLabel").font.size     = 18
    m.sDevValue.font.size                     = 18
    m.top.findNode("sP1Label").font.size      = 18
    m.sP1NamePreview.font.size                = 17
    m.top.findNode("sP1Arrow").font.size      = 20
    m.top.findNode("sP2Label").font.size      = 18
    m.sP2NamePreview.font.size                = 17
    m.top.findNode("sP2Arrow").font.size      = 20
    m.top.findNode("settingsHint").font.size  = 13

    ' ── Font sizes: profile overlay ──
    m.profileTopTitle.font.size               = 22
    m.top.findNode("pNameLabel").font.size    = 18
    m.top.findNode("pNameArrowL").font.size   = 20
    m.pNameValue.font.size                    = 18
    m.top.findNode("pNameArrowR").font.size   = 20
    m.top.findNode("pColorLabel").font.size   = 18
    m.top.findNode("pColorArrowL").font.size  = 20
    m.pColorValue.font.size                   = 18
    m.top.findNode("pColorArrowR").font.size  = 20
    m.top.findNode("pEffectLabel").font.size  = 18
    m.top.findNode("pEffectArrowL").font.size = 20
    m.pEffectValue.font.size                  = 18
    m.top.findNode("pEffectArrowR").font.size = 20
    m.top.findNode("profileHint").font.size   = 13

    ' ── Game data ──
    m.gameNames      = ["TIC-TAC-TOE", "CHECKERS", "CONNECT 4"]
    m.gameTaglines   = ["Classic X vs O", "Strategy board game", "Connect four in a row"]
    m.gameStars      = [chr(9733)+chr(9734)+chr(9734)+chr(9734)+chr(9734), chr(9733)+chr(9733)+chr(9733)+chr(9734)+chr(9734), chr(9733)+chr(9733)+chr(9734)+chr(9734)+chr(9734)]
    m.gameDiffs      = ["Easy", "Medium", "Normal"]
    m.gameLengths    = ["~3 min", "~15 min", "~5 min"]
    m.gameComponents = ["TicTacToeGame", "CheckersGame", "Connect4Game"]

    m.gameHowTo = []
    tic = [">"+chr(160)+"Take turns placing X and O", ">"+chr(160)+"Get 3 in a row to win", ">"+chr(160)+"Draw if the board fills up"]
    m.gameHowTo.Push(tic)
    chk = [">"+chr(160)+"Move your pieces diagonally", ">"+chr(160)+"Jump over enemies to capture", ">"+chr(160)+"King up by reaching the far side"]
    m.gameHowTo.Push(chk)
    c4  = [">"+chr(160)+"Drop pieces into columns", ">"+chr(160)+"Pieces fall to the lowest slot", ">"+chr(160)+"Connect 4 in a row to win"]
    m.gameHowTo.Push(c4)

    ' ── Home screen state ──
    m.selectedCard = 0
    m.currentGame  = invalid
    m.inGame       = false
    m.screenState  = "home"   ' "home" | "settings" | "profile"

    ' ── Themes & global effects ──
    m.themes      = getThemes()
    m.themeIndex  = 0
    m.effectNames = ["Confetti", "Crown"]
    m.effectIndex = 0

    ' ── Dev mode & profiles ──
    m.devMode = false

    m.profileNames = ["Player 1", "Player 2", "Alex", "Blake", "Casey", "Drew", "Jordan", "Morgan", "Quinn", "Riley", "Sam", "Taylor", "Avery", "Phoenix"]

    m.profileColors = []
    pc = {} : pc.name = "Red"    : pc.hex = "0xFF4444FF" : m.profileColors.Push(pc)
    pc = {} : pc.name = "Blue"   : pc.hex = "0x4488FFFF" : m.profileColors.Push(pc)
    pc = {} : pc.name = "Green"  : pc.hex = "0x44BB44FF" : m.profileColors.Push(pc)
    pc = {} : pc.name = "Purple" : pc.hex = "0xAA44FFFF" : m.profileColors.Push(pc)
    pc = {} : pc.name = "Orange" : pc.hex = "0xFF8800FF" : m.profileColors.Push(pc)
    pc = {} : pc.name = "Teal"   : pc.hex = "0x44BBBBFF" : m.profileColors.Push(pc)
    pc = {} : pc.name = "Pink"   : pc.hex = "0xFF44AAFF" : m.profileColors.Push(pc)
    pc = {} : pc.name = "Yellow" : pc.hex = "0xFFDD00FF" : m.profileColors.Push(pc)
    pc = {} : pc.name = "White"  : pc.hex = "0xEEEEEEFF" : m.profileColors.Push(pc)
    pc = {} : pc.name = "Gold"   : pc.hex = "0xFFD700FF" : m.profileColors.Push(pc)

    ' p1/p2 store name as a string; colorIdx and effectIdx are list indices
    m.p1 = {name: "Player 1", colorIdx: 0, effectIdx: 0}
    m.p2 = {name: "Player 2", colorIdx: 1, effectIdx: 0}

    ' Settings screen state
    m.settingsFocusRow = 0   ' 0=theme 1=effect 2=devMode 3=p1 4=p2

    ' Profile editing state
    m.editingPlayer   = 1
    m.profileFocusRow = 0    ' 0=name 1=color 2=effect
    m.editName        = "Player 1"
    m.editColorIdx    = 0
    m.editEffectIdx   = 0

    ' Initialise overlay label text
    m.sThemeValue.text    = getCurrentTheme().name
    m.sEffectValue.text   = m.effectNames[m.effectIndex]
    m.sDevValue.text      = "OFF"
    m.sDevValue.color     = "0xFF4444FF"
    m.sP1NamePreview.text = m.p1.name
    m.sP2NamePreview.text = m.p2.name

    applyHomeTheme()
    updateDetail()
    updateFocus()
end function

' ════════════════════════════════════════════════════════════
'  Game detail panel
' ════════════════════════════════════════════════════════════
sub updateDetail()
    g     = m.selectedCard
    howTo = m.gameHowTo[g]
    m.detailGameTitle.text = m.gameNames[g]
    m.detailTagline.text   = m.gameTaglines[g]
    m.statDiffValue.text   = m.gameStars[g]
    m.statDiffText.text    = m.gameDiffs[g]
    m.statLenValue.text    = m.gameLengths[g]
    m.howTo1.text          = howTo[0]
    m.howTo2.text          = howTo[1]
    m.howTo3.text          = howTo[2]
end sub

' ════════════════════════════════════════════════════════════
'  Theme definitions
' ════════════════════════════════════════════════════════════
function getThemes() as Object
    themes = []

    roku = {}
    roku.name="Roku" : roku.bg="0x1A1A2EFF" : roku.cardBg="0x252545FF"
    roku.cardBgFocused="0x303060FF" : roku.accent="0x662D91FF"
    roku.text="0xFFFFFFFF" : roku.textSec="0x8888AAFF"
    roku.divider="0x333355FF" : roku.gridLine="0x555577FF"
    roku.highlight="0xFFD70066" : roku.selection="0x00FF0066"
    roku.player1="0xFF6666FF" : roku.player2="0x6688FFFF"
    roku.boardLight="0xDEB887FF" : roku.boardDark="0x8B4513FF"
    roku.winColor="0x00FF00FF" : roku.cursorColor="0xFFD70066"
    themes.Push(roku)

    dark = {}
    dark.name="Dark" : dark.bg="0x0D0D0DFF" : dark.cardBg="0x1A1A1AFF"
    dark.cardBgFocused="0x2A2A2AFF" : dark.accent="0xBB86FCFF"
    dark.text="0xE0E0E0FF" : dark.textSec="0x777777FF"
    dark.divider="0x2A2A2AFF" : dark.gridLine="0x444444FF"
    dark.highlight="0xBB86FC66" : dark.selection="0x03DAC666"
    dark.player1="0xCF6679FF" : dark.player2="0x03DAC6FF"
    dark.boardLight="0x3E3E3EFF" : dark.boardDark="0x1A1A1AFF"
    dark.winColor="0xBB86FCFF" : dark.cursorColor="0xBB86FC66"
    themes.Push(dark)

    light = {}
    light.name="Light" : light.bg="0xEEEEF2FF" : light.cardBg="0xFFFFFFFF"
    light.cardBgFocused="0xE0D8F0FF" : light.accent="0x6200EEFF"
    light.text="0x1A1A1AFF" : light.textSec="0x666666FF"
    light.divider="0xCCCCCCFF" : light.gridLine="0x999999FF"
    light.highlight="0x6200EE66" : light.selection="0x03DAC666"
    light.player1="0xD32F2FFF" : light.player2="0x1565C0FF"
    light.boardLight="0xFFE0B2FF" : light.boardDark="0xBF360CFF"
    light.winColor="0x4CAF50FF" : light.cursorColor="0x6200EE66"
    themes.Push(light)

    return themes
end function

function getCurrentTheme() as Object
    return m.themes[m.themeIndex]
end function

' ════════════════════════════════════════════════════════════
'  Apply theme to home screen and overlays
' ════════════════════════════════════════════════════════════
sub applyHomeTheme()
    t = getCurrentTheme()

    m.top.backgroundColor = t.bg
    m.menuBg.color        = t.bg
    m.topBar.color        = t.accent
    m.topTitle.color      = t.text
    m.panelDivider.color  = t.divider

    m.detailBg.color         = t.bg
    m.detailAccentBar.color  = t.accent
    m.detailGameTitle.color  = t.text
    m.detailTagline.color    = t.textSec
    m.statDiffLabel.color    = t.gridLine
    m.statDiffValue.color    = "0xFFD700FF"
    m.statDiffText.color     = t.textSec
    m.statLenLabel.color     = t.gridLine
    m.statLenValue.color     = t.text
    m.statPlayersLabel.color = t.gridLine
    m.statPlayersValue.color = t.text
    m.detailDiv1.color       = t.divider
    m.howToPlayTitle.color   = t.gridLine
    m.howTo1.color           = t.text
    m.howTo2.color           = t.text
    m.howTo3.color           = t.text
    m.detailDiv2.color       = t.divider
    m.detailNavHint.color    = t.divider

    m.listBg.color        = t.bg
    m.listHeader.color    = t.textSec
    m.listHeaderDiv.color = t.divider

    m.entry0Accent.color = t.accent : m.entry0Stars.color  = "0xFFD700FF"
    m.entry0Diff.color   = t.textSec : m.entry0Length.color = t.gridLine
    m.entry1Accent.color = t.accent : m.entry1Stars.color  = "0xFFD700FF"
    m.entry1Diff.color   = t.textSec : m.entry1Length.color = t.gridLine
    m.entry2Accent.color = t.accent : m.entry2Stars.color  = "0xFFD700FF"
    m.entry2Diff.color   = t.textSec : m.entry2Length.color = t.gridLine

    ' Settings overlay
    m.top.findNode("settingsPanelBg").color  = t.bg
    m.top.findNode("settingsTopBar").color   = t.accent
    m.top.findNode("settingsTopTitle").color = t.text
    m.top.findNode("settingsHint").color     = t.divider
    m.top.findNode("sDiv1").color            = t.divider
    m.sDiv2.color                            = t.divider
    m.sThemeRowBg.color  = t.cardBg : m.sEffectRowBg.color = t.cardBg
    m.sDevRowBg.color    = t.cardBg : m.sP1RowBg.color     = t.cardBg
    m.sP2RowBg.color     = t.cardBg
    m.top.findNode("sThemeLabel").color  = t.textSec
    m.top.findNode("sEffectLabel").color = t.textSec
    m.top.findNode("sDevLabel").color    = t.textSec
    m.top.findNode("sP1Label").color     = t.textSec
    m.top.findNode("sP2Label").color     = t.textSec
    m.sThemeValue.text   = getCurrentTheme().name
    m.sThemeValue.color  = t.text
    m.sEffectValue.color = t.text
    m.sThemeArrowL.color = t.textSec : m.sThemeArrowR.color = t.textSec
    m.sEffectArrowL.color = t.textSec : m.sEffectArrowR.color = t.textSec
    m.sP1NamePreview.color = t.text : m.sP2NamePreview.color = t.text
    m.top.findNode("sP1Arrow").color = t.textSec
    m.top.findNode("sP2Arrow").color = t.textSec

    ' Profile overlay
    m.top.findNode("profilePanelBg").color  = t.bg
    m.top.findNode("profileTopBar").color   = t.accent
    m.profileTopTitle.color                 = t.text
    m.top.findNode("profileHint").color     = t.divider
    m.pNameRowBg.color   = t.cardBg : m.pColorRowBg.color  = t.cardBg
    m.pEffectRowBg.color = t.cardBg
    m.top.findNode("pNameLabel").color   = t.textSec
    m.top.findNode("pColorLabel").color  = t.textSec
    m.top.findNode("pEffectLabel").color = t.textSec
    m.pNameValue.color   = t.text : m.pColorValue.color  = t.text
    m.pEffectValue.color = t.text
    m.top.findNode("pNameArrowL").color   = t.textSec
    m.top.findNode("pNameArrowR").color   = t.textSec
    m.top.findNode("pColorArrowL").color  = t.textSec
    m.top.findNode("pColorArrowR").color  = t.textSec
    m.top.findNode("pEffectArrowL").color = t.textSec
    m.top.findNode("pEffectArrowR").color = t.textSec

    updateFocus()
end sub

' ════════════════════════════════════════════════════════════
'  Home screen focus management (game list only)
' ════════════════════════════════════════════════════════════
sub updateFocus()
    t           = getCurrentTheme()
    transparent = "0x00000000"

    if m.selectedCard = 0
        m.entry0Bg.color    = t.cardBgFocused
        m.entry0Title.color = t.accent
        setEntryBorder(0, t.accent)
    else
        m.entry0Bg.color    = t.cardBg
        m.entry0Title.color = t.text
        setEntryBorder(0, transparent)
    end if

    if m.selectedCard = 1
        m.entry1Bg.color    = t.cardBgFocused
        m.entry1Title.color = t.accent
        setEntryBorder(1, t.accent)
    else
        m.entry1Bg.color    = t.cardBg
        m.entry1Title.color = t.text
        setEntryBorder(1, transparent)
    end if

    if m.selectedCard = 2
        m.entry2Bg.color    = t.cardBgFocused
        m.entry2Title.color = t.accent
        setEntryBorder(2, t.accent)
    else
        m.entry2Bg.color    = t.cardBg
        m.entry2Title.color = t.text
        setEntryBorder(2, transparent)
    end if

    m.detailPlayHint.color = t.accent
end sub

sub setEntryBorder(idx as Integer, color as String)
    if idx = 0
        m.entry0BorderTop.color    = color
        m.entry0BorderBottom.color = color
        m.entry0BorderLeft.color   = color
        m.entry0BorderRight.color  = color
    else if idx = 1
        m.entry1BorderTop.color    = color
        m.entry1BorderBottom.color = color
        m.entry1BorderLeft.color   = color
        m.entry1BorderRight.color  = color
    else
        m.entry2BorderTop.color    = color
        m.entry2BorderBottom.color = color
        m.entry2BorderLeft.color   = color
        m.entry2BorderRight.color  = color
    end if
end sub

' ════════════════════════════════════════════════════════════
'  Key routing
' ════════════════════════════════════════════════════════════
function onKeyEvent(key as String, press as Boolean) as Boolean
    if not press  then return false
    if m.inGame   then return false

    if m.screenState = "settings"
        return handleSettingsKey(key)
    else if m.screenState = "profile"
        return handleProfileKey(key)
    end if

    ' ── Home screen ──
    if key = "options"
        openSettings()
        return true
    else if key = "up"
        if m.selectedCard > 0
            m.selectedCard = m.selectedCard - 1
            updateDetail()
            updateFocus()
        end if
        return true
    else if key = "down"
        if m.selectedCard < 2
            m.selectedCard = m.selectedCard + 1
            updateDetail()
            updateFocus()
        end if
        return true
    else if key = "OK"
        launchGame(m.gameComponents[m.selectedCard])
        return true
    end if

    return false
end function

' ════════════════════════════════════════════════════════════
'  Settings screen
' ════════════════════════════════════════════════════════════
sub openSettings()
    m.screenState      = "settings"
    m.settingsFocusRow = 0
    m.settingsOverlay.visible = true

    m.sThemeValue.text    = getCurrentTheme().name
    m.sEffectValue.text   = m.effectNames[m.effectIndex]
    m.sP1NamePreview.text = m.p1.name
    m.sP2NamePreview.text = m.p2.name

    if m.devMode
        m.sDevValue.text  = "ON"
        m.sDevValue.color = "0x44FF44FF"
        m.sDiv2.visible   = true
        m.sP1Row.visible  = true
        m.sP2Row.visible  = true
    else
        m.sDevValue.text  = "OFF"
        m.sDevValue.color = "0xFF4444FF"
        m.sDiv2.visible   = false
        m.sP1Row.visible  = false
        m.sP2Row.visible  = false
    end if

    updateSettingsFocus()
end sub

sub closeSettings()
    m.screenState = "home"
    m.settingsOverlay.visible = false
end sub

function handleSettingsKey(key as String) as Boolean
    if key = "back"
        closeSettings()
        return true
    else if key = "up"
        if m.settingsFocusRow > 0
            m.settingsFocusRow = m.settingsFocusRow - 1
            updateSettingsFocus()
        end if
        return true
    else if key = "down"
        maxRow = 2
        if m.devMode then maxRow = 4
        if m.settingsFocusRow < maxRow
            m.settingsFocusRow = m.settingsFocusRow + 1
            updateSettingsFocus()
        end if
        return true
    else if key = "left"
        settingsAdjustValue(-1)
        return true
    else if key = "right"
        settingsAdjustValue(1)
        return true
    else if key = "OK"
        if m.settingsFocusRow = 2
            toggleDevMode()
        else if m.settingsFocusRow = 3
            openProfile(1)
        else if m.settingsFocusRow = 4
            openProfile(2)
        end if
        return true
    end if
    return false
end function

sub settingsAdjustValue(dir as Integer)
    if m.settingsFocusRow = 0
        m.themeIndex = m.themeIndex + dir
        if m.themeIndex < 0 then m.themeIndex = m.themes.Count() - 1
        if m.themeIndex >= m.themes.Count() then m.themeIndex = 0
        applyHomeTheme()
        m.sThemeValue.text = getCurrentTheme().name
        updateSettingsFocus()
    else if m.settingsFocusRow = 1
        m.effectIndex = m.effectIndex + dir
        if m.effectIndex < 0 then m.effectIndex = m.effectNames.Count() - 1
        if m.effectIndex >= m.effectNames.Count() then m.effectIndex = 0
        m.sEffectValue.text = m.effectNames[m.effectIndex]
    end if
end sub

sub toggleDevMode()
    m.devMode = not m.devMode
    if m.devMode
        m.sDevValue.text  = "ON"
        m.sDevValue.color = "0x44FF44FF"
        m.sDiv2.visible   = true
        m.sP1Row.visible  = true
        m.sP2Row.visible  = true
    else
        m.sDevValue.text  = "OFF"
        m.sDevValue.color = "0xFF4444FF"
        m.sDiv2.visible   = false
        m.sP1Row.visible  = false
        m.sP2Row.visible  = false
        if m.settingsFocusRow > 2 then m.settingsFocusRow = 2
        updateSettingsFocus()
    end if
end sub

sub updateSettingsFocus()
    t           = getCurrentTheme()
    transparent = "0x00000000"

    ' Reset all rows
    m.sThemeRowBg.color   = t.cardBg : m.sThemeAccent.color   = transparent
    m.sEffectRowBg.color  = t.cardBg : m.sEffectAccent.color  = transparent
    m.sDevRowBg.color     = t.cardBg : m.sDevAccent.color     = transparent
    m.sP1RowBg.color      = t.cardBg : m.sP1Accent.color      = transparent
    m.sP2RowBg.color      = t.cardBg : m.sP2Accent.color      = transparent

    ' Highlight active row
    if m.settingsFocusRow = 0
        m.sThemeRowBg.color  = t.cardBgFocused
        m.sThemeAccent.color = t.accent
    else if m.settingsFocusRow = 1
        m.sEffectRowBg.color  = t.cardBgFocused
        m.sEffectAccent.color = t.accent
    else if m.settingsFocusRow = 2
        m.sDevRowBg.color  = t.cardBgFocused
        m.sDevAccent.color = t.accent
    else if m.settingsFocusRow = 3
        m.sP1RowBg.color  = t.cardBgFocused
        m.sP1Accent.color = t.accent
    else if m.settingsFocusRow = 4
        m.sP2RowBg.color  = t.cardBgFocused
        m.sP2Accent.color = t.accent
    end if
end sub

' ════════════════════════════════════════════════════════════
'  Profile screen
' ════════════════════════════════════════════════════════════
sub openProfile(playerNum as Integer)
    m.editingPlayer   = playerNum
    m.profileFocusRow = 0
    m.screenState     = "profile"
    m.profileOverlay.visible = true

    if playerNum = 1
        m.profileTopTitle.text = "PLAYER 1 PROFILE"
        m.editName      = m.p1.name
        m.editColorIdx  = m.p1.colorIdx
        m.editEffectIdx = m.p1.effectIdx
    else
        m.profileTopTitle.text = "PLAYER 2 PROFILE"
        m.editName      = m.p2.name
        m.editColorIdx  = m.p2.colorIdx
        m.editEffectIdx = m.p2.effectIdx
    end if

    syncProfileValues()
    updateProfileFocus()
end sub

sub closeProfile()
    if m.editingPlayer = 1
        m.p1.name      = m.editName
        m.p1.colorIdx  = m.editColorIdx
        m.p1.effectIdx = m.editEffectIdx
        m.sP1NamePreview.text = m.p1.name
    else
        m.p2.name      = m.editName
        m.p2.colorIdx  = m.editColorIdx
        m.p2.effectIdx = m.editEffectIdx
        m.sP2NamePreview.text = m.p2.name
    end if

    m.profileOverlay.visible = false
    m.screenState = "settings"
end sub

function handleProfileKey(key as String) as Boolean
    if key = "back"
        closeProfile()
        return true
    else if key = "up"
        if m.profileFocusRow > 0
            m.profileFocusRow = m.profileFocusRow - 1
            updateProfileFocus()
        end if
        return true
    else if key = "down"
        if m.profileFocusRow < 2
            m.profileFocusRow = m.profileFocusRow + 1
            updateProfileFocus()
        end if
        return true
    else if key = "OK"
        if m.profileFocusRow = 0 then openNameKeyboard()
        return true
    else if key = "left"
        profileAdjustValue(-1)
        return true
    else if key = "right"
        profileAdjustValue(1)
        return true
    end if
    return false
end function

sub profileAdjustValue(dir as Integer)
    if m.profileFocusRow = 0
        ' Find where the current name sits in the preset list (fall back to 0 for custom names)
        curIdx = 0
        for i = 0 to m.profileNames.Count() - 1
            if m.profileNames[i] = m.editName then curIdx = i
        end for
        curIdx = curIdx + dir
        if curIdx < 0 then curIdx = m.profileNames.Count() - 1
        if curIdx >= m.profileNames.Count() then curIdx = 0
        m.editName = m.profileNames[curIdx]
        m.pNameValue.text = m.editName
    else if m.profileFocusRow = 1
        ' Skip the color already chosen by the other player
        if m.editingPlayer = 1
            takenIdx = m.p2.colorIdx
        else
            takenIdx = m.p1.colorIdx
        end if
        nextIdx = m.editColorIdx + dir
        if nextIdx < 0 then nextIdx = m.profileColors.Count() - 1
        if nextIdx >= m.profileColors.Count() then nextIdx = 0
        attempts = 0
        while nextIdx = takenIdx and attempts < m.profileColors.Count()
            nextIdx = nextIdx + dir
            if nextIdx < 0 then nextIdx = m.profileColors.Count() - 1
            if nextIdx >= m.profileColors.Count() then nextIdx = 0
            attempts = attempts + 1
        end while
        m.editColorIdx = nextIdx
        m.pColorSwatch.color = m.profileColors[m.editColorIdx].hex
        m.pColorValue.text   = m.profileColors[m.editColorIdx].name
    else if m.profileFocusRow = 2
        m.editEffectIdx = m.editEffectIdx + dir
        if m.editEffectIdx < 0 then m.editEffectIdx = m.effectNames.Count() - 1
        if m.editEffectIdx >= m.effectNames.Count() then m.editEffectIdx = 0
        m.pEffectValue.text = m.effectNames[m.editEffectIdx]
    end if
end sub

sub syncProfileValues()
    m.pNameValue.text    = m.editName
    m.pColorSwatch.color = m.profileColors[m.editColorIdx].hex
    m.pColorValue.text   = m.profileColors[m.editColorIdx].name
    m.pEffectValue.text  = m.effectNames[m.editEffectIdx]
end sub

sub updateProfileFocus()
    t           = getCurrentTheme()
    transparent = "0x00000000"

    m.pNameRowBg.color    = t.cardBg : m.pNameAccent.color   = transparent
    m.pColorRowBg.color   = t.cardBg : m.pColorAccent.color  = transparent
    m.pEffectRowBg.color  = t.cardBg : m.pEffectAccent.color = transparent

    if m.profileFocusRow = 0
        m.pNameRowBg.color  = t.cardBgFocused
        m.pNameAccent.color = t.accent
        m.top.findNode("profileHint").text = "LEFT/RIGHT Preset Names   OK Type Custom   BACK Save"
    else if m.profileFocusRow = 1
        m.pColorRowBg.color  = t.cardBgFocused
        m.pColorAccent.color = t.accent
        m.top.findNode("profileHint").text = "LEFT/RIGHT Change Color   BACK Save & Close"
    else if m.profileFocusRow = 2
        m.pEffectRowBg.color  = t.cardBgFocused
        m.pEffectAccent.color = t.accent
        m.top.findNode("profileHint").text = "LEFT/RIGHT Change Effect   BACK Save & Close"
    end if
end sub

' ════════════════════════════════════════════════════════════
'  Name keyboard entry
' ════════════════════════════════════════════════════════════
sub openNameKeyboard()
    dialog = CreateObject("roSGNode", "KeyboardDialog")
    dialog.title   = "Player Name"
    dialog.message = "Enter a name for this player:"
    dialog.buttons = ["Confirm", "Cancel"]
    dialog.observeField("buttonSelected", "onNameEntryDone")
    m.top.dialog = dialog
end sub

sub onNameEntryDone()
    dialog = m.top.dialog
    if dialog = invalid then return
    if dialog.buttonSelected = 0
        newText = dialog.keyboard.text
        if newText <> ""
            trimmed = newText.Trim()
            if trimmed <> "" then m.editName = trimmed else m.editName = newText
            m.pNameValue.text = m.editName
        end if
    end if
    m.top.dialog = invalid
end sub

' ════════════════════════════════════════════════════════════
'  Launch / exit games
' ════════════════════════════════════════════════════════════
sub launchGame(gameName as String)
    m.menuGroup.visible     = false
    m.gameContainer.visible = true

    gameNode = CreateObject("roSGNode", gameName)

    ' Build theme data, extending with profile info when dev mode is on
    t = getCurrentTheme()
    t.devMode = m.devMode
    if m.devMode
        p1d = {}
        p1d.name   = m.p1.name
        p1d.color  = m.profileColors[m.p1.colorIdx].hex
        p1d.effect = m.effectNames[m.p1.effectIdx]
        t.p1 = p1d
        p2d = {}
        p2d.name   = m.p2.name
        p2d.color  = m.profileColors[m.p2.colorIdx].hex
        p2d.effect = m.effectNames[m.p2.effectIdx]
        t.p2 = p2d
    end if

    gameNode.themeData = t
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
