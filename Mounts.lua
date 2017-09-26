---------------------
-- Local Variables --
---------------------
local addonName = ...
local addon = LibStub("AceAddon-3.0"):GetAddon(addonName)
local HBD = LibStub("HereBeDragons-1.0")

---------------------
-- Addon Functions --
---------------------

--------------------
-- Mounts Pin List --
--------------------
--Mount is an item id right now. That needs to change.
-- Need to find a way to attach ingame mount ID with either item id.
addon.pinList["Heroic Dungeon Mounts"] = {
	{ x = 65.8, y = 48.9, id = 161, zone = 521, mount = 43951, group = "COT", boss = "Infinite Corruptor"    , }, 
	{ x = 60.2, y = 27.5, id = 499, zone = 798, mount = 35513, group = "MGT", boss = "Kael'Thas Sunstrider"  , }, 
	{ x = 41.9, y = 65.8, id = 478, zone = 723, mount = 32768, group = "SH" , boss = "Anzu"                  , }, 
	{ x = 58.4, y = 45.0, id = 491, zone = 524, mount = 44151, group = "UP" , boss = "Skadi the Ruthless"    , }, 
	{ x = 67.3, y = 32.6, id = 37 , zone = 793, mount = 68824, group = "ZG" , boss = "High Priestess Kilnara", }, 
	{ x = 67.3, y = 32.6, id = 37 , zone = 793, mount = 68823, group = "ZG" , boss = "Bloodlord Mandokir"    , }, 
	{ x = 76.1, y = 64.0, id = 463, zone = 781, mount = 69747, group = "ZA" , note = "Timed Run"             , }, 
}
addon.pinList["Dungeon Mounts"] = {
	{ x = 26.9, y = 11.8, id = 23 , zone = 765, mount = 13335, group = "Strat", boss = "Lord Aurius Rivendare", }, 
	{ x = 46.8, y = 49.7, id = 640, zone = 768, mount = 63043, group = "SC"   , boss = "Slabhide"             , }, 
	{ x = 75.0, y = 85.0, id = 720, zone = 769, mount = 63040, group = "VP"   , boss = "Altairus"             , },  
}

addon.pinList["Raid Mounts"] = {
	-- Level 60
	{ x = 23.1, y = 86.3, id = 261, zone = 765, mount = 21218, group = "AQ40", note = "Drops from trash mobs.", }, 
	{ x = 23.1, y = 86.3, id = 261, zone = 765, mount = 21323, group = "AQ40", note = "Drops from trash mobs.", }, 
	{ x = 23.1, y = 86.3, id = 261, zone = 765, mount = 21324, group = "AQ40", note = "Drops from trash mobs.", }, 
	{ x = 23.1, y = 86.3, id = 261, zone = 765, mount = 21321, group = "AQ40", note = "Drops from trash mobs.", }, 
	-- Level 70
	{ x = 47.1, y = 72.4, id = 32 , zone = 799, mount = 30480, group = "Kara", boss = "Atuumen the Huntsman", }, 
	{ x = 76.6, y = 65.8, id = 479, zone = 782, mount = 32458, group = "Eye" , boss = "Kael'Thas Sunstrider", }, 
	-- Level 80
	{ x = 28.1, y = 28.1, id = 486, zone = 527, mount = 43952, group = "EoE", boss = "Malygos"              , }, 
	{ x = 28.1, y = 28.1, id = 486, zone = 527, mount = 43953, group = "EoE", boss = "Malygos"              , }, 
	{ x = 51.2, y = 78.8, id = 141, zone = 718, mount = 49636, group = "Ony", boss = "Onyxia"               , }, 
	{ x = 60.0, y = 56.0, id = 488, zone = 531, mount = 43986, group = "WRT", boss = "Sartharion"           , note = "3 Drakes. 10man"      , }, 
	{ x = 60.0, y = 56.0, id = 488, zone = 531, mount = 43954, group = "WRT", boss = "Sartharion"           , note = "3 Drakes. 25man"      , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, mount = 45693, group = "Uld", boss = "Yogg-Saron"           , note = "0 Keepers. 25man Only", }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, mount = 50818, group = "ICC", boss = "The Lich King (25man)", }, 
	{ x = 49.8, y = 18.2, id = 501, zone = 532, mount = 44083, group = "ICC", boss = "All Four Bosses"      , }, 
	-- Level 85
	{ x = 36.3, y = 84.8, id = 720, zone = 773, mount = 63041, group = "TFW", boss = "Al'akir"           , }, 
	{ x = 47.5, y = 79.6, id = 606, zone = 800, mount = 71665, group = "FL" , boss = "Alysrazor"         , }, 
	{ x = 47.5, y = 79.6, id = 606, zone = 800, mount = 69224, group = "FL" , boss = "Ragnaros"          , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 824, mount = 78919, group = "COT", boss = "Ultraxion"         , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 824, mount = 77067, group = "COT", boss = "Deathwing"         , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 824, mount = 77069, group = "COT", boss = "Deathwing (Heroic)", }, 
	-- Level 90
	{ x = 60.0, y = 40.0, id = 809, zone = 896, mount = 87777 , group = "MSV", boss = "Elegon"                     , }, 
	{ x = 63.0, y = 32.0, id = 928, zone = 930, mount = 93666 , group = "TOT", boss = "Horridon"                   , }, 
	{ x = 63.0, y = 32.0, id = 928, zone = 930, mount = 95059 , group = "TOT", boss = "Ji-Kun"                     , }, 
	{ x = 74.0, y = 44.0, id = 811, zone = 953, mount = 104253, group = "SOO", boss = "Garrosh Hellscream (Mythic)", },  
	-- Level 100
	{ x = 51.4, y = 28.7, id = 949, zone = 988 , mount = 116660, group = "BRF", boss = "Blackhand (Mythic)" , }, 
	{ x = 46.5, y = 53.2, id = 945, zone = 1026, mount = 123890, group = "HFC", boss = "Archimonde (Mythic)", },
	-- Level 110
	{ x = 47.1, y = 72.4, id = 32  , zone = 1115, mount = 142236, group = "Kara", boss = "Atuumen the Huntsman (Mythic)", }, 
	{ x = 47.1, y = 72.4, id = 32  , zone = 1115, mount = 142552, group = "Kara", boss = "Nightbane (Mythic)"           , }, 
	{ x = 58.1, y = 77.4, id = 1033, zone = 1088, mount = 137574, group = "NH"  , boss = "Gul'dan"                      , }, 
	{ x = 58.1, y = 77.4, id = 1033, zone = 1088, mount = 137575, group = "NH"  , boss = "Gul'dan (Mythic)"             , }, 
	{ x = 64.5, y = 20.9, id = 1021, zone = 1147, mount = 143643, group = "TOS" , boss = "Mistress Sassz'ine"           , }, 
	--{ x = 58.1, y = 77.4, id = 1171, zone = 1088, mount = 142552, group = "ABT" , boss = "Felhounds of Sargeras"        , }, 
	-- World Bosses Mounts
	{ x = 67.6, y = 74.6, id = 809, mount = 87771 , boss = "Sha of Anger", }, 
	{ x = 71.6, y = 64.4, id = 807, mount = 89783 , boss = "Galleon"     , }, 
	{ x = 50.6, y = 54.4, id = 929, mount = 94228 , boss = "Oondasta"    , }, 
	{ x = 60.5, y = 37.3, id = 928, mount = 95057 , boss = "Nalak"       , }, 
	{ x = 47.1, y = 78.4, id = 948, mount = 116771, boss = "Rukhmar"     , note = "Patrols around the entire zone.", }, 
}