#NoEnv

AuraList := {"Starscourge_Radiant": 1 ;100m
, "Chromatic_Genesis": 1 ;99m
, "Spectraflow": 1 ;100m
, "Lily": 1 ;112m
, "Overture": 1 ;150m
, "Symphony": 1 ;175m
, "Twilight_Withering_Grace": 1 ;180m
, "Felled": 1 ;180m
, "Projection": 1 ;197m
, "Impeached": 1 ;200m
, "Lumenpool": 1 ;220m
, "Hyper-Volt_Ever-Storm": 1 ;225m
, "Virtual Memory": 1 ;232m
, "Astral_Legendarium": 1 ;267m
, "Prophecy": 1 ;275m
, "Exotic_Void": 1 ;299m
, "BLOODLUST": 1 ;300m
, "Overture_History": 1 ;300m
, "Maelstrom": 1 ;309m
, "Perpetual": 1 ;315m
, "dreamer": 1 ;315m                       New
, "LOTUSFALL": 1 ;320m
, "CYTOKINESIS": 1 ;323m                    New
, "Jazz_Orchestra": 1 ;336m
, "Archangel": 1 ;350m
, "Atlas": 1 ;360m
, "Flora_Evergreen": 1 ;370m
, "CHILLSEAR": 1 ;375m
, "Celestial_Eclipse": 1 ;384m
, "AbyssalHunter": 1 ;400m
, "GARGANTUA": 1 ;430m
, "APOSTOLOS": 1 ;444m
, "Kyawthuite_Remembrance": 1 ;450m
, "Ruins": 1 ;500m
, "Matrix_Overdrive": 1 ;503m
, "Gravitational_PointZero": 1 ;540m
, "SAILOR_ADMIRAL": 1 ;540m
, "Sophyra": 1 ;590m
, "Matrix_Reality": 1 ;601m
, "PYTHIOS": 1 ;666m
, "Sovereign": 1 ;750m
, "Ruins_Withered": 1 ;800m
, "Aegis": 1 ;825m
, "ASCENDANT": 1 ;935m
, "PROLOGUE": 1 ;666m
, "Unknown": 1 ;444m
, "Elude": 1 ;555m
, "Dreamscape": 1 ;850m
, "Raven_Plauge": 1} ;200m

AuraListTrans := {"NYCTOPHOBIA": 1 ;1b
, "Pixelation": 1 ;1b 73m
, "Luminosity": 1 ;1.2b
, "LEVIATHAN": 1 ;1.7b 30m
, "ASTRAIOS" :1 ;1.7b 50m
, "BREAKTHROUGH": 1 ;2b
, "EQUINOX": 1 ;2.5b
, "MONARCH": 1 ;3b
, "meta": 1 ;10k
, "illusionary": 1} ;10m

AuraListOrder := ["Chromatic_Genesis", "Starscourge_Radiant", "Spectraflow", "Lily", "Overture", "Symphony", "Twilight_Withering_Grace", "Felled", "Projection", "Impeached", "Lumenpool", "Hyper-Volt_Ever-Storm", "Astral_Legendarium", "Prophecy", "Exotic_Void", "BLOODLUST", "Overture_History", "Maelstrom", "Perpetual", "dreamer", "LOTUSFALL", "Jazz_Orchestra", "CYTOKINESIS", "Archangel", "Atlas", "Flora_Evergreen", "CHILLSEAR", "Celestial_Eclipse", "AbyssalHunter", "GARGANTUA", "APOSTOLOS", "Kyawthuite_Remembrance", "Ruins", "Matrix_Overdrive", "Gravitational_PointZero", "Sophyra", "SAILOR_ADMIRAL", "Matrix_Reality", "PYTHIOS", "Sovereign", "Ruins_Withered", "Aegis", "ASCENDANT", "Raven_Plauge", "Unknown",  "Elude", "PROLOGUE", "Dreamscape"]
EnabledAuras := {}
for i, aura in AuraListOrder
EnabledAuras[aura] := 1