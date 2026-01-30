#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
iniFilePath := A_ScriptDir "\settings.ini"
iconFilePath := A_ScriptDir "\img\icon.ico"
if (FileExist(iconFilePath)) {
    Menu, Tray, Icon, %iconFilePath%
}

res := "1080p"
maxLoopCount := 30
fishingLoopCount := 30
sellAllToggle := false
advancedFishingToggle := false
pathingMode := "Vip Pathing"
azertyPathing := false
autoUnequip := false
useNothing := false
nvidiaReplay := false
detectLimbo := false
detectTranscendents :=false
transcendentCounters := {}
transcendentColors := [0x060908, 0xC2C2C2, 0x566980]
transcendentColorNames := {}
transcendentColorNames[0x060908] := "Equinox1"
transcendentColorNames[0xC2C2C2] := "Equinox2"
transcendentColorNames[0x566980] := "Luminosity1"
lastTranscendentColor := ""
lastTranscendentColor2 := ""
snowmanCollect := false
strangeController := false
biomeRandomizer := false
autoCloseChat := false
privateServerLink := ""
globalFailsafeTimer := 0
fishingFailsafeTime := 31
pathingFailsafeTime := 61
autoRejoinFailsafeTime := 320
webhookURL := ""
webhookID := ""
clipWebhook := false
onoffWebhook := false
GlobalArea := false
TransArea := false
doPing := false
doPing2 := false
autocrafting := false
useCelestial := false
useExotic := false
useBounded := false
useZeus := false
usePoseidon := false
useHades := false
advancedFishingThreshold := 25
archDevice := false
steampunkAura := false
autoClicker := false
addFlows := false
IfAdded := ""
global ClipPending := false
global ClipType := ""


if (FileExist(iniFilePath)) {
    IniRead, tempRes, %iniFilePath%, Macro, resolution
    if (tempRes != "ERROR")
    {
        res := tempRes
    }
    IniRead, tempMaxLoop, %iniFilePath%, Macro, maxLoopCount
    if (tempMaxLoop != "ERROR" && tempMaxLoop > 0)
    {
        maxLoopCount := tempMaxLoop
    }
    IniRead, tempFishingLoop, %iniFilePath%, Macro, fishingLoopCount
    if (tempFishingLoop != "ERROR" && tempFishingLoop > 0)
    {
        fishingLoopCount := tempFishingLoop
    }
    IniRead, tempSellAll, %iniFilePath%, Macro, sellAllToggle
    if (tempSellAll != "ERROR")
    {
        sellAllToggle := (tempSellAll = "true" || tempSellAll = "1")
    }
    
    IniRead, tempPathing, %iniFilePath%, Macro, pathingMode
    if (tempPathing != "ERROR")
    {
        pathingMode := tempPathing
    }
    IniRead, tempAzerty, %iniFilePath%, Macro, azertyPathing
    if (tempAzerty != "ERROR")
    {
        azertyPathing := (tempAzerty = "true" || tempAzerty = "1")
    }
    IniRead, tempPrivateServer, %iniFilePath%, Macro, privateServerLink
    if (tempPrivateServer != "ERROR")
    {
        privateServerLink := tempPrivateServer
    }
    IniRead, tempAdvancedFishing, %iniFilePath%, Macro, advancedFishingToggle
    if (tempAdvancedFishing != "ERROR")
    {
        advancedFishingToggle := (tempAdvancedFishing = "true" || tempAdvancedFishing = "1")
    }
    IniRead, tempFishingFailsafe, %iniFilePath%, Macro, fishingFailsafeTime
    if (tempFishingFailsafe != "ERROR" && tempFishingFailsafe > 0)
    {
        fishingFailsafeTime := tempFishingFailsafe
    }
    IniRead, tempPathingFailsafe, %iniFilePath%, Macro, pathingFailsafeTime
    if (tempPathingFailsafe != "ERROR" && tempPathingFailsafe > 0)
    {
        pathingFailsafeTime := tempPathingFailsafe
    }
    IniRead, tempAutoRejoinFailsafe, %iniFilePath%, Macro, autoRejoinFailsafeTime
    if (tempAutoRejoinFailsafe != "ERROR" && tempAutoRejoinFailsafe > 0)
    {
        autoRejoinFailsafeTime := tempAutoRejoinFailsafe
    }
    IniRead, tempAutoUnequip, %iniFilePath%, Macro, autoUnequip
    if (tempAutoUnequip != "ERROR")
    {
        autoUnequip := (tempAutoUnequip = "true" || tempAutoUnequip = "1")
    }
    IniRead, tempUseNothing, %iniFilePath%, Macro, useNothing
    if (tempUseNothing != "ERROR")
    {
        useNothing := (tempUseNothing = "true" || tempUseNothing = "1")
    }
    IniRead, tempWebhook, %iniFilePath%, Macro, webhookURL
    if (tempWebhook != "ERROR")
    {
        webhookURL := tempWebhook
    }
    IniRead, tempWebhookID, %iniFilePath%, Macro, webhookID
    if (tempWebhookID != "ERROR")
    {
        webhookID := tempWebhookID
    }
    IniRead, tempClipWebhook, %iniFilePath%, Macro, ClipWebhook
    if (tempClipWebhook != "ERROR") {
    StringLower, tempClipWebhook, tempClipWebhook
    clipWebhook := (tempClipWebhook = "true" || tempClipWebhook = "1")
    }
    IniRead, tempOnoffWebhook, %iniFilePath%, Macro, onoffWebhook
    if (tempOnoffWebhook != "ERROR")
    onoffWebhook := (tempOnoffWebhook = "true" || tempOnoffWebhook = "1")

    IniRead, tempNvidiaReplay, %iniFilePath%, Macro, nvidiaReplay, false
    nvidiaReplay := (tempNvidiaReplay = "true" || tempNvidiaReplay = "1")

    IniRead, tempDetectTranscendent, %iniFilePath%, Macro, detectTranscendents, false
    detectTranscendents := (tempDetectTranscendent = "true" || tempDetectTranscendent = "1")

    IniRead, tempAutoCloseChat, %iniFilePath%, Macro, autoCloseChat, false
    autoCloseChat := (tempAutoCloseChat = "true" || tempAutoCloseChat = "1")

    IniRead, tempSnowmanCollect, %iniFilePath%, Macro, snowmanCollect
    if (tempSnowmanCollect != "ERROR")
    snowmanCollect := (tempSnowmanCollect = "true" || tempSnowmanCollect = "1")

    IniRead, tempBiomeRandomizer, %iniFilePath%, Macro, biomeRandomizer
    if (tempBiomeRandomizer != "ERROR")
    biomeRandomizer := (tempBiomeRandomizer = "true" || tempBiomeRandomizer = "1")

    IniRead, tempStrangeController, %iniFilePath%, Macro, strangeController
    if (tempStrangeController != "ERROR")
    strangeController := (tempStrangeController = "true" || tempStrangeController = "1")

    IniRead, tempAzerty, %iniFilePath%, Macro, azertyPathing
    if (tempAzerty != "ERROR")
    azertyPathing := (tempAzerty = "true" || tempAzerty = "1")

    IniRead, tempDetectLimbo, %iniFilePath%, Macro, detectLimbo
    if (tempDetectLimbo != "ERROR")
    detectLimbo := (tempDetectLimbo = "true" || tempDetectLimbo = "1")

    IniRead, tempGlobalArea, %iniFilePath%, Macro, globalArea
    if (tempGlobalArea != "ERROR")
    globalArea := (tempGlobalArea = "true" || tempGlobalArea = "1")

    IniRead, tempTransArea, %iniFilePath%, Macro, transArea
    if (tempTransArea != "ERROR")
    transArea := (tempTransArea = "true" || tempTransArea = "1")

    IniRead, tempDoPing, %iniFilePath%, Macro, doPing
    if (tempDoPing != "ERROR")
    doPing := (tempDoPing = "true" || tempDoPing = "1")

    IniRead, tempDoPing2, %iniFilePath%, Macro, doPing2
    if (tempDoPing2 != "ERROR")
    doPing2 := (tempDoPing2 = "true" || tempDoPing2 = "1")

    IniRead, tempCelestial, %iniFilePath%, Macro, useCelestial
    if (tempCelestial != "ERROR")
    useCelestial := (tempCelestial = "true" || tempCelestial = "1")

    IniRead, tempExotic, %iniFilePath%, Macro, useExotic
    if (tempExotic != "ERROR")
    useExotic := (tempExotic = "true" || tempExotic = "1")

    IniRead, tempBounded, %iniFilePath%, Macro, useBounded
    if (tempBounded != "ERROR")
    useBounded := (tempBounded = "true" || tempBounded = "1")

    IniRead, tempZeus, %iniFilePath%, Macro, useZeus
    if (tempZeus != "ERROR")
    useZeus := (tempZeus = "true" || tempZeus = "1")

    IniRead, tempPoseidon, %iniFilePath%, Macro, usePoseidon
    if (tempPoseidon != "ERROR")
    usePoseidon := (tempPoseidon = "true" || tempPoseidon = "1")

    IniRead, tempHades, %iniFilePath%, Macro, useHades
    if (tempHades != "ERROR")
    useHades := (tempHades = "true" || tempHades = "1")

    IniRead, tempArchDevice, %iniFilePath%, Macro, archDevice
    if (tempArchDevice != "ERROR")
    archDevice := (tempArchDevice = "true" || tempArchDevice = "1")

    IniRead, tempSteampunkAura, %iniFilePath%, Macro, steampunkAura
    if (tempSteampunkAura != "ERROR")
    steampunkAura := (tempSteampunkAura = "true" || tempSteampunkAura = "1")

    IniRead, tempAutoClicker, %iniFilePath%, Macro, autoClicker
    if (tempAutoClicker != "ERROR")
    autoClicker := (tempAutoClicker = "true" || tempAutoClicker = "1")

    IniRead, tempAddFlows, %iniFilePath%, Macro, addFlows
    if (tempAddFlows != "ERROR")
    addFlows := (tempAddFlows = "true" || tempAddFlows = "1")


    IniRead, tempAdvancedThreshold, %iniFilePath%, Macro, advancedFishingThreshold
    if (tempAdvancedThreshold != "ERROR" && tempAdvancedThreshold >= 0 && tempAdvancedThreshold <= 40)
    {
        advancedFishingThreshold := tempAdvancedThreshold
    }
}


version := "Aery's v1.2"
code := ""
if RegExMatch(privateServerLink, "code=([^&]+)", m)
{
    code := m1
}



if (shuffle = 1) {
    dev1_name := "maxstellar"
    dev1_discord := "Twitch"
    dev1_role := "Lead Developer"
    dev2_name := "ivelchampion249"
    dev2_discord := "Youtube"
    dev2_role := "Original Creator"
    dev3_name := "cresqnt"
    dev3_discord := "Scope Development (other macros)"
    dev3_role := "Frontend Developer"
} else if (shuffle = 2) {
    dev1_name := "maxstellar"
    dev1_discord := "Twitch"
    dev1_role := "Lead Developer"
    dev2_name := "cresqnt"
    dev2_discord := "Scope Development (other macros)"
    dev2_role := "Frontend Developer"
    dev3_name := "ivelchampion249"
    dev3_discord := "Youtube"
    dev3_role := "Original Creator"
} else if (shuffle = 3) {
    dev1_name := "cresqnt"
    dev1_discord := "Scope Development (other macros)"
    dev1_role := "Frontend Developer"
    dev2_name := "ivelchampion249"
    dev2_discord := "Youtube"
    dev2_role := "Original Creator"
    dev3_name := "maxstellar"
    dev3_discord := "Twitch"
    dev3_role := "Lead Developer"
} else if (shuffle = 4) {
    dev1_name := "cresqnt"
    dev1_discord := "Scope Development (other macros)"
    dev1_role := "Frontend Developer"
    dev2_name := "maxstellar"
    dev2_discord := "Twitch"
    dev2_role := "Lead Developer"
    dev3_name := "ivelchampion249"
    dev3_discord := "Youtube"
    dev3_role := "Original Creator"
} else if (shuffle = 5) {
    dev1_name := "ivelchampion249"
    dev1_discord := "Youtube"
    dev1_role := "Original Creator"
    dev2_name := "maxstellar"
    dev2_discord := "Twitch"
    dev2_role := "Lead Developer"
    dev3_name := "cresqnt"
    dev3_discord := "Scope Development (other macros)"
    dev3_role := "Frontend Developer"
} else {
    dev1_name := "ivelchampion249"
    dev1_discord := "Youtube"
    dev1_role := "Original Creator"
    dev2_name := "cresqnt"
    dev2_discord := "Scope Development (other macros)"
    dev2_role := "Frontend Developer"
    dev3_name := "maxstellar"
    dev3_discord := "Twitch"
    dev3_role := "Lead Developer"
}

dev1_img := ""
dev2_img := ""
dev3_img := ""

if (dev1_name = "ivelchampion249") {
    dev1_img := A_ScriptDir . "\img\Ivel.png"
} else if (dev1_name = "maxstellar") {
    dev1_img := A_ScriptDir . "\img\maxstellar.png"
} else if (dev1_name = "cresqnt") {
    dev1_img := A_ScriptDir . "\img\cresqnt.png"
}

if (dev2_name = "ivelchampion249") {
    dev2_img := A_ScriptDir . "\img\Ivel.png"
} else if (dev2_name = "maxstellar") {
    dev2_img := A_ScriptDir . "\img\maxstellar.png"
} else if (dev2_name = "cresqnt") {
    dev2_img := A_ScriptDir . "\img\cresqnt.png"
}

if (dev3_name = "ivelchampion249") {
    dev3_img := A_ScriptDir . "\img\Ivel.png"
} else if (dev3_name = "maxstellar") {
    dev3_img := A_ScriptDir . "\img\maxstellar.png"
} else if (dev3_name = "cresqnt") {
    dev3_img := A_ScriptDir . "\img\cresqnt.png"
}

Gui, Color, 0x1E1E1E
Gui, Font, s17 cWhite Bold, Segoe UI
Gui, Add, Text, x0 y10 w600 h45 Center BackgroundTrans c0x00D4FF, Aery's fishSol v1.2
Gui, Font, s12 cWhite Bold, Segoe UI
Gui, Add, Text, x160 y35 w290 h20 Center BackgroundTrans c0x00D4FF, (Only Works In 1080p and Needs VIP)

Gui, Font, s10 cWhite Normal, Segoe UI
Gui, Add, Tab3, x15 y55 w570 h600 vMainTabs gTabChange c0xFFFFFF, Main|Misc|Replay|Webhook|Crafting|Failsafes|About

Gui, Tab, Main
Gui, Font, s9 cWhite Normal, Segoe UI

Gui, Add, GroupBox, x30 y85 w260 h120 cWhite, Control Panel
Gui, Font, s11 cWhite Bold
Gui, Add, Text, x45 y110 w60 h25 BackgroundTrans, Status:
Gui, Add, Text, x98 y110 w150 h25 vStatusText BackgroundTrans c0xFF4444, Stopped

Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, Button, x45 y140 w70 h35 gStartScript vStartBtn c0x00AA00 +0x8000, Start
Gui, Add, Button, x125 y140 w70 h35 gPauseScript vPauseBtn c0xFFAA00 +0x8000, Pause
Gui, Add, Button, x205 y140 w70 h35 gCloseScript vStopBtn c0xFF4444 +0x8000, Stop

Gui, Font, s8 c0xCCCCCC
Gui, Add, Text, x45 y185 w240 h15 BackgroundTrans, Hotkeys: F1=Start - F2=Pause - F3=Stop

Gui, Add, GroupBox, x305 y85 w260 h120 cWhite, Configuration
Gui, Font, s10 cWhite Bold
Gui, Add, Text, x320 y110 w80 h25 BackgroundTrans, Resolution:
Gui, Font, s13 cWhite Bold
Gui, Add, Text, x320 y135 w80 h25 BackgroundTrans, 1080p

Gui, Font, s10 cWhite Bold
Gui, Add, Button, x320 y170 w100 h25 gToggleSellAll vSellAllBtn, Toggle Sell All
Gui, Font, s10 c0xCCCCCC
Gui, Add, Text, x435 y174 w100 h25 vSellAllStatus BackgroundTrans, OFF

Gui, Add, GroupBox, x30 y215 w535 h120 cWhite, Loop Count Settings
Gui, Font, s10 cWhite Bold
Gui, Add, Text, x45 y240 w180 h25 BackgroundTrans, Fishing Loop Count:
Gui, Add, Edit, x220 y238 w60 h25 vMaxLoopInput gUpdateLoopCount Number Background0xD3D3D3 cBlack, %maxLoopCount%
Gui, Font, s8 c0xCCCCCC
Gui, Add, Text, x285 y242 w270 h15 BackgroundTrans, (How many times to fish before selling. Default: 30)
Gui, Font, s10 cWhite Bold
Gui, Add, Text, x45 y270 w180 h25 BackgroundTrans, Sell Loop Count:
Gui, Add, Edit, x220 y268 w60 h25 vFishingLoopInput gUpdateLoopCount Number Background0xD3D3D3 cBlack, %fishingLoopCount%
Gui, Font, s8 c0xCCCCCC
Gui, Add, Text, x285 y272 w270 h15 BackgroundTrans, (There's is 56 Fish in the game. Default: 30)   

Gui, Font, s10 cWhite Bold
Gui, Add, Text, x45 y301 w120 h25 BackgroundTrans, Pathing Mode:
Gui, Font, s14 cWhite Bold
Gui, Add, Text, x145 y296 w135 h25 BackgroundTrans, VIP Pathing

Gui, Font, s10 cWhite Bold
Gui, Add, Text, x295 y301 w120 h25 BackgroundTrans, AZERTY Pathing:
Gui, Add, Button, x415 y298 w80 h25 gToggleAzertyPathing vAzertyPathingBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x510 y303 w60 h25 vAzertyPathingStatus BackgroundTrans, OFF


Gui, Font, s11 cWhite Bold
Gui, Add, GroupBox, x250 y343 w315 h197, Advanced Fishing Detection
Gui, Font, s10 cWhite Bold
Gui, Add, Button, x270 y380 w80 h25 gToggleAdvancedFishingDetection vAdvancedFishingDetectionBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x360 y384 w60 h25 vAdvancedFishingDetectionStatus BackgroundTrans, OFF
Gui, Font, s10 cWhite Bold
Gui, Add, Text, x400 y384 w80 h25 BackgroundTrans, Pixels:
Gui, Add, Edit, x455 y380 w75 h25 vAdvancedThresholdInput gUpdateAdvancedThreshold Number Background0xD3D3D3 cBlack, %advancedFishingThreshold%
Gui, Font, s9 cWhite Bold
Gui, Add, Text, x270 y415 w260 cWhite BackgroundTrans, Advanced Detection Threshold -
Gui, Font, s9 cWhite Normal
Gui, Add, Text, x270 y435 w270 h40 BackgroundTrans c0xCCCCCC, Customize how many pixels are left in the fishing range before clicking.
Gui, Font, s9 cWhite Bold
Gui, Add, Text, x453 y416 w120 BackgroundTrans c0xFF4444, Max : 40 Pixels
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Text, x270 y470 w285 h30 BackgroundTrans, Advanced Fishing Detection uses a system that clicks slightly before the bar exits the fish range, making the catch rate higher than ever.
Gui, Font, s9 c0x00D4FF Bold
Gui, Add, Text, x297 y503 w515 h30 BackgroundTrans c0x00D4FF, [ Recommended For Lower End Devices ]



Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x30 y345 w205 h95 cWhite, Live Statistics
Gui, Color, 0x1E1E1E
Gui, Font, s11 cWhite Bold, Segoe UI
Gui, Add, Text, x50 y375 w100 h30 BackgroundTrans, Runtime:
Gui, Add, Text, x120 y375 w120 h30 vRuntimeText BackgroundTrans c0x00DD00, 00:00:00
Gui, Add, Text, x50 y405 w100 h30 BackgroundTrans, Cycles:
Gui, Add, Text, x102 y405 w120 h30 vCyclesText BackgroundTrans c0x00DD00, 0

Gui, Font, s10 c0xCCCCCC Bold
Gui, Add, Text, x175 y570 w500 h20 BackgroundTrans, Roblox MUST be in fullscreen mode

Gui, Tab, Misc

Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, GroupBox, x22 y90 w260 h195 cWhite, Auto-Unequip
Gui, Font, s9 cWhite Normal
Gui, Add, Text, x35 y110 h45 w240 BackgroundTrans c0xCCCCCC, Automatically unequip rolled auras every cycle. Prevents lag and possible macro issues.
Gui, Add, Text, x35 y210 h45 w240 BackgroundTrans c0xCCCCCC, Equips "Nothing" instead of equipping and unequipping your first aura in your storage.
Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, Text, x32 y190 h45 w240 BackgroundTrans, Use "Nothing" Aura.
Gui, Font, s10 cWhite Bold
Gui, Add, Button, x35 y145 w80 h25 gToggleAutoUnequip vAutoUnequipBtn, Toggle
Gui, Add, Button, x35 y245 w80 h25 gToggleUseNothing vUseNothingBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x130 y148 w60 h25 vAutoUnequipStatus BackgroundTrans, OFF
Gui, Add, Text, x130 y248 w60 h25 vUseNothingStatus BackgroundTrans, OFF

Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, GroupBox, x307 y90 w270 h100 cWhite, Auto-Close Chat
Gui, Font, s9 cWhite Normal
Gui, Add, Text, x317 y110 h45 w255 BackgroundTrans c0xCCCCCC, Automatically detects if chat is open and if so, closes it to prevent getting stuck in collection.
Gui, Font, s10 cWhite Bold
Gui, Add, Button, x320 y150 w80 h25 gToggleAutoCloseChat vAutoCloseChatBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x415 y153 w60 h25 vAutoCloseChatStatus BackgroundTrans, OFF

Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x307 y190 w270 h135 cWhite, Auto-Clicker
Gui, Add, Button, x320 y285 w80 h25 gStartAutoClicker vAutoClickStart, Start
Gui, Add, Button, x410 y285 w80 h25 gStopAutoClicker  vAutoClickStop Disabled, Stop
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x500 y289 w60 h25 vAutoClickerStatus BackgroundTrans, OFF
Gui, Font, s10 cWhite Bold
Gui, Add, Text, x320 y260 w90 h20 BackgroundTrans, Delay (sec):
Gui, Font, s9 cBlack Bold
Gui, Add, Edit, x405 y260 w60 h22 vAutoClickDelay, 60
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Text, x317 y210 w255 h135 BackgroundTrans c0xCCCCCC, Automatically clicks after the desired seconds to prevent disconnection.

Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x307 y340 w270 h95 cWhite, Snowman Collect
Gui, Add, Button, x320 y400 w80 h25 gToggleSnowmanCollect vSnowmanCollectBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x415 y403 w60 h25  vSnowmanCollectStatus BackgroundTrans, OFF
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Text, x317 y360 w280 h135 BackgroundTrans c0xCCCCCC, Goes to Lime's snowman to collect snowflakes before going to the fish sell shop.

Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x22 y296 w270 h139 cWhite, Biome/Strange Controller:
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Text, x37 y318 w255 h30 BackgroundTrans, Uses Biome Randomizer and/or Strange Controller before going to the fish sell shop.

Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, Text, x30 y355 w120 h25 BackgroundTrans, Strange Controller:
Gui, Add, Button, x157 y355 w80 h25 gToggleStrangeController vStrangeControllerBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x257 y360 w60 h25 vStrangeControllerStatus BackgroundTrans, OFF

Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, Text, x30 y395 w125 h25 BackgroundTrans, Biome Randomizer:
Gui, Add, Button, x157 y395 w80 h25 gToggleBiomeRandomizer vBiomeRandomizerBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x257 y398 w60 h25 vBiomeRandomizerStatus BackgroundTrans, OFF



Gui, Tab, Replay
Gui, Font, s13 cWhite Bold, Segoe UI
Gui, Add, Text, x230 y93 w250 h75 BackgroundTrans, [ Nvidia Replay ]
Gui, Add, Button, x208 y600 w180 h40 gOpenNvidiaNotes, Tutorial/Disclaimers

; Globals

Gui, Font, s11 cWhite Bold, Segoe UI
Gui, Add, GroupBox, x33 y120 w534 h135 cWhite, Clip Globals
Gui, Font, s10 c0xCCCCCC Normal
Gui, Add, Text, x45 y140 w515 h135 BackgroundTrans, (BETA) Automatically clips with Nvidia's Instant Replay when detecting if your screen has turned white. This means it only clips auras rolled above 99M+.                                   Example: Clips breakthrough Gargantua, but not in starfall/rune.
Gui, Font, s8 c0xCCCCCC Normal
Gui, Add, Text, x45 y237 w534 h135 BackgroundTrans, May clip Pixelation too.
Gui, Font, s9 cWhite Bold
Gui, Add, Text, x183 y211 w424 h135 BackgroundTrans, ! This automatically starts when toggle is ON !
Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, Button, x45 y209 w80 h25 gToggleNvidiaReplay vNvidiaReplayBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x143 y211 w70 h25 vNvidiaReplayStatus BackgroundTrans, OFF

; Transcendents

Gui, Font, s11 cWhite Bold
Gui, Add, GroupBox, x33 y265 w534 h120 cWhite, Clip Transcendents
Gui, Font, s10 c0xCCCCCC Normal
Gui, Add, Text, x45 y285 w515 h145 BackgroundTrans, (BETA) Automatically clips with Nvidia's Instant Replay when detecting a Transcendent's cutscene. Not guaranteed to work. Works for Pixelation, Luminosity, Breakthrough, Equinox and Leviathan
Gui, Font, s9 cWhite Bold
Gui, Add, Text, x183 y350 w424 h135 BackgroundTrans, ! This automatically starts when toggle is ON !
Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, Button, x45 y345 w80 h25 gToggleDetectTranscendents vDetectTranscendentsBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x143 y348 w70 h25 vDetectTranscendentsStatus BackgroundTrans, OFF


; Limbo Gloabls

Gui, Font, s11 cWhite Bold
Gui, Add, GroupBox, x33 y390 w534 h120 cWhite, Detect and Contract Eden
Gui, Font, s8 c0xCCCCCC Normal
Gui, Add, Text, x45 y440 w520 h145 BackgroundTrans, Temporary until I find the motivation to be able to clip all the Limbo Globals
Gui, Font, s10 c0xCCCCCC Normal
Gui, Add, Text, x45 y410 w520 h145 BackgroundTrans, Automatically detects if Eden has spawned in and contracts with it. (Not even tested lol)
Gui, Font, s9 cWhite Bold
Gui, Add, Text, x183 y479 w400 h135 BackgroundTrans, 
Gui, Font, s10 cWhite Bold
Gui, Add, Text, x230 y477 w400 h135 BackgroundTrans, ! This automatically starts when toggle is ON !
Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, Button, x45 y475 w80 h25 gToggleDetectLimbo vDetectLimboBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x143 y478 w60 h25 vDetectLimboStatus BackgroundTrans, OFF


; Highlight Area

Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x33 y520 w534 h75 cWhite, Highlight Detection Area
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Text, x45 y540 w520 h145 BackgroundTrans, Highlights where it is detecting to clip Globals and Transcendents
Gui, Add, Text, x173 y566 w520 h145 BackgroundTrans, (Globals | Spamming = Lag)
Gui, Add, Text, x470 y566 w520 h145 BackgroundTrans, (Transcendents)
Gui, Font, s10 cWhite Bold
Gui, Add, Button, x45 y561 w80 h25 gToggleGlobalArea vGlobalAreaBtn, Toggle
Gui, Add, Button, x345 y561 w80 h25 gToggleTransArea vTransAreaBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold
Gui, Add, Text, x143 y566 w60 h25 vGlobalAreaStatus BackgroundTrans, OFF
Gui, Add, Text, x440 y566 w60 h25 vTransAreaStatus BackgroundTrans, OFF

Gui, Font, s10 cWhite Bold
Gui, Add, Text, x30 y618 w520 h145 BackgroundTrans, F6 to Cancel Clipping

Gui, Tab, Webhook

Gui, Font, s10 cWhite Normal Bold
Gui, Add, Text, x50 y125 w200 h25 BackgroundTrans, Discord Webhook URL:
Gui, Add, Edit, x50 y150 w500 h25 vWebhookInput gUpdateWebhook Background0xD3D3D3 cBlack, %webhookURL%
Gui, Font, s8 c0xCCCCCC Normal
Gui, Add, Text, x50 y180 w500 h15 BackgroundTrans, Paste your Discord webhook URL here to be notified of actions happening in real time.
Gui, Font, s10 cWhite Normal Bold
Gui, Add, Text, x50 y205 w200 h25 BackgroundTrans, Discord USERID:
Gui, Add, Edit, x50 y230 w500 h25 vUserIDInput gUpdateUserID Background0xD3D3D3 cBlack, %webhookID%
Gui, Font, s8 c0xCCCCCC Normal
Gui, Add, Text, x50 y260 w500 h15 BackgroundTrans, Paste your Discord USERID here to be pinged of actions happening in real time.


Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x33 y295 w534 h65 cWhite, Macro De/Activation Message
Gui, Add, Button, x60 y320 w80 h25 gToggleOnoffWebhook vOnoffWebhookBtn, Toggle
Gui, Add, Text, x150 y324 w60 h25 vOnoffWebhookStatus BackgroundTrans, OFF
Gui, Add, Button, x320 y320 w80 h25 gToggledoPing vDoPingBtn, Toggle
Gui, Add, Text, x410 y324 w60 h25 vDoPingStatus BackgroundTrans, OFF
Gui, Font, s10 cWhite Normal
Gui, Add, Text, x250 y324 w100 h25 BackgroundTrans c0xCCCCCC, Ping User: 

Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x33 y365 w534 h65 cWhite, Macro Clip Message
Gui, Add, Button, x60 y390 w80 h25 gToggleClipWebhook vClipWebhookBtn, Toggle
Gui, Add, Text, x150 y394 w60 h25 vClipWebhookStatus BackgroundTrans, OFF
Gui, Add, Button, x320 y390 w80 h25 gToggleDoPing2 vDoPing2Btn, Toggle
Gui, Add, Text, x410 y394 w60 h25 vDoPing2Status BackgroundTrans, OFF
Gui, Font, s10 cWhite Normal
Gui, Add, Text, x250 y394 w100 h25 BackgroundTrans c0xCCCCCC, Ping User: 
Gui, Font, s7 cWhite Normal
Gui, Add, Text, x465 y376 w80 h100 BackgroundTrans c0xCCCCCC, Messages and/or pings if anything has been clipped via Webhook.

Gui, Tab, Crafting

Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x22 y85 w554 h210 cWhite, Auto Craft
; Gui, Add, GroupBox, x45 y385 w200 h100 cWhite, Watch AD
Gui, Add, GroupBox, x30 y185 w210 h100 cWhite, Heavenly Potion
Gui, Add, GroupBox, x247 y185 w130 h100 cWhite, Bound Potion 
Gui, Add, GroupBox, x385 y185 w181 h100 cWhite, Godly Potions
Gui, Add, Text, x60 y157 w150 h50 BackgroundTrans, F4 = Start | F5 = Stop

Gui, Font, s10 cWhite Bold
Gui, Add, Button, x118 y205 w80 h25 gToggleUseCelestial vUseCelestialBtn, Toggle
Gui, Add, Button, x118 y245 w80 h25 gToggleUseExotic vUseExoticBtn, Toggle
Gui, Add, Text, x208 y209 w60 h25 vUseCelestialStatus BackgroundTrans, OFF
Gui, Add, Text, x208 y249 w60 h25 vUseExoticStatus BackgroundTrans, OFF
Gui, Font, s9 cWhite Normal
Gui, Add, Text, x38 y209 w600 h100 BackgroundTrans c0xCCCCCC, Add 
Gui, Add, Text, x38 y249 w600 h100 BackgroundTrans c0xCCCCCC, Add
Gui, Font, s9 c9B8CFF Bold, Trajan Pro
Gui, Add, Text, x64 y209 w600 h100 BackgroundTrans, Celestial:
Gui, Font, s9 cFF0000 Bold, Trajan Pro
Gui, Add, Text, x64 y249 w600 h100 BackgroundTrans, Exotic:

Gui, Font, s10 cWhite Bold
Gui, Add, Button, x258 y245 w80 h25 gToggleUseBounded vUseBoundedBtn, Toggle
Gui, Add, Text, x346 y249 w60 h25 vUseBoundedStatus BackgroundTrans, OFF
Gui, Font, s9 cWhite Normal
Gui, Add, Text, x258 y209 w600 h100 BackgroundTrans c0xCCCCCC, Add
Gui, Font, s9 c1559C9 Bold, Trajan Pro
Gui, Add, Text, x285 y209 w600 h100 BackgroundTrans, Bounded:

Gui, Font, s9 cWhite Bold, Segoe UI
Gui, Add, Button, x480 y205 w50 h15 gToggleUseZeus vUseZeusBtn, Toggle
Gui, Add, Button, x480 y234 w50 h15 gToggleUseHades vUseHadesBtn, Toggle
Gui, Add, Button, x480 y260 w50 h15 gToggleUsePoseidon vUsePoseidonBtn, Toggle
Gui, Add, Text, x535 y207 w60 h25 vUseZeusStatus BackgroundTrans, OFF
Gui, Add, Text, x535 y236 w60 h25 vUseHadesStatus BackgroundTrans, OFF
Gui, Add, Text, x535 y262 w60 h25 vUsePoseidonStatus BackgroundTrans, OFF
Gui, Font, s9 cWhite Normal, Trajan Pro
Gui, Add, Text, x395 y209 w600 h100 BackgroundTrans c0xCCCCCC, Add
Gui, Add, Text, x395 y234 w600 h100 BackgroundTrans c0xCCCCCC, Add
Gui, Add, Text, x395 y260 w600 h100 BackgroundTrans c0xCCCCCC, Add  
Gui, Font, s9 cFFD700 Bold, Trajan Pro
Gui, Add, Text, x422 y209 w600 h100 BackgroundTrans, Zeus:
Gui, Font, s9 cCC5500 Bold, Trajan Pro
Gui, Add, Text, x422 y234 w600 h100 BackgroundTrans, Hades:
Gui, Font, s9 c085A8C Bold, Trajan Pro
Gui, Add, Text, x422 y260 w600 h100 BackgroundTrans, Poseidon:

Gui, Font, s9 cWhite Normal
Gui, Add, Text, x35 y105 w534 h100 BackgroundTrans c0xCCCCCC, Adds the nessecary potions and/or auras to craft potions. Please already put the desired item on auto craft. MUST be inside Stella's Cauldron's UI. Adding the auras listed below means adding them to the desired potion from your inventory.

Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, DropDownList, x245 y155 w120 vAutoCraft gSelectItem, Heavenly Potion|Bound Potion|Zeus Potion|Hades Potion|Poseidon Potion|Jewelry Potion|Zombie Potion|Rage Potion|Diver Potion




Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x300 y300 w276 h95 cWhite, Craft Matrix: Steampunk
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Text, x315 y320 w260 h60 BackgroundTrans, Automatically adds auras to the Angel Device before going to the fish sell shop.
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Button, x315 y360 w70 h25 gToggleSteampunkAura vSteampunkAuraBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x403 y364 w60 h25 vSteampunkAuraStatus BackgroundTrans, OFF

Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x22 y400 w271 h95 cWhite, Add Flows to Runic Device
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Text, x37 y420 w260 h60 BackgroundTrans, Automatically adds Flows to the Runic Device before going to the fish sell shop.
Gui, Add, Text, x37 y500 w310 h60 BackgroundTrans, (ill prob not add the other auras, i had said i wasnt gonna add ts already)
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Button, x37 y460 w70 h25 gToggleAddFlows vAddFlowsBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x120 y464 w60 h25 vAddFlowsStatus BackgroundTrans, OFF

Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x22 y300 w271 h95 cWhite, Craft Angel Device
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Text, x37 y320 w260 h60 BackgroundTrans, Automatically adds auras to the Angel Device before going to the fish sell shop.
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Button, x37 y360 w70 h25 gToggleArchDevice vArchDeviceBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x120 y364 w60 h25 vArchDeviceStatus BackgroundTrans, OFF


Gui, Tab, Failsafes

Gui, Add, Progress, x23 y99 w554 h2 Background871C00
Gui, Add, Progress, x23 y100 w2 h32 Background871C00
Gui, Add, Progress, x575 y100 w2 h32 Background871C00
Gui, Add, Progress, x208 y99 w180 h27 Background0x1E1E1E
Gui, Font, s12 cWhite Bold, Segoe UI
Gui, Add, Text, x30 y90 w535 h30 Center BackgroundTrans c0xFF2C00,  [ ! Handle With Care ! ]
Gui, Add, Progress, x23 y463 w554 h2 Background0x871C00
Gui, Add, Progress, x23 y430 w2 h35 Background0x871C00
Gui, Add, Progress, x575 y430 w2 h35 Background871C00
Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, GroupBox, x32 y110 w533 h225 cWhite, Auto-Rejoin Failsafe
Gui, Font, s10 cWhite Normal
Gui, Add, Text, x50 y140 w500 h40 BackgroundTrans c0xCCCCCC, If the fishing minigame is not detected for the specified time, the macro will`nautomatically rejoin using the private server link below.
Gui, Font, s10 cWhite Bold
Gui, Add, Text, x50 y190 w150 h25 BackgroundTrans, Private Server Link:
Gui, Add, Edit, x50 y215 w500 h25 vPrivateServerInput gUpdatePrivateServer Background0xD3D3D3 cBlack, %privateServerLink%
Gui, Font, s8 c0xCCCCCC Normal
Gui, Add, Text, x50 y245 w500 h15 BackgroundTrans, Paste your Roblox private server link here (leave empty to disable)
Gui, Font, s10 cWhite Normal
Gui, Add, Text, x79 y306 w450 h40 BackgroundTrans c0xCCCCCC, Customize how long until the Auto-Rejoin Failsafe triggers. (Default : 320)
Gui, Font, s11 cWhite Bold
Gui, Add, Text, x145 y275 w150 h25 BackgroundTrans, Seconds:
Gui, Add, Edit, x218 y272 w150 h25 vAutoRejoinFailsafeInput gUpdateAutoRejoinFailsafe Number Background0xD3D3D3 cBlack, %autoRejoinFailsafeTime%
Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, GroupBox, x32 y340 w260 h105 cWhite, Fishing Failsafe
Gui, Font, s9 cWhite Normal
Gui, Add, Text, x45 y370 w230 h40 BackgroundTrans c0xCCCCCC, Customize how long until the Fishing Failsafe triggers. (Default : 31)
Gui, Font, s11 cWhite Bold
Gui, Add, Text, x45 y413 w150 h35 BackgroundTrans, Seconds:
Gui, Add, Edit, x125 y411 w150 h25 vFishingFailsafeInput gUpdateFishingFailsafe Number Background0xD3D3D3 cBlack, %fishingFailsafeTime%
Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, GroupBox, x307 y340 w258 h105 cWhite, Pathing Failsafe
Gui, Font, s9 cWhite Normal
Gui, Add, Text, x320 y370 w230 h45 BackgroundTrans c0xCCCCCC, Customize how long until the Pathing Failsafe triggers. (Default : 61)
Gui, Font, s11 cWhite Bold
Gui, Add, Text, x320 y413 w150 h35 BackgroundTrans, Seconds:
Gui, Add, Edit, x400 y411 w150 h25 vPathingFailsafeInput gUpdatePathingFailsafe Number Background0xD3D3D3 cBlack, %pathingFailsafeTime%


Gui, Tab, About

Gui, Font, s14 cWhite Bold, Segoe UI
Gui, Add, Text, x30 y90 w535 h30 Center BackgroundTrans c0x00D4FF, Original fishSol Creators

Gui, Add, Picture, x50 y130 w50 h50, %dev1_img%
Gui, Font, s11 cWhite Bold
if (dev1_name = "cresqnt") {
    Gui, Add, Text, x110 y135 w200 h20 BackgroundTrans c0x0088FF gDev1NameClick, %dev1_name%
} else {
    Gui, Add, Text, x110 y135 w200 h20 BackgroundTrans c0x00DD00, %dev1_name%
}
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Text, x110 y155 w300 h15 BackgroundTrans, %dev1_role%
Gui, Add, Text, x110 y170 w300 h15 BackgroundTrans c0x0088FF gDev1LinkClick, %dev1_discord%

Gui, Add, Picture, x50 y195 w50 h50, %dev2_img%
Gui, Font, s11 cWhite Bold
if (dev2_name = "cresqnt") {
    Gui, Add, Text, x110 y200 w200 h20 BackgroundTrans c0x0088FF gDev2NameClick, %dev2_name%
} else {
    Gui, Add, Text, x110 y200 w200 h20 BackgroundTrans c0x00DD00, %dev2_name%
}
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Text, x110 y220 w300 h15 BackgroundTrans, %dev2_role%
Gui, Add, Text, x110 y235 w300 h15 BackgroundTrans c0x0088FF gDev2LinkClick, %dev2_discord%

Gui, Add, Picture, x50 y260 w50 h50, %dev3_img%
Gui, Font, s11 cWhite Bold
if (dev3_name = "cresqnt") {
    Gui, Add, Text, x110 y265 w200 h20 BackgroundTrans c0x0088FF gDev3NameClick, %dev3_name%
} else {
    Gui, Add, Text, x110 y265 w200 h20 BackgroundTrans c0x00DD00, %dev3_name%
}
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Text, x110 y285 w300 h15 BackgroundTrans, %dev3_role%
Gui, Add, Text, x110 y300 w300 h15 BackgroundTrans c0x0088FF gDev3LinkClick, %dev3_discord%

Gui, Font, s8 c0x888888
Gui, Add, Text, x50 y325 w480 h1 0x10 BackgroundTrans

url := "https://raw.githubusercontent.com/ivelchampion249/FishSol-Macro/refs/heads/main/DONATORS.txt"

Http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
Http.Open("GET", url, false)
Http.Send()

content := Http.ResponseText

Gui, Font, s10 cWhite Bold
Gui, Add, Text, x50 y345 w2000 h20 BackgroundTrans, Hope you enjoy my fishSol! Donators of Original fishSol:
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Edit, x50 y370 w480 h95 vDonatorsList -Wrap +ReadOnly +VScroll -WantReturn -E0x200 Background0x2D2D2D c0xCCCCCC, %content%

Gui, Font, s8 c0x888888
Gui, Add, Text, x50 y490 w480 h1 0x10 BackgroundTrans

Gui, Font, s8 c0xCCCCCC Normal
Gui, Add, Text, x50 y500 w500 h15 BackgroundTrans, Aery's fishSol v1.2
Gui, Add, Text, x50 y525 w500 h15 BackgroundTrans c0x0088FF gReleasesClick +0x200, https://github.com/knowaery/Aery-s-Fishsol

Gui, Show, w600 h670,  Aery's fishSol v1.2

if (res = "1080p") {
    GuiControl, Choose, Resolution, 1
} else if (res = "1440p") {
    GuiControl, Choose, Resolution, 2
} else if (res = "1366x768") {
    GuiControl, Choose, Resolution, 3
} else {
    GuiControl, Choose, Resolution, 1
    res := "1080p"
}

if (sellAllToggle) {
    GuiControl,, SellAllStatus, ON
    GuiControl, +c0x00DD00, SellAllStatus
} else {
    GuiControl,, SellAllStatus, OFF
    GuiControl, +c0xFF4444, SellAllStatus
}

if (advancedFishingDetection) {
    GuiControl,, AdvancedFishingDetectionStatus, ON
    GuiControl, +c0x00DD00, AdvancedFishingDetectionStatus
} else {
    GuiControl,, AdvancedFishingDetectionStatus, OFF
    GuiControl, +c0xFF4444, AdvancedFishingDetectionStatus
}

if (pathingMode = "Vip Pathing") {
    GuiControl, Choose, PathingMode, 1
} else if (pathingMode = "Non Vip Pathing") {
    GuiControl, Choose, PathingMode, 2
} else if (pathingMode = "Abyssal Pathing") {
    GuiControl, Choose, PathingMode, 3
} else {
    GuiControl, Choose, PathingMode, 1
    pathingMode := "Vip Pathing"
}

if (azertyPathing) {
    GuiControl,, AzertyPathingStatus, ON
    GuiControl, +c0x00DD00, AzertyPathingStatus
} else {
    GuiControl,, AzertyPathingStatus, OFF
    GuiControl, +c0xFF4444, AzertyPathingStatus
}
if (autoUnequip) {
    GuiControl,, AutoUnequipStatus, ON
    GuiControl, +c0x00DD00, AutoUnequipStatus
} else {
    GuiControl,, AutoUnequipStatus, OFF
    GuiControl, +c0xFF4444, AutoUnequipStatus
}
if (useNothing) {
    GuiControl,, UseNothingStatus, ON
    GuiControl, +c0x00DD00, UseNothingStatus
} else {
    GuiControl,, UseNothingStatus, OFF
    GuiControl, +c0xFF4444, UseNothingStatus
}
if (autoCloseChat) {
    GuiControl,, AutoCloseChatStatus, ON
    GuiControl, +c0x00DD00, AutoCloseChatStatus
} else {
    GuiControl,, AutoCloseChatStatus, OFF
    GuiControl, +c0xFF4444, AutoCloseChatStatus
}
if (snowmanCollect) {
    GuiControl,, SnowmanCollectStatus, ON
    GuiControl, +c0x00DD00, SnowmanCollectStatus
} else {
    GuiControl,, SnowmanCollectStatus, OFF
    GuiControl, +c0xFF4444, SnowmanCollectStatus
}
if (detectLimbo) {
    GuiControl,, DetectLimboStatus, ON
    GuiControl, +c0x00DD00, DetectLimboStatus
    triggerDelay3 := 20000
    SetTimer, CheckPixel3, 50
} else {
    GuiControl,, DetectLimboStatus, OFF
    GuiControl, +c0xFF4444, DetectLimboStatus
    SetTimer, CheckPixel3, Off
}
if (biomeRandomizer) {
    GuiControl,, BiomeRandomizerStatus, ON
    GuiControl, +c0x00DD00, BiomeRandomizerStatus
} else {
    GuiControl,, BiomeRandomizerStatus, OFF
    GuiControl, +c0xFF4444, BiomeRandomizerStatus
}
if (strangeController) {
    GuiControl,, StrangeControllerStatus, ON
    GuiControl, +c0x00DD00, StrangeControllerStatus
} else {
    GuiControl,, StrangeControllerStatus, OFF
    GuiControl, +c0xFF4444, StrangeControllerStatus
}
if (clipWebhook) {
    GuiControl,, ClipWebhookStatus, ON
    GuiControl, +c0x00DD00, ClipWebhookStatus
} else {
    GuiControl,, ClipWebhookStatus, OFF
    GuiControl, +c0xFF4444, ClipWebhookStatus
}
if (onoffWebhook) {
    GuiControl,, OnoffWebhookStatus, ON
    GuiControl, +c0x00DD00, OnoffWebhookStatus
} else {
    GuiControl,, OnoffWebhookStatus, OFF
    GuiControl, +c0xFF4444, OnoffWebhookStatus
}
if (globalArea) {
    GuiControl,, GlobalAreaStatus, ON
    GuiControl, +c0x00DD00, GlobalAreaStatus
    ShowAllGlobalOutlines()
} else {
    GuiControl,, GlobalAreaStatus, OFF
    GuiControl, +c0xFF4444, GlobalAreaStatus
    HideAllGlobalOutlines()
}
if (transArea) {
    GuiControl,, TransAreaStatus, ON
    GuiControl, +c0x00DD00, TransAreaStatus
    ShowTranscendentOutline()
} else {
    GuiControl,, TransAreaStatus, OFF
    GuiControl, +c0xFF4444, TransAreaStatus
    HideTranscendentOutline()
}
if (doPing) {
    GuiControl,, DoPingStatus, ON
    GuiControl, +c0x00DD00, DoPingStatus
} else {
    GuiControl,, DoPingStatus, OFF
    GuiControl, +c0xFF4444, DoPingStatus
}
if (doPing2) {
    GuiControl,, DoPing2Status, ON
    GuiControl, +c0x00DD00, DoPing2Status
} else {
    GuiControl,, DoPing2Status, OFF
    GuiControl, +c0xFF4444, DoPing2Status
}
if (useCelestial) {
    GuiControl,, UseCelestialStatus, ON
    GuiControl, +c0x00DD00, UseCelestialStatus
} else {
    GuiControl,, UseCelestialStatus, OFF
    GuiControl, +c0xFF4444, UseCelestialStatus
}
if (useExotic) {
    GuiControl,, UseExoticStatus, ON
    GuiControl, +c0x00DD00, UseExoticStatus
} else {
    GuiControl,, UseExoticStatus, OFF
    GuiControl, +c0xFF4444, UseExoticStatus
}
if (useBounded) {
    GuiControl,, UseBoundedStatus, ON
    GuiControl, +c0x00DD00, UseBoundedStatus
} else {
    GuiControl,, UseBoundedStatus, OFF
    GuiControl, +c0xFF4444, UseBoundedStatus
}
if (useZeus) {
    GuiControl,, UseZeusStatus, ON
    GuiControl, +c0x00DD00, UseZeusStatus
} else {
    GuiControl,, UseZeusStatus, OFF
    GuiControl, +c0xFF4444, UseZeusStatus
}
if (usePoseidon) {
    GuiControl,, UsePoseidonStatus, ON
    GuiControl, +c0x00DD00, UsePoseidonStatus
} else {
    GuiControl,, UsePoseidonStatus, OFF
    GuiControl, +c0xFF4444, UsePoseidonStatus
}
if (useHades) {
    GuiControl,, UseHadesStatus, ON
    GuiControl, +c0x00DD00, UseHadesStatus
} else {
    GuiControl,, UseHadesStatus, OFF
    GuiControl, +c0xFF4444, UseHadesStatus
}
if (archDevice) {
    GuiControl,, ArchDeviceStatus, ON
    GuiControl, +c0x00DD00, ArchDeviceStatus
} else {
    GuiControl,, ArchDeviceStatus, OFF
    GuiControl, +c0xFF4444, ArchDeviceStatus
}
if (steampunkAura) {
    GuiControl,, SteampunkAuraStatus, ON
    GuiControl, +c0x00DD00, SteampunkAuraStatus
} else {
    GuiControl,, SteampunkAuraStatus, OFF
    GuiControl, +c0xFF4444, SteampunkAuraStatus
}
if (autoClicker) {
    GuiControl, Disable, AutoClickStart
    GuiControl, Enable, AutoClickStop
    GuiControl, +c0x00DD00, AutoClickerStatus, ON
} else {
    GuiControl, Enable, AutoClickStart
    GuiControl, Disable, AutoClickStop
    GuiControl, +c0xFF4444, AutoClickerStatus, OFF
}
if (addFlows) {
    GuiControl,, AddFlowsStatus, ON
    GuiControl, +c0x00DD00, AddFlowsStatus
} else {
    GuiControl,, AddFlowsStatus, OFF
    GuiControl, +c0xFF4444, AddFlowsStatus
}

if (detectTranscendents) {
    GuiControl,, DetectTranscendentsStatus, ON
    GuiControl, +c0x00DD00, DetectTranscendentsStatus

    triggerDelay2 := 20000

    transcendentPixels := []
    transcendentPixels.Push({x: 1050, y: 49})

    transcendentCounters := {}
    for index, _ in transcendentPixels
        transcendentCounters[index] := 0

    SetTimer, CheckPixel2, 25
} else {
    GuiControl,, DetectTranscendentsStatus, OFF
    GuiControl, +c0xFF4444, DetectTranscendentsStatus
    SetTimer, CheckPixel2, Off
}
if (nvidiaReplay) {
    GuiControl,, NvidiaReplayStatus, ON
    GuiControl, +c0x00DD00, NvidiaReplayStatus
    triggerDelay := 10000
    SetTimer, CheckPixel, 25
} else {
    GuiControl,, NvidiaReplayStatus, OFF
    GuiControl, +c0xFF4444, NvidiaReplayStatus
    SetTimer, CheckPixel, Off
}



return

GuiClose:
ExitApp

toggle := false
firstLoop := true
startTick := 0
cycleCount := 0

TabChange:
return
UpdateLoopCount:
    Gui, Submit, NoHide
    if (MaxLoopInput > 0) {
        maxLoopCount := MaxLoopInput
        IniWrite, %maxLoopCount%, %iniFilePath%, Macro, maxLoopCount
    }
    if (FishingLoopInput > 0) {
        fishingLoopCount := FishingLoopInput
        IniWrite, %fishingLoopCount%, %iniFilePath%, Macro, fishingLoopCount
    }
return

ToggleSellAll:
    sellAllToggle := !sellAllToggle
    if (sellAllToggle) {
        GuiControl,, SellAllStatus, ON
        GuiControl, +c0x00DD00, SellAllStatus
    } else {
        GuiControl,, SellAllStatus, OFF
        GuiControl, +c0xFF4444, SellAllStatus
    }
    IniWrite, % (sellAllToggle ? "true" : "false"), %iniFilePath%, Macro, sellAllToggle
return

ToggleAdvancedFishingDetection:
    advancedFishingDetection := !advancedFishingDetection
    if (advancedFishingDetection) {
        GuiControl,, AdvancedFishingDetectionStatus, ON
        GuiControl, +c0x00DD00, AdvancedFishingDetectionStatus
    } else {
        GuiControl,, AdvancedFishingDetectionStatus, OFF
        GuiControl, +c0xFF4444, AdvancedFishingDetectionStatus
    }
    IniWrite, % (advancedFishingDetection ? "true" : "false"), %iniFilePath%, Macro, advancedFishingDetection
return

ToggleAutoUnequip:
    autoUnequip := !autoUnequip
    if (autoUnequip) {
        GuiControl,, AutoUnequipStatus, ON
        GuiControl, +c0x00DD00, AutoUnequipStatus
    } else {
        GuiControl,, AutoUnequipStatus, OFF
        GuiControl, +c0xFF4444, AutoUnequipStatus
    }
    IniWrite, % (autoUnequip ? "true" : "false"), %iniFilePath%, Macro, autoUnequip
return

ToggleUseNothing:
    useNothing := !useNothing
    if (useNothing) {
        GuiControl,, UseNothingStatus, ON
        GuiControl, +c0x00DD00, UseNothingStatus
    } else {
        GuiControl,, UseNothingStatus, OFF
        GuiControl, +c0xFF4444, UseNothingStatus
    }
    IniWrite, % (useNothing ? "true" : "false"), %iniFilePath%, Macro, useNothing
return

ToggleAutoCloseChat:
    autoCloseChat := !autoCloseChat
    if (autoCloseChat) {
        GuiControl,, AutoCloseChatStatus, ON
        GuiControl, +c0x00DD00, AutoCloseChatStatus
    } else {
        GuiControl,, AutoCloseChatStatus, OFF
        GuiControl, +c0xFF4444, AutoCloseChatStatus
    }
    IniWrite, % (autoCloseChat ? "true" : "false"), %iniFilePath%, Macro, autoCloseChat
return

ToggleAzertyPathing:
    azertyPathing := !azertyPathing
    if (azertyPathing) {
        GuiControl,, AzertyPathingStatus, ON
        GuiControl, +c0x00DD00, AzertyPathingStatus
    } else {
        GuiControl,, AzertyPathingStatus, OFF
        GuiControl, +c0xFF4444, AzertyPathingStatus
    }
    IniWrite, % (azertyPathing ? "true" : "false"), %iniFilePath%, Macro, azertyPathing
return

ToggleClipWebhook:
    clipWebhook := !clipWebhook
    if (clipWebhook) {
        GuiControl,, ClipWebhookStatus, ON
        GuiControl, +c0x00DD00, ClipWebhookStatus
    } else {
        GuiControl,, ClipWebhookStatus, OFF
        GuiControl, +c0xFF4444, ClipWebhookStatus
    }
    IniWrite, % (clipWebhook ? "true" : "false"), %iniFilePath%, Macro, clipWebhook
return

ToggleDoPing:
    doPing := !doPing
    if (doPing) {
        GuiControl,, DoPingStatus, ON
        GuiControl, +c0x00DD00, DoPingStatus
    } else {
        GuiControl,, DoPingStatus, OFF
        GuiControl, +c0xFF4444, DoPingStatus
    }
    IniWrite, % (doPing ? "true" : "false"), %iniFilePath%, Macro, doPing
return

ToggleDoPing2:
    doPing2 := !doPing2
    if (doPing2) {
        GuiControl,, DoPing2Status, ON
        GuiControl, +c0x00DD00, DoPing2Status
    } else {
        GuiControl,, DoPing2Status, OFF
        GuiControl, +c0xFF4444, DoPing2Status
    }
    IniWrite, % (doPing2 ? "true" : "false"), %iniFilePath%, Macro, doPing2
return

ToggleOnoffWebhook:
    onoffWebhook := !onoffWebhook
    if (onoffWebhook) {
        GuiControl,, OnoffWebhookStatus, ON
        GuiControl, +c0x00DD00, OnoffWebhookStatus
    } else {
        GuiControl,, OnoffWebhookStatus, OFF
        GuiControl, +c0xFF4444, OnoffWebhookStatus
    }
    IniWrite, % (onoffWebhook ? "true" : "false"), %iniFilePath%, Macro, onoffWebhook
return

ToggleSnowmanCollect:
    snowmanCollect := !snowmanCollect
    if (snowmanCollect) {
        GuiControl,, SnowmanCollectStatus, ON
        GuiControl, +c0x00DD00, SnowmanCollectStatus
    } else {
        GuiControl,, SnowmanCollectStatus, OFF
        GuiControl, +c0xFF4444, SnowmanCollectStatus
    }
    IniWrite, % (snowmanCollect ? "true" : "false"), %iniFilePath%, Macro, snowmanCollect
return

ToggleStrangeController:
    strangeController := !strangeController
    if (strangeController) {
        GuiControl,, StrangeControllerStatus, ON
        GuiControl, +c0x00DD00, StrangeControllerStatus
    } else {
        GuiControl,, StrangeControllerStatus, OFF
        GuiControl, +c0xFF4444, StrangeControllerStatus
    }
    IniWrite, % (strangeController ? "true" : "false"), %iniFilePath%, Macro, strangeController
return

ToggleBiomeRandomizer:
    biomeRandomizer := !biomeRandomizer
    if (biomeRandomizer) {
        GuiControl,, BiomeRandomizerStatus, ON
        GuiControl, +c0x00DD00, BiomeRandomizerStatus
    } else {
        GuiControl,, BiomeRandomizerStatus, OFF
        GuiControl, +c0xFF4444, BiomeRandomizerStatus
    }
    IniWrite, % (biomeRandomizer ? "true" : "false"), %iniFilePath%, Macro, biomeRandomizer
return

ToggleGlobalArea:
    globalArea := !globalArea
    if (globalArea) {
        GuiControl,, GlobalAreaStatus, ON
        GuiControl, +c0x00DD00, GlobalAreaStatus
        ShowAllGlobalOutlines()
    } else {
        GuiControl,, GlobalAreaStatus, OFF
        GuiControl, +c0xFF4444, GlobalAreaStatus
        HideAllGlobalOutlines()
    }
    IniWrite, % (globalArea ? "true" : "false"), %iniFilePath%, Macro, globalArea
return

ToggleTransArea:
    transArea := !transArea
    if (transArea) {
        GuiControl,, TransAreaStatus, ON
        GuiControl, +c0x00DD00, TransAreaStatus
        ShowTranscendentOutline()
    } else {
        GuiControl,, TransAreaStatus, OFF
        GuiControl, +c0xFF4444, TransAreaStatus
        HideTranscendentOutline()
    }
    IniWrite, % (transArea ? "true" : "false"), %iniFilePath%, Macro, transArea
return

ToggleUseCelestial:
    useCelestial := !useCelestial
    if (useCelestial) {
        GuiControl,, UseCelestialStatus, ON
        GuiControl, +c0x00DD00, UseCelestialStatus
    } else {
        GuiControl,, UseCelestialStatus, OFF
        GuiControl, +c0xFF4444, UseCelestialStatus
    }
    IniWrite, % (useCelestial ? "true" : "false"), %iniFilePath%, Macro, useCelestial
return

ToggleUseExotic:
    useExotic := !useExotic
    if (useExotic) {
        GuiControl,, UseExoticStatus, ON
        GuiControl, +c0x00DD00, UseExoticStatus
    } else {
        GuiControl,, UseExoticStatus, OFF
        GuiControl, +c0xFF4444, UseExoticStatus
    }
    IniWrite, % (useExotic ? "true" : "false"), %iniFilePath%, Macro, useExotic
return

ToggleUseBounded:
    useBounded := !useBounded
    if (useBounded) {
        GuiControl,, UseBoundedStatus, ON
        GuiControl, +c0x00DD00, UseBoundedStatus
    } else {
        GuiControl,, UseBoundedStatus, OFF
        GuiControl, +c0xFF4444, UseBoundedStatus
    }
    IniWrite, % (useBounded ? "true" : "false"), %iniFilePath%, Macro, useBounded
return

ToggleUseZeus:
    useZeus := !useZeus
    if (useZeus) {
        GuiControl,, UseZeusStatus, ON
        GuiControl, +c0x00DD00, UseZeusStatus
    } else {
        GuiControl,, UseZeusStatus, OFF
        GuiControl, +c0xFF4444, UseZeusStatus
    }
    IniWrite, % (useZeus ? "true" : "false"), %iniFilePath%, Macro, useZeus
return

ToggleUsePoseidon:
    usePoseidon := !usePoseidon
    if (usePoseidon) {
        GuiControl,, UsePoseidonStatus, ON
        GuiControl, +c0x00DD00, UsePoseidonStatus
    } else {
        GuiControl,, UsePoseidonStatus, OFF
        GuiControl, +c0xFF4444, UsePoseidonStatus
    }
    IniWrite, % (usePoseidon ? "true" : "false"), %iniFilePath%, Macro, usePoseidon
return

ToggleUseHades:
    useHades := !useHades
    if (useHades) {
        GuiControl,, UseHadesStatus, ON
        GuiControl, +c0x00DD00, UseHadesStatus
    } else {
        GuiControl,, UseHadesStatus, OFF
        GuiControl, +c0xFF4444, UseHadesStatus
    }
    IniWrite, % (useHades ? "true" : "false"), %iniFilePath%, Macro, useHades
return

ToggleArchDevice:
    archDevice := !archDevice
    if (archDevice) {
        GuiControl,, ArchDeviceStatus, ON
        GuiControl, +c0x00DD00, ArchDeviceStatus
    } else {
        GuiControl,, ArchDeviceStatus, OFF
        GuiControl, +c0xFF4444, ArchDeviceStatus
    }
    IniWrite, % (archDevice ? "true" : "false"), %iniFilePath%, Macro, archDevice
return

ToggleSteampunkAura:
    steampunkAura := !steampunkAura
    if (steampunkAura) {
        GuiControl,, SteampunkAuraStatus, ON
        GuiControl, +c0x00DD00, SteampunkAuraStatus
    } else {
        GuiControl,, SteampunkAuraStatus, OFF
        GuiControl, +c0xFF4444, SteampunkAuraStatus
    }
    IniWrite, % (steampunkAura ? "true" : "false"), %iniFilePath%, Macro, steampunkAura
return
ToggleAutoClicker:
    autoClicker := !autoClicker
        if (autoClicker) {
        GuiControl, Disable, AutoClickStart
        GuiControl, Enable, AutoClickStop
        GuiControl,, AutoClickerStatus, ON
    } else {
        GuiControl, Enable, AutoClickStart
        GuiControl, Disable, AutoClickStop
        GuiControl,, AutoClickerStatus, OFF
    }

    IniWrite, % (autoClicker ? "true" : "false"), %iniFilePath%, Macro, autoClicker
return

ToggleAddFlows:
    addFlows := !addFlows
    if (addFlows) {
        GuiControl,, AddFlowsStatus, ON
        GuiControl, +c0x00DD00, AddFlowsStatus
    } else {
        GuiControl,, AddFlowsStatus, OFF
        GuiControl, +c0xFF4444, AddFlowsStatus
    }
    IniWrite, % (addFlows ? "true" : "false"), %iniFilePath%, Macro, addFlows
return

ToggleDetectLimbo:
    detectLimbo := !detectLimbo
    if (detectLimbo) {
        GuiControl,, DetectLimboStatus, ON
        GuiControl, +c0x00DD00, DetectLimboStatus
        triggerDelay3 := 20000
        SetTimer, CheckPixel3, 25
    } else {
        GuiControl,, DetectLimboStatus, OFF
        GuiControl, +c0xFF4444, DetectLimboStatus
        SetTimer, CheckPixel3, Off
    }
    IniWrite, % (detectLimbo ? "true" : "false"), %iniFilePath%, Macro, detectLimbo
return

ToggleDetectTranscendents:
    detectTranscendents := !detectTranscendents
    if (detectTranscendents) {
        GuiControl,, DetectTranscendentsStatus, ON
        GuiControl, +c0x00DD00, DetectTranscendentsStatus

        triggerDelay2 := 20000
        transcendentPixels := []
        transcendentPixels.Push({x: 1050, y: 49})

        transcendentCounters := {}
        for index, _ in transcendentPixels
            transcendentCounters[index] := 0

        SetTimer, CheckPixel2, 25
    } else {
        GuiControl,, DetectTranscendentsStatus, OFF
        GuiControl, +c0xFF4444, DetectTranscendentsStatus
        SetTimer, CheckPixel2, Off
    }
    IniWrite, % (detectTranscendents ? "true" : "false"), %iniFilePath%, Macro, detectTranscendents
return

ToggleNvidiaReplay:
    nvidiaReplay := !nvidiaReplay

    if (nvidiaReplay) {
        GuiControl,, NvidiaReplayStatus, ON
        GuiControl, +c0x00DD00, NvidiaReplayStatus
        triggerDelay := 10000
        SetTimer, CheckPixel, 25
    } else {
        GuiControl,, NvidiaReplayStatus, OFF
        GuiControl, +c0xFF4444, NvidiaReplayStatus
        SetTimer, CheckPixel, Off
    }

    IniWrite, % (nvidiaReplay ? "true" : "false"), %iniFilePath%, Macro, nvidiaReplay
return


UpdatePrivateServer:
    Gui, Submit, NoHide
    privateServerLink := PrivateServerInput
    IniWrite, %privateServerLink%, %iniFilePath%, Macro, privateServerLink
return

UpdateFishingFailsafe:
    Gui, Submit, NoHide
    if (FishingFailsafeInput > 0) {
        fishingFailsafeTime := FishingFailsafeInput
        IniWrite, %fishingFailsafeTime%, %iniFilePath%, Macro, fishingFailsafeTime
    }
return

UpdatePathingFailsafe:
    Gui, Submit, NoHide
    if (PathingFailsafeInput > 0) {
        pathingFailsafeTime := PathingFailsafeInput
        IniWrite, %pathingFailsafeTime%, %iniFilePath%, Macro, pathingFailsafeTime
    }
return

UpdateAutoRejoinFailsafe:
    Gui, Submit, NoHide
    if (AutoRejoinFailsafeInput > 0) {
        autoRejoinFailsafeTime := AutoRejoinFailsafeInput
        IniWrite, %autoRejoinFailsafeTime%, %iniFilePath%, Macro, autoRejoinFailsafeTime
    }
return

UpdateAdvancedThreshold:
    Gui, Submit, nohide
    if (AdvancedThresholdInput >= 0 && AdvancedThresholdInput <= 40) {
        advancedFishingThreshold := AdvancedThresholdInput
        IniWrite, %advancedFishingThreshold%, %iniFilePath%, Macro, advancedFishingThreshold
    }
return

ShowAllGlobalOutlines() {
    ShowGlobalOutline(1, 1111, 80)

    ShowGlobalOutline(2, 600, 80)

    ShowGlobalOutline(3, 400, 80)
}

HideAllGlobalOutlines() {
    HideGlobalOutline(1)
    HideGlobalOutline(2)
    HideGlobalOutline(3)
}

ShowGlobalOutline(id, centerX, centerY) {
    size := 40
    thickness := 2

    x := centerX - size//2
    y := centerY - size//2

    yBottom := y + size - thickness
    xRight  := x + size - thickness

    Gui, GBoxTop%id%:Destroy
    Gui, GBoxTop%id%:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, GBoxTop%id%:Color, 00FF00
    Gui, GBoxTop%id%:Show, x%x% y%y% w%size% h%thickness% NA

    Gui, GBoxBottom%id%:Destroy
    Gui, GBoxBottom%id%:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, GBoxBottom%id%:Color, 00FF00
    Gui, GBoxBottom%id%:Show, x%x% y%yBottom% w%size% h%thickness% NA

    Gui, GBoxLeft%id%:Destroy
    Gui, GBoxLeft%id%:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, GBoxLeft%id%:Color, 00FF00
    Gui, GBoxLeft%id%:Show, x%x% y%y% w%thickness% h%size% NA

    Gui, GBoxRight%id%:Destroy
    Gui, GBoxRight%id%:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, GBoxRight%id%:Color, 00FF00
    Gui, GBoxRight%id%:Show, x%xRight% y%y% w%thickness% h%size% NA
}

HideGlobalOutline(id) {
    Gui, GBoxTop%id%:Destroy
    Gui, GBoxBottom%id%:Destroy
    Gui, GBoxLeft%id%:Destroy
    Gui, GBoxRight%id%:Destroy
}

ShowTranscendentOutline() {
    size := 40
    thickness := 2

    x := 1050 - size//2
    y := 49 - size//2

    yBottom := y + size - thickness
    xRight  := x + size - thickness

    color := "66CCFF"

    Gui, TBoxTop:Destroy
    Gui, TBoxTop:New
    Gui, TBoxTop:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, TBoxTop:Color, %color%
    Gui, TBoxTop:Show, x%x% y%y% w%size% h%thickness% NA

    Gui, TBoxBottom:Destroy
    Gui, TBoxBottom:New
    Gui, TBoxBottom:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, TBoxBottom:Color, %color%
    Gui, TBoxBottom:Show, x%x% y%yBottom% w%size% h%thickness% NA

    Gui, TBoxLeft:Destroy
    Gui, TBoxLeft:New
    Gui, TBoxLeft:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, TBoxLeft:Color, %color%
    Gui, TBoxLeft:Show, x%x% y%y% w%thickness% h%size% NA

    Gui, TBoxRight:Destroy
    Gui, TBoxRight:New
    Gui, TBoxRight:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, TBoxRight:Color, %color%
    Gui, TBoxRight:Show, x%xRight% y%y% w%thickness% h%size% NA
}

HideTranscendentOutline() {
    Gui, TBoxTop:Destroy
    Gui, TBoxBottom:Destroy
    Gui, TBoxLeft:Destroy
    Gui, TBoxRight:Destroy
}

CheckPixel:
    global nvidiaReplay, triggerDelay, ClipPending, ClipType

    if (!nvidiaReplay)
        return

    PixelGetColor, pos1, 1111, 80, RGB
    PixelGetColor, pos2, 600, 80, RGB
    PixelGetColor, pos3, 600, 80, RGB

    if (pos1 && pos2 && pos3 = 0xFFFFFF && !ClipPending) {
        ClipPending := true
        ClipType := "global"
        ShowClipText()
        SetTimer, DoClip, -%triggerDelay%
    }
return


CheckPixel2:
    global detectTranscendents, transcendentPixels, transcendentColors, lastTranscendentColor2
    global triggerDelay2, transcendentCounters, nvidiaReplay

    if (!detectTranscendents)
        return
    

    for index, pos in transcendentPixels {
        PixelGetColor, colort, % pos.x, % pos.y, RGB

        for _, c in transcendentColors {
        if (colort = c) {
            transcendentCounters[index]++
            lastTranscendentColor := colort
            ShowClipText()

            SetTimer, DoClip, Off
            ClipPending := true
            ClipType := "transcendent"
            SetTimer, DoClip2, -%triggerDelay2%
        }
    }
    }

    if (levicolor = 0x000201) {
        ShowClipText()
        lastTranscendentColor2 := "Leviathan"

        SetTimer, DoClip, Off
        ClipPending := true
        ClipType := "transcendent"
        SetTimer, DoClip2, -%triggerDelay2%
    }


    PixelGetColor, colorbt, 950, 180, RGB
    PixelGetColor, colorbt2, 1200, 500, RGB
    PixelGetColor, colorbt3, 10, 900, RGB
    PixelGetColor, colorbt4, 670, 750, RGB
    if (colorbt = 0xFFFFFF && colorbt2 = 0x000000 && colorbt3 = 0xFFFFFF && colorbt4 = 0x000000) {
        ShowClipText()
        lastTranscendentColor2 := "Breakthrough"

        SetTimer, DoClip, Off
        ClipPending := true
        ClipType := "transcendent"
        SetTimer, DoClip2, -%triggerDelay2%
    }
return

CheckPixel3:
    global detectLimbo, triggerDelay3
    global lastColor3, lastTranscendentColor2

    if (!detectLimbo)
        return

    PixelGetColor, colorlimbo, 950, 180, RGB
    PixelGetColor, colorlimbo2, 1200, 100, RGB
    PixelGetColor, colorlimbo3, 676, 676, RGB

    if (colorlimbo = 0xFFFFFF && colorlimbo2 = 0x000000 && colorlimbo3 = 0x000000) {
            ShowClipText()
            lastTranscendentColor2 := "Eden"
            SetTimer, DoContract, -%triggerDelay3%
            return
        }
return

DoClip2:
if (clipWebhook) {
    global lastTranscendentColor, transcendentColorNames
    global lastTranscendentColor2
    Send, !{F10}

    sleep, 1500
    PixelGetColor, nvidiacolor, 1622, 155, RGB

    if (nvidiacolor = 0x76B900) {
    colorHex := Format("0x{:06X}", lastTranscendentColor)
    colorName := transcendentColorNames.HasKey(lastTranscendentColor)
        ? transcendentColorNames[lastTranscendentColor]
        : "Unknown Color"

    if (colorName = "Equinox1" || colorName = "Equinox2") {
        SendWebhook2(":tada: **Transcendent Detected!** :tada:                                            Color detected: " colorName " (" colorHex ") | Clipped: Yes", 0, "https://raw.githubusercontent.com/knowaery/Aery-s-Fishsol/main/auracutscenes/Equniox.png")

    } else if (colorName = "Luminosity1") {
        SendWebhook2(":tada: **Transcendent Detected!** :tada:                                            Color detected: " colorName " (" colorHex ") | Clipped: Yes", 11393254, "https://raw.githubusercontent.com/knowaery/Aery-s-Fishsol/main/auracutscenes/Luminosity.png")

    } else if (lastTranscendentColor2 = "Leviathan") {
        SendWebhook2(":tada: **Transcendent Detected!** :tada:                                            Color detected:  Leviathan/Pixelation | Clipped: Yes", 25600, "https://raw.githubusercontent.com/knowaery/Aery-s-Fishsol/main/auracutscenes/676767levipixellmao.png")

    } else if (lastTranscendentColor2 = "Breakthrough") {
        SendWebhook2(":tada: **Transcendent Detected!** :tada:                                            Color detected: Breakthrough | Clipped: Yes", 0, "https://raw.githubusercontent.com/knowaery/Aery-s-Fishsol/main/auracutscenes/Breakthrough.png")
    }
    ToolTip
    } else if (nvidiacolor != 0x76B900) {
    colorHex := Format("0x{:06X}", lastTranscendentColor)
    colorName := transcendentColorNames.HasKey(lastTranscendentColor)
        ? transcendentColorNames[lastTranscendentColor]
        : "Unknown Color"

    if (colorName = "Equinox1" || colorName = "Equinox2") {
        SendWebhook2(":tada: **Transcendent Detected!** :tada:                                            Color detected: " colorName " (" colorHex ") | Clipped: No", 0, "https://raw.githubusercontent.com/knowaery/Aery-s-Fishsol/main/auracutscenes/Equniox.png")

    } else if (colorName = "Luminosity1") {
        SendWebhook2(":tada: **Transcendent Detected!** :tada:                                            Color detected: " colorName " (" colorHex ") | Clipped: No", 11393254, "https://raw.githubusercontent.com/knowaery/Aery-s-Fishsol/main/auracutscenes/Luminosity.png")

    } else if (lastTranscendentColor2 = "Leviathan") {
        SendWebhook2(":tada: **Transcendent Detected!** :tada:                                            Color detected:  Leviathan/Pixelation | Clipped: No", 25600, "https://raw.githubusercontent.com/knowaery/Aery-s-Fishsol/main/auracutscenes/676767levipixellmao.png")

    } else if (lastTranscendentColor2 = "Breakthrough") {
        SendWebhook2(":tada: **Transcendent Detected!** :tada:                                            Color detected: Breakthrough | Clipped: No", 0, "https://raw.githubusercontent.com/knowaery/Aery-s-Fishsol/main/auracutscenes/Breakthrough.png")
    }
    ToolTip
}
} else if (!clipWebhook) {
    ToolTip
    Send, !{F10}
}
ClipPending := false
ClipType := ""
return

DoClip:
if (clipWebhook) {
    Send, !{F10}

    sleep, 1500
    PixelGetColor, nvidiacolor, 1622, 155, RGB

    if (nvidiacolor = 0x76B900) {
        try SendWebhook2(":warning: A Global has been Detected and Clipped!", 16777215)
    }

    if (nvidiacolor != 0x76B900) {
        try SendWebhook2(":warning: A Global has been Detected but not Clipped!", 16777215)
    }
    ToolTip
} else if (!clipWebhook) {
    Send, !{F10}
    ToolTip
}
ClipPending := false
ClipType := ""
return


DoContract:
global lastTranscendentColor2
    Send, e
    sleep, 100
    Send, e
    sleep, 100
    Send, e
    sleep, 400
    MouseMove, 800, 800, 3
    sleep, 300
    Click, Left
    sleep, 800
    MouseMove, 720, 930, 3
    sleep, 400
    Click, Left

    if (clipWebhook && lastTranscendentColor2 = "Eden") {
        try SendWebhook2(":tada: **Eden has been Contracted!** :tada:                                         White & Black Pixel Detected! (Eden Summoned)", 0, "https://raw.githubusercontent.com/knowaery/Aery-s-Fishsol/main/auracutscenes/Eden.png")
    }
    if (!nvidiaReplay) {
        ToolTip 
    }
    if (nvidiaReplay) {
        Sleep, 30000
        Send, !{F10}
        ToolTip 
    }
return

GetPingText() {
    global webhookID
    return webhookID != "" ? "<@" webhookID ">" : ""
}

UpdateWebhook:
    Gui, Submit, nohide
    webhookURL := WebhookInput
    IniWrite, %webhookURL%, %iniFilePath%, Macro, webhookURL
return

UpdateUserID:
    Gui, Submit, NoHide
    webhookID := UserIDInput
    IniWrite, %webhookID%, %iniFilePath%, Macro, webhookID
return

; webhook cystinuzeabukuttuty, please dont hate me max
SendWebhook3(text, color := 16777215) {
    global webhookURL, webhookID, doPing, doPing2

    if (!InStr(webhookURL, "discord"))
        return

    time := A_NowUTC
    timestamp := SubStr(time,1,4) "-" SubStr(time,5,2) "-" SubStr(time,7,2)
              . "T" SubStr(time,9,2) ":" SubStr(time,11,2) ":" SubStr(time,13,2) ".000Z"

    content := ""
    allowedMentions := ""

    if (doPing && webhookID != "") {
        content := "<@" webhookID ">"
        allowedMentions := """allowed_mentions"": {""users"": [""" webhookID """]},"
    }

    json := "{"
    . """content"": """ content ""","
    . allowedMentions
    . """embeds"": [{"
    . """title"": """ text ""","
    . """color"": " color ","
    . """footer"": {"
    . """text"": ""Aery's fishSol V1.2"","
    . """icon_url"": ""https://maxstellar.github.io/fishSol%20icon.png"""
    . "},"
    . """timestamp"": """ timestamp """"
    . "}]"
    . "}"

    http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    http.Open("POST", webhookURL, false)
    http.SetRequestHeader("Content-Type", "application/json")
    http.Send(json)
}

SendWebhook2(text, color := 16777215, imageURL := "") {
    global webhookURL, webhookID, doPing2

    if (!InStr(webhookURL, "discord"))
        return

    time := A_NowUTC
    timestamp := SubStr(time,1,4) "-" SubStr(time,5,2) "-" SubStr(time,7,2)
              . "T" SubStr(time,9,2) ":" SubStr(time,11,2) ":" SubStr(time,13,2) ".000Z"

    content := ""
    allowedMentions := ""

    if (doPing2 && webhookID != "") {
        content := "<@" webhookID ">"
        allowedMentions := """allowed_mentions"": {""users"": [""" webhookID """]},"
    }

    imageBlock := ""
    if (imageURL != "") {
        imageBlock := """image"": {""url"": """ imageURL """},"
    }

    json := "{"
    . """content"": """ content ""","
    . allowedMentions
    . """embeds"": [{"
    . """title"": """ text ""","
    . """color"": " color ","
    . imageBlock
    . """footer"": {"
    . """text"": ""Aery's fishSol V1.2"","
    . """icon_url"": ""https://maxstellar.github.io/fishSol%20icon.png"""
    . "},"
    . """timestamp"": """ timestamp """"
    . "}]"
    . "}"

    http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    http.Open("POST", webhookURL, false)
    http.SetRequestHeader("Content-Type", "application/json")
    http.Send(json)
}

SendWebhook(text, color := 16777215) {
    global webhookURL, webhookID

    if (!InStr(webhookURL, "discord"))
        return

    time := A_NowUTC
    timestamp := SubStr(time,1,4) "-" SubStr(time,5,2) "-" SubStr(time,7,2)
              . "T" SubStr(time,9,2) ":" SubStr(time,11,2) ":" SubStr(time,13,2) ".000Z"

    content := ""
    allowedMentions := ""



    json := "{"
    . """content"": """ content ""","
    . allowedMentions
    . """embeds"": [{"
    . """title"": """ text ""","
    . """color"": " color ","
    . """footer"": {"
    . """text"": ""Aery's fishSol V1.2"","
    . """icon_url"": ""https://maxstellar.github.io/fishSol%20icon.png"""
    . "},"
    . """timestamp"": """ timestamp """"
    . "}]"
    . "}"

    http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    http.Open("POST", webhookURL, false)
    http.SetRequestHeader("Content-Type", "application/json")
    http.Send(json)
}



OpenNvidiaNotes:
    Gui, NvidiaNotes:New, +AlwaysOnTop +Resize, Nvidia Replay - Tutorial
    Gui, NvidiaNotes:Font, s10, Segoe UI

    Gui, NvidiaNotes:Add, Edit, x10 y10 w550 h540 ReadOnly vNvidiaNotesText -Wrap, 
    (
IMPORTANT, PLEASE READ

Requirements:
- Nvidia Overlay (requires an Nvidia GPU)
- Instant Replay must be enabled, with the keybind set to ALT + F10
- Replay length should be set between 2-5 minutes
- Global Replay may be triggered by cutscenes between 99k-999k. 
To avoid unwanted clips, ensure aura cutscenes are above 1M+.
- Set Graphics to the lowest to avoid accidental detection via auras.

Warnings:
- Other global white flashes may trigger a clip
  (for example, if someone else rolls a global)
- Some Transcendent cutscenes may not be detected correctly
- This feature is BETA - false detections may occur

Disclaimer:
Global Replay will NOT detect any global rolled under 99m.
(It will clip Breakthrough Gargantua (Rolled at 430m), 
but will NOT clip at native or with an starfall rune. (Rolled at 86m.))

Status: (+ = true | - = false)
All Globals: +
Limbo Globals: -
Nyctophobia: -
Pixelation: +
Luminosity: +
Leviathan (Unsure)
Breakthrough: + 
Equinox: +
Eden: (Unsure)


This Replay System can be used even if you're not using the macro
    )

    Gui, NvidiaNotes:Add, Button, x225 y560 w100 h25 gCloseNvidiaNotes, Close
    Gui, NvidiaNotes:Show, w550 h600
return

CloseNvidiaNotes:
    Gui, NvidiaNotes:Destroy
return

ShowClipText() {
    ToolTip, Clipped with Aery's Fishsol, 890, 10
}

DoStrangeController:
    MouseMove, 45, 521, 3
    sleep 300
    Click, Left
    MouseMove, 1280, 343, 3
    sleep 300
    Click, Left
    MouseMove, 820, 370, 3
    sleep 300
    Click, Left
    Send, Strange Controller
    MouseMove, 850, 485, 3
    sleep 300
    Click, Left            
    MouseMove, 690, 585, 3
    sleep 300
    Click, Left
    sleep 600
    MouseMove, 45, 521, 3
    sleep 300
    Click, Left
    sleep, 600
return

DoBiomeRandomizer:
    MouseMove, 45, 521, 3
    sleep 300
    Click, Left
    MouseMove, 1280, 343, 3
    sleep 300
    Click, Left
    MouseMove, 820, 370, 3
    sleep 300
    Click, Left
    Send, Biome Randomizer
    MouseMove, 850, 485, 3
    sleep 300
    Click, Left            
    MouseMove, 690, 585, 3
    sleep 300
    Click, Left
    sleep 300
    MouseMove, 45, 521, 3
    sleep 300
    Click, Left
    sleep, 600
return

SelectItem:
    Gui, Submit, NoHide
    selectedItem := AutoCraft
return

CraftHeavenly:
ToolTip
if (IfAdded != "Heavenly") {
    MouseMove, 910, 333, 3
    Sleep, 200
    Click, Left
    Sleep, 200
    Send, Heavenly Potion
    Sleep, 200

    MouseMove, 1150, 420, 3
    Sleep, 200
    Send, {WheelUp 6}
    Sleep, 500
    Click, Left
    Sleep, 200

    MouseMove, 740, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    Send, ^a
    Sleep, 200
    Send, 250
    Sleep, 200
}

    MouseMove, 806, 636, 3
    Sleep, 1000
    Click, Left
    Sleep, 1000

    if (useCelestial) {
        MouseMove, 800, 682, 3
        Sleep, 500
        Click, Left
        Sleep, 500
        Click, Left
        Sleep, 500
    }

    if (useExotic) {
        MouseMove, 800, 742, 3
        Sleep, 500
        Click, Left
        Sleep, 500
    }

    MouseMove, 585, 585, 3
    Sleep, 1000
    Click, Left
    Sleep, 2500
return



CraftBound:
ToolTip
if (IfAdded != "Bounded") {
    MouseMove, 910, 333, 3
    Sleep, 200
    Click, Left
    Sleep, 200
    Send, Bound Potion
    Sleep, 200

    MouseMove, 1150, 420, 3
    Sleep, 200

    Send, {WheelUp 6}
    Sleep, 500

    Click, Left
    Sleep, 200

    MouseMove, 740, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    Send, ^a
    Sleep, 200
    Send, 250
    Sleep, 200
}

    MouseMove, 806, 636, 3
    Sleep, 1000
    Click, Left
    Sleep, 1000

    if (useBounded) {
        MouseMove, 800, 682, 3
        Sleep, 500
        Click, Left
        Sleep, 500
    }

    MouseMove, 585, 585, 3
    Sleep, 1000
    Click, Left
    Sleep, 2500
return

CraftZeus:
ToolTip
    MouseMove, 910, 333, 3
    Sleep, 200
    Click, Left
    Sleep, 200
    Send, Godly Zeus
    Sleep, 200

    MouseMove, 1150, 420, 3
    Sleep, 200

    Send, {WheelUp 6}
    Sleep, 500

    Click, Left
    Sleep, 200

    MouseMove, 740, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    Send, ^a
    Sleep, 200
    Send, 25
    Sleep, 200
    
    MouseMove, 806, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    MouseMove, 740, 690, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    Send, ^a
    Sleep, 200
    Send, 25
    Sleep, 200

    MouseMove, 806, 690, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    if (useZeus) {
        MouseMove, 800, 746, 3
        Sleep, 500
        Click, Left
        Sleep, 500
    }

    MouseMove, 585, 585, 3
    Sleep, 200
    Click, Left
    Sleep, 1000
return

CraftHades:
if (IfAdded != "Hades") {
    ToolTip
    MouseMove, 910, 333, 3
    Sleep, 200
    Click, Left
    Sleep, 200
    Send, Godly Hades
    Sleep, 200

    MouseMove, 1150, 420, 3
    Sleep, 200

    Send, {WheelUp 6}
    Sleep, 500

    Click, Left
    Sleep, 200

    MouseMove, 740, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    Send, ^a
    Sleep, 200
    Send, 50
    Sleep, 200
}

    MouseMove, 806, 636, 3
    Sleep, 1000
    Click, Left
    Sleep, 1000

    if (useHades) {
        MouseMove, 800, 682, 3
        Sleep, 500
        Click, Left
        Sleep, 500
    }

    MouseMove, 585, 585, 3
    Sleep, 1000
    Click, Left
    Sleep, 2500
return

CraftPoseidon:
if (IfAdded != "Poseidon") {
    ToolTip
    MouseMove, 910, 333, 3
    Sleep, 200
    Click, Left
    Sleep, 200
    Send, Godly Poseidon
    Sleep, 200

    MouseMove, 1150, 420, 3
    Sleep, 200

    Send, {WheelUp 6}
    Sleep, 500

    Click, Left
    Sleep, 200

    MouseMove, 740, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    Send, ^a
    Sleep, 200
    Send, 50
    Sleep, 200
}

    MouseMove, 806, 636, 3
    Sleep, 1000
    Click, Left
    Sleep, 1000

    if (usePoseidon) {
        MouseMove, 800, 682, 3
        Sleep, 500
        Click, Left
        Sleep, 500
    }

    MouseMove, 585, 585, 3
    Sleep, 1000
    Click, Left
    Sleep, 2500
return

CraftJewerly:
if (IfAdded != "Jewerly") {
    ToolTip
    MouseMove, 910, 333, 3
    Sleep, 200
    Click, Left
    Sleep, 200
    Send, Jewerly Potion
    Sleep, 200

    MouseMove, 1150, 420, 3
    Sleep, 200

    Send, {WheelUp 6}
    Sleep, 500

    Click, Left
    Sleep, 200

    MouseMove, 740, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

        Send, ^a
        Sleep, 200
        Send, 20
        Sleep, 200
    }

    MouseMove, 806, 636, 3
    Sleep, 1000
    Click, Left
    Sleep, 1000

    MouseMove, 585, 585, 3
    Sleep, 1000
    Click, Left
    Sleep, 1000
return

CraftZombie:
if (IfAdded != "Zombie") {
    ToolTip
    MouseMove, 910, 333, 3
    Sleep, 200
    Click, Left
    Sleep, 200
    Send, Zombie Potion
    Sleep, 200

    MouseMove, 1150, 420, 3
    Sleep, 200

    Send, {WheelUp 6}
    Sleep, 500

    Click, Left
    Sleep, 200

    MouseMove, 740, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

        Send, ^a
        Sleep, 200
        Send, 10
        Sleep, 200
    }

    MouseMove, 806, 636, 3
    Sleep, 1000
    Click, Left
    Sleep, 1000

    MouseMove, 585, 585, 3
    Sleep, 1000
    Click, Left
    Sleep, 1000
return

CraftRage:
    if (IfAdded != "Rage") {
        ToolTip
        MouseMove, 910, 333, 3
        Sleep, 200
        Click, Left
        Sleep, 200
        Send, Rage Potion
        Sleep, 200

        MouseMove, 1150, 420, 3
        Sleep, 200

        Send, {WheelUp 6}
        Sleep, 500

        Click, Left
        Sleep, 200


        MouseMove, 740, 636, 3
        Sleep, 200
        Click, Left
        Sleep, 200

        Send, ^a
        Sleep, 200
        Send, 10
        Sleep, 200
    }

    MouseMove, 806, 636, 3
    Sleep, 1000
    Click, Left
    Sleep, 1000

    MouseMove, 585, 585, 3
    Sleep, 1000
    Click, Left
    Sleep, 1000
return

CraftDiver:
if (IfAdded != "Diver") {
    ToolTip
    MouseMove, 910, 333, 3
    Sleep, 200
    Click, Left
    Sleep, 200
    Send, Diver Potion
    Sleep, 200

    MouseMove, 1150, 420, 3
    Sleep, 200

    Send, {WheelUp 6}
    Sleep, 500

    Click, Left
    Sleep, 200

    MouseMove, 740, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

        Send, ^a
        Sleep, 200
        Send, 20
        Sleep, 200
    }

    MouseMove, 806, 636, 3
    Sleep, 1000
    Click, Left
    Sleep, 1000

    MouseMove, 585, 585, 3
    Sleep, 1000
    Click, Left
    Sleep, 1000
return

CraftSelected:
    if (!autocrafting)
        return

    if (selectedItem = "Heavenly Potion") {
        Gosub, CraftHeavenly
        Sleep, 500
        IfAdded := "Heavenly"

    } else if (selectedItem = "Bound Potion") {
        Gosub, CraftBound
        Sleep, 500
        IfAdded := "Bound"

    } else if (selectedItem = "Zeus Potion") {
        Gosub, CraftZeus
        Sleep, 500
        IfAdded := "Zeus"

    } else if (selectedItem = "Hades Potion") {
        Gosub, CraftHades
        Sleep, 500
        IfAdded := "Hades"

    } else if (selectedItem = "Poseidon Potion") {
        Gosub, CraftPoseidon
        Sleep, 500
        IfAdded := "Poseidon"

    } else if (selectedItem = "Jewelry Potion") {
        Gosub, CraftJewerly
        Sleep, 500
        IfAdded := "Jewerly"

    } else if (selectedItem = "Zombie Potion") {
        Gosub, CraftZombie
        Sleep, 500
        IfAdded := "Zombie"

    } else if (selectedItem = "Rage Potion") {
        Gosub, CraftRage
        Sleep, 500
        IfAdded := "Rage"

    } else if (selectedItem = "Diver Potion") {
        Gosub, CraftDiver
        Sleep, 500
        IfAdded := "Diver"
    }
return

CollectSnowman:
    Send, {a Down}
    Sleep, 3000
    Send, {a Up}
    Sleep, 50

    Send, {s Down}
    Sleep, 5000
    Send, {s Up}
    Sleep, 50

    Send, {w Down}
    Sleep, 100
    Send, {w Up}
    Sleep, 50

    Send, {Space Down}
    Sleep, 50
    Send, {Space Up}
    Sleep, 50

    Send, {s Down}
    Sleep, 500
    Send, {s Up}
    Sleep, 50

    Send, {a Down}
    Sleep, 2350
    Send, {a Up}
    Sleep, 50

    Send, {w Down}
    Sleep, 200
    Send, {w Up}
    Sleep, 50

    Send, {e Down}
    Sleep, 150
    Send, {e Up}
    Sleep, 50

    Send, {Esc}
    Sleep, 500

     Send, r
     Sleep, 500

    Send, {Enter}
     Sleep, 3000
return

CraftArchDevice:
    Send, {a Down}
    Sleep, 3000
    Send, {a Up}
    Sleep, 50
    Send, {s Down}
    Sleep, 5000
    Send, {s Up}
    Sleep, 50
    Send, {a Down}
    Sleep, 1100
    Send, {a Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 100
    Send, {w Up}
    Sleep, 50

    Send, {Space Down}
    Sleep, 50
    Send, {Space Up}
    Sleep, 50

    Send, {s Down}
    Sleep, 2250
    Send, {s Up}
    Sleep, 50

    Send, {Shift}
    Sleep, 250

    Send, {d Down}
    Sleep, 1800
    Send, {d Up}
    Sleep, 250
    Send, {Shift}
    Sleep, 250

    Send, e
    Sleep, 600
    MouseMove, 960, 800, 3
    Sleep, 250
    Click, Left
    Sleep, 600
    MouseMove, 670, 949, 3
    Sleep, 250
    Click, Left
    Sleep, 800
    MouseMove, 900, 365, 3
    Sleep, 350
    Click, Left
    Sleep, 350
    Send, Angel Device
    Sleep, 350
    MouseMove, 1111, 444, 3
    Sleep, 250
    Send, {WheelUp 25}
    Sleep, 500
    Click, Left
    Sleep, 500
    MouseMove, 600, 700, 3
    Sleep, 400
    Send, {WheelUp 25}
    Sleep, 800
    Send, {WheelDown 25}
    Sleep, 800

    ; Divnus Angel (7)
    MouseMove, 800, 770, 3
    Sleep, 250
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 250

    ; Hope (5)
    MouseMove, 800, 720, 3
    Sleep, 250
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 250

    ; Faith (1)
    MouseMove, 800, 665, 3
    Sleep, 250
    Click, Left
    Sleep, 1000
    MouseMove, 1420, 302, 3
    Sleep, 250
    Click, Left
    Sleep, 500

    Send, {Esc}
    Sleep, 500
    Send, r
    Sleep, 500
    Send, {Enter}
    Sleep, 3500
return

CraftMatrixSteampunk:
    Send, {a Down}
    Sleep, 3000
    Send, {a Up}
    Sleep, 50
    Send, {s Down}
    Sleep, 5000
    Send, {s Up}
    Sleep, 50
    Send, {a Down}
    Sleep, 1100
    Send, {a Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 100
    Send, {w Up}
    Sleep, 50

    Send, {Space Down}
    Sleep, 50
    Send, {Space Up}
    Sleep, 50

    Send, {s Down}
    Sleep, 2250
    Send, {s Up}
    Sleep, 50

    Send, {Shift}
    Sleep, 250

    Send, {d Down}
    Sleep, 1800
    Send, {d Up}
    Sleep, 250
    Send, {Shift}
    Sleep, 250

    Send, e
    Sleep, 600
    MouseMove, 960, 800, 3
    Sleep, 250
    Click, Left
    Sleep, 600
    MouseMove, 670, 949, 3
    Sleep, 250
    Click, Left
    Sleep, 800


    MouseMove, 1150, 340,3
    Sleep, 250
    Click, Left
    MouseMove, 900, 365, 3
    Sleep, 350
    Click, Left
    Sleep, 350
    Send, Steampunk
    Sleep, 350
    MouseMove, 1111, 444, 3
    Sleep, 250
    Send, {WheelUp 25}
    Sleep, 500
    Click, Left
    Sleep, 500
    MouseMove, 600, 700, 3
    Sleep, 400
    Send, {WheelUp 25}
    Sleep, 800

    ; Magnetic Polarity (5)
    MouseMove, 800, 690, 3
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500

    ; Virtual (3)
    MouseMove, 800, 740, 3
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500

    ; Zeus (2)
    Send, {WheelUp 1}
    Sleep, 500
    MouseMove, 800, 670, 3
    Sleep, 300
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500

    ; Hypervolt (1)
    MouseMove, 800, 725, 3
    Sleep, 300
    Click, Left
    Sleep, 500

    MouseMove, 1400, 300, 3
    Sleep, 300
    Click, Left

    Send, {Esc}
    Sleep, 500
    Send, r
    Sleep, 500
    Send, {Enter}
    Sleep, 3500
return

CraftRunicDevice:
    Send, {a Down}
    Sleep, 3000
    Send, {a Up}
    Sleep, 50
    Send, {s Down}
    Sleep, 5000
    Send, {s Up}
    Sleep, 50
    Send, {a Down}
    Sleep, 1100
    Send, {a Up}
    Sleep, 200
    Send, {w Down}
    Sleep, 100
    Send, {w Up}
    Sleep, 50

    Send, {Space Down}
    Sleep, 50
    Send, {Space Up}
    Sleep, 50

    Send, {s Down}
    Sleep, 2250
    Send, {s Up}
    Sleep, 50

    Send, {Shift}
    Sleep, 250

    Send, {d Down}
    Sleep, 1800
    Send, {d Up}
    Sleep, 250
    Send, {Shift}
    Sleep, 250

    Send, e
    Sleep, 600
    MouseMove, 960, 800, 3
    Sleep, 250
    Click, Left
    Sleep, 600
    MouseMove, 670, 949, 3
    Sleep, 250
    Click, Left
    Sleep, 800
    MouseMove, 900, 365, 3
    Sleep, 350
    Click, Left
    Sleep, 350
    Send, Unfathomable Ruins
    Sleep, 350
    MouseMove, 1111, 444, 3
    Sleep, 250
    Send, {WheelUp 25}
    Sleep, 500
    Click, Left
    Sleep, 500
    MouseMove, 600, 700, 3
    Sleep, 400
    Send, {WheelUp 25}
    Sleep, 800
    Send, {WheelDown 25}
    Sleep, 800

    ; Flows (15)
    MouseMove, 800, 770, 3
    Sleep, 250
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 500
    Click, Left
    Sleep, 250

    Send, {Esc}
    Sleep, 500
    Send, r
    Sleep, 500
    Send, {Enter}
    Sleep, 3500
return

StartAutoClicker:
    Gui, Submit, NoHide

    if (autoClicker)
        return

    autoClicker := true

    GuiControl, Disable, AutoClickStart
    GuiControl, Enable, AutoClickStop
    GuiControl,, AutoClickerStatus, ON
    GuiControl, +c0x00DD00, AutoClickerStatus

    autoClickDelayMS := AutoClickDelay * 1000
    SetTimer, AutoClickTick, %autoClickDelayMS%
return

StopAutoClicker:
    autoClicker := false

    SetTimer, AutoClickTick, Off

    GuiControl, Enable, AutoClickStart
    GuiControl, Disable, AutoClickStop
    GuiControl,, AutoClickerStatus, OFF
    GuiControl, +c0xFF4444, AutoClickerStatus
return

AutoClickTick:
    if (!autoClicker)
        return

    Click
return





UpdateGUI:
if (toggle) {
    GuiControl,, StatusText, Running
    GuiControl, +c0x00DD00, StatusText
    GuiControl,, ResStatusText, Active - %res%

    elapsed := A_TickCount - startTick
    hours := elapsed // 3600000
    minutes := (elapsed - hours * 3600000) // 60000
    seconds := (elapsed - hours * 3600000 - minutes * 60000) // 1000
    timeStr := Format("{:02d}:{:02d}:{:02d}", hours, minutes, seconds)
    GuiControl,, RuntimeText, %timeStr%
    GuiControl, +c0x00DD00, RuntimeText
    GuiControl,, CyclesText, %cycleCount%
    GuiControl, +c0x00DD00, CyclesText


} else {
    GuiControl,, StatusText, Stopped
    GuiControl, +c0xFF4444, StatusText
    GuiControl,, ResStatusText, Ready
}
return


ManualGUIUpdate() {
    if (toggle) {
        GuiControl,, StatusText, Running
        GuiControl, +c0x00DD00, StatusText
        GuiControl,, ResStatusText, Active - %res%

        elapsed := A_TickCount - startTick
        hours := elapsed // 3600000
        minutes := (elapsed - hours * 3600000) // 60000
        seconds := (elapsed - hours * 3600000 - minutes * 60000) // 1000
        timeStr := Format("{:02d}:{:02d}:{:02d}", hours, minutes, seconds)
        GuiControl,, RuntimeText, %timeStr%
        GuiControl, +c0x00DD00, RuntimeText
        GuiControl,, CyclesText, %cycleCount%
        GuiControl, +c0x00DD00, CyclesText


    } else {
        GuiControl,, StatusText, Stopped
        GuiControl, +c0xFF4444, StatusText
        GuiControl,, ResStatusText, Ready
    }
}

F1::
if (!res) {
    res := "1080p"
}
if (!toggle) {
    Gui, Submit, nohide
    if (MaxLoopInput > 0) {
        maxLoopCount := MaxLoopInput
    }
    if (FishingLoopInput > 0) {
        fishingLoopCount := FishingLoopInput
    }
    toggle := true
    if (startTick = "") {
        startTick := A_TickCount
    }
    if (cycleCount = "") {
        cycleCount := 0
    }
    IniWrite, %res%, %iniFilePath%, Macro, resolution
    IniWrite, %maxLoopCount%, %iniFilePath%, Macro, maxLoopCount
    IniWrite, %fishingLoopCount%, %iniFilePath%, Macro, fishingLoopCount
    WinActivate, ahk_exe RobloxPlayerBeta.exe
    ManualGUIUpdate()
    SetTimer, UpdateGUI, 1000
    if (res = "1080p") {
        SetTimer, DoMouseMove, 100
    }
}
if (onoffWebhook) {
    try SendWebhook3(":green_circle: Macro Started!", "7909721")
}
return



F2::
    toggle := false
    firstLoop := true
    SetTimer, DoMouseMove, Off
    SetTimer, UpdateGUI, Off
    ManualGUIUpdate()
    ToolTip
Return

F3::
    if (onoffWebhook) {
            try SendWebhook3(":red_circle: Macro Stopped.", "14495300")
    }
    ExitApp
return


F4::
    Gui, Submit, NoHide

    if (autocrafting || toggle)
        return

    if (selectedItem = "") {
        ToolTip, Please Select Item To Craft!, 900, 10
        Sleep, 2500
        ToolTip
        return
    }

    autocrafting := true

    if (onoffWebhook) {
        try SendWebhook("Crafting Started", 7909721)
    }

    ToolTip, Crafting will start in 5 seconds..., 900, 10
    Sleep, 1000
    ToolTip, Crafting will start in 4 seconds..., 900, 10
    Sleep, 1000
    ToolTip, Crafting will start in 3 seconds..., 900, 10
    Sleep, 1000
    ToolTip, Crafting will start in 2 seconds..., 900, 10
    Sleep, 1000
    ToolTip, Crafting will start in 1 second..., 900, 10
    Sleep, 1000
    ToolTip

    SetTimer, CraftSelected, 1000
return


F5:: 
if (!autocrafting)
   return

   if (onoffWebhook) {
        try SendWebhook("Crafting Stopped", "14495300")
   }

    autocrafting := false
    SetTimer, CraftSelected, Off

    ToolTip, Crafting has Stopped. Plese wait Until Crafting finishes it's Cycle. (5), 800, 10
    sleep 1000
    ToolTip, Crafting has Stopped. Plese wait Until Crafting finishes it's Cycle. (4), 800, 10
    sleep 1000
    ToolTip, Crafting has Stopped. Plese wait Until Crafting finishes it's Cycle. (3), 800, 10
    Sleep 1000
    ToolTip, Crafting has Stopped. Plese wait Until Crafting finishes it's Cycle. (2), 800, 10
    Sleep 1000
    ToolTip, Crafting has Stopped. Plese wait Until Crafting finishes it's Cycle. (1), 800, 10
    Sleep 1000
    ToolTip
return

F6::
    if (!nvidiaReplay && !detectTranscendents && !detectLimbo)
        return

    if (detectLimbo && !nvidiaReplay && detectTranscendents) {
        SetTimer, DoContract, Off
        ToolTip
        if (clipWebhook)
            try SendWebhook(":warning: Contracting Canceled", 14495300)
        return
    } else if (detectLimbo && nvidiaReplay && !detectTranscendents) {
        SetTimer, DoContract, Off
        ToolTip
        if (clipWebhook)
            try SendWebhook(":warning: Contracting Canceled", 14495300)
        return
    } else if (detectLimbo && !nvidiaReplay && !detectTranscendents) {
        SetTimer, DoContract, Off
        ToolTip
        if (clipWebhook)
            try SendWebhook(":warning: Contracting Canceled", 14495300)
        return
    }

    if (nvidiaReplay && !detectLimbo) {
        SetTimer, DoClip, Off

        if (detectTranscendents)
            SetTimer, DoClip2, Off

        ToolTip
        if (clipWebhook)
            try SendWebhook(":warning: Clipping Canceled", 14495300)
        return
    }

    if (detectTranscendents && !detectLimbo && !nvidiaReplay) {
        SetTimer, DoClip2, Off
        ToolTip
        if (clipWebhook)
            try SendWebhook(":warning: Clipping Canceled", 14495300)
        return
    }
return




;1080p
DoMouseMove:
if (toggle) {
    global pathingMode
    global privateServerLink
    global globalFailsafeTimer
    global azertyPathing
    global autoUnequip
    global useNothing
    global autoCloseChat
    global snowmanCollect
    global strangeController
    global biomeRandomizer
    global DoBiomeRandomizer
    global DoStrangeController
    global CollectSnowman
    global CraftArchDevice
    global CraftMatrixSteampunk
    global code
    loopCount := 0
    keyW := azertyPathing ? "z" : "w"
    keyA := azertyPathing ? "q" : "a"
    Loop {
        restartPathing := false
        if (!toggle) {
            break
        }

        loopCount++
        if (loopCount > maxLoopCount) {
        Send, {Esc}
        Sleep, 650
        Send, R
        Sleep, 650
        Send, {Enter}
        sleep 3000

    if (autoCloseChat) {
        PixelGetColor, chatcolor, 138, 40, RGB
        if (chatcolor != 0x121215) {
            Send, {Esc}
            Sleep, 300
            MouseMove, 800, 210, 3
            Sleep, 300
            Click, Left
            MouseMove, 800, 460, 3
            Sleep, 300
            Click, WheelDown, 25
            Sleep, 300
            MouseMove, 1285, 340, 3
            Sleep, 300
            Click, Left
            Sleep, 300
            Send, {Esc}
            Sleep, 1000
        }

        PixelGetColor, chatcolor2, 138, 40, RGB
        if (chatcolor2 = 0xF7F7F8) {
            Sleep, 300
            MouseMove, 145, 40, 3
            Sleep, 300
            MouseClick, Left
            Sleep, 300
        } else if (chatcolor2 = 0x121215) {
            Sleep, 300
        }
    }

    if (autoUnequip && useNothing) {
            MouseMove, 45, 412, 3
            sleep 150
            Click, Left
            sleep 150
            MouseMove, 820, 370, 3
            sleep 250
            Click, Left
            Send, Nothing
            sleep 150
            MouseMove, 830, 441, 3
            sleep 500
            Send, {WheelUp 25}
            Sleep, 750
            Click, Left
            sleep 300
            MouseMove, 634, 638, 3
            sleep 150
            Click, Left
            sleep 700
            Click, Left
            Sleep, 250
            MouseMove, 1425, 303, 3
            sleep 150
            Click, Left
            sleep 150
        }

    if (autoUnequip && !useNothing) {
            MouseMove, 45, 412, 3
            sleep 150
            Click, Left
            sleep 150
            MouseMove, 830, 441, 3
            sleep 150
            Click, Left
            sleep 150
            MouseMove, 634, 638, 3
            sleep 159
            Click, Left
            sleep 1200
            Click, Left
            sleep 150
            MouseMove, 1425, 303, 3
            sleep 150
            Click, Left
            sleep 150
        }

    if (strangeController && biomeRandomizer) {
        Gosub, DoStrangeController
        Sleep, 500
        Gosub, DoBiomeRandomizer
    } else if (strangeController && !biomeRandomizer) {
        Gosub, DoStrangeController
    } else if (biomeRandomizer && !strangeController) {
        Gosub, DoBiomeRandomizer
    }



        MouseMove, 47, 467, 3
        sleep 220
        Click, Left
        sleep 220
        MouseMove, 382, 126, 3
        sleep 220
        Click, Left
        sleep 220
		Click, WheelUp 80
		sleep 500
		Click, WheelDown 45
		sleep 300

 
        if (snowmanCollect) {
            Gosub, CollectSnowman
        }

        if (archDevice && !steampunkAura && !addFlows) {
            Gosub, CraftArchDevice
        }

        if !archDevice && steampunkAura && !addFlows {
            Gosub, CraftMatrixSteampunk
        }

        if !archDevice && !steampunkAura && addFlows {
            Gosub, CraftRunicDevice
        }

        if archDevice && steampunkAura && !addFlows {
            Gosub, CraftArchDevice
            Sleep, 500
            Gosub, CraftMatrixSteampunk
        }

        if !archDevice && steampunkAura && addFlows {
            Gosub, CraftMatrixSteampunk
            Sleep, 500
            Gosub, CraftRunicDevice
        }

        if archDevice && !steampunkAura && addFlows {
            Send, {a Down}
            Sleep, 3000
            Send, {a Up}
            Sleep, 50

            Send, {s Down}
            Sleep, 5000
            Send, {s Up}
            Sleep, 50

            Send, {a Down}
            Sleep, 1100
            Send, {a Up}
            Sleep, 200

            Send, {w Down}
            Sleep, 100
            Send, {w Up}
            Sleep, 50

            Send, {Space Down}
            Sleep, 50
            Send, {Space Up}
            Sleep, 50

            Send, {s Down}
            Sleep, 2250
            Send, {s Up}
            Sleep, 50

            Send, {Shift}
            Sleep, 250

            Send, {d Down}
            Sleep, 1800
            Send, {d Up}
            Sleep, 250

            Send, {Shift}
            Sleep, 250

            Send, e
            Sleep, 600
            MouseMove, 960, 800, 3
            Sleep, 250
            Click, Left
            Sleep, 600
            MouseMove, 670, 949, 3
            Sleep, 250
            Click, Left
            Sleep, 800

            MouseMove, 900, 340
            Sleep, 350
            Click, Left
            MouseMove, 900, 365, 3
            Sleep, 350
            Click, Left
            Sleep, 350
            Send, Angel Device
            Sleep, 350
            MouseMove, 1111, 444, 3
            Sleep, 250
            Send, {WheelUp 25}
            Sleep, 500
            Click, Left
            Sleep, 500
            MouseMove, 600, 700, 3
            Sleep, 400
            Send, {WheelUp 25}
            Sleep, 800
            Send, {WheelDown 25}
            Sleep, 800

            ; Divnus Angel (7)
            MouseMove, 800, 770, 3
            Sleep, 250
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 250

            ; Hope (5)
            MouseMove, 800, 720, 3
            Sleep, 250
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 250

            ; Faith (1)
            MouseMove, 800, 665, 3
            Sleep, 250
            Click, Left
            Sleep, 1000

            MouseMove, 900, 365, 3
            Sleep, 350
            Click, Left
            Sleep, 350
            Send, Unfathomable Ruins
            Sleep, 350
            MouseMove, 1111, 444, 3
            Sleep, 250
            Send, {WheelUp 25}
            Sleep, 500
            Click, Left
            Sleep, 500
            MouseMove, 600, 700, 3
            Sleep, 400
            Send, {WheelUp 25}
            Sleep, 800
            Send, {WheelDown 25}
            Sleep, 800

            ; Flows (15)
            MouseMove, 800, 770, 3
            Sleep, 250
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 750

            MouseMove, 1400, 300, 3
            Sleep, 300
            Click, Left
            Sleep, 300

            Send, {Esc}
            Sleep, 500
            Send, r
            Sleep, 500
            Send, {Enter}
            Sleep, 3500
        }

        if archDevice && steampunkAura && addFlows {
            Send, {a Down}
            Sleep, 3000
            Send, {a Up}
            Sleep, 50

            Send, {s Down}
            Sleep, 5000
            Send, {s Up}
            Sleep, 50

            Send, {a Down}
            Sleep, 1100
            Send, {a Up}
            Sleep, 200

            Send, {w Down}
            Sleep, 100
            Send, {w Up}
            Sleep, 50

            Send, {Space Down}
            Sleep, 50
            Send, {Space Up}
            Sleep, 50

            Send, {s Down}
            Sleep, 2250
            Send, {s Up}
            Sleep, 50

            Send, {Shift}
            Sleep, 250

            Send, {d Down}
            Sleep, 1800
            Send, {d Up}
            Sleep, 250

            Send, {Shift}
            Sleep, 250

            Send, e
            Sleep, 600
            MouseMove, 960, 800, 3
            Sleep, 250
            Click, Left
            Sleep, 600
            MouseMove, 670, 949, 3
            Sleep, 250
            Click, Left
            Sleep, 800

            MouseMove, 900, 340
            Sleep, 350
            Click, Left
            MouseMove, 900, 365, 3
            Sleep, 350
            Click, Left
            Sleep, 350
            Send, Angel Device
            Sleep, 350
            MouseMove, 1111, 444, 3
            Sleep, 250
            Send, {WheelUp 25}
            Sleep, 500
            Click, Left
            Sleep, 500
            MouseMove, 600, 700, 3
            Sleep, 400
            Send, {WheelUp 25}
            Sleep, 800
            Send, {WheelDown 25}
            Sleep, 800

            ; Divnus Angel (7)
            MouseMove, 800, 770, 3
            Sleep, 250
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 250

            ; Hope (5)
            MouseMove, 800, 720, 3
            Sleep, 250
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 250

            ; Faith (1)
            MouseMove, 800, 665, 3
            Sleep, 250
            Click, Left
            Sleep, 1000



            MouseMove, 900, 365, 3
            Sleep, 350
            Click, Left
            Sleep, 350
            Send, Unfathomable Ruins
            Sleep, 350
            MouseMove, 1111, 444, 3
            Sleep, 250
            Send, {WheelUp 25}
            Sleep, 500
            Click, Left
            Sleep, 500
            MouseMove, 600, 700, 3
            Sleep, 400
            Send, {WheelUp 25}
            Sleep, 800
            Send, {WheelDown 25}
            Sleep, 800

            ; Flows (15)
            MouseMove, 800, 770, 3
            Sleep, 250
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 750

            ; Steampunk
            MouseMove, 1150, 340,3
            Sleep, 250
            Click, Left
            MouseMove, 900, 365, 3
            Sleep, 350
            Click, Left
            Sleep, 350
            Send, Steampunk
            Sleep, 350
            MouseMove, 1111, 444, 3
            Sleep, 250
            Send, {WheelUp 25}
            Sleep, 500
            Click, Left
            Sleep, 500
            MouseMove, 600, 700, 3
            Sleep, 400
            Send, {WheelUp 25}
            Sleep, 800

            ; Magnetic Polarity (5)
            MouseMove, 800, 690, 3
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500

            ; Virtual (3)
            MouseMove, 800, 740, 3
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500

            ; Zeus (2)
            Send, {WheelDown 1}
            Sleep, 500
            MouseMove, 800, 670, 3
            Sleep, 300
            Click, Left
            Sleep, 500
            Click, Left
            Sleep, 500

            ; Hypervolt (1)
            MouseMove, 800, 725, 3
            Sleep, 300
            Click, Left
            Sleep, 500

            MouseMove, 1400, 300, 3
            Sleep, 300
            Click, Left
            Sleep, 300

            Send, {Esc}
            Sleep, 500
            Send, r
            Sleep, 500
            Send, {Enter}
            Sleep, 3500
        }




        if (pathingMode = "Vip Pathing") {
            ; VIP Pathing
            Send, {%keyW% Down}
            Send, {%keyA% Down}
            sleep 4150
            Send, {%keyW% Up}
            sleep 600
            Send {%keyA% Up}
            sleep 200
            Send {%keyW% Down}
            sleep 400
            Send {%keyW% Up}
            sleep 300
            Send {d Down}
            sleep 180
            Send {d Up}
            sleep 150
            Send {%keyW% Down}
            sleep 1100
            Send {%keyW% Up}
            sleep 300
            Send {s Down}
            sleep 300
            Send {S Up}
            sleep 300
            Send {Space Down}
            sleep 25
            Send {%keyW% Down}
            sleep 1200
            Send {Space Up}
            sleep 200
            Send {%keyW% Up}
            sleep 300
            Send, {Shift Down}
            Sleep, 300
            Send, {Shift Up}
            Sleep, 300
            Send {e Down}
            sleep 300
            Send {e Up}
            sleep 300
            MouseMove, 956, 803, 3
            sleep 50
            MouseClick, Left
            sleep 50
            MouseClick, Left
            sleep 200
            MouseMove, 956, 938, 3
            sleep 200
            MouseClick, Left
            sleep 800
            loopCount := 0

            while (loopCount < fishingLoopCount) {
                MouseMove, 828, 404, 3
                sleep 200
                MouseClick, Left
                sleep 200
                if (sellAllToggle) {
                    MouseMove, 680, 804, 3
                } else {
                    MouseMove, 512, 804, 3
                }
                sleep 200
                MouseClick, Left
                sleep 300
                MouseMove, 801, 626, 3
                sleep 200
                MouseClick, Left
                sleep 1000
                loopCount++
            }

            MouseMove, 1458, 266, 3
            sleep 200
            MouseClick, Left
            sleep 200
            Send, {%keyA% Down}
            sleep 1400
            Send, {%keyA% Up}
            sleep 75
            Send, {%keyW% Down}
            sleep 2670
            Send, {%keyW% Up}
            loopCount := 0
        }
     }
 

        MouseMove, 862, 843, 3
        Sleep 300
        MouseClick, Left
        sleep 300
        barColor := 0
        otherBarColor := 0

        ; Check for white pixel
        startWhitePixelSearch := A_TickCount
        if (globalFailsafeTimer = 0) {
        globalFailsafeTimer := A_TickCount
        }
        fishingFailsafeRan := false
        Loop {
        PixelGetColor, color, 1176, 836, RGB
        if (color = 0xFFFFFF) {
        MouseMove, 950, 880, 3
        ; Get randomized bar color
        Sleep 50
        PixelGetColor, barColor, 955, 767, RGB
        SetTimer, DoMouseMove, Off
        globalFailsafeTimer := 0
        break
        }

        ; Auto Rejoin Failsafe
        if (A_TickCount - globalFailsafeTimer > (autoRejoinFailsafeTime * 1000) && privateServerLink != "") {
        PixelGetColor, checkColor, 1175, 837, RGB
        if (checkColor != 0xFFFFFF) {
        Process, Close, RobloxPlayerBeta.exe
        sleep 2000
        Run, % "powershell -NoProfile -Command ""Start-Process 'roblox://navigation/share_links?code=" code "&type=Server'"""
        sleep 8000
        WinActivate, ahk_exe RobloxPlayerBeta.exe
        sleep 2000

        ; Skip button
        sleep 13000
        MouseMove, 960, 540, 3
        sleep 350
        MouseClick, Left
        sleep 2000
        startButtonSearch := A_TickCount
        Loop {
        ErrorLevel := 0
        PixelSearch, px, py, 894, 811, 1013, 848, 0xFFFFFF, 3, Fast RGB
        if (ErrorLevel = 0) {
        MouseMove, 960, 825, 3
        sleep 350
        MouseClick, Left
        break
        }
        if (A_TickCount - startButtonSearch > 30000) {
        break
        }
        sleep 100
        }

        ; Start Button
        sleep 7000
        startButtonSearch2 := A_TickCount
        Loop {
        ErrorLevel := 0
        PixelSearch, px, py, 814, 839, 962, 892, 0xFFFFFF, 3, Fast RGB
        if (ErrorLevel = 0) {
        MouseMove, 960, 870, 3
        sleep 350
        MouseClick, Left
        break
        }
        if (A_TickCount - startButtonSearch2 > 30000) {
        break
        }
        sleep 100
        }

        sleep 2500
        Send {F11}
        sleep 2500

        ; Reset timer after rejoining
        globalFailsafeTimer := A_TickCount
        restartPathing := true
        break
        }
        }

        ; Fishing Failsafe
        if (A_TickCount - startWhitePixelSearch > (fishingFailsafeTime * 1000) && !fishingFailsafeRan) {
        MouseMove, 1268, 941, 3
        sleep 300
        MouseClick, Left
        sleep 300
        MouseMove, 1167, 476, 3
        sleep 300
        MouseClick, Left
        sleep 300
        MouseMove, 1113, 342, 3
        sleep 300
        MouseClick, left
        sleep 300
        MouseMove, 851, 832, 3
        sleep 300
        MouseClick, Left
        fishingFailsafeRan := true
        }
        ; Pathing Failsafe
        if (A_TickCount - startWhitePixelSearch > (pathingFailsafeTime * 1000)) {
        restartPathing := true
        break
        }
        if (!toggle) {
        Return
        }
        }

        if (restartPathing) {
        continue
        }

        ; PixelSearch loop with 9-second timeout
        startTime := A_TickCount
        Loop {
        if (!toggle)
        break
        if (A_TickCount - startTime > 9000)
        break

        ; Advanced detection
        if (advancedFishingDetection) {
            ErrorLevel := 0
            PixelSearch, leftX, leftY, 757, 767, 1161, 767, barColor, 5, Fast RGB
            if (ErrorLevel = 0) {
                rightX := leftX
                Loop {
                    testX := rightX + 1
                    if (testX > 1161)
                        break
                    PixelGetColor, testColor, %testX%, 767, RGB
                    if (Abs((testColor & 0xFF) - (barColor & 0xFF)) <= 10 && Abs(((testColor >> 8) & 0xFF) - ((barColor >> 8) & 0xFF)) <= 10 && Abs(((testColor >> 16) & 0xFF) - ((barColor >> 16) & 0xFF)) <= 10) {
                        rightX := testX
                    } else {
                        break
                    }
                }
                barWidth := rightX - leftX
                if (barWidth < advancedFishingThreshold) {
                    MouseClick, left
                    sleep 25
                }
            } else {
                MouseClick, left
            }
            sleep 10
        } else {
            ErrorLevel := 0
            PixelSearch, FoundX, FoundY, 757, 762, 1161, 782, barColor, 5, Fast RGB
            if (ErrorLevel = 0) {
            } else {
                MouseClick, left
            }
        }
        }
        sleep 300
        MouseMove, 1113, 342, 3
        Sleep 700
        /*
        Loop {
        PixelGetColor, color, 1112, 342, RGB
        if (color = 0xFFFFFF) {
        break
        }
        if (!toggle) {
        Return
        }
        }
        */
        MouseClick, Left
        sleep 300
        cycleCount++
    }
}
Return




StartScript:
if (!toggle) {
    Gui, Submit, nohide
    if (MaxLoopInput > 0) {
        maxLoopCount := MaxLoopInput
    }
    if (FishingLoopInput > 0) {
        fishingLoopCount := FishingLoopInput
    }
    toggle := true
    if (startTick = "") {
        startTick := A_TickCount
    }
    if (cycleCount = "") {
        cycleCount := 0
    }
    WinActivate, ahk_exe RobloxPlayerBeta.exe
    ManualGUIUpdate()
    SetTimer, UpdateGUI, 1000
    if (res = "1080p") {
        SetTimer, DoMouseMove, 100
    }
    if (onoffWebhook) {
            try SendWebhook3(":green_circle: Macro Started!", "7909721")
            }
        }
return

StartScript(res) {
    if (!toggle) {
        Gui, Submit, nohide
        if (MaxLoopInput > 0) {
            maxLoopCount := MaxLoopInput
        }
        if (FishingLoopInput > 0) {
            fishingLoopCount := FishingLoopInput
        }
        toggle := true
        if (startTick = "") {
            startTick := A_TickCount
        }
        if (cycleCount = "") {
            cycleCount := 0
        }
        WinActivate, ahk_exe RobloxPlayerBeta.exe
        ManualGUIUpdate()
        SetTimer, UpdateGUI, 1000
        if (res = "1080p") {
            SetTimer, DoMouseMove, 100
        }
    if (onoffWebhook) {
            try SendWebhook3(":green_circle: Macro Started!", "7909721")
            }
        }
    }
return


PauseScript:
    toggle := false
    firstLoop := true
    SetTimer, DoMouseMove, Off
    SetTimer, UpdateGUI, Off
    ManualGUIUpdate()
    ToolTip
return

CloseScript:
if (onoffWebhook) {
            try SendWebhook3(":red_circle: Macro Stopped.", "14495300")
        }
    ExitApp
return

SelectRes:
    Gui, Submit, nohide
    res := Resolution
    IniWrite, %res%, %iniFilePath%, Macro, resolution
    ManualGUIUpdate()
return

SelectPathing:
    Gui, Submit, nohide
    IniWrite, %PathingMode%, %iniFilePath%, Macro, pathingMode
    pathingMode := PathingMode
return

Dev1NameClick:
if (dev1_name = "cresqnt") {
    Run, https://cresqnt.com
}
return

Dev1LinkClick:
if (dev1_name = "maxstellar") {
    Run, https://www.twitch.tv/maxstellar
} else if (dev1_name = "cresqnt") {
    Run, https://scopedevelopment.tech
} else if (dev1_name = "ivelchampion249") {
    Run, https://www.youtube.com/@ivelchampion
}
return

Dev2NameClick:
if (dev2_name = "cresqnt") {
    Run, https://cresqnt.com
}
return

Dev2LinkClick:
if (dev2_name = "maxstellar") {
    Run, https://www.twitch.tv/maxstellar
} else if (dev2_name = "cresqnt") {
    Run, https://scopedevelopment.tech
} else if (dev2_name = "ivelchampion249") {
    Run, https://www.youtube.com/@ivelchampion
}
return

Dev3NameClick:
if (dev3_name = "cresqnt") {
    Run, https://cresqnt.com
}
return

Dev3LinkClick:
if (dev3_name = "maxstellar") {
    Run, https://www.twitch.tv/maxstellar
} else if (dev3_name = "cresqnt") {
    Run, https://scopedevelopment.tech
} else if (dev3_name = "ivelchampion249") {
    Run, https://www.youtube.com/@ivelchampion
}
return

ReleasesClick:
    Run, https://github.com/knowaery/Aery-s-Fishsol
return
