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
maxLoopCount := 15
fishingLoopCount := 15
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
transcendentColors := [0x060908, 0xC2C2C2 0xFEFEFE, 0X566980, 0x66AE65, 0x010105, 0x010103]
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
ClipWebhook := false
onoffWebhook := false
GlobalArea := false
TransArea := false
doPing := false
doPing2 := false
autoCraft:= false
autocrafting := false
useCelestial := false
useExotic := false
useBounded := false
useZeus := false
usePoseidon := false
useHades := false



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

    IniRead, tempAutoCraft, %iniFilePath%, Macro, autoCraft
    if (tempAutoCraft != "ERROR")
    autoCraft := (tempAutoCraft = "true" || tempAutoCraft = "1")

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


    IniRead, tempAdvancedThreshold, %iniFilePath%, Macro, advancedFishingThreshold
    if (tempAdvancedThreshold != "ERROR" && tempAdvancedThreshold >= 0 && tempAdvancedThreshold <= 40)
    {
        advancedFishingThreshold := tempAdvancedThreshold
    }
}


version := "Aery's v1.7"
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
Gui, Add, Text, x0 y10 w600 h45 Center BackgroundTrans c0x00D4FF, Aery's fishSol 
Gui, Font, s12 cWhite Bold, Segoe UI
Gui, Add, Text, x160 y35 w290 h20 Center BackgroundTrans c0x00D4FF, (Only Works In 1080p and Needs VIP)




Gui, Font, s10 cWhite Normal, Segoe UI
Gui, Add, Tab3, x15 y55 w570 h600 vMainTabs gTabChange c0xFFFFFF, Main|Misc|Replay|Webhook|Failsafes|About

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
Gui, Add, Text, x285 y242 w270 h15 BackgroundTrans, (Fishing Cycles Before Reset - default: 15)
Gui, Font, s10 cWhite Bold
Gui, Add, Text, x45 y270 w180 h25 BackgroundTrans, Sell Loop Count:
Gui, Add, Edit, x220 y268 w60 h25 vFishingLoopInput gUpdateLoopCount Number Background0xD3D3D3 cBlack, %fishingLoopCount%
Gui, Font, s8 c0xCCCCCC
Gui, Add, Text, x285 y272 w270 h15 BackgroundTrans, (Sell Cycles  -  If Sell All: 22)
Gui, Font, s10 cWhite Bold
Gui, Add, Text, x45 y301 w120 h25 BackgroundTrans, Pathing Mode:
Gui, Font, s14 cWhite Bold
Gui, Add, Text, x145 y296 w135 h25 BackgroundTrans, VIP Pathing

Gui, Font, s10 cWhite Bold
Gui, Add, Text, x295 y301 w120 h25 BackgroundTrans, AZERTY Pathing:
Gui, Add, Button, x415 y298 w80 h25 gToggleAzertyPathing vAzertyPathingBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x510 y303 w60 h25 vAzertyPathingStatus BackgroundTrans, OFF


Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, Text, x270 y410 w120 h25 BackgroundTrans, Strange Controller:
Gui, Add, Button, x405 y405 w80 h25 gToggleStrangeController vStrangeControllerBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x500 y410 w60 h25 vStrangeControllerStatus BackgroundTrans, OFF

Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, Text, x270 y450 w125 h25 BackgroundTrans, Biome Randomizer:
Gui, Add, Button, x405 y445 w80 h25 gToggleBiomeRandomizer vBiomeRandomizerBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x500 y450 w60 h25 vBiomeRandomizerStatus BackgroundTrans, OFF


Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x30 y445 w205 h70 cWhite, Snowman Collect
Gui, Add, Button, x65 y474 w80 h25 gToggleSnowmanCollect vSnowmanCollectBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x160 y478 w60 h25 vSnowmanCollectStatus BackgroundTrans, OFF



Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x30 y345 w205 h95 cWhite, Live Statistics

Gui, Color, 0x1E1E1E
Gui, Font, s11 cWhite Bold, Segoe UI

Gui, Add, GroupBox, x250 y343 w315 h172 cWhite, Extra
Gui, Add, Text, x270 y370 w400 h30 BackgroundTrans, Biome/Strange Controller:
Gui, Font, s11 c0xFF2C00 Bold


Gui, Font, s11 cWhite Bold, Segoe UI
Gui, Add, Text, x50 y375 w100 h30 BackgroundTrans, Runtime:
Gui, Add, Text, x120 y375 w120 h30 vRuntimeText BackgroundTrans c0x00DD00, 00:00:00

Gui, Add, Text, x50 y405 w100 h30 BackgroundTrans, Cycles:
Gui, Add, Text, x102 y405 w120 h30 vCyclesText BackgroundTrans c0x00DD00, 0



Gui, Font, s10 c0xCCCCCC Bold
Gui, Add, Text, x175 y570 w500 h20 BackgroundTrans, Roblox MUST be in fullscreen mode

Gui, Tab, Misc

Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, GroupBox, x22 y90 w260 h165 cWhite, Auto-Unequip
Gui, Font, s9 cWhite Normal
Gui, Add, Text, x35 y110 h45 w240 BackgroundTrans c0xCCCCCC, Automatically unequip rolled auras every cycle. Prevents lag and possible macro issues.
Gui, Font, s9 cWhite Bold, Segoe UI
Gui, Add, Text, x35 y195 h45 w240 BackgroundTrans, Use "Nothing" aura from Limbo.
Gui, Font, s10 cWhite Bold
Gui, Add, Button, x35 y145 w80 h25 gToggleAutoUnequip vAutoUnequipBtn, Toggle
Gui, Add, Button, x35 y215 w80 h25 gToggleUseNothing vUseNothingBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x130 y148 w60 h25 vAutoUnequipStatus BackgroundTrans, OFF
Gui, Add, Text, x130 y218 w60 h25 vUseNothingStatus BackgroundTrans, OFF



Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, GroupBox, x307 y90 w270 h165 cWhite, Auto-Close Chat
Gui, Font, s9 cWhite Normal
Gui, Add, Text, x317 y110 h45 w225 BackgroundTrans c0xCCCCCC, Automatically closes chat every cycle to prevent getting stuck in collection.
Gui, Font, s9 cWhite Bold
Gui, Add, Text, x317 y150 h150 w250 BackgroundTrans,! Doesn't work if your chat is opened to "Server Message" !  
Gui, Font, s10 cWhite Bold
Gui, Add, Button, x320 y195 w80 h25 gToggleAutoCloseChat vAutoCloseChatBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x415 y198 w60 h25 vAutoCloseChatStatus BackgroundTrans, OFF

Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x22 y265 w554 h210 cWhite, Crafting
; Gui, Add, GroupBox, x45 y365 w200 h100 cWhite, Watch AD
Gui, Add, GroupBox, x28 y365 w210 h100 cWhite, Heavenly
Gui, Add, GroupBox, x247 y365 w130 h100 cWhite, Bound
Gui, Add, GroupBox, x385 y365 w181 h100 cWhite, Godly
Gui, Add, Button, x60 y325 w80 h25 gToggleAutoCraft vAutoCraftBtn, Toggle
Gui, Add, Text, x150 y329 w60 h25 vAutoCraftStatus BackgroundTrans, OFF
Gui, Add, Text, x375 y329 w220 h50 BackgroundTrans, F4 = Start | F5 = Stop

Gui, Font, s10 cWhite Bold
Gui, Add, Button, x118 y385 w80 h25 gToggleUseCelestial vUseCelestialBtn, Toggle
Gui, Add, Button, x118 y425 w80 h25 gToggleUseExotic vUseExoticBtn, Toggle
Gui, Add, Text, x208 y389 w60 h25 vUseCelestialStatus BackgroundTrans, OFF
Gui, Add, Text, x208 y429 w60 h25 vUseExoticStatus BackgroundTrans, OFF
Gui, Font, s9 cWhite Normal
Gui, Add, Text, x38 y389 w600 h100 BackgroundTrans c0xCCCCCC, Add Celestial: 
Gui, Add, Text, x38 y429 w600 h100 BackgroundTrans c0xCCCCCC, Add Exotic:

Gui, Font, s10 cWhite Bold
Gui, Add, Button, x258 y425 w80 h25 gToggleUseBounded vUseBoundedBtn, Toggle
Gui, Add, Text, x346 y429 w60 h25 vUseBoundedStatus BackgroundTrans, OFF
Gui, Font, s9 cWhite Normal
Gui, Add, Text, x258 y389 w600 h100 BackgroundTrans c0xCCCCCC, Add Bounded:

Gui, Font, s9 cWhite Bold
Gui, Add, Button, x480 y385 w50 h15 gToggleUseZeus vUseZeusBtn, Toggle
Gui, Add, Button, x480 y414 w50 h15 gToggleUseHades vUseHadesBtn, Toggle
Gui, Add, Button, x480 y440 w50 h15 gToggleUsePoseidon vUsePoseidonBtn, Toggle
Gui, Add, Text, x535 y387 w60 h25 vUseZeusStatus BackgroundTrans, OFF
Gui, Add, Text, x535 y416 w60 h25 vUseHadesStatus BackgroundTrans, OFF
Gui, Add, Text, x535 y442 w60 h25 vUsePoseidonStatus BackgroundTrans, OFF
Gui, Font, s9 cWhite Normal
Gui, Add, Text, x395 y389 w600 h100 BackgroundTrans c0xCCCCCC, Add Zeus: 
Gui, Add, Text, x395 y414 w600 h100 BackgroundTrans c0xCCCCCC, Add Hades:
Gui, Add, Text, x395 y440 w600 h100 BackgroundTrans c0xCCCCCC, Add Poseidon:


Gui, Font, s9 cWhite Normal
Gui, Add, Text, x45 y285 w534 h100 BackgroundTrans c0xCCCCCC, Adds the nessecary potions and/or auras. Please auto craft the desired item. MUST be inside Stella's Cauldron's UI

Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, DropDownList, x225 y325 w120 vAutoCraft gSelectItem, Heavenly Potion|Bound Potion|Zeus Potion|Hades Potion|Poseidon Potion|Jewelry Potion|Zombie Potion|Rage Potion|Diver Potion


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
Gui, Add, Text, x45 y237 w534 h135 BackgroundTrans, Clips Pixelation (50/50 Chance), Frostveil and Winter Garden. (Their cutscenes end with a flash)
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
Gui, Add, Text, x45 y285 w515 h145 BackgroundTrans, (BETA) Automatically clips with Nvidia's Instant Replay when detecting a Transcendent's cutscene. Not guaranteed to work. Works for Luminosity, Equinox and Dream Traveler
Gui, Font, s9 cWhite Bold
Gui, Add, Text, x183 y350 w424 h135 BackgroundTrans, ! This automatically starts when toggle is ON !
Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, Button, x45 y345 w80 h25 gToggleDetectTranscendents vDetectTranscendentsBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x143 y348 w70 h25 vDetectTranscendentsStatus BackgroundTrans, OFF


; Limbo Gloabls

Gui, Font, s11 cWhite Bold
Gui, Add, GroupBox, x33 y390 w534 h120 cWhite, Clip Limbo Globals
Gui, Font, s10 c0xCCCCCC Normal
Gui, Add, Text, x45 y410 w520 h145 BackgroundTrans, (BETA) Automatically clips with Nvidia's Instant Replay when detecting a Limbo Global's star/cutscene. Less reliable to detect if a global is rolled. Does not detect Nyctophobia.
Gui, Font, s9 cWhite Bold
Gui, Add, Text, x183 y479 w400 h135 BackgroundTrans, 
Gui, Font, s12 cWhite Bold
Gui, Add, Text, x230 y477 w400 h135 BackgroundTrans, DOES NOT WORK
Gui, Font, s10 cWhite Bold, Segoe UI
Gui, Add, Button, x45 y475 w80 h25 gToggleDetectLimbo vDetectLimboBtn, Toggle
Gui, Font, s10 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x143 y478 w60 h25 vDetectLimboStatus BackgroundTrans, OFF


; Highlight Area

Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x33 y520 w534 h75 cWhite, Highlight Detection Area
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Text, x45 y540 w520 h145 BackgroundTrans, Highlights where it is detecting to clip Globals and Transcendents
Gui, Add, Text, x173 y566 w520 h145 BackgroundTrans, (Globals)
Gui, Add, Text, x470 y566 w520 h145 BackgroundTrans, (Transcendents)
Gui, Font, s9 cWhite Bold, Segoe UI
Gui, Add, Button, x45 y561 w80 h25 gToggleGlobalArea vGlobalAreaBtn, Toggle
Gui, Add, Button, x345 y561 w80 h25 gToggleTransArea vTransAreaBtn, Toggle
Gui, Font, s9 c0xCCCCCC Bold, Segoe UI
Gui, Add, Text, x143 y566 w60 h25 vGlobalAreaStatus BackgroundTrans, OFF
Gui, Add, Text, x440 y566 w60 h25 vTransAreaStatus BackgroundTrans, OFF

Gui, Tab, Webhook

Gui, Font, s10 cWhite Normal Bold
Gui, Add, Text, x50 y125 w200 h25 BackgroundTrans, Discord Webhook URL:
Gui, Add, Edit, x50 y150 w500 h25 vWebhookInput gUpdateWebhook Background0xD3D3D3 cBlack, %webhookURL%
Gui, Font, s8 c0xCCCCCC Normal
Gui, Add, Text, x50 y180 w500 h15 BackgroundTrans, Paste your Discord webhook URL here to be notified of actions happening in real time.
Gui, Font, s10 cWhite Normal Bold
Gui, Add, Text, x50 y225 w200 h25 BackgroundTrans, Discord USERID:
Gui, Add, Edit, x50 y250 w500 h25 vUserIDInput gUpdateUserID Background0xD3D3D3 cBlack, %webhookID%
Gui, Font, s8 c0xCCCCCC Normal
Gui, Add, Text, x50 y280 w500 h15 BackgroundTrans, Paste your Discord USERID here to be pinged of actions happening in real time.


Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x33 y295 w534 h65 cWhite, Macro Message De/Activation
Gui, Add, Button, x60 y320 w80 h25 gToggleOnoffWebhook vOnoffWebhookBtn, Toggle
Gui, Add, Text, x150 y324 w60 h25 vOnoffWebhookStatus BackgroundTrans, OFF
Gui, Add, Button, x320 y320 w80 h25 gToggledoPing vDoPingBtn, Toggle
Gui, Add, Text, x410 y324 w60 h25 vDoPingStatus BackgroundTrans, OFF
Gui, Font, s10 cWhite Normal
Gui, Add, Text, x250 y324 w100 h25 BackgroundTrans c0xCCCCCC, Ping User: 

Gui, Font, s10 cWhite Bold
Gui, Add, GroupBox, x33 y365 w534 h65 cWhite, Macro Message if Clip
Gui, Add, Button, x60 y390 w80 h25 gToggleClipWebhook vClipWebhookBtn, Toggle
Gui, Add, Text, x150 y394 w60 h25 vClipWebhookStatus BackgroundTrans, OFF
Gui, Add, Button, x320 y390 w80 h25 gToggledoPing2 vDoPing2Btn, Toggle
Gui, Add, Text, x410 y394 w60 h25 vDoPing2Status BackgroundTrans, OFF
Gui, Font, s10 cWhite Normal
Gui, Add, Text, x250 y394 w100 h25 BackgroundTrans c0xCCCCCC, Ping User: 
Gui, Font, s7 cWhite Normal
Gui, Add, Text, x465 y376 w80 h100 BackgroundTrans c0xCCCCCC, Messages and/or pings if anything has been clipped via Webhook.


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
Gui, Add, Text, x30 y90 w535 h30 Center BackgroundTrans c0x00D4FF, fishSol Development Team

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

url := "https://raw.githubusercontent.com/knowaery/Aery-s-Fishsol/refs/heads/main/DONATORS.txt"

Http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
Http.Open("GET", url, false)
Http.Send()

content := Http.ResponseText

Gui, Font, s10 cWhite Bold
Gui, Add, Text, x50 y345 w2000 h20 BackgroundTrans, Thank you to our donators! and noaery
Gui, Font, s9 c0xCCCCCC Normal
Gui, Add, Edit, x50 y370 w480 h95 vDonatorsList -Wrap +ReadOnly +VScroll -WantReturn -E0x200 Background0x2D2D2D c0xCCCCCC, %content%

Gui, Font, s8 c0x888888
Gui, Add, Text, x50 y490 w480 h1 0x10 BackgroundTrans

Gui, Font, s8 c0xCCCCCC Normal
Gui, Add, Text, x50 y500 w500 h15 BackgroundTrans, Aery's fishSol 

Gui, Show, w600 h670,  Aery's fishSol

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

if (advancedFishingToggle) {
    GuiControl,, AdvancedFishingStatus, ON
    GuiControl, +c0x00DD00, AdvancedFishingStatus
} else {
    GuiControl,, AdvancedFishingStatus, OFF
    GuiControl, +c0xFF4444, AdvancedFishingStatus
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
} else {
    GuiControl,, DetectLimboStatus, OFF
    GuiControl, +c0xFF4444, DetectLimboStatus
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
} else {
    GuiControl,, GlobalAreaStatus, OFF
    GuiControl, +c0xFF4444, GlobalAreaStatus
}
if (transArea) {
    GuiControl,, TransAreaStatus, ON
    GuiControl, +c0x00DD00, TransAreaStatus
} else {
    GuiControl,, TransAreaStatus, OFF
    GuiControl, +c0xFF4444, TransAreaStatus
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
if (autoCraft) {
    GuiControl,, AutoCraftStatus, ON
    GuiControl, +c0x00DD00, AutoCraftStatus
} else {
    GuiControl,, AutoCraftStatus, OFF
    GuiControl, +c0xFF4444, AutoCraftStatus
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

if (detectTranscendents) {
    GuiControl,, DetectTranscendentsStatus, ON
    GuiControl, +c0x00DD00, DetectTranscendentsStatus

    triggerDelay2 := 30000

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
    SetTimer, CheckPixel, 50
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

ToggleAdvancedFishing:
    advancedFishingToggle := !advancedFishingToggle
    if (advancedFishingToggle) {
        GuiControl,, AdvancedFishingStatus, ON
        GuiControl, +c0x00DD00, AdvancedFishingStatus
    } else {
        GuiControl,, AdvancedFishingStatus, OFF
        GuiControl, +c0xFF4444, AdvancedFishingStatus
    }
    IniWrite, % (advancedFishingToggle ? "true" : "false"), %iniFilePath%, Macro, advancedFishingToggle
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

ToggleAutoCraft:
    autoCraft := !autoCraft
    if (autoCraft) {
        GuiControl,, AutoCraftStatus, ON
        GuiControl, +c0x00DD00, AutoCraftStatus
    } else {
        GuiControl,, AutoCraftStatus, OFF
        GuiControl, +c0xFF4444, AutoCraftStatus
    }
    IniWrite, % (autoCraft ? "true" : "false"), %iniFilePath%, Macro, autoCraft
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
    } else {
        GuiControl,, GlobalAreaStatus, OFF
        GuiControl, +c0xFF4444, GlobalAreaStatus
    }

    IniWrite, % (globalArea ? "true" : "false"), %iniFilePath%, Macro, globalArea
    UpdateGlobalBox()
return

ToggleTransArea:
    transArea := !transArea
    if (transArea) {
        GuiControl,, TransAreaStatus, ON
        GuiControl, +c0x00DD00, TransAreaStatus
    } else {
        GuiControl,, TransAreaStatus, OFF
        GuiControl, +c0xFF4444, TransAreaStatus
    }
    IniWrite, % (transArea ? "true" : "false"), %iniFilePath%, Macro, transArea
    UpdateTransBox()
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



ToggleDetectLimbo:
    detectLimbo := !detectLimbo
    if (detectLimbo) {
        GuiControl,, DetectLimboStatus, ON
        GuiControl, +c0x00DD00, DetectLimboStatus
    } else {
        GuiControl,, DetectLimboStatus, OFF
        GuiControl, +c0xFF4444, DetectLimboStatus
    }
    IniWrite, % (detectLimbo ? "true" : "false"), %iniFilePath%, Macro, detectLimbo
return

ToggleDetectTranscendents:
    detectTranscendents := !detectTranscendents
    if (detectTranscendents) {
        GuiControl,, DetectTranscendentsStatus, ON
        GuiControl, +c0x00DD00, DetectTranscendentsStatus

        triggerDelay2 := 30000
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
        triggerDelay := 15000
        SetTimer, CheckPixel, 50
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
    Gui, Submit, NoHide
    if (AdvancedThresholdInput >= 0 && AdvancedThresholdInput <= 40) {
        advancedFishingThreshold := AdvancedThresholdInput
        IniWrite, %advancedFishingThreshold%, %iniFilePath%, Macro, advancedFishingThreshold
    }
return

UpdateGlobalBox() {
    global globalArea, nvidiaReplay

    if (globalArea && nvidiaReplay) {
        ShowGlobalOutline()
    } else {
        HideGlobalOutline()
    }
}

UpdateTransBox() {
    global transArea, detectTranscendents

    if (transArea && detectTranscendents) {
        ShowTranscendentOutline()
    } else {
        HideTranscendentOutline()
    }
}

ShowGlobalOutline() {
    size := 40
    thickness := 2

    x := 950 - size//2
    y := 80 - size//2

    yBottom := y + size - thickness
    xRight  := x + size - thickness

    Gui, GBoxTop:Destroy
    Gui, GBoxTop:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, GBoxTop:Color, 00FF00
    Gui, GBoxTop:Show, x%x% y%y% w%size% h%thickness% NA

    Gui, GBoxBottom:Destroy
    Gui, GBoxBottom:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, GBoxBottom:Color, 00FF00
    Gui, GBoxBottom:Show, x%x% y%yBottom% w%size% h%thickness% NA

    Gui, GBoxLeft:Destroy
    Gui, GBoxLeft:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, GBoxLeft:Color, 00FF00
    Gui, GBoxLeft:Show, x%x% y%y% w%thickness% h%size% NA

    Gui, GBoxRight:Destroy
    Gui, GBoxRight:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, GBoxRight:Color, 00FF00
    Gui, GBoxRight:Show, x%xRight% y%y% w%thickness% h%size% NA
}

HideGlobalOutline() {
    Gui, GBoxTop:Destroy
    Gui, GBoxBottom:Destroy
    Gui, GBoxLeft:Destroy
    Gui, GBoxRight:Destroy
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
    Gui, TBoxTop:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, TBoxTop:Color, %color%
    Gui, TBoxTop:Show, x%x% y%y% w%size% h%thickness% NA

    Gui, TBoxBottom:Destroy
    Gui, TBoxBottom:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, TBoxBottom:Color, %color%
    Gui, TBoxBottom:Show, x%x% y%yBottom% w%size% h%thickness% NA

    Gui, TBoxLeft:Destroy
    Gui, TBoxLeft:+AlwaysOnTop -Caption +ToolWindow +E0x20
    Gui, TBoxLeft:Color, %color%
    Gui, TBoxLeft:Show, x%x% y%y% w%thickness% h%size% NA

    Gui, TBoxRight:Destroy
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

GetPingText() {
    global webhookID
    return webhookID != "" ? "<@" webhookID ">" : ""
}

CheckPixel:
    global nvidiaReplay, triggerDelay

    if (!nvidiaReplay)
        return

    PixelGetColor, color, 950, 80, RGB

    if (color = 0xFFFFFF) {
        ShowClipText()
        SetTimer, DoClip, -%triggerDelay%
    }
return

CheckPixel2:
    global detectTranscendents, transcendentPixels, transcendentColors
    global triggerDelay2, transcendentCounters

    if (!detectTranscendents)
        return

    for index, pos in transcendentPixels {
        PixelGetColor, color, % pos.x, % pos.y, RGB

        for _, c in transcendentColors {
            if (color = c) {
                transcendentCounters[index]++  
                ShowClipText()
                SetTimer, DoClip2, -%triggerDelay2%
                break
            }
        }
    }
return

;CheckPixel3:
    ; global detectLimbo, limboPixels, limboColors
    ; global triggerDelay3, limboCounters

    ; if (!detectLimbo)
    ;     return

    ; for index, pos in limboPixels {
    ;    PixelGetColor, color, % pos.x, % pos.y, RGB

    ;    for _, c in limboColors {
    ;        if (color = c) {
    ;            limbo[index]++  
    ;            SetTimer, DoClip, -%triggerDelay3%
    ;            break
    ;       }
    ;    }
    ;}
; return

DoClip:
if (clipWebhook) {
    ToolTip
    try SendWebhook2(":warning: A Global has been clipped! (or pixel, frostveil, and/or winter garden... :face_holding_back_tears:)", 16777215)
    Send, !{F10}
} else if (!clipWebhook) {
    Send, !{F10}
}
return



DoClip2:
if (clipWebhook) {
    ToolTip
    try SendWebhook2(":tada: A Transcendent has been clipped! :tada:", 11393254)
    Send, !{F10}
} else if (!clipWebhook) {
    Send, !{F10}
}
return



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
    . """text"": ""Aery's fishSol V1"","
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

SendWebhook2(text, color := 16777215) {
    global webhookURL, webhookID, doPing, doPing2

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

    json := "{"
    . """content"": """ content ""","
    . allowedMentions
    . """embeds"": [{"
    . """title"": """ text ""","
    . """color"": " color ","
    . """footer"": {"
    . """text"": ""Aery's fishSol V1"","
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
    . """text"": ""Aery's fishSol V1"","
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
IMPORTANT - NVIDIA REPLAY DISCLAIMER

Requirements:
- Nvidia Overlay (requires an Nvidia GPU)
- Instant Replay must be enabled, with the keybind set to ALT + F10
- Replay length should be set between 2-5 minutes
- Global Replay may be triggered by cutscenes between 99k-999k. 
To avoid unwanted clips, ensure aura cutscenes are above 1M+.

Warnings:
- Other global white flashes may trigger a clip
  (for example, if someone else rolls a global)
- Some Transcendent cutscenes may not be detected correctly
- Luminosity can cause Transcendent Replay to trigger more than once
- This feature is BETA - false detections may occur

Disclaimer:
Global Replay will NOT detect any global rolled under 99m.

(It will clip Breakthrough Gargantua (Rolled at 430m), 
but will NOT clip native globals or those with an active rune. (Rolled at 86m.))

Status: (+ = true | - = false)
All Globals: +
Limbo Globals: -
Nyctophobia: -
Pixelation: + (lowkey RNG if it clips)
Luminosity: +
Winter Garden: +
Dream Traveler: +
Equinox: +


This Replay System can be used even if you're not using the macro
    )

    Gui, NvidiaNotes:Add, Button, x225 y560 w100 h25 gCloseNvidiaNotes, Close
    Gui, NvidiaNotes:Show, w550 h600
return

CloseNvidiaNotes:
    Gui, NvidiaNotes:Destroy
return

global ClipText
ShowClipText() {
    ToolTip, Clipped with Aery's Fishsol, 890, 10
}

HideClipText() {
    ToolTip
}




SelectItem:
    Gui, Submit, NoHide
    selectedItem := AutoCraft
return





DoHeavenly:
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

    MouseMove, 806, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    if (useCelestial) {
        MouseMove, 800, 682, 3
        Sleep, 200
        Click, Left
        Sleep, 200
        Click, Left
        Sleep, 200
    }

    if (useExotic) {
        MouseMove, 800, 742, 3
        Sleep, 200
        Click, Left
        Sleep, 200
    }

    MouseMove, 585, 585, 3
    Sleep, 200
    Click, Left
    Sleep, 200
return


DoBound:
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

    MouseMove, 806, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    if (useBounded) {
        MouseMove, 800, 682, 3
        Sleep, 200
        Click, Left
        Sleep, 200
    }

    MouseMove, 585, 585, 3
    Sleep, 200
    Click, Left
    Sleep, 200
return

DoZeus:
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
        Sleep, 200
        Click, Left
        Sleep, 200
    }

    MouseMove, 585, 585, 3
    Sleep, 200
    Click, Left
    Sleep, 200
return

DoHades:
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

    MouseMove, 806, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    if (useHades) {
        MouseMove, 800, 682, 3
        Sleep, 200
        Click, Left
        Sleep, 200
    }

    MouseMove, 585, 585, 3
    Sleep, 200
    Click, Left
    Sleep, 200
return

DoPoseidon:
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

    MouseMove, 806, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    if (usePoseidon) {
        MouseMove, 800, 682, 3
        Sleep, 200
        Click, Left
        Sleep, 200
    }

    MouseMove, 585, 585, 3
    Sleep, 200
    Click, Left
    Sleep, 200
return

DoJewelry:
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

    MouseMove, 806, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    MouseMove, 585, 585, 3
    Sleep, 200
    Click, Left
    Sleep, 200
return

DoZombie:
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

    MouseMove, 806, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    MouseMove, 585, 585, 3
    Sleep, 200
    Click, Left
    Sleep, 200
return

DoRage:
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

    MouseMove, 806, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    MouseMove, 585, 585, 3
    Sleep, 200
    Click, Left
    Sleep, 200
return

DoDiver:
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

    MouseMove, 806, 636, 3
    Sleep, 200
    Click, Left
    Sleep, 200

    MouseMove, 585, 585, 3
    Sleep, 200
    Click, Left
    Sleep, 200
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

    if (!autoCraft)  ; make sure autoCraft toggle is on
        return

    if (autocrafting)  ; already running
        return

    autocrafting := true

   if (onoffWebhook)
        try SendWebhook(":green_circle: Crafting Started", "7909721")

    SetTimer, DoCraftSelected, 500
return


F5::
    if (!autocrafting)  ; not running
        return

    autocrafting := false
    SetTimer, DoCraftSelected, Off  ; stop the timer

    if (onoffWebhook)
        try SendWebhook(":red_circle: Crafting Stopped", "14495300")
ExitApp
return


DoCraftSelected:
    if (!autocrafting)  ; stop immediately if toggle is off
        return

    ; Your crafting logic
    if (selectedItem = "Heavenly Potion")
        Gosub, DoHeavenly
    else if (selectedItem = "Bound Potion")
        Gosub, DoBound
    else if (selectedItem = "Zeus Potion")
        Gosub, DoZeus
    else if (selectedItem = "Hades Potion")
        Gosub, DoHades
    else if (selectedItem = "Poseidon Potion")
        Gosub, DoPoseidon
    else if (selectedItem = "Jewelry Potion")
        Gosub, DoJewelry
    else if (selectedItem = "Zombie Potion")
        Gosub, DoZombie
    else if (selectedItem = "Rage Potion")
        Gosub, DoRage
    else if (selectedItem = "Diver Potion")
        Gosub, DoDiver
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
        sleep 2600
        if (autoCloseChat) {
            sleep 300
            Send {/}
            sleep 300
            MouseMove, 149, 40, 3
            sleep 300
            MouseClick, Left
            sleep 300
        }
    if (autoUnequip) {
        if (useNothing) {
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
            sleep 150
            Click, Left
            sleep 300
            MouseMove, 634, 638, 3
            sleep 150
            Click, Left
            sleep 1200
            Click, Left
            sleep 150
            MouseMove, 1425, 303, 3
            sleep 150
            Click, Left
            sleep 150
        }
    }

    if (autoUnequip) {
        if (!useNothing) {
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
            sleep 158
            MouseMove, 1425, 303, 3
            sleep 150
            Click, Left
            sleep 150
        }
    }

            if (strangeController) {
                if (biomeRandomizer) {
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
                 }
            }

            if (strangeController) {
                if (!biomeRandomizer) {
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
                 }
            }

            if (!strangeController) {
                if (biomeRandomizer) {
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
                }
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
    Sleep, 300

    Send, r
    Sleep, 300

    Send, {Enter}
    Sleep, 2000
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

        ErrorLevel := 0
        PixelSearch, FoundX, FoundY, 757, 762, 1161, 782, barColor, 5, Fast RGB

        if (ErrorLevel = 0) {
        } else {
        MouseClick, left
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
IniWrite, %res%, %iniFilePath%, "Macro", "resolution"
ManualGUIUpdate()
return

SelectPathing:
Gui, Submit, nohide
IniWrite, %PathingMode%, %iniFilePath%, "Macro", "pathingMode"
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

DonateClick:
Run, https://www.roblox.com/games/130758835005479/FishSol-Donations#!/store
return

NeedHelpClick:
Run, https://discord.gg/nPvA54ShTm
return
