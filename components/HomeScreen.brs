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

    ' ── Scrollable game cards (card nodes are created in buildCards) ──
    m.cardsViewport  = m.top.findNode("cardsViewport")
    m.cardsContent   = m.top.findNode("cardsContent")
    m.scrollUpHint   = m.top.findNode("scrollUpHint")
    m.scrollDownHint = m.top.findNode("scrollDownHint")

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

    ' ── Fonts ──
    ' Headings/titles use the Audiowide display face; body text uses Chakra Petch.
    ' Star-rating labels stay on the system font (custom faces lack the ★/☆ glyphs).
    DISP = "pkg:/fonts/Audiowide-Regular.ttf"
    BODY = "pkg:/fonts/ChakraPetch-Regular.ttf"

    ' Detail panel
    m.topTitle.font          = NewFont(DISP, 22)
    m.detailGameTitle.font   = NewFont(DISP, 46)
    m.detailTagline.font     = NewFont(BODY, 17)
    m.statDiffLabel.font     = NewFont(BODY, 13)
    m.statDiffValue.font.size = 22                       ' stars → keep system font
    m.statDiffText.font      = NewFont(BODY, 14)
    m.statLenLabel.font      = NewFont(BODY, 13)
    m.statLenValue.font      = NewFont(BODY, 20)
    m.statPlayersLabel.font  = NewFont(BODY, 13)
    m.statPlayersValue.font  = NewFont(BODY, 20)
    m.howToPlayTitle.font    = NewFont(BODY, 13)
    m.howTo1.font            = NewFont(BODY, 17)
    m.howTo2.font            = NewFont(BODY, 17)
    m.howTo3.font            = NewFont(BODY, 17)
    m.detailPlayHint.font    = NewFont(DISP, 20)
    m.detailNavHint.font     = NewFont(BODY, 13)
    m.listHeader.font        = NewFont(DISP, 16)
    ' (Game-card fonts are assigned per card inside buildCards())

    ' Settings overlay
    m.top.findNode("settingsTopTitle").font = NewFont(DISP, 22)
    m.top.findNode("sThemeLabel").font   = NewFont(BODY, 18)
    m.sThemeArrowL.font                  = NewFont(BODY, 20)
    m.sThemeValue.font                   = NewFont(BODY, 18)
    m.sThemeArrowR.font                  = NewFont(BODY, 20)
    m.top.findNode("sEffectLabel").font  = NewFont(BODY, 18)
    m.sEffectArrowL.font                 = NewFont(BODY, 20)
    m.sEffectValue.font                  = NewFont(BODY, 18)
    m.sEffectArrowR.font                 = NewFont(BODY, 20)
    m.top.findNode("sMusicLabel").font   = NewFont(BODY, 18)
    m.top.findNode("sMusicValue").font   = NewFont(BODY, 16)
    m.top.findNode("sDevLabel").font     = NewFont(BODY, 18)
    m.sDevValue.font                     = NewFont(BODY, 18)
    m.top.findNode("sP1Label").font      = NewFont(BODY, 18)
    m.sP1NamePreview.font                = NewFont(BODY, 17)
    m.top.findNode("sP1Arrow").font      = NewFont(BODY, 20)
    m.top.findNode("sP2Label").font      = NewFont(BODY, 18)
    m.sP2NamePreview.font                = NewFont(BODY, 17)
    m.top.findNode("sP2Arrow").font      = NewFont(BODY, 20)

    ' Profile overlay
    m.profileTopTitle.font               = NewFont(DISP, 22)
    m.top.findNode("pNameLabel").font    = NewFont(BODY, 18)
    m.top.findNode("pNameArrowL").font   = NewFont(BODY, 20)
    m.pNameValue.font                    = NewFont(BODY, 18)
    m.top.findNode("pNameArrowR").font   = NewFont(BODY, 20)
    m.top.findNode("pColorLabel").font   = NewFont(BODY, 18)
    m.top.findNode("pColorArrowL").font  = NewFont(BODY, 20)
    m.pColorValue.font                   = NewFont(BODY, 18)
    m.top.findNode("pColorArrowR").font  = NewFont(BODY, 20)
    m.top.findNode("pEffectLabel").font  = NewFont(BODY, 18)
    m.top.findNode("pEffectArrowL").font = NewFont(BODY, 20)
    m.pEffectValue.font                  = NewFont(BODY, 18)
    m.top.findNode("pEffectArrowR").font = NewFont(BODY, 20)
    m.top.findNode("profileHint").font   = NewFont(BODY, 13)

    ' ── Game data ──────────────────────────────────────────────
    ' ONE place to manage games. To add a game, copy a block below.
    ' Set available=false for a game whose component isn't built yet:
    ' it still gets a banner you can scroll to, but shows a "coming
    ' soon" message instead of trying to launch a missing component.
    '   stars     : 0-5 (filled stars in the rating)
    '   component : the roSGNode component name to launch
    '   available : false = banner only (no component needed yet)
    m.games = []

    addGame("TIC-TAC-TOE", "Classic X vs O", 1, "Easy", "~3 min", "2", "TicTacToeGame", true, [_
        ">"+chr(160)+"Take turns placing X and O", _
        ">"+chr(160)+"Get 3 in a row to win", _
        ">"+chr(160)+"Draw if the board fills up"])

    addGame("CHECKERS", "Strategy board game", 3, "Medium", "~15 min", "2", "CheckersGame", true, [_
        ">"+chr(160)+"Move your pieces diagonally", _
        ">"+chr(160)+"Jump over enemies to capture", _
        ">"+chr(160)+"King up by reaching the far side"])

    addGame("CONNECT 4", "Connect four in a row", 2, "Normal", "~5 min", "2", "Connect4Game", true, [_
        ">"+chr(160)+"Drop pieces into columns", _
        ">"+chr(160)+"Pieces fall to the lowest slot", _
        ">"+chr(160)+"Connect 4 in a row to win"])

    ' ── New game: banner only, not built yet (available = false) ──
    addGame("BLACKJACK", "Beat the dealer to 21", 3, "Medium", "~5 min", "1", "", false, [_
        ">"+chr(160)+"Get as close to 21 as you can", _
        ">"+chr(160)+"Hit for a card or stand to hold", _
        ">"+chr(160)+"Beat the dealer without busting"])

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
    m.settingsFocusRow = 0   ' 0=theme 1=effect 2=music 3=devMode 4=p1 5=p2

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

    ' Audio setup
    m.audio = m.top.findNode("homeAudio")
    m.audioContent = createObject("RoSGNode", "ContentNode")
    m.audioContent.url = "https://audio.jukehost.co.uk/019ecc42-a0f5-734e-bb6d-82ff21521e38"
    m.audioContent.streamFormat = "wav"
    m.audio.content = m.audioContent
    m.audio.control = "play"
    m.audio.loop = true

    m.scrollOffset = 0
    buildCards()
    applyHomeTheme()
    updateDetail()
    updateFocus()
    scrollToSelected()

    ' ── Game Music row (settings overlay) ──
    m.sMusicRow    = m.top.findNode("sMusicRow")
    m.sMusicRowBg  = m.top.findNode("sMusicRowBg")
    m.sMusicAccent = m.top.findNode("sMusicAccent")
    m.sMusicLabel  = m.top.findNode("sMusicLabel")
    m.sMusicValue  = m.top.findNode("sMusicValue")

    ' Background-music search task (created on demand when OK is pressed)
    m.musicTask  = invalid
    m.musicOn    = true       ' background track begins playing during init
    m.musicTitle = invalid    ' holds the searched track title once one is playing
end function

' ════════════════════════════════════════════════════════════
'  Game detail panel
' ════════════════════════════════════════════════════════════
sub updateDetail()
    g     = m.games[m.selectedCard]
    howTo = g.howTo
    m.detailGameTitle.text  = g.name
    m.detailTagline.text    = g.tagline
    m.statDiffValue.text    = starString(g.stars)
    m.statDiffText.text     = g.diff
    m.statLenValue.text     = g.length
    m.statPlayersValue.text = g.players
    m.howTo1.text           = howTo[0]
    m.howTo2.text           = howTo[1]
    m.howTo3.text           = howTo[2]
end sub

' ════════════════════════════════════════════════════════════
'  Game list: data, card construction, and scrolling
' ════════════════════════════════════════════════════════════

' Append one game to the catalog. Called from init().
sub addGame(name as String, tagline as String, stars as Integer, diff as String, length as String, players as String, component as String, available as Boolean, howTo as Object)
    g = {}
    g.name      = name
    g.tagline   = tagline
    g.stars     = stars
    g.diff      = diff
    g.length    = length
    g.players   = players
    g.component = component
    g.available = available
    g.howTo     = howTo
    m.games.Push(g)
end sub

' Build the ★/☆ rating string for a 0-5 score.
function starString(filled as Integer) as String
    s = ""
    for i = 1 to 5
        if i <= filled then s = s + chr(9733) else s = s + chr(9734)
    end for
    return s
end function

' Create one banner card per game inside the scrolling content group.
' Node refs for each card are stored in m.cards so focus/theme code can
' restyle them by index.
sub buildCards()
    DISP = "pkg:/fonts/Audiowide-Regular.ttf"
    BODY = "pkg:/fonts/ChakraPetch-Regular.ttf"

    ' Card geometry (matches the original hardcoded layout)
    m.cardWidth   = 502
    m.cardHeight  = 172
    m.cardSpacing = 182    ' card height + 10px gap
    m.viewportH   = 602    ' visible height of the cards viewport

    m.cards = []

    for i = 0 to m.games.Count() - 1
        g = m.games[i]

        card = m.cardsContent.createChild("Group")
        card.translation = [0, i * m.cardSpacing]

        bg = card.createChild("Rectangle")
        bg.width = m.cardWidth : bg.height = m.cardHeight : bg.color = "0x252545FF"

        accent = card.createChild("Rectangle")
        accent.width = 5 : accent.height = m.cardHeight : accent.color = "0x662D91FF"

        title = card.createChild("Label")
        title.width = 460 : title.height = 42 : title.translation = [18, 12]
        title.horizAlign = "left" : title.vertAlign = "center"
        title.font = NewFont(DISP, 24)
        title.text = g.name

        stars = card.createChild("Label")
        stars.width = 250 : stars.height = 28 : stars.translation = [18, 56]
        stars.horizAlign = "left" : stars.vertAlign = "center"
        stars.font.size = 18                 ' stars stay on the system font
        stars.color = "0xFFD700FF"
        stars.text = starString(g.stars)

        diff = card.createChild("Label")
        diff.width = 200 : diff.height = 22 : diff.translation = [18, 86]
        diff.horizAlign = "left" : diff.vertAlign = "center"
        diff.font = NewFont(BODY, 14)
        diff.text = g.diff

        length = card.createChild("Label")
        length.width = 460 : length.height = 22 : length.translation = [18, 118]
        length.horizAlign = "left" : length.vertAlign = "center"
        length.font = NewFont(BODY, 14)
        length.text = g.length + " avg"

        bTop = card.createChild("Rectangle")
        bTop.width = m.cardWidth : bTop.height = 3 : bTop.translation = [0, 0] : bTop.color = "0x00000000"
        bBot = card.createChild("Rectangle")
        bBot.width = m.cardWidth : bBot.height = 3 : bBot.translation = [0, 169] : bBot.color = "0x00000000"
        bLeft = card.createChild("Rectangle")
        bLeft.width = 3 : bLeft.height = m.cardHeight : bLeft.translation = [0, 0] : bLeft.color = "0x00000000"
        bRight = card.createChild("Rectangle")
        bRight.width = 3 : bRight.height = m.cardHeight : bRight.translation = [499, 0] : bRight.color = "0x00000000"

        ref = {}
        ref.card   = card : ref.bg = bg : ref.accent = accent : ref.title = title
        ref.stars  = stars : ref.diff = diff : ref.length = length
        ref.bTop   = bTop : ref.bBot = bBot : ref.bLeft = bLeft : ref.bRight = bRight
        m.cards.Push(ref)
    end for
end sub

' Scroll the cards content so the selected card is fully visible, and
' light up the up/down hint arrows when there's more above/below.
sub scrollToSelected()
    if m.cards = invalid then return

    selTop = m.selectedCard * m.cardSpacing
    selBot = selTop + m.cardHeight

    offset = m.scrollOffset
    if offset = invalid then offset = 0

    if selTop < offset then offset = selTop
    if selBot > offset + m.viewportH then offset = selBot - m.viewportH

    totalH = m.games.Count() * m.cardSpacing - (m.cardSpacing - m.cardHeight)
    maxOff = totalH - m.viewportH
    if maxOff < 0 then maxOff = 0
    if offset > maxOff then offset = maxOff
    if offset < 0 then offset = 0

    m.scrollOffset = offset
    m.cardsContent.translation = [0, -offset]

    t = getCurrentTheme()
    if offset > 0     then m.scrollUpHint.color   = t.accent else m.scrollUpHint.color   = "0x00000000"
    if offset < maxOff then m.scrollDownHint.color = t.accent else m.scrollDownHint.color = "0x00000000"
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
    dark.name="Dark" : dark.bg="0x003249FF" : dark.cardBg="0x004A66FF"
    dark.cardBgFocused="0x00658AFF" : dark.accent="0x007EA7FF"
    dark.text="0xCCDBDCFF" : dark.textSec="0x7FA8B0FF"
    dark.divider="0x0E4A63FF" : dark.gridLine="0x4F8A9AFF"
    dark.highlight="0x007EA766" : dark.selection="0x80CED766"
    dark.player1="0x007EA7FF" : dark.player2="0x9AD1D4FF"
    dark.boardLight="0x274257FF" : dark.boardDark="0x0E2233FF"
    dark.winColor="0x9AD1D4FF" : dark.cursorColor="0x007EA766"
    themes.Push(dark)

    light = {}
    light.name="Light" : light.bg="0xCCDBDCFF" : light.cardBg="0xEAF2F2FF"
    light.cardBgFocused="0x9AD1D4FF" : light.accent="0x007EA7FF"
    light.text="0x003249FF" : light.textSec="0x33687CFF"
    light.divider="0xA8C5C8FF" : light.gridLine="0x4E8A9CFF"
    light.highlight="0x007EA766" : light.selection="0x80CED766"
    light.player1="0x007EA7FF" : light.player2="0x003249FF"
    light.boardLight="0xEAF2F2FF" : light.boardDark="0xB8DCE0FF"
    light.winColor="0x007EA7FF" : light.cursorColor="0x007EA766"
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

    if m.cards <> invalid
        for i = 0 to m.cards.Count() - 1
            c = m.cards[i]
            c.accent.color = t.accent
            c.stars.color  = "0xFFD700FF"
            c.diff.color   = t.textSec
            c.length.color = t.gridLine
        end for
    end if

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

    if m.cards <> invalid
        for i = 0 to m.cards.Count() - 1
            c = m.cards[i]
            if i = m.selectedCard
                c.bg.color    = t.cardBgFocused
                c.title.color = t.accent
                setCardBorder(c, t.accent)
            else
                c.bg.color    = t.cardBg
                c.title.color = t.text
                setCardBorder(c, transparent)
            end if
        end for
    end if

    m.detailPlayHint.color = t.accent
end sub

sub setCardBorder(c as Object, color as String)
    c.bTop.color   = color
    c.bBot.color   = color
    c.bLeft.color  = color
    c.bRight.color = color
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
    if key = "replay"
        openSettings()
        return true
    else if key = "up"
        if m.selectedCard > 0
            m.selectedCard = m.selectedCard - 1
            updateDetail()
            updateFocus()
            scrollToSelected()
        end if
        return true
    else if key = "down"
        if m.selectedCard < m.games.Count() - 1
            m.selectedCard = m.selectedCard + 1
            updateDetail()
            updateFocus()
            scrollToSelected()
        end if
        return true
    else if key = "OK"
        launchGame(m.selectedCard)
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

    updateMusicLabel()
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
        maxRow = 3
        if m.devMode then maxRow = 5
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
            startMusicSearch()
        else if m.settingsFocusRow = 3
            toggleDevMode()
        else if m.settingsFocusRow = 4
            openProfile(1)
        else if m.settingsFocusRow = 5
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
    else if m.settingsFocusRow = 2
        ' Game Music row: LEFT/RIGHT toggles the audio on/off
        m.musicOn = not m.musicOn
        if m.musicOn
            m.audio.control = "play"
        else
            m.audio.control = "stop"
        end if
        updateMusicLabel()
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
        if m.settingsFocusRow > 3 then m.settingsFocusRow = 3
        updateSettingsFocus()
    end if
end sub

sub updateSettingsFocus()
    t           = getCurrentTheme()
    transparent = "0x00000000"

    ' Reset all rows
    m.sThemeRowBg.color   = t.cardBg : m.sThemeAccent.color   = transparent
    m.sEffectRowBg.color  = t.cardBg : m.sEffectAccent.color  = transparent
    m.sMusicRowBg.color   = t.cardBg : m.sMusicAccent.color   = transparent
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
        m.sMusicRowBg.color  = t.cardBgFocused
        m.sMusicAccent.color = t.accent
    else if m.settingsFocusRow = 3
        m.sDevRowBg.color  = t.cardBgFocused
        m.sDevAccent.color = t.accent
    else if m.settingsFocusRow = 4
        m.sP1RowBg.color  = t.cardBgFocused
        m.sP1Accent.color = t.accent
    else if m.settingsFocusRow = 5
        m.sP2RowBg.color  = t.cardBgFocused
        m.sP2Accent.color = t.accent
    end if
end sub

' ════════════════════════════════════════════════════════════
'  Game Music search + playback
' ════════════════════════════════════════════════════════════
sub startMusicSearch()
    dialog = CreateObject("roSGNode", "KeyboardDialog")
    dialog.title   = "Game Music"
    dialog.message = "Search for a track to play:"
    dialog.buttons = ["Search", "Cancel"]
    dialog.observeField("buttonSelected", "onMusicQueryDone")
    m.top.dialog = dialog
end sub

sub onMusicQueryDone()
    dialog = m.top.dialog
    if dialog = invalid then return

    confirmed = (dialog.buttonSelected = 0)
    queryText = ""
    if dialog.keyboard <> invalid then queryText = dialog.keyboard.text
    m.top.dialog = invalid

    if not confirmed then return
    if queryText = invalid or queryText.Trim() = "" then return

    m.sMusicValue.text = "Searching..."

    ' Kick off the cloud lookup task and wait for its response
    m.musicTask = CreateObject("roSGNode", "musicService")
    m.musicTask.observeField("response", "onMusicResponse")
    m.musicTask.query   = queryText.Trim()
    m.musicTask.control = "RUN"
end sub

sub onMusicResponse()
    if m.musicTask = invalid then return
    resp = m.musicTask.response

    if resp <> invalid and resp.url <> invalid
        title = "Now Playing"
        if resp.title <> invalid then title = resp.title

        fmt = "m4a"
        if resp.format <> invalid then fmt = resp.format

        track = CreateObject("roSGNode", "ContentNode")
        track.url          = resp.url
        track.streamFormat = fmt

        m.audio.control = "stop"
        m.audio.content = track
        m.audio.loop    = true
        m.audio.control = "play"

        m.musicTitle = title
        m.musicOn    = true
        updateMusicLabel()
    else
        m.sMusicValue.text = "No track found - Press OK to retry"
    end if
end sub

' Refresh the Game Music row label from current state. Called when the
' value changes and whenever Settings reopens (clears stale status text).
sub updateMusicLabel()
    if not m.musicOn
        m.sMusicValue.text = "Music Off  (LEFT/RIGHT to turn on)"
    else if m.musicTitle <> invalid
        m.sMusicValue.text = m.musicTitle
    else
        m.sMusicValue.text = "Press OK to Search Track"
    end if
end sub


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
sub launchGame(idx as Integer)
    g = m.games[idx]

    ' Game not built yet → show a message instead of launching nothing
    if not g.available or g.component = ""
        showComingSoon(g)
        return
    end if

    m.menuGroup.visible     = false
    m.gameContainer.visible = true

    gameNode = CreateObject("roSGNode", g.component)

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

' Shown when a banner with available=false is selected.
sub showComingSoon(g as Object)
    dialog = CreateObject("roSGNode", "Dialog")
    dialog.title   = g.name
    dialog.message = "This game isn't available yet - coming soon!"
    dialog.buttons = ["OK"]
    dialog.observeField("buttonSelected", "onComingSoonDismiss")
    m.top.dialog = dialog
end sub

sub onComingSoonDismiss()
    m.top.dialog = invalid
end sub

' ────────────────────────────────────────────────────────────
'  Build a Font node from a packaged TrueType file + size.
'  Returns a fresh node each call so per-label sizes stay independent.
' ────────────────────────────────────────────────────────────
function NewFont(uri as string, size as integer) as object
    f = createObject("roSGNode", "Font")
    f.uri  = uri
    f.size = size
    return f
end function
