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
local db

addon.pinList = {}
local npcCache = {}
local pinStorage = {}
local pinGroupStorage = {}

--Setup Defaults
local defaults = {
	profile = {
		Enable = true,
		Mount    = { r = 0.9, g = 0.3, b = 0.3, }, 
		Pet      = { r = 0.9, g = 0.1, b = 0.9, }, 
		Toy      = { r = 0.2, g = 0.9, b = 0.2, }, 
		Treasure = { r = 0.2, g = 0.8, b = 1  , }, 
		Rare     = { r = 0.8, g = 0.6, b = 0.4, }, 
		Other    = { r = 1  , g = 1  , b = 1  , }, 
	},
}
---
-- Locals and Constants
local X_SPACING = 1.5
local Y_SPACING = 2.0
local SPACING = 2
local pinCount = 1

-- Scanning those acheivements can give us various npc names, mostly used for rares.
local RARE_ACHIEVEMENTS = {2257, }

-- Find/Replace Regex
-- /way (.*) ([0-9]*[.][0-9]+) ([0-9]*[.][0-9]+) (.*)
-- { x = $2, y = $3, map = $1, npc = $4, },
-- Can be used to convert TomTom Waypoints into pinTable.

---------------------
-- Rare Pins  --
---------------------

addon.pinList["Frostbitten"] = {
	{ x = 72.4, y = 39.2, id = 486, rare = 32358, }, 
	{ x = 66.2, y = 36.6, id = 486, rare = 32358, }, 
	{ x = 61.6, y = 28.0, id = 486, rare = 32358, }, 
	{ x = 61.2, y = 25.0, id = 486, rare = 32358, }, 
	{ x = 60.6, y = 15.0, id = 486, rare = 32358, }, 
	{ x = 67.0, y = 19.4, id = 486, rare = 32358, }, 
	{ x = 68.6, y = 26.6, id = 486, rare = 32358, }, 
	{ x = 72.6, y = 29.4, id = 486, rare = 32358, }, 
	{ x = 80.6, y = 46.2, id = 486, rare = 32361, }, 
	{ x = 84.6, y = 46.8, id = 486, rare = 32361, }, 
	{ x = 88.6, y = 39.8, id = 486, rare = 32361, }, 
	{ x = 91.6, y = 32.6, id = 486, rare = 32361, }, 
	{ x = 85.8, y = 34.6, id = 486, rare = 32361, }, 
	{ x = 81.4, y = 31.4, id = 486, rare = 32361, }, 
	{ x = 20.6, y = 27.6, id = 486, rare = 32357, }, 
	{ x = 22.2, y = 33.8, id = 486, rare = 32357, }, 
	{ x = 34.4, y = 31.6, id = 486, rare = 32357, }, 
	{ x = 34.0, y = 24.2, id = 486, rare = 32357, }, 
	{ x = 33.2, y = 56.8, id = 488, rare = 32409, }, 
	{ x = 30.6, y = 58.6, id = 488, rare = 32409, }, 
	{ x = 28.8, y = 61.6, id = 488, rare = 32409, }, 
	{ x = 26.6, y = 58.6, id = 488, rare = 32409, }, 
	{ x = 24.0, y = 53.8, id = 488, rare = 32409, }, 
	{ x = 20.6, y = 55.2, id = 488, rare = 32409, }, 
	{ x = 15.6, y = 58.2, id = 488, rare = 32409, }, 
	{ x = 15.6, y = 45.6, id = 488, rare = 32409, }, 
	{ x = 67.8, y = 59.2, id = 488, rare = 32400, }, 
	{ x = 68.0, y = 46.0, id = 488, rare = 32400, }, 
	{ x = 68.6, y = 27.6, id = 488, rare = 32400, }, 
	{ x = 63.6, y = 37.2, id = 488, rare = 32400, }, 
	{ x = 61.6, y = 59.0, id = 488, rare = 32400, }, 
	{ x = 58.8, y = 59.6, id = 488, rare = 32400, }, 
	{ x = 60.2, y = 34.6, id = 488, rare = 32400, }, 
	{ x = 53.6, y = 59.2, id = 488, rare = 32400, }, 
	{ x = 69.2, y = 75.6, id = 488, rare = 32417, }, 
	{ x = 72.0, y = 74.0, id = 488, rare = 32417, }, 
	{ x = 72.0, y = 70.8, id = 488, rare = 32417, }, 
	{ x = 86.8, y = 41.6, id = 488, rare = 32417, }, 
	{ x = 88.2, y = 36.6, id = 488, rare = 32417, }, 
	{ x = 86.0, y = 36.4, id = 488, rare = 32417, }, 
	{ x = 75.6, y = 27.2, id = 488, rare = 32417, }, 
	{ x = 72.6, y = 25.8, id = 488, rare = 32417, }, 
	{ x = 71.6, y = 22.4, id = 488, rare = 32417, }, 
	{ x = 22.8, y = 73.4, id = 490, rare = 32422, }, 
	{ x = 17.6, y = 70.6, id = 490, rare = 32422, }, 
	{ x = 11.2, y = 71.0, id = 490, rare = 32422, }, 
	{ x = 25.8, y = 56.4, id = 490, rare = 32422, }, 
	{ x = 20.8, y = 56.2, id = 490, rare = 32422, }, 
	{ x = 12.0, y = 55.6, id = 490, rare = 32422, }, 
	{ x = 13.2, y = 46.6, id = 490, rare = 32422, }, 
	{ x = 10.0, y = 38.4, id = 490, rare = 32422, }, 
	{ x = 67.0, y = 42.6, id = 490, rare = 32438, }, 
	{ x = 75.2, y = 41.4, id = 490, rare = 32438, }, 
	{ x = 66.2, y = 35.6, id = 490, rare = 32438, }, 
	{ x = 71.4, y = 33.4, id = 490, rare = 32438, }, 
	{ x = 68.8, y = 26.8, id = 490, rare = 32438, }, 
	{ x = 61.6, y = 36.2, id = 490, rare = 32438, }, 
	{ x = 28.0, y = 45.6, id = 490, rare = 32429, }, 
	{ x = 34.0, y = 49.2, id = 490, rare = 32429, }, 
	{ x = 40.2, y = 48.8, id = 490, rare = 32429, }, 
	{ x = 31.2, y = 56.8, id = 491, rare = 32398, }, 
	{ x = 26.0, y = 64.0, id = 491, rare = 32398, }, 
	{ x = 30.8, y = 71.2, id = 491, rare = 32398, }, 
	{ x = 32.0, y = 75.8, id = 491, rare = 32398, }, 
	{ x = 33.2, y = 80.2, id = 491, rare = 32398, }, 
	{ x = 71.6, y = 13.6, id = 491, rare = 32377, }, 
	{ x = 68.6, y = 16.8, id = 491, rare = 32377, }, 
	{ x = 60.8, y = 20.2, id = 491, rare = 32377, }, 
	{ x = 53.2, y = 11.4, id = 491, rare = 32377, }, 
	{ x = 50.6, y = 4.8 , id = 491, rare = 32377, }, 
	{ x = 68.2, y = 46.0, id = 491, rare = 32386, }, 
	{ x = 75.6, y = 45.0, id = 491, rare = 32386, }, 
	{ x = 69.6, y = 58.0, id = 491, rare = 32386, }, 
	{ x = 74.6, y = 59.6, id = 491, rare = 32386, }, 
	{ x = 72.8, y = 49.0, id = 491, rare = 32386, }, 
	{ x = 28.6, y = 45.8, id = 492, rare = 32495, }, 
	{ x = 31.8, y = 42.2, id = 492, rare = 32495, }, 
	{ x = 29.6, y = 37.8, id = 492, rare = 32495, }, 
	{ x = 30.6, y = 34.4, id = 492, rare = 32495, }, 
	{ x = 30.6, y = 28.2, id = 492, rare = 32495, }, 
	{ x = 34.0, y = 27.6, id = 492, rare = 32495, }, 
	{ x = 37.4, y = 23.6, id = 492, rare = 32495, }, 
	{ x = 54.6, y = 52.4, id = 492, rare = 32495, }, 
	{ x = 59.0, y = 56.0, id = 492, rare = 32495, }, 
	{ x = 58.2, y = 63.0, id = 492, rare = 32495, }, 
	{ x = 46.6, y = 65.0, id = 492, rare = 32487, }, 
	{ x = 44.8, y = 53.8, id = 492, rare = 32487, }, 
	{ x = 52.4, y = 38.6, id = 492, rare = 32487, }, 
	{ x = 69.0, y = 67.6, id = 492, rare = 32487, }, 
	{ x = 65.4, y = 48.6, id = 492, rare = 32487, }, 
	{ x = 67.6, y = 38.6, id = 492, rare = 32501, }, 
	{ x = 74.2, y = 33.0, id = 492, rare = 32501, }, 
	{ x = 49.2, y = 79.0, id = 492, rare = 32501, }, 
	{ x = 48.4, y = 86.8, id = 492, rare = 32501, }, 
	{ x = 31.2, y = 62.2, id = 492, rare = 32501, }, 
	{ x = 35.6, y = 70.0, id = 492, rare = 32501, }, 
	{ x = 54.4, y = 52.8, id = 493, rare = 32481, }, 
	{ x = 46.8, y = 55.0, id = 493, rare = 32481, }, 
	{ x = 43.0, y = 52.2, id = 493, rare = 32481, }, 
	{ x = 41.0, y = 58.6, id = 493, rare = 32481, }, 
	{ x = 57.8, y = 65.6, id = 493, rare = 32481, }, 
	{ x = 52.6, y = 72.6, id = 493, rare = 32481, }, 
	{ x = 44.8, y = 69.4, id = 493, rare = 32481, }, 
	{ x = 41.2, y = 68.4, id = 493, rare = 32481, }, 
	{ x = 42.0, y = 73.8, id = 493, rare = 32481, }, 
	{ x = 59.4, y = 22.6, id = 493, rare = 32517, }, 
	{ x = 36.8, y = 30.0, id = 493, rare = 32517, }, 
	{ x = 31.0, y = 66.6, id = 493, rare = 32517, }, 
	{ x = 28.6, y = 70.0, id = 493, rare = 32517, }, 
	{ x = 21.6, y = 70.6, id = 493, rare = 32517, }, 
	{ x = 51.0, y = 81.6, id = 493, rare = 32517, }, 
	{ x = 67.0, y = 79.6, id = 493, rare = 32517, }, 
	{ x = 71.0, y = 71.6, id = 493, rare = 32517, }, 
	{ x = 26.8, y = 47.8, id = 493, rare = 32485, }, 
	{ x = 37.8, y = 28.8, id = 493, rare = 32485, }, 
	{ x = 52.6, y = 41.8, id = 493, rare = 32485, }, 
	{ x = 47.0, y = 44.0, id = 493, rare = 32485, }, 
	{ x = 50.2, y = 80.4, id = 493, rare = 32485, }, 
	{ x = 63.8, y = 82.8, id = 493, rare = 32485, }, 
	{ x = 66.2, y = 78.2, id = 493, rare = 32485, }, 
	{ x = 26.6, y = 59.0, id = 495, rare = 32630, }, 
	{ x = 29.2, y = 66.6, id = 495, rare = 32630, }, 
	{ x = 36.2, y = 65.2, id = 495, rare = 32630, }, 
	{ x = 37.0, y = 73.4, id = 495, rare = 32630, }, 
	{ x = 39.8, y = 58.0, id = 495, rare = 32630, }, 
	{ x = 68.2, y = 47.6, id = 495, rare = 32500, }, 
	{ x = 37.8, y = 58.6, id = 495, rare = 32500, }, 
	{ x = 41.0, y = 51.6, id = 495, rare = 32500, }, 
	{ x = 41.6, y = 40.6, id = 495, rare = 32500, }, 
	{ x = 21.2, y = 79.8, id = 496, rare = 32471, }, 
	{ x = 25.0, y = 77.6, id = 496, rare = 32471, }, 
	{ x = 26.6, y = 71.2, id = 496, rare = 32471, }, 
	{ x = 22.0, y = 70.6, id = 496, rare = 32471, }, 
	{ x = 17.0, y = 70.4, id = 496, rare = 32471, }, 
	{ x = 23.0, y = 61.0, id = 496, rare = 32471, }, 
	{ x = 26.6, y = 55.8, id = 496, rare = 32471, }, 
	{ x = 14.6, y = 56.8, id = 496, rare = 32471, }, 
	{ x = 75.0, y = 66.8, id = 496, rare = 32475, }, 
	{ x = 77.4, y = 43.6, id = 496, rare = 32475, }, 
	{ x = 81.6, y = 34.6, id = 496, rare = 32475, }, 
	{ x = 71.8, y = 23.8, id = 496, rare = 32475, }, 
	{ x = 71.8, y = 29.6, id = 496, rare = 32475, }, 
	{ x = 61.8, y = 36.4, id = 496, rare = 32475, }, 
	{ x = 53.6, y = 32.0, id = 496, rare = 32475, }, 
	{ x = 21.6, y = 82.8, id = 496, rare = 32447, }, 
	{ x = 29.0, y = 82.2, id = 496, rare = 32447, }, 
	{ x = 28.8, y = 72.2, id = 496, rare = 32447, }, 
	{ x = 51.4, y = 84.6, id = 496, rare = 32447, }, 
	{ x = 42.6, y = 70.6, id = 496, rare = 32447, }, 
	{ x = 40.6, y = 62.2, id = 496, rare = 32447, }, 
	{ x = 40.4, y = 53.0, id = 496, rare = 32447, }, 
	{ x = 45.0, y = 68.6, id = 496, rare = 32447, }, 
	{ x = 47.8, y = 63.4, id = 496, rare = 32447, }, 
	{ x = 44.8, y = 55.6, id = 496, rare = 32447, }, 
}

local function RareNameCache()
	for i = 1, #RARE_ACHIEVEMENTS do
		local id = RARE_ACHIEVEMENTS[i]
		for j = 1, GetAchievementNumCriteria(id) do
			local name, _, completed, _, _, _, _, npcID = GetAchievementCriteriaInfo(id, j)
			npcCache[npcID] = name
		end
	end
	LUI:Print(npcCache[32447])
end

function addon:GetRareName(id)
	return npcCache[id] or "NPC ID #"..id
end

---------------------
-- Addon Functions --
---------------------

local function SetPinColor(self, color)
	local c = db[color]
	self.texture:SetVertexColor(c.r, c.g, c.b)
end

local function PinTooltipHandler(self, ...)
	local tooltip = (self:GetParent() == WorldMapButton) and WorldMapTooltip or GameTooltip

	tooltip:SetOwner(self, "ANCHOR_RIGHT")
	tooltip:ClearLines()
	
	tooltip:AddLine(format("|cff0070dd%s|r", self.name or self:GetDebugName()))
	if self.type then tooltip:AddLine(self.type) end
	tooltip:AddLine(" ")
	
	if self.zone then tooltip:AddLine(format("|cffffffffZone:|r %s", GetMapNameByID(self.zone))) end
	if not self.zone then tooltip:AddLine(format("|cffffffffZone:|r %s", GetMapNameByID(self.id))) end
	if self.boss then tooltip:AddLine(format("|cffffffffBoss:|r %s", self.boss)) end
	if self.note then tooltip:AddLine(format("|cffffffffNote:|r %s", self.note)) end

	tooltip:Show()
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

	pin:SetScript("OnEnter", PinTooltipHandler)
	pin:SetScript("OnLeave", function(self)
		if self:GetParent() == WorldMapButton then
			WorldMapTooltip:Hide()
		else
			GameTooltip:Hide()
		end
	end)
	pin:Show()
	return pin
end

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

function addon:GeneratePinList()
	for typeName, pinList in pairs(addon.pinList) do
		for i = 1, #pinList do
			local data = pinList[i]
			local pinName = "TMPin"..pinCount
			pinCount = pinCount + 1
			local pin = addon:CreatePin(pinName)

			for k, v in pairs(data) do
				pin[k] = v
			end
			pinStorage[#pinStorage+1] = pin

			-- If several pins are supposed to come from the same source (instance, ...), groups will anchor pins next to each other
			if data.group then
				local group = pinGroupStorage[data.group] or {}
				if not pinGroupStorage[data.group] then
					pinGroupStorage[data.group] = group
				end
				group[#group+1] = pin
			end

			-- Add type-specific information. 
			if data.pet then
				pin:SetPinColor("Pet")
				pin.type = "Pet"
				pin.name = addon:GetPetName(data.pet)
			elseif data.mount then
				pin.type = "Mount"
				pin:SetPinColor("Mount")
			elseif data.toy then
				pin.Type = "Toy"
				pin:SetPinColor("Toy")
			elseif data.rare then
				pin.Type = "Rare"
				pin:SetPinColor("Rare")
				pin.name = addon:GetRareName(data.rare)
			end

			HBDPins:AddWorldMapIconMF(addonName, pin, data.id, nil, data.x/100, data.y/100)
		end
	end

	--Grouped pins will be on top of each other unless we space them out
	for name, group in pairs(pinGroupStorage) do
		addon:UpdateGroupedPinPosition(name)
	end
end

-------------------
-- Addon Options -- 
-------------------

local options = {}
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

--Addon Loaded
function addon:OnInitialize()
	--Setup Database
	self.db = LibStub("AceDB-3.0"):New("TreasureMapDB",defaults)
	db = self.db.profile

	--Setup Options
	LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, LoadOptions);
	options.General = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonName, nil, nil, "General")
end

function addon:OnEnable()
	--addon:RegisterEvent("WORLD_MAP_UPDATE")
	RareNameCache()
	addon:GeneratePinList()
end

function addon:ChatCommand(input)
	InterfaceOptionsFrame_OpenToCategory("TreasureMap")
end