--[[
	Project....: AchieveChannel2
	File.......: AchieveChannel.lua
	Description: Shows Achievements earned in custom/private channels. 
	Version....: 2.0
	Rev Date...: 10/07/12 [dd/mm/yy]
]] 

---------------------
-- Local Variables --
---------------------
local addonName = ...
local addon = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceEvent-3.0")
local HBD = LibStub("HereBeDragons-1.0")
local HBDPins = LibStub("HereBeDragons-Pins-1.0")
local options = {}
local db

--Setup Defaults
local defaults = {
	profile = {
		Enable = true,
		Mount = { r = 0.9, g = 0.3, b = 0.3, }, 
		Pet   = { r = 0.2, g = 0.9, b = 0.2, }, -
		Toy   = { r = 1  , g = 0.1, b = 1  , }, 
	},
	global = {
		petInfoCache = {},
	},
}

local continentList = {}
addon.pinList = {}

--------------------
-- Addon Pin List --
--------------------
--/dump LibStub("HereBeDragons-1.0"):GetPlayerZonePosition()

addon.pinList["Heroic Dungeon Mounts"] = {
	{ x = 65.8, y = 48.9, id = 161, zone = 521, item = 43951, group = "COT", boss = "Infinite Corruptor"    , }, 
	{ x = 60.2, y = 27.5, id = 499, zone = 798, item = 35513, group = "MGT", boss = "Kael'Thas Sunstrider"  , }, 
	{ x = 41.9, y = 65.8, id = 478, zone = 723, item = 32768, group = "SH" , boss = "Anzu"                  , }, 
	{ x = 58.4, y = 45.0, id = 491, zone = 524, item = 44151, group = "UP" , boss = "Skadi the Ruthless"    , }, 
	{ x = 67.3, y = 32.6, id = 37 , zone = 793, item = 68824, group = "ZG" , boss = "High Priestess Kilnara", }, 
	{ x = 67.3, y = 32.6, id = 37 , zone = 793, item = 68823, group = "ZG" , boss = "Bloodlord Mandokir"    , }, 
	{ x = 76.1, y = 64.0, id = 463, zone = 781, item = 69747, group = "ZA" , note = "Timed Run"             , }, 
}
addon.pinList["Dungeon Mounts"] = {
	{ x = 26.9, y = 11.8, id = 23 , zone = 765, item = 13335, group = "Strat", boss = "Lord Aurius Rivendare", }, 
	{ x = 46.8, y = 49.7, id = 640, zone = 768, item = 63043, group = "SC"   , boss = "Slabhide"             , }, 
	{ x = 75.0, y = 85.0, id = 720, zone = 769, item = 63040, group = "VP"   , boss = "Altairus"             , },  
}

addon.pinList["Raid Mounts"] = {
	-- Level 60
	{ x = 23.1, y = 86.3, id = 261, zone = 765, item = 21218, group = "AQ40", note = "Drops from trash mobs.", }, 
	{ x = 23.1, y = 86.3, id = 261, zone = 765, item = 21323, group = "AQ40", note = "Drops from trash mobs.", }, 
	{ x = 23.1, y = 86.3, id = 261, zone = 765, item = 21324, group = "AQ40", note = "Drops from trash mobs.", }, 
	{ x = 23.1, y = 86.3, id = 261, zone = 765, item = 21321, group = "AQ40", note = "Drops from trash mobs.", }, 
	-- Level 70
	{ x = 47.1, y = 72.4, id = 32 , zone = 799, item = 30480, group = "Kara", boss = "Atuumen the Huntsman", }, 
	{ x = 76.6, y = 65.8, id = 479, zone = 782, item = 32458, group = "Eye" , boss = "Kael'Thas Sunstrider", }, 
	-- Level 80
	{ x = 28.1, y = 28.1, id = 486, zone = 527, item = 43952, group = "EoE", boss = "Malygos"              , }, 
	{ x = 28.1, y = 28.1, id = 486, zone = 527, item = 43953, group = "EoE", boss = "Malygos"              , }, 
	{ x = 51.2, y = 78.8, id = 141, zone = 718, item = 49636, group = "Ony", boss = "Onyxia"               , }, 
	{ x = 60.0, y = 56.0, id = 486, zone = 531, item = 43986, group = "WRT", boss = "Sartharion"           , note = "3 Drakes. 10man"      , }, 
	{ x = 60.0, y = 56.0, id = 486, zone = 531, item = 43954, group = "WRT", boss = "Sartharion"           , note = "3 Drakes. 25man"      , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, item = 45693, group = "Uld", boss = "Yogg-Saron"           , note = "0 Keepers. 25man Only", }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, item = 50818, group = "ICC", boss = "The Lich King (25man)", }, 
	{ x = 49.8, y = 18.2, id = 501, zone = 532, item = 44083, group = "ICC", boss = "All Four Bosses"      , }, 
	-- Level 85
	{ x = 36.3, y = 84.8, id = 720, zone = 773, item = 63041, group = "TFW", boss = "Al'akir"           , }, 
	{ x = 47.5, y = 79.6, id = 606, zone = 800, item = 71665, group = "FL" , boss = "Alysrazor"         , }, 
	{ x = 47.5, y = 79.6, id = 606, zone = 800, item = 69224, group = "FL" , boss = "Ragnaros"          , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 824, item = 78919, group = "COT", boss = "Ultraxion"         , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 824, item = 77067, group = "COT", boss = "Deathwing"         , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 824, item = 77069, group = "COT", boss = "Deathwing (Heroic)", }, 
	-- Level 90
	{ x = 60.0, y = 40.0, id = 809, zone = 896, item = 87777 , group = "MSV", boss = "Elegon"                     , }, 
	{ x = 63.0, y = 32.0, id = 928, zone = 930, item = 93666 , group = "TOT", boss = "Horridon"                   , }, 
	{ x = 63.0, y = 32.0, id = 928, zone = 930, item = 95059 , group = "TOT", boss = "Ji-Kun"                     , }, 
	{ x = 74.0, y = 44.0, id = 811, zone = 953, item = 104253, group = "SOO", boss = "Garrosh Hellscream (Mythic)", },  
	-- Level 100
	{ x = 51.4, y = 28.7, id = 949, zone = 988 , item = 116660, group = "BRF", boss = "Blackhand (Mythic)" , }, 
	{ x = 46.5, y = 53.2, id = 945, zone = 1026, item = 123890, group = "HFC", boss = "Archimonde (Mythic)", },
	-- Level 110
	{ x = 47.1, y = 72.4, id = 32  , zone = 1115, item = 142236, group = "Kara", boss = "Atuumen the Huntsman (Mythic)", }, 
	{ x = 47.1, y = 72.4, id = 32  , zone = 1115, item = 142552, group = "Kara", boss = "Nightbane (Mythic)"           , }, 
	{ x = 58.1, y = 77.4, id = 1033, zone = 1088, item = 137574, group = "NH"  , boss = "Gul'dan"                      , }, 
	{ x = 58.1, y = 77.4, id = 1033, zone = 1088, item = 137575, group = "NH"  , boss = "Gul'dan (Mythic)"             , }, 
	{ x = 64.5, y = 20.9, id = 1021, zone = 1147, item = 143643, group = "TOS" , boss = "Mistress Sassz'ine"           , }, 
	--{ x = 58.1, y = 77.4, id = 1171, zone = 1088, item = 142552, group = "ABT" , boss = "Felhounds of Sargeras"        , }, 
	-- World Bosses Mounts
	{ x = 67.6, y = 74.6, id = 809, item = 87771 , boss = "Sha of Anger", }, 
	{ x = 71.6, y = 64.4, id = 807, item = 89783 , boss = "Galleon"     , }, 
	{ x = 50.6, y = 54.4, id = 929, item = 94228 , boss = "Oondasta"    , }, 
	{ x = 60.5, y = 37.3, id = 928, item = 95057 , boss = "Nalak"       , }, 
	{ x = 47.1, y = 78.4, id = 948, item = 116771, boss = "Rukhmar"     , note = "Patrols around the entire zone.", }, 
}

addon.pinList["Raiding With Leashes"] = {
	-- I: Vanilla
	{ x = 20.5, y = 32.8, id = 29 , zone = 696, petID = 68665, group = "BRM" , boss = "Sulfuron Harbringer"  , }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 696, petID = 68664, group = "BRM" , boss = "Magmadar"             , }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 696, petID = 68666, group = "BRM" , boss = "Golemagg"             , }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 755, petID = 68661, group = "BRM" , boss = "Razorgore the Untamed", }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 755, petID = 68663, group = "BRM" , boss = "Broodlord Lashlayer"  , }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 755, petID = 68662, group = "BRM" , boss = "Chromaggus"           , }, 
	{ x = 23.1, y = 86.3, id = 261, zone = 765, petID = 68660, group = "AQ40", boss = "Viscidus"             , }, 
	{ x = 23.1, y = 86.3, id = 261, zone = 766, petID = 68659, group = "AQ40", boss = "Emperor Vek'lor"      , }, 
	{ x = 23.1, y = 86.3, id = 261, zone = 766, petID = 68658, group = "AQ40", boss = "The Prophet Skeram"   , }, 
	{ x = 87.4, y = 46.4, id = 488, zone = 535, petID = 68654, group = "Naxx", boss = "Gluth"                , }, 
	{ x = 87.4, y = 46.4, id = 488, zone = 535, petID = 68656, group = "Naxx", boss = "Maexxna"              , }, 
	{ x = 87.4, y = 46.4, id = 488, zone = 535, petID = 68657, group = "Naxx", boss = "Loatheb"              , }, 
	-- II: Attunement Edition
	{ x = 47.1, y = 72.4, id = 32 , zone = 799, petID = 71014, group = "Kara", boss = "The Big Bad Wolf"         , }, 
	{ x = 47.1, y = 72.4, id = 32 , zone = 799, petID = 71015, group = "Kara", boss = "The Curator"              , }, 
	{ x = 47.1, y = 72.4, id = 32 , zone = 799, petID = 71033, group = "Kara", boss = "Terestian Illhoof"        , }, 
	{ x = 47.1, y = 72.4, id = 32 , zone = 799, petID = 71016, group = "Kara", boss = "Prince Malchezaar"        , }, 
	{ x = 50.0, y = 41.0, id = 467, zone = 780, petID = 71018, group = "SSC" , boss = "Hydross The Unstable"     , }, 
	{ x = 50.0, y = 41.0, id = 467, zone = 780, petID = 71017, group = "SSC" , boss = "Morogrim Tidewalker"      , }, 
	{ x = 50.0, y = 41.0, id = 467, zone = 780, petID = 71019, group = "SSC" , boss = "Lady Vashj"               , }, 
	{ x = 76.6, y = 65.8, id = 479, zone = 782, petID = 71022, group = "Eye" , boss = "A'lar"                    , }, 
	{ x = 76.6, y = 65.8, id = 479, zone = 782, petID = 71020, group = "Eye" , boss = "Void Reaver"              , }, 
	{ x = 76.6, y = 65.8, id = 479, zone = 782, petID = 71021, group = "Eye" , boss = "High Astromancer Solarian", }, 
	-- III: Drinking From The Sunwell
	{ x = 74.8, y = 43.1, id = 473, zone = 796, petID = 90201, group = "BT" , boss = "High Warlord Naj'entus", }, 
	{ x = 74.8, y = 43.1, id = 473, zone = 796, petID = 90202, group = "BT" , boss = "Supremus"              , }, 
	{ x = 74.8, y = 43.1, id = 473, zone = 796, petID = 90203, group = "BT" , boss = "Reliquary of Souls"    , }, 
	{ x = 74.8, y = 43.1, id = 473, zone = 796, petID = 90205, group = "BT" , boss = "Reliquary of Souls"    , }, 
	{ x = 74.8, y = 43.1, id = 473, zone = 796, petID = 90204, group = "BT" , boss = "Reliquary of Souls"    , }, 
	{ x = 74.8, y = 43.1, id = 473, zone = 796, petID = 90206, group = "BT" , boss = "Mother Shahraz"        , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 775, petID = 90207, group = "COT", boss = "Anetheron"             , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 775, petID = 90200, group = "COT", boss = "Azgalor"               , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 775, petID = 90208, group = "COT", boss = "Archimonde"            , }, 
	{ x = 40.4, y = 46.4, id = 499, zone = 789, petID = 90212, group = "SWP", boss = "Brutallus"             , }, 
	{ x = 40.4, y = 46.4, id = 499, zone = 789, petID = 90214, group = "SWP", boss = "The Eredar Twins"      , }, 
	{ x = 40.4, y = 46.4, id = 499, zone = 789, petID = 90213, group = "SWP", boss = "M'uru"                 , }, 
	-- IV: Wrath of the Lick King
	{ x = 41.5, y = 16.1, id = 495, zone = 529, petID = 115138, group = "Uld" , boss = "Ignis the Furnace Master", }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, petID = 115139, group = "Uld" , boss = "Razorscale"              , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, petID = 115140, group = "Uld" , boss = "The Assembly of Iron"    , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, petID = 115141, group = "Uld" , boss = "Auriaya"                 , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, petID = 115142, group = "Uld" , boss = "Hodir"                   , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, petID = 115143, group = "Uld" , boss = "Freya"                   , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, petID = 115144, group = "Uld" , boss = "Mimiron"                 , }, 
	{ x = 41.5, y = 16.1, id = 495, zone = 529, petID = 115145, group = "Uld" , boss = "Yogg-Saron"              , }, 
	{ x = 75.2, y = 21.9, id = 492, zone = 543, petID = 115135, group = "TOGC", boss = "The Northrend Beasts"    , }, 
	{ x = 75.2, y = 21.9, id = 492, zone = 543, petID = 115136, group = "TOGC", boss = "The Northrend Beasts"    , }, 
	{ x = 75.2, y = 21.9, id = 492, zone = 543, petID = 115137, group = "TOGC", boss = "Anub'arak"               , }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, petID = 115146, group = "ICC" , boss = "Lord Marrowgar"          , }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, petID = 115147, group = "ICC" , boss = "Deathbringer Saurfang"   , }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, petID = 115148, group = "ICC" , boss = "Professor Putricide"     , }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, petID = 115149, group = "ICC" , boss = "Sindragosa"              , }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, petID = 115150, group = "ICC" , boss = "The Lich King (Normal)"  , }, 
	{ x = 53.4, y = 85.8, id = 492, zone = 604, petID = 115152, group = "ICC" , boss = "The Lich King (Heroic)"  , },
	-- V: Cuteaclysm
	{ x = 20.5, y = 32.8, id = 29 , zone = 754, petID = 127850, group = "BRM", boss = "Omnotron Defense System", }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 754, petID = 127852, group = "BRM", boss = "Maloriak"               , }, 
	{ x = 20.5, y = 32.8, id = 29 , zone = 754, petID = 127853, group = "BRM", boss = "Nefarian"               , }, 
	{ x = 34.0, y = 78.0, id = 700, zone = 758, petID = 127857, group = "BOT", boss = "Theralion and Valiona"  , }, 
	{ x = 34.0, y = 78.0, id = 700, zone = 758, petID = 127858, group = "BOT", boss = "Ascendant Council"      , }, 
	{ x = 34.0, y = 78.0, id = 700, zone = 758, petID = 127859, group = "BOT", boss = "Cho'gall"               , }, 
	{ x = 36.3, y = 84.8, id = 720, zone = 773, petID = 127863, group = "TFW", boss = "Conclave of Wind"       , }, 
	{ x = 36.3, y = 84.8, id = 720, zone = 773, petID = 127862, group = "TFW", boss = "Al'Akir"                , }, 
	{ x = 47.5, y = 79.6, id = 606, zone = 800, petID = 127947, group = "FL" , boss = "Shannox"                , }, 
	{ x = 47.5, y = 79.6, id = 606, zone = 800, petID = 127948, group = "FL" , boss = "Beth'tilac"             , }, 
	{ x = 47.5, y = 79.6, id = 606, zone = 800, petID = 127950, group = "FL" , boss = "Baleroc"                , }, 
	{ x = 47.5, y = 79.6, id = 606, zone = 800, petID = 127951, group = "FL" , boss = "Majordomo Staghelm"     , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 824, petID = 127952, group = "COT", boss = "Yor'sahj the Unsleeping", }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 824, petID = 127953, group = "COT", boss = "Spine of Deathwing"     , }, 
	{ x = 65.8, y = 48.9, id = 161, zone = 824, petID = 127954, group = "COT", boss = "Madness of Deathwing"   , }, 
}

---------------------
-- Addon Functions --
---------------------

local function SetPinColor(self, color)
	local c = db[color]
	self.texture:SetVertexColor(c.r, c.g, c.b)
end

function addon:CreatePin(name)
	local pin = CreateFrame("Button", name, WorldMapButton)
	pin:SetSize(20,20)
	pin:SetPoint("CENTER", WorldMapButton, "CENTER")

	local tex = pin:CreateTexture(nil, "OVERLAY")
	tex:SetAllPoints(pin)
	--tex:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-NotReady.blp")
	tex:SetTexture("Interface\\AddOns\\TreasureMap\\WhiteMark.tga")
	--tex:SetDesaturated(true)
	pin.texture = tex
	pin.SetPinColor = SetPinColor
	
	pin:Show()
	return pin
end

local pinGroupStorage = {}
local function GetPinGroup(name)
	if pinGroupStorage[name] then 
		return pinGroupStorage[name] 
	end

	-- If it doesn't exists, create it.
	local group = CreateFrame("Frame", "TMGRoup"..name, WorldMapButton)
	pinGroupStorage[name] = group
	group:SetSize(20,20)
	return group
end

local function UpdatePinGroupAnchors(name)
	local group = pinGroupStorage[name]

	group[1]:SetPoint("TOPLEFT", group, "TOPLEFT")
	for i = 2, #group do
		group[i]:SetPoint("LEFT", group[i-1], "RIGHT", -5, 0)
	end
end

local X_SPACING = 1.5
local Y_SPACING = 2.0
local SPACING = 2
function addon:UpdateGroupedPinPosition(name)
	local group = pinGroupStorage[name]
	if not group then return end

	-- this will let for a roughly even distribution of pins in a square formation
	local rowSize = ceil(sqrt(#group)) 
	local offsetX, offsetY = 0, 0
	local index = 0
	for i = 1, #group do
		index = index + 1
		local pin = group[i]
		local x = pin.x + offsetX
		local y = pin.y + offsetY
		HBDPins:AddWorldMapIconMF(addonName, pin, pin.id, nil, x/100, y/100)

		--Calculate offset for next pin
		if index == rowSize then
			index = 0
			offsetX = 0
			offsetY = offsetY + Y_SPACING
		else
			offsetX = offsetX + X_SPACING
		end

	end
end

local pinCount = 1
local pinStorage = {}

function addon:GeneratePinList()
	for typeName, pinList in pairs(addon.pinList) do
		for i = 1, #pinList do
			local data = pinList[i]
			local pinName = "TMPin"..pinCount
			pinCount = pinCount + 1
			local pin = addon:CreatePin(pinName)
			pin.name = data.name
			pin.id = data.id
			pin.x, pin.y = data.x, data.y
			pinStorage[#pinStorage+1] = pin

			-- If several pins are supposed to come from the same source (instance, ...), groups will anchor pins next to each other
			if data.group then
				local group = GetPinGroup(data.group)
				group[#group+1] = pin
				pin.group = data.group
				--if #group > 1 then
				--	data.y = data.y + 2 * (#group - 1)
				--end
				--UpdatePinGroupAnchors(data.group)
				--HBDPins:AddWorldMapIconMF(addonName, group, data.id, nil, data.x/100, data.y/100)
			end

			-- Color the pin based on type
			if data.petID then
			--	pin.texture:SetVertexColor(0.2,0.9,0.2)
				pin:SetPinColor("Pet")
			else
				pin:SetPinColor("Mount")
				--pin.texture:SetVertexColor(1,0.3,0.3)
			end

			HBDPins:AddWorldMapIconMF(addonName, pin, data.id, nil, data.x/100, data.y/100)
		end
	end
	
	--Grouped pins will be on top of each other unless we space them out
	for name, group in pairs(pinGroupStorage) do
		addon:UpdateGroupedPinPosition(name)
	end
end

local oldMapID
function addon:WORLD_MAP_UPDATE()
	if not WorldMapButton:IsVisible() then return end
	local continentIndex, continentID = GetCurrentMapContinent()
	local mapID = GetCurrentMapAreaID()
	-- We don't need to this to trigger continuously while it's still on the same map.
	if mapID == oldMapID then return end
	oldMapID = mapID
end

function addon:GenerateContinentList()
	-- GetMapContinents returns a list alternating between IDs and localizzed names, so we can go in steps of two.
	local returnList = {GetMapContinents()}
	for i = 1, #returnList, 2 do
		local id = returnList[i]
		continentList[id] = returnList[i+1]
	end
end

-------------------
-- Addon Options -- 
-------------------

local function LoadOptions()
	if options.args then return end

	options = {
		type = "group",
		name = addonName,
		get = function(info) return db[ info[#info] ] end,
		set = function(info, value) db[ info[#info] ] = value end,
		args = {
			--start of general options
			General = {
				order = 1,
				type = "group",
				name = "General",
				args = {
				},
			},
			--end of general options
		},
	}
	
	return options
end

function addon:SetupOptions()
	LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, LoadOptions);
	options.General = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonName, nil, nil, "General")
end

--Addon Loaded
function addon:OnInitialize()
	
	--Setup Database
	self.db = LibStub("AceDB-3.0"):New("TreasureMapDB",defaults)
	db = self.db.profile

	addon:SetupOptions()
end

-- Event to care about: 
function addon:OnEnable()
	addon:RegisterEvent("WORLD_MAP_UPDATE")
	addon:GenerateContinentList()
	addon:GeneratePinList()
end

function addon:ChatCommand(input)
	InterfaceOptionsFrame_OpenToCategory("TreasureMap")
end