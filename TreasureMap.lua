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
	},
}

local continentList = {}

---------------------
-- Addon Functions --
---------------------

addon.pinList["Raid Mounts"] = {
	{ x = 60.2, y = 27.5, id = 499, zone = 798, item = 35513, group = "MGT" , boss = "Kael'Thas Sunstrider", },
	{ x = 41.9, y = 65.8, id = 478, zone = 723, item = 32768, group = "Sethekk" , boss = "Anzu", },
	{ x = 58.4, y = 45, id = 491, zone = 524, item = 44151, group = "UP" , boss = "Skadi the Ruthless", },
	{ x = 53, y = 86, id = 492, zone = 492, item = 43951, group = "COT" , boss = "Infinite Corruptor", },
}


local pinTable = {
	{ name = "Icecrown Test"   , x = 62, y = 40, id = 492, }, 
	{ name = "Storm Peaks Test", x = 62, y = 40, id = 495, }, 
	{ name = "ICC Test 1"      , x = 53, y = 86, id = 492, group = "ICC"   , }, 
	{ name = "ICC Test 2"      , x = 53, y = 86, id = 492, group = "ICC"   , }, 
	{ name = "ICC Test 3"      , x = 53, y = 86, id = 492, group = "ICC"   , }, 
	{ name = "ICC Test 4"      , x = 53, y = 86, id = 492, group = "ICC"   , }, 
	{ name = "ICC Test 5"      , x = 53, y = 86, id = 492, group = "ICC"   , }, 
	{ name = "ICC Test 6"      , x = 53, y = 86, id = 492, group = "ICC"   , }, 
	{ name = "ICC Test 7"      , x = 53, y = 86, id = 492, group = "ICC"   , }, 
	{ name = "ICC Test 8"      , x = 53, y = 86, id = 492, group = "ICC"   , }, 
	{ name = "UlduarTest 1"    , x = 41, y = 18, id = 495, group = "Ulduar", }, 
	{ name = "UlduarTest 2"    , x = 41, y = 18, id = 495, group = "Ulduar", }, 
	{ name = "UlduarTest 3"    , x = 41, y = 18, id = 495, group = "Ulduar", }, 
	{ name = "UlduarTest 4"    , x = 41, y = 18, id = 495, group = "Ulduar", }, 
	{ name = "UlduarTest 5"    , x = 41, y = 18, id = 495, group = "Ulduar", }, 
	{ name = "UlduarTest 6"    , x = 41, y = 18, id = 495, group = "Ulduar", }, 
	{ name = "UlduarTest 7"    , x = 41, y = 18, id = 495, group = "Ulduar", },

}

local function CreatePin(name)
	local pin = CreateFrame("Button", name, WorldMapButton)
	pin:SetSize(20,20)
	pin:SetPoint("CENTER", WorldMapButton, "CENTER")

	local tex = pin:CreateTexture(nil, "OVERLAY")
	tex:SetAllPoints(pin)
	tex:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-NotReady.blp")
	--tex:SetDesaturated(true)

	pin.texture = tex
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

function addon:AddWorldMapPin(mapID, x, y)
	--local pinName = "TMTest"..random(1,100)
	local pinName = "TMTest"
	local pin = CreatePin(pinName)
	LUI:Print("Added Pin:",pinName)
	-- Coords seen ingame and on wowhead are multiplied by 100 to be human-readable. 
	HBDPins:AddWorldMapIconMF(addonName, pin, mapID, nil, x/100, y/100)
	pin:Show()
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
	for i = 1, #pinTable do
		local data = pinTable[i]
		local pinName = "TMPin"..pinCount
		pinCount = pinCount + 1
		local pin = CreatePin(pinName)
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

		HBDPins:AddWorldMapIconMF(addonName, pin, data.id, nil, data.x/100, data.y/100)
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

--[[
	local function getNewPin()
	local pin = next(pinCache)
	if pin then
		pinCache[pin] = nil -- remove it from the cache
		return pin
	end
	-- create a new pin
	pinCount = pinCount + 1
	pin = CreateFrame("Button", "HandyNotesPin"..pinCount, WorldMapButton)
	pin:SetFrameLevel(5)
	pin:EnableMouse(true)
	pin:SetWidth(12)
	pin:SetHeight(12)
	pin:SetPoint("CENTER", WorldMapButton, "CENTER")
	local texture = pin:CreateTexture(nil, "OVERLAY")
	pin.texture = texture
	texture:SetAllPoints(pin)
	pin:RegisterForClicks("LeftButtonDown", "LeftButtonUp", "RightButtonDown", "RightButtonUp")
	pin:SetMovable(true)
	pin:Hide()
	return pin
end

]]

function addon:ChatCommand(input)
	InterfaceOptionsFrame_OpenToCategory("TreasureMap")
end