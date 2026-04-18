#NoEnv

AuraList := {"Starscourge_Radiant": 1
, "Chromatic_Genesis": 1
, "Spectraflow": 1
, "Lily": 1
, "Overture": 1
, "Symphony": 1
, "Twilight_Withering_Grace": 1
, "Felled": 1
, "Impeached": 1
, "Lumenpool": 1
, "Hyper-Volt_Ever-Storm": 1
, "Astral_Legendarium": 1
, "Prophecy": 1
, "Exotic_Void": 1
, "BLOODLUST": 1
, "Overture_History": 1
, "Maelstrom": 1
, "Perpetual": 1
, "LOTUSFALL": 1
, "Jazz_Orchestra": 1
, "Archangel": 1
, "Atlas": 1
, "Flora_Evergreen": 1
, "CHILLSEAR": 1
, "Celestial_Eclipse": 1
, "AbyssalHunter": 1
, "GARGANTUA": 1
, "APOSTOLOS": 1
, "Kyawthuite_Remembrance": 1
, "Ruins": 1
, "Matrix_Overdrive": 1
, "Sophyra": 1
, "SAILOR_ADMIRAL": 1
, "Matrix_Reality": 1
, "PYTHIOS": 1
, "Sovereign": 1
, "Ruins_Withered": 1
, "Aegis": 1
, "ASCENDANT": 1
, "PROLOGUE": 1
, "Unknown": 1
, "Elude": 1
, "Dreamscape": 1
, "Raven_Plauge": 1
, "Eggsistance": 1
, "Revive": 1
, "Eggore": 1
, "Doodle_AbyssalHunter": 1
, "Lumenpool_Ramenpool": 1
, "Impeached_IMCRINE": 1
, "Surfer_Symphony": 1
, "Workshop_System": 1}

AuraListTrans := {"NYCTOPHOBIA": 1
, "Pixelation": 1
, "Luminosity": 1
, "LEVIATHAN": 1
, "Leviathan": 1
, "Breakthrough": 1
, "BREAKTHROUGH": 1
, "Equinox": 1
, "EQUINOX": 1
, "Monarch": 1
, "MONARCH": 1
, "illusionary": 1
, "ILLUSIONARY": 1
, "Eostre": 1
, "Afoolsexperience": 1
, "pukeko_god": 1
, "Aegis_EGGIS": 1
, "YOLKEGG": 1
, "skyfestival": 1
, "EQUINOX_youareanidiot": 1}

AuraListOrder := ["Chromatic_Genesis", "Starscourge_Radiant", "Spectraflow", "Lily", "Overture", "Symphony", "Twilight_Withering_Grace", "Felled", "Impeached", "Impeached_IMCRINE", "Lumenpool", "Lumenpool_Ramenpool", "Hyper-Volt_Ever-Storm", "Astral_Legendarium", "Prophecy", "Exotic_Void", "BLOODLUST", "Overture_History", "Maelstrom", "Perpetual", "LOTUSFALL", "Jazz_Orchestra", "Archangel", "Atlas", "Flora_Evergreen", "CHILLSEAR", "Celestial_Eclipse", "AbyssalHunter", "Doodle_AbyssalHunter", "GARGANTUA", "APOSTOLOS", "Kyawthuite_Remembrance", "Ruins", "Matrix_Overdrive", "Sophyra", "SAILOR_ADMIRAL", "Matrix_Reality", "PYTHIOS", "Sovereign", "Ruins_Withered", "Aegis", "ASCENDANT", "Raven_Plauge", "Unknown",  "Elude", "PROLOGUE", "Dreamscape", "Eggsistance", "Revive", "Eggore", "Surfer_Symphony", "Workshop_System"]
EnabledAuras := {}
for i, aura in AuraListOrder
EnabledAuras[aura] := 1
