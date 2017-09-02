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
local options = {}
local db

--Setup Defaults
local defaults = {
	profile = {
		Enable = true,
	},
}

---------------------
-- Addon Functions --
--------------------- 


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

function addon:OnEnable()
end

function addon:ChatCommand(input)
	InterfaceOptionsFrame_OpenToCategory("TreasureMap")
end