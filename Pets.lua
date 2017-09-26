---------------------
-- Local Variables --
---------------------
local addonName = ...
local addon = LibStub("AceAddon-3.0"):GetAddon(addonName)
local HBD = LibStub("HereBeDragons-1.0")

---------------------
-- Addon Functions --
---------------------
function TMDebug_GetPetList()
    local petTable = {}
    local numPets = C_PetJournal.GetNumPets()
    for i = 1, numPets do
        local _, petID, _, _, _, _, _, _, _, _, npcID = C_PetJournal.GetPetInfoByIndex(i)
        petTable[npcID] = petID
    end
    
    for k,v in pairs(addon.pinList["Raiding With Leashes"]) do
        if petTable[v.pet] then
            LUI:Print(petTable[v.pet], v.boss)
        end
    end
end

function addon:GetPetName(id)
    local name = C_PetJournal.GetPetInfoBySpeciesID(id)
    return name
end

--------------------
-- Pets Pin List --
--------------------
addon.pinList["Reputation Toys"] = {
    --Toy is a itemID
    { x = 36.4, y = 46.8, id = 1033, toy = 140324, group = "RNF", req="Honored", },
    { x = 36.4, y = 46.8, id = 1033, toy = 140325, group = "RNF", req="Revered", },
    { x = 60.2, y = 51.2, id = 1017, toy = 129367, group = "RVLJ", req="Honored", },
    { x = 60.2, y = 51.2, id = 1017, toy = 129149, group = "RVLJ", req="Revered", },
    { x = 48.2, y = 73.8, id = 1015, toy = 130191, group = "RWD", req="Honored", },
    { x = 48.2, y = 73.8, id = 1015, toy = 130199, group = "RWD", req="Revered", },
    { x = 48.2, y = 73.8, id = 1015, toy = 130157, group = "RWD", req="Honored", },
    { x = 54.6, y = 73.2, id = 1018, toy = 130158, group = "RDW", req="Friendly", },
    { x = 54.6, y = 73.2, id = 1018, toy = 130170, group = "RDW", req="Honored", },
    { x = 54.6, y = 73.2, id = 1018, toy = 130232, group = "RDW", req="Revered", },
    { x = 38.6, y = 45.8, id = 1024, toy = 131814, group = "RHMT", req="Friendly", },
    { x = 38.6, y = 45.8, id = 1024, toy = 131812, group = "RHMT", req="Revered", },
    { x = 46.8, y = 41.4, id = 1015, toy = 129279, group = "RCOF", req="Honored", },
    { x = 46.8, y = 41.4, id = 1015, toy = 129279, group = "RCOF", req="Honored", },

}

addon.pinList["Reputation Pets"] = {
    -- Legion
    { x = 36.4, y = 46.8, id = 1033, pet = 97174, group = "RNF", req="Revered", }, -- Extinguished Eye
    { x = 60.2, y = 51.2, id = 1017, pet = 106181, group = "RVLJ", req="Revered", },
    { x = 48.2, y = 73.8, id = 1015, pet = 97128, group = "RWD", req="Revered", },
    { x = 38.6, y = 45.8, id = 1024, pet = 106152, group = "RHMT", req="Revered", },
    { x = 46.8, y = 41.4, id = 1015, pet = 112728, group = "RCOF", req="Revered", },
}

addon.pinList["Raiding With Leashes"] = {
	-- I: Vanilla
	{ x = 20.5, y = 32.8, id = 29 , zone = 696, pet = 1147, group = "BRM" , boss = "Sulfuron Harbringer"  , }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 696, pet = 1149, group = "BRM" , boss = "Magmadar"             , }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 696, pet = 1150, group = "BRM" , boss = "Golemagg"             , }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 755, pet = 1151, group = "BRM" , boss = "Razorgore the Untamed", }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 755, pet = 1153, group = "BRM" , boss = "Broodlord Lashlayer"  , }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 755, pet = 1152, group = "BRM" , boss = "Chromaggus"           , }, 
	{ x = 23.1, y = 86.3, id = 261, zone = 765, pet = 1154, group = "AQ40", boss = "Viscidus"             , }, 
	{ x = 23.1, y = 86.3, id = 261, zone = 766, pet = 1155, group = "AQ40", boss = "Emperor Vek'lor"      , }, 
	{ x = 23.1, y = 86.3, id = 261, zone = 766, pet = 1156, group = "AQ40", boss = "The Prophet Skeram"   , }, 
	{ x = 87.4, y = 46.4, id = 488, zone = 535, pet = 1146, group = "Naxx", boss = "Gluth"                , }, 
	{ x = 87.4, y = 46.4, id = 488, zone = 535, pet = 1143, group = "Naxx", boss = "Maexxna"              , }, 
	{ x = 87.4, y = 46.4, id = 488, zone = 535, pet = 1144, group = "Naxx", boss = "Loatheb"              , }, 
	-- II: Attunement Edition
	{ x = 47.1, y = 72.4, id = 32 , zone = 799, pet = 1226, group = "Kara", boss = "The Big Bad Wolf"         , }, 
	{ x = 47.1, y = 72.4, id = 32 , zone = 799, pet = 1227, group = "Kara", boss = "The Curator"              , }, 
	{ x = 47.1, y = 72.4, id = 32 , zone = 799, pet = 1229, group = "Kara", boss = "Terestian Illhoof"        , }, 
	{ x = 47.1, y = 72.4, id = 32 , zone = 799, pet = 1228, group = "Kara", boss = "Prince Malchezaar"        , }, 
	{ x = 50.0, y = 41.0, id = 467, zone = 780, pet = 1231, group = "SSC" , boss = "Hydross The Unstable"     , }, 
	{ x = 50.0, y = 41.0, id = 467, zone = 780, pet = 1230, group = "SSC" , boss = "Morogrim Tidewalker"      , }, 
	{ x = 50.0, y = 41.0, id = 467, zone = 780, pet = 1232, group = "SSC" , boss = "Lady Vashj"               , }, 
	{ x = 76.6, y = 65.8, id = 479, zone = 782, pet = 1235, group = "Eye" , boss = "A'lar"                    , }, 
	{ x = 76.6, y = 65.8, id = 479, zone = 782, pet = 1233, group = "Eye" , boss = "Void Reaver"              , }, 
	{ x = 76.6, y = 65.8, id = 479, zone = 782, pet = 1234, group = "Eye" , boss = "High Astromancer Solarian", }, 
	-- III: Drinking From The Sunwell
	{ x = 74.8, y = 43.1, id = 473, zone = 796, pet = 1623, group = "BT" , boss = "High Warlord Naj'entus", }, 
	{ x = 74.8, y = 43.1, id = 473, zone = 796, pet = 1624, group = "BT" , boss = "Supremus"              , }, 
	{ x = 74.8, y = 43.1, id = 473, zone = 796, pet = 1625, group = "BT" , boss = "Reliquary of Souls"    , }, 
	{ x = 74.8, y = 43.1, id = 473, zone = 796, pet = 1626, group = "BT" , boss = "Reliquary of Souls"    , }, 
	{ x = 74.8, y = 43.1, id = 473, zone = 796, pet = 1627, group = "BT" , boss = "Reliquary of Souls"    , }, 
	{ x = 74.8, y = 43.1, id = 473, zone = 796, pet = 1628, group = "BT" , boss = "Mother Shahraz"        , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 775, pet = 1629, group = "COT", boss = "Anetheron"             , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 775, pet = 1622, group = "COT", boss = "Azgalor"               , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 775, pet = 1631, group = "COT", boss = "Archimonde"            , }, 
	{ x = 40.4, y = 46.4, id = 499, zone = 789, pet = 1632, group = "SWP", boss = "Brutallus"             , }, 
	{ x = 40.4, y = 46.4, id = 499, zone = 789, pet = 1634, group = "SWP", boss = "The Eredar Twins"      , }, 
	{ x = 40.4, y = 46.4, id = 499, zone = 789, pet = 1633, group = "SWP", boss = "M'uru"                 , }, 
	-- IV: Wrath of the Lick King
	{ x = 41.5, y = 16.1, id = 495, zone = 529, pet = 1955, group = "Uld" , boss = "Ignis the Furnace Master", }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, pet = 1956, group = "Uld" , boss = "Razorscale"              , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, pet = 1957, group = "Uld" , boss = "The Assembly of Iron"    , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, pet = 1958, group = "Uld" , boss = "Auriaya"                 , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, pet = 1959, group = "Uld" , boss = "Hodir"                   , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, pet = 1960, group = "Uld" , boss = "Freya"                   , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, pet = 1961, group = "Uld" , boss = "Mimiron"                 , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, pet = 1962, group = "Uld" , boss = "Yogg-Saron"              , }, 
	{ x = 75.2, y = 21.9, id = 492, zone = 543, pet = 1952, group = "TOGC", boss = "The Northrend Beasts"    , }, 
	{ x = 75.2, y = 21.9, id = 492, zone = 543, pet = 1953, group = "TOGC", boss = "The Northrend Beasts"    , }, 
	{ x = 75.2, y = 21.9, id = 492, zone = 543, pet = 1954, group = "TOGC", boss = "Anub'arak"               , }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, pet = 1963, group = "ICC" , boss = "Lord Marrowgar"          , }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, pet = 1964, group = "ICC" , boss = "Deathbringer Saurfang"   , }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, pet = 1965, group = "ICC" , boss = "Professor Putricide"     , }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, pet = 1966, group = "ICC" , boss = "Sindragosa"              , }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, pet = 1967, group = "ICC" , boss = "The Lich King (Normal)"  , }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, pet = 1968, group = "ICC" , boss = "The Lich King (Heroic)"  , },
	-- V: Cuteaclysm
	{ x = 20.5, y = 32.8, id = 29 , zone = 754, pet = 2078, group = "BRM", boss = "Omnotron Defense System", }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 754, pet = 2079, group = "BRM", boss = "Maloriak"               , }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 754, pet = 2080, group = "BRM", boss = "Nefarian"               , }, 
	{ x = 34.0, y = 78.0, id = 700, zone = 758, pet = 2081, group = "BOT", boss = "Theralion and Valiona"  , }, 
	{ x = 34.0, y = 78.0, id = 700, zone = 758, pet = 2082, group = "BOT", boss = "Ascendant Council"      , }, 
	{ x = 34.0, y = 78.0, id = 700, zone = 758, pet = 2083, group = "BOT", boss = "Cho'gall"               , }, 
	{ x = 36.3, y = 84.8, id = 720, zone = 773, pet = 2085, group = "TFW", boss = "Conclave of Wind"       , }, 
	{ x = 36.3, y = 84.8, id = 720, zone = 773, pet = 2084, group = "TFW", boss = "Al'Akir"                , }, 
	{ x = 47.5, y = 79.6, id = 606, zone = 800, pet = 2086, group = "FL" , boss = "Shannox"                , }, 
	{ x = 47.5, y = 79.6, id = 606, zone = 800, pet = 2087, group = "FL" , boss = "Beth'tilac"             , }, 
	{ x = 47.5, y = 79.6, id = 606, zone = 800, pet = 2088, group = "FL" , boss = "Baleroc"                , }, 
	{ x = 47.5, y = 79.6, id = 606, zone = 800, pet = 2089, group = "FL" , boss = "Majordomo Staghelm"     , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 824, pet = 2090, group = "COT", boss = "Yor'sahj the Unsleeping", }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 824, pet = 2091, group = "COT", boss = "Spine of Deathwing"     , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 824, pet = 2092, group = "COT", boss = "Madness of Deathwing"   , }, 
}