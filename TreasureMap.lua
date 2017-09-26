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
		Mount       = { r = 0.9, g = 0.3, b = 0.3, }, 
		Pet         = { r = 0.9, g = 0.1, b = 0.9, }, 
		Toy         = { r = 0.2, g = 0.9, b = 0.2, }, 
		Treasure    = { r = 0.2, g = 0.8, b = 1  , }, 
		Rare        = { r = 0.8, g = 0.6, b = 0.4, }, 
		Achievement = { r = 1  , g = 1  , b = 1  , }, 
	},
}

local continentList = {}
addon.pinList = {}

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

			for k, v in pairs(data) do
				pin[k] = v
			end
			pinStorage[#pinStorage+1] = pin

			-- If several pins are supposed to come from the same source (instance, ...), groups will anchor pins next to each other
			if data.group then
				local group = GetPinGroup(data.group)
				group[#group+1] = pin
				--if #group > 1 then
				--	data.y = data.y + 2 * (#group - 1)
				--end
				--UpdatePinGroupAnchors(data.group)
				--HBDPins:AddWorldMapIconMF(addonName, group, data.id, nil, data.x/100, data.y/100)
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