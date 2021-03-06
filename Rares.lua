---------------------
-- Local Variables --
---------------------
local addonName = ...
local addon = LibStub("AceAddon-3.0"):GetAddon(addonName)
local HBD = LibStub("HereBeDragons-1.0")

-- Scanning those acheivements can give us various npc names, mostly used for rares.
local RARE_ACHIEVEMENTS = { 1312, 2257, 7439, 8714, 10070}

---------------------
-- Addon Functions --
---------------------

function addon:RareNameCache()
	for i = 1, #RARE_ACHIEVEMENTS do
		local id = RARE_ACHIEVEMENTS[i]
		for j = 1, GetAchievementNumCriteria(id) do
			local name, _, completed, _, _, _, _, npcID = GetAchievementCriteriaInfo(id, j)
			addon.npcCache[npcID] = name
		end
	end
end

function addon:GetRareName(id)
	return addon.npcCache[id] or "NPC ID #"..id
end

--------------------
-- Pets Pin List --
--------------------
addon.pinList["Bloody Rare"] = {
    { x = 30.8, y = 71.8, id = 475, rare = 18692, }, { x = 29.0, y = 68.2, id = 475, rare = 18692, }, 
    { x = 30.8, y = 67.8, id = 475, rare = 18692, }, { x = 29.8, y = 64.4, id = 475, rare = 18692, }, 
    { x = 32.0, y = 54.8, id = 475, rare = 18692, }, { x = 29.6, y = 50.8, id = 475, rare = 18692, }, 
    { x = 30.0, y = 44.8, id = 475, rare = 18692, }, { x = 68.6, y = 73.8, id = 475, rare = 18690, }, 
    { x = 68.0, y = 65.0, id = 475, rare = 18690, }, { x = 61.8, y = 54.0, id = 475, rare = 18690, }, 
    { x = 70.8, y = 42.8, id = 475, rare = 18690, }, { x = 59.0, y = 25.4, id = 475, rare = 18690, }, 
    { x = 62.0, y = 19.6, id = 475, rare = 18690, }, { x = 68.4, y = 32.8, id = 475, rare = 18690, }, 
    { x = 77.6, y = 24.0, id = 475, rare = 18690, }, { x = 66.8, y = 26.8, id = 475, rare = 18693, }, 
    { x = 64.4, y = 19.2, id = 475, rare = 18693, }, { x = 57.8, y = 33.0, id = 475, rare = 18693, }, 
    { x = 56.4, y = 24.4, id = 475, rare = 18693, }, { x = 42.6, y = 50.2, id = 475, rare = 18693, }, 
    { x = 39.8, y = 57.0, id = 475, rare = 18693, }, { x = 46.8, y = 76.4, id = 475, rare = 18693, }, 
    { x = 42.8, y = 81.2, id = 475, rare = 18693, }, { x = 24.2, y = 63.6, id = 465, rare = 18678, }, 
    { x = 24.8, y = 49.6, id = 465, rare = 18678, }, { x = 31.0, y = 36.8, id = 465, rare = 18678, }, 
    { x = 27.6, y = 69.8, id = 465, rare = 18678, }, { x = 32.4, y = 60.6, id = 465, rare = 18678, }, 
    { x = 40.6, y = 51.6, id = 465, rare = 18678, }, { x = 58.6, y = 71.6, id = 465, rare = 18678, }, 
    { x = 47.2, y = 69.6, id = 465, rare = 18678, }, { x = 41.4, y = 71.0, id = 465, rare = 18678, }, 
    { x = 40.2, y = 64.8, id = 465, rare = 18678, }, { x = 41.8, y = 71.8, id = 465, rare = 18677, }, 
    { x = 47.2, y = 57.6, id = 465, rare = 18677, }, { x = 48.0, y = 54.4, id = 465, rare = 18677, }, 
    { x = 55.6, y = 50.4, id = 465, rare = 18677, }, { x = 47.8, y = 46.8, id = 465, rare = 18677, }, 
    { x = 45.2, y = 40.6, id = 465, rare = 18677, }, { x = 67.6, y = 76.8, id = 465, rare = 18677, }, 
    { x = 67.4, y = 68.2, id = 465, rare = 18677, }, { x = 72.8, y = 57.2, id = 465, rare = 18679, }, 
    { x = 71.0, y = 46.8, id = 465, rare = 18679, }, { x = 74.4, y = 39.6, id = 465, rare = 18679, }, 
    { x = 65.6, y = 30.6, id = 465, rare = 18679, }, { x = 53.6, y = 29.4, id = 465, rare = 18679, }, 
    { x = 42.6, y = 31.8, id = 465, rare = 18679, }, { x = 38.4, y = 29.8, id = 465, rare = 18679, }, 
    { x = 35.4, y = 47.2, id = 477, rare = 17144, }, { x = 42.8, y = 47.8, id = 477, rare = 17144, }, 
    { x = 42.2, y = 40.0, id = 477, rare = 17144, }, { x = 58.8, y = 28.8, id = 477, rare = 17144, }, 
    { x = 76.6, y = 78.8, id = 477, rare = 17144, }, { x = 35.8, y = 65.6, id = 477, rare = 18683, }, 
    { x = 34.6, y = 76.8, id = 477, rare = 18683, }, { x = 32.6, y = 71.6, id = 477, rare = 18683, }, 
    { x = 39.8, y = 71.0, id = 477, rare = 18683, }, { x = 26.6, y = 42.0, id = 479, rare = 18697, }, 
    { x = 27.0, y = 37.2, id = 479, rare = 18697, }, { x = 58.6, y = 64.0, id = 479, rare = 18697, }, 
    { x = 61.0, y = 65.4, id = 479, rare = 18697, }, { x = 46.6, y = 83.2, id = 479, rare = 18697, }, 
    { x = 46.2, y = 80.8, id = 479, rare = 18697, }, { x = 23.0, y = 64.6, id = 479, rare = 18698, }, 
    { x = 23.4, y = 75.8, id = 479, rare = 18698, }, { x = 20.6, y = 70.0, id = 479, rare = 18698, }, 
    { x = 27.8, y = 70.8, id = 479, rare = 18698, }, { x = 62.8, y = 32.4, id = 479, rare = 18698, }, 
    { x = 61.6, y = 46.8, id = 479, rare = 18698, }, { x = 57.6, y = 40.4, id = 479, rare = 18698, }, 
    { x = 67.6, y = 39.2, id = 479, rare = 18698, }, { x = 30.8, y = 41.8, id = 479, rare = 18698, }, 
    { x = 24.4, y = 40.6, id = 479, rare = 18698, }, { x = 25.0, y = 82.4, id = 479, rare = 20932, }, 
    { x = 46.0, y = 73.4, id = 479, rare = 20932, }, { x = 67.6, y = 61.0, id = 479, rare = 20932, }, 
    { x = 52.8, y = 57.8, id = 479, rare = 20932, }, { x = 35.0, y = 33.2, id = 479, rare = 20932, }, 
    { x = 35.8, y = 20.8, id = 479, rare = 20932, }, { x = 30.6, y = 58.6, id = 473, rare = 18695, }, 
    { x = 29.8, y = 52.2, id = 473, rare = 18695, }, { x = 28.2, y = 48.0, id = 473, rare = 18695, }, 
    { x = 46.6, y = 66.0, id = 473, rare = 18695, }, { x = 45.6, y = 68.0, id = 473, rare = 18695, }, 
    { x = 48.0, y = 68.4, id = 473, rare = 18695, }, { x = 46.8, y = 70.8, id = 473, rare = 18695, }, 
    { x = 71.6, y = 63.2, id = 473, rare = 18695, }, { x = 68.0, y = 61.4, id = 473, rare = 18695, }, 
    { x = 59.6, y = 37.2, id = 473, rare = 18695, }, { x = 56.2, y = 38.6, id = 473, rare = 18695, }, 
    { x = 57.0, y = 34.2, id = 473, rare = 18695, }, { x = 45.6, y = 31.2, id = 473, rare = 18695, }, 
    { x = 46.8, y = 26.6, id = 473, rare = 18695, }, { x = 45.6, y = 52.2, id = 473, rare = 18694, }, 
    { x = 38.6, y = 42.4, id = 473, rare = 18694, }, { x = 36.4, y = 45.4, id = 473, rare = 18694, }, 
    { x = 59.2, y = 22.0, id = 473, rare = 18694, }, { x = 66.8, y = 21.8, id = 473, rare = 18694, }, 
    { x = 67.4, y = 28.6, id = 473, rare = 18694, }, { x = 73.8, y = 29.2, id = 473, rare = 18694, }, 
    { x = 55.8, y = 73.6, id = 473, rare = 18694, }, { x = 58.2, y = 73.6, id = 473, rare = 18694, }, 
    { x = 62.6, y = 62.6, id = 473, rare = 18694, }, { x = 71.6, y = 66.6, id = 473, rare = 18694, }, 
    { x = 64.6, y = 68.0, id = 473, rare = 18694, }, { x = 45.6, y = 12.6, id = 473, rare = 18696, }, 
    { x = 42.0, y = 40.0, id = 473, rare = 18696, }, { x = 31.2, y = 45.6, id = 473, rare = 18696, }, 
    { x = 59.6, y = 46.6, id = 473, rare = 18696, }, { x = 42.0, y = 68.8, id = 473, rare = 18696, }, 
    { x = 46.6, y = 78.8, id = 478, rare = 18689, }, { x = 51.6, y = 66.6, id = 478, rare = 18689, }, 
    { x = 50.6, y = 62.4, id = 478, rare = 18689, }, { x = 45.4, y = 62.4, id = 478, rare = 18689, }, 
    { x = 48.6, y = 55.8, id = 478, rare = 18689, }, { x = 46.8, y = 52.2, id = 478, rare = 18689, }, 
    { x = 43.4, y = 57.0, id = 478, rare = 18689, }, { x = 39.2, y = 49.2, id = 478, rare = 18689, }, 
    { x = 40.8, y = 62.6, id = 478, rare = 18689, }, { x = 38.8, y = 67.6, id = 478, rare = 18689, }, 
    { x = 41.2, y = 65.8, id = 478, rare = 18689, }, { x = 39.0, y = 63.6, id = 478, rare = 18689, }, 
    { x = 32.4, y = 51.0, id = 478, rare = 18689, }, { x = 35.4, y = 56.0, id = 478, rare = 18689, }, 
    { x = 29.4, y = 55.6, id = 478, rare = 18689, }, { x = 32.4, y = 63.4, id = 478, rare = 18689, }, 
    { x = 28.6, y = 63.4, id = 478, rare = 18689, }, { x = 58.0, y = 33.6, id = 478, rare = 18686, }, 
    { x = 68.0, y = 46.6, id = 478, rare = 18686, }, { x = 36.6, y = 42.0, id = 478, rare = 18686, }, 
    { x = 35.8, y = 35.8, id = 478, rare = 18686, }, { x = 41.6, y = 26.2, id = 478, rare = 18686, }, 
    { x = 47.6, y = 26.8, id = 478, rare = 18686, }, { x = 55.8, y = 19.8, id = 478, rare = 18686, }, 
    { x = 49.6, y = 18.2, id = 478, rare = 18685, }, { x = 31.0, y = 43.0, id = 478, rare = 18685, }, 
    { x = 59.2, y = 24.2, id = 478, rare = 18685, }, { x = 56.6, y = 67.8, id = 478, rare = 18685, }, 
    { x = 22.4, y = 21.4, id = 467, rare = 18682, }, { x = 22.8, y = 28.4, id = 467, rare = 18682, }, 
    { x = 26.8, y = 27.6, id = 467, rare = 18682, }, { x = 27.6, y = 21.2, id = 467, rare = 18682, }, 
    { x = 40.8, y = 62.2, id = 467, rare = 18682, }, { x = 50.6, y = 59.6, id = 467, rare = 18682, }, 
    { x = 86.4, y = 89.0, id = 467, rare = 18682, }, { x = 84.4, y = 79.2, id = 467, rare = 18682, }, 
    { x = 25.8, y = 42.6, id = 467, rare = 18681, }, { x = 63.0, y = 38.0, id = 467, rare = 18681, }, 
    { x = 62.0, y = 69.6, id = 467, rare = 18681, }, { x = 72.2, y = 76.0, id = 467, rare = 18681, }, 
    { x = 73.6, y = 82.2, id = 467, rare = 18681, }, { x = 10.0, y = 52.4, id = 467, rare = 18680, }, 
    { x = 18.6, y = 31.4, id = 467, rare = 18680, }, { x = 79.6, y = 53.6, id = 467, rare = 18680, }, 
    { x = 69.8, y = 40.0, id = 467, rare = 18680, }, { x = 55.2, y = 34.0, id = 467, rare = 18680, }, 
    { x = 48.0, y = 30.0, id = 467, rare = 18680, }, { x = 43.0, y = 35.4, id = 467, rare = 18680, }, 
    { x = 39.4, y = 33.2, id = 467, rare = 18680, }, { x = 38.0, y = 38.2, id = 467, rare = 18680, }, 
}

addon.pinList["Frostbitten"] = {
	{ x = 72.4, y = 39.2, id = 486, rare = 32358, }, { x = 66.2, y = 36.6, id = 486, rare = 32358, }, 
	{ x = 61.6, y = 28.0, id = 486, rare = 32358, }, { x = 61.2, y = 25.0, id = 486, rare = 32358, }, 
	{ x = 60.6, y = 15.0, id = 486, rare = 32358, }, { x = 67.0, y = 19.4, id = 486, rare = 32358, }, 
	{ x = 68.6, y = 26.6, id = 486, rare = 32358, }, { x = 72.6, y = 29.4, id = 486, rare = 32358, }, 
	{ x = 80.6, y = 46.2, id = 486, rare = 32361, }, { x = 84.6, y = 46.8, id = 486, rare = 32361, }, 
	{ x = 88.6, y = 39.8, id = 486, rare = 32361, }, { x = 91.6, y = 32.6, id = 486, rare = 32361, }, 
	{ x = 85.8, y = 34.6, id = 486, rare = 32361, }, { x = 81.4, y = 31.4, id = 486, rare = 32361, }, 
	{ x = 20.6, y = 27.6, id = 486, rare = 32357, }, { x = 22.2, y = 33.8, id = 486, rare = 32357, }, 
	{ x = 34.4, y = 31.6, id = 486, rare = 32357, }, { x = 34.0, y = 24.2, id = 486, rare = 32357, }, 
	{ x = 33.2, y = 56.8, id = 488, rare = 32409, }, { x = 30.6, y = 58.6, id = 488, rare = 32409, }, 
	{ x = 28.8, y = 61.6, id = 488, rare = 32409, }, { x = 26.6, y = 58.6, id = 488, rare = 32409, }, 
	{ x = 24.0, y = 53.8, id = 488, rare = 32409, }, { x = 20.6, y = 55.2, id = 488, rare = 32409, }, 
	{ x = 15.6, y = 58.2, id = 488, rare = 32409, }, { x = 15.6, y = 45.6, id = 488, rare = 32409, }, 
	{ x = 67.8, y = 59.2, id = 488, rare = 32400, }, { x = 68.0, y = 46.0, id = 488, rare = 32400, }, 
	{ x = 68.6, y = 27.6, id = 488, rare = 32400, }, { x = 63.6, y = 37.2, id = 488, rare = 32400, }, 
	{ x = 61.6, y = 59.0, id = 488, rare = 32400, }, { x = 58.8, y = 59.6, id = 488, rare = 32400, }, 
	{ x = 60.2, y = 34.6, id = 488, rare = 32400, }, { x = 53.6, y = 59.2, id = 488, rare = 32400, }, 
	{ x = 69.2, y = 75.6, id = 488, rare = 32417, }, { x = 72.0, y = 74.0, id = 488, rare = 32417, }, 
	{ x = 72.0, y = 70.8, id = 488, rare = 32417, }, { x = 86.8, y = 41.6, id = 488, rare = 32417, }, 
	{ x = 88.2, y = 36.6, id = 488, rare = 32417, }, { x = 86.0, y = 36.4, id = 488, rare = 32417, }, 
	{ x = 75.6, y = 27.2, id = 488, rare = 32417, }, { x = 72.6, y = 25.8, id = 488, rare = 32417, }, 
	{ x = 71.6, y = 22.4, id = 488, rare = 32417, }, { x = 22.8, y = 73.4, id = 490, rare = 32422, }, 
	{ x = 17.6, y = 70.6, id = 490, rare = 32422, }, { x = 11.2, y = 71.0, id = 490, rare = 32422, }, 
	{ x = 25.8, y = 56.4, id = 490, rare = 32422, }, { x = 20.8, y = 56.2, id = 490, rare = 32422, }, 
	{ x = 12.0, y = 55.6, id = 490, rare = 32422, }, { x = 13.2, y = 46.6, id = 490, rare = 32422, }, 
	{ x = 10.0, y = 38.4, id = 490, rare = 32422, }, { x = 67.0, y = 42.6, id = 490, rare = 32438, }, 
	{ x = 75.2, y = 41.4, id = 490, rare = 32438, }, { x = 66.2, y = 35.6, id = 490, rare = 32438, }, 
	{ x = 71.4, y = 33.4, id = 490, rare = 32438, }, { x = 68.8, y = 26.8, id = 490, rare = 32438, }, 
	{ x = 61.6, y = 36.2, id = 490, rare = 32438, }, { x = 28.0, y = 45.6, id = 490, rare = 32429, }, 
	{ x = 34.0, y = 49.2, id = 490, rare = 32429, }, { x = 40.2, y = 48.8, id = 490, rare = 32429, }, 
	{ x = 31.2, y = 56.8, id = 491, rare = 32398, }, { x = 26.0, y = 64.0, id = 491, rare = 32398, }, 
	{ x = 30.8, y = 71.2, id = 491, rare = 32398, }, { x = 32.0, y = 75.8, id = 491, rare = 32398, }, 
	{ x = 33.2, y = 80.2, id = 491, rare = 32398, }, { x = 71.6, y = 13.6, id = 491, rare = 32377, }, 
	{ x = 68.6, y = 16.8, id = 491, rare = 32377, }, { x = 60.8, y = 20.2, id = 491, rare = 32377, }, 
	{ x = 53.2, y = 11.4, id = 491, rare = 32377, }, { x = 50.6, y = 4.8 , id = 491, rare = 32377, }, 
	{ x = 68.2, y = 46.0, id = 491, rare = 32386, }, { x = 75.6, y = 45.0, id = 491, rare = 32386, }, 
	{ x = 69.6, y = 58.0, id = 491, rare = 32386, }, { x = 74.6, y = 59.6, id = 491, rare = 32386, }, 
	{ x = 72.8, y = 49.0, id = 491, rare = 32386, }, { x = 28.6, y = 45.8, id = 492, rare = 32495, }, 
	{ x = 31.8, y = 42.2, id = 492, rare = 32495, }, { x = 29.6, y = 37.8, id = 492, rare = 32495, }, 
	{ x = 30.6, y = 34.4, id = 492, rare = 32495, }, { x = 30.6, y = 28.2, id = 492, rare = 32495, }, 
	{ x = 34.0, y = 27.6, id = 492, rare = 32495, }, { x = 37.4, y = 23.6, id = 492, rare = 32495, }, 
	{ x = 54.6, y = 52.4, id = 492, rare = 32495, }, { x = 59.0, y = 56.0, id = 492, rare = 32495, }, 
	{ x = 58.2, y = 63.0, id = 492, rare = 32495, }, { x = 46.6, y = 65.0, id = 492, rare = 32487, }, 
	{ x = 44.8, y = 53.8, id = 492, rare = 32487, }, { x = 52.4, y = 38.6, id = 492, rare = 32487, }, 
	{ x = 69.0, y = 67.6, id = 492, rare = 32487, }, { x = 65.4, y = 48.6, id = 492, rare = 32487, }, 
	{ x = 67.6, y = 38.6, id = 492, rare = 32501, }, { x = 74.2, y = 33.0, id = 492, rare = 32501, }, 
	{ x = 49.2, y = 79.0, id = 492, rare = 32501, }, { x = 48.4, y = 86.8, id = 492, rare = 32501, }, 
	{ x = 31.2, y = 62.2, id = 492, rare = 32501, }, { x = 35.6, y = 70.0, id = 492, rare = 32501, }, 
	{ x = 54.4, y = 52.8, id = 493, rare = 32481, }, { x = 46.8, y = 55.0, id = 493, rare = 32481, }, 
	{ x = 43.0, y = 52.2, id = 493, rare = 32481, }, { x = 41.0, y = 58.6, id = 493, rare = 32481, }, 
	{ x = 57.8, y = 65.6, id = 493, rare = 32481, }, { x = 52.6, y = 72.6, id = 493, rare = 32481, }, 
	{ x = 44.8, y = 69.4, id = 493, rare = 32481, }, { x = 41.2, y = 68.4, id = 493, rare = 32481, }, 
	{ x = 42.0, y = 73.8, id = 493, rare = 32481, }, { x = 59.4, y = 22.6, id = 493, rare = 32517, }, 
	{ x = 36.8, y = 30.0, id = 493, rare = 32517, }, { x = 31.0, y = 66.6, id = 493, rare = 32517, }, 
	{ x = 28.6, y = 70.0, id = 493, rare = 32517, }, { x = 21.6, y = 70.6, id = 493, rare = 32517, }, 
	{ x = 51.0, y = 81.6, id = 493, rare = 32517, }, { x = 67.0, y = 79.6, id = 493, rare = 32517, }, 
	{ x = 71.0, y = 71.6, id = 493, rare = 32517, }, { x = 26.8, y = 47.8, id = 493, rare = 32485, }, 
	{ x = 37.8, y = 28.8, id = 493, rare = 32485, }, { x = 52.6, y = 41.8, id = 493, rare = 32485, }, 
	{ x = 47.0, y = 44.0, id = 493, rare = 32485, }, { x = 50.2, y = 80.4, id = 493, rare = 32485, }, 
	{ x = 63.8, y = 82.8, id = 493, rare = 32485, }, { x = 66.2, y = 78.2, id = 493, rare = 32485, }, 
	{ x = 26.6, y = 59.0, id = 495, rare = 32630, }, { x = 29.2, y = 66.6, id = 495, rare = 32630, }, 
	{ x = 36.2, y = 65.2, id = 495, rare = 32630, }, { x = 37.0, y = 73.4, id = 495, rare = 32630, }, 
	{ x = 39.8, y = 58.0, id = 495, rare = 32630, }, { x = 68.2, y = 47.6, id = 495, rare = 32500, }, 
	{ x = 37.8, y = 58.6, id = 495, rare = 32500, }, { x = 41.0, y = 51.6, id = 495, rare = 32500, }, 
	{ x = 41.6, y = 40.6, id = 495, rare = 32500, }, { x = 21.2, y = 79.8, id = 496, rare = 32471, }, 
	{ x = 25.0, y = 77.6, id = 496, rare = 32471, }, { x = 26.6, y = 71.2, id = 496, rare = 32471, }, 
	{ x = 22.0, y = 70.6, id = 496, rare = 32471, }, { x = 17.0, y = 70.4, id = 496, rare = 32471, }, 
	{ x = 23.0, y = 61.0, id = 496, rare = 32471, }, { x = 26.6, y = 55.8, id = 496, rare = 32471, }, 
	{ x = 14.6, y = 56.8, id = 496, rare = 32471, }, { x = 75.0, y = 66.8, id = 496, rare = 32475, }, 
	{ x = 77.4, y = 43.6, id = 496, rare = 32475, }, { x = 81.6, y = 34.6, id = 496, rare = 32475, }, 
	{ x = 71.8, y = 23.8, id = 496, rare = 32475, }, { x = 71.8, y = 29.6, id = 496, rare = 32475, }, 
	{ x = 61.8, y = 36.4, id = 496, rare = 32475, }, { x = 53.6, y = 32.0, id = 496, rare = 32475, }, 
	{ x = 21.6, y = 82.8, id = 496, rare = 32447, }, { x = 29.0, y = 82.2, id = 496, rare = 32447, }, 
	{ x = 28.8, y = 72.2, id = 496, rare = 32447, }, { x = 51.4, y = 84.6, id = 496, rare = 32447, }, 
	{ x = 42.6, y = 70.6, id = 496, rare = 32447, }, { x = 40.6, y = 62.2, id = 496, rare = 32447, }, 
	{ x = 40.4, y = 53.0, id = 496, rare = 32447, }, { x = 45.0, y = 68.6, id = 496, rare = 32447, }, 
	{ x = 47.8, y = 63.4, id = 496, rare = 32447, }, { x = 44.8, y = 55.6, id = 496, rare = 32447, }, 
}

-- Staring Pandaria, it's common for rares to also drops pets/toys.
addon.pinList["Glorious!"] = {
    { x = 33.6, y = 50.8, id = 806, rare = 50750, },
    { x = 56.4, y = 48.0, id = 806, rare = 51078, },
    { x = 53.6, y = 49.6, id = 806, rare = 51078, },
    { x = 53.8, y = 45.6, id = 806, rare = 51078, },
    { x = 52.2, y = 44.4, id = 806, rare = 51078, },
    { x = 54.2, y = 42.4, id = 806, rare = 51078, },
    { x = 44.0, y = 75.0, id = 806, rare = 50338, },
    { x = 39.6, y = 62.6, id = 806, rare = 50363, },
    { x = 42.6, y = 38.8, id = 806, rare = 50823, },
    { x = 48.2, y = 20.6, id = 806, rare = 50350, },
    { x = 48.0, y = 18.6, id = 806, rare = 50350, },
    { x = 46.6, y = 16.8, id = 806, rare = 50350, },
    { x = 42.6, y = 16.2, id = 806, rare = 50350, },
    { x = 42.2, y = 17.6, id = 806, rare = 50350, },
    { x = 40.8, y = 15.2, id = 806, rare = 50350, },
    { x = 64.6, y = 74.2, id = 806, rare = 50782, },
    { x = 57.4, y = 71.4, id = 806, rare = 50808, },
    { x = 39.6, y = 57.6, id = 807, rare = 51059, toy = 86565, }, -- Battle Horn
    { x = 37.8, y = 60.6, id = 807, rare = 51059, toy = 86565, }, -- Battle Horn
    { x = 34.6, y = 59.6, id = 807, rare = 51059, toy = 86565, }, -- Battle Horn
    { x = 32.8, y = 62.8, id = 807, rare = 51059, toy = 86565, }, -- Battle Horn
    { x = 15.6, y = 32.2, id = 807, rare = 50828, },
    { x = 16.8, y = 35.2, id = 807, rare = 50828, },
    { x = 19.0, y = 35.8, id = 807, rare = 50828, },
    { x = 14.0, y = 38.2, id = 807, rare = 50828, },
    { x = 16.6, y = 41.0, id = 807, rare = 50828, },
    { x = 18.6, y = 77.6, id = 807, rare = 50351, },
    { x = 10.2, y = 49.4, id = 807, rare = 50364, },
    { x = 88.6, y = 18.0, id = 807, rare = 50811, },
    { x = 67.6, y = 59.6, id = 807, rare = 50783, toy = 86583, }, -- Salyin Battle Banner
    { x = 71.0, y = 52.4, id = 807, rare = 50783, toy = 86583, }, -- Salyin Battle Banner
    { x = 74.6, y = 51.8, id = 807, rare = 50783, toy = 86583, }, -- Salyin Battle Banner
    { x = 75.8, y = 46.4, id = 807, rare = 50783, toy = 86583, }, -- Salyin Battle Banner
    { x = 52.8, y = 28.6, id = 807, rare = 50766, },
    { x = 54.0, y = 31.6, id = 807, rare = 50766, },
    { x = 54.6, y = 36.6, id = 807, rare = 50766, },
    { x = 57.6, y = 33.8, id = 807, rare = 50766, },
    { x = 59.0, y = 38.6, id = 807, rare = 50766, },
    { x = 37.0, y = 25.6, id = 807, rare = 50339, },
    { x = 56.2, y = 46.8, id = 857, rare = 50787, }, 
    { x = 30.6, y = 38.2, id = 857, rare = 50768, },
    { x = 53.6, y = 38.8, id = 857, rare = 50340, },
    { x = 56.2, y = 38.2, id = 857, rare = 50340, },
    { x = 56.2, y = 35.2, id = 857, rare = 50340, },
    { x = 54.0, y = 32.2, id = 857, rare = 50340, },
    { x = 39.6, y = 29.0, id = 857, rare = 50331, },
    { x = 67.2, y = 23.0, id = 857, rare = 50352, },
    { x = 39.4, y = 55.2, id = 857, rare = 50816, },
    { x = 41.6, y = 55.2, id = 857, rare = 50816, },
    { x = 52.2, y = 88.8, id = 857, rare = 50830, },
    { x = 15.2, y = 35.6, id = 857, rare = 50388, },
    { x = 40.8, y = 42.4, id = 809, rare = 50817, toy = 86588, }, -- Pandaren Firework Launcher
    { x = 56.0, y = 43.4, id = 809, rare = 50341, },
    { x = 57.6, y = 75.0, id = 809, rare = 50354, toy = 86573, }, -- Shard of Archstone
    { x = 51.6, y = 81.0, id = 809, rare = 50332, },
    { x = 47.4, y = 81.2, id = 809, rare = 50332, },
    { x = 63.8, y = 13.8, id = 809, rare = 50789, toy = 86584, }, -- Hardened Shell
    { x = 47.2, y = 63.0, id = 809, rare = 50831, },
    { x = 46.2, y = 61.8, id = 809, rare = 50831, },
    { x = 44.8, y = 63.6, id = 809, rare = 50831, },
    { x = 44.8, y = 65.2, id = 809, rare = 50831, },
    { x = 36.6, y = 79.6, id = 809, rare = 50733, },
    { x = 73.8, y = 77.4, id = 809, rare = 50769, toy = 86581, }, -- Farwater Conch
    { x = 68.8, y = 89.2, id = 810, rare = 50772, },
    { x = 67.8, y = 87.6, id = 810, rare = 50772, },
    { x = 66.4, y = 86.8, id = 810, rare = 50772, },
    { x = 65.4, y = 87.6, id = 810, rare = 50772, },
    { x = 63.0, y = 35.6, id = 810, rare = 50355, }, 
    { x = 46.4, y = 74.4, id = 810, rare = 50734, }, 
    { x = 42.0, y = 78.4, id = 810, rare = 50734, }, 
    { x = 47.6, y = 84.2, id = 810, rare = 50734, }, 
    { x = 47.8, y = 88.6, id = 810, rare = 50734, }, 
    { x = 66.8, y = 44.4, id = 810, rare = 50333, }, 
    { x = 67.8, y = 50.8, id = 810, rare = 50333, }, 
    { x = 64.2, y = 49.8, id = 810, rare = 50333, }, 
    { x = 54.0, y = 63.4, id = 810, rare = 50344, },
    { x = 59.2, y = 85.6, id = 810, rare = 50791, }, 
    { x = 67.6, y = 74.4, id = 810, rare = 50832, },
    { x = 32.0, y = 61.8, id = 810, rare = 50820, },
    { x = 34.8, y = 23.2, id = 858, rare = 50821, toy = 86589, }, -- Ai-Li's Skymirror
    { x = 25.2, y = 28.6, id = 858, rare = 50334, }, 
    { x = 39.2, y = 41.8, id = 858, rare = 50739, toy = 86578, }, -- Eternal Warrior's Sigil
    { x = 37.8, y = 29.6, id = 858, rare = 50739, toy = 86578, }, -- Eternal Warrior's Sigil
    { x = 35.6, y = 30.8, id = 858, rare = 50739, toy = 86578, }, -- Eternal Warrior's Sigil
    { x = 55.4, y = 63.4, id = 858, rare = 50836, toy = 86593, }, -- Hozen Beach Ball
    { x = 71.8, y = 37.6, id = 858, rare = 50347, pet = 86564, }, -- Imbued Jade Fragment
    { x = 73.0, y = 22.2, id = 858, rare = 50356, },
    { x = 64.2, y = 58.6, id = 858, rare = 50776, toy = 86563, }, -- Hollow Reed
    { x = 36.6, y = 64.6, id = 858, rare = 50805, },
    { x = 39.6, y = 61.8, id = 858, rare = 50805, },
    { x = 39.6, y = 58.4, id = 858, rare = 50805, },
    { x = 36.8, y = 60.6, id = 858, rare = 50805, },
    { x = 42.6, y = 69.0, id = 811, rare = 50822, toy = 86590, }, -- Essence of the Breeze
    { x = 14.2, y = 58.6, id = 811, rare = 50749, },
    { x = 15.0, y = 35.6, id = 811, rare = 50347, toy = 86571, }, -- Kang's Bindstone
    { x = 31.0, y = 91.6, id = 811, rare = 50840, toy = 86594}, -- Helpful Wikky's Whistle
    { x = 45.8, y = 56.0, id = 811, rare = 50806, toy = 86586, }, -- Panflute of Pandaria
    { x = 38.4, y = 54.0, id = 811, rare = 50806, toy = 86586, }, -- Panflute of Pandaria
    { x = 35.6, y = 62.6, id = 811, rare = 50806, toy = 86586, }, -- Panflute of Pandaria
    { x = 69.6, y = 30.8, id = 811, rare = 50780, toy = 86582, }, -- Aqua Jewel
    { x = 39.8, y = 25.0, id = 811, rare = 50359, toy = 86575, }, -- Chalice of Secrets
    { x = 87.8, y = 44.6, id = 811, rare = 50336, toy = 86568,}, -- Mr. Smite's Brass Compass
}

addon.pinList["Timeless Champions"] = {
    { x = 50.2, y = 22.9, id = 951, rare = 73174,                name = "Archiereus of Flame", },
    { x = 57.8, y = 25.8, id = 951, rare = 73174,                name = "Archiereus of Flame", },
    { x = 56.6, y = 35.4, id = 951, rare = 73174,                name = "Archiereus of Flame", },
    { x = 48.8, y = 33.2, id = 951, rare = 73174,                name = "Archiereus of Flame", },
    { x = 34.8, y = 31.2, id = 951, rare = 73666,                name = "Archiereus of Flame",   note = "Summoned with Scroll of Challenge", },
    { x = 62.2, y = 76.6, id = 951, rare = 72775, pet = 104169,  note = "Can spawn in the place of any Crooking Hollow.", },
    { x = 63.4, y = 73.0, id = 951, rare = 72775, pet = 104169,  note = "Can spawn in the place of any Crooking Hollow.", },
    { x = 64.4, y = 74.6, id = 951, rare = 72775, pet = 104169,  note = "Can spawn in the place of any Crooking Hollow.", },
    { x = 62.4, y = 44.2, id = 951, rare = 73171, toy = 104302,  toyName = "Blackflame Daggers", note = "Patrols Around", },
    { x = 70.8, y = 51.0, id = 951, rare = 73171, toy = 104302,  toyName = "Blackflame Daggers", note = "Patrols Around", },
    { x = 60.6, y = 48.4, id = 951, rare = 73171, toy = 104302,  toyName = "Blackflame Daggers", note = "Patrols Around", },
    { x = 25.2, y = 36.0, id = 951, rare = 72045, },
    { x = 54.4, y = 53.2, id = 951, rare = 73175, },
    { x = 43.8, y = 69.6, id = 951, rare = 73854, },
    { x = 25.8, y = 23.2, id = 951, rare = 73281, toy = 104294,  note = "Summoned using the Mist-Filled Spirit Lantern from Evermaw.", },
    { x = 44.4, y = 54.8, id = 951, rare = 73158,                note = "Can spawn in the place of any Brilliant Windfeather.", },
    { x = 29.4, y = 50.0, id = 951, rare = 73158,                note = "Can spawn in the place of any Brilliant Windfeather.", },
    { x = 30.2, y = 43.4, id = 951, rare = 73158,                note = "Can spawn in the place of any Brilliant Windfeather.", },
    { x = 72.8, y = 84.8, id = 951, rare = 73279,                note = "Patrols Around", },
    { x = 14.2, y = 29.6, id = 951, rare = 73279,                note = "Patrols Around", },
    { x = 14.6, y = 55.6, id = 951, rare = 73279,                note = "Patrols Around", },
    { x = 16.0, y = 63.0, id = 951, rare = 73279,                note = "Patrols Around", },
    { x = 44.2, y = 33.8, id = 951, rare = 73172, toy = 104329, },
    { x = 40.4, y = 26.4, id = 951, rare = 73172, toy = 104329, },
    { x = 46.4, y = 39.6, id = 951, rare = 73172, toy = 104329, },
    { x = 64.6, y = 28.6, id = 951, rare = 73282, pet = 104159, },
    { x = 62.2, y = 62.6, id = 951, rare = 72970, toy = 104262, },
    { x = 60.4, y = 62.2, id = 951, rare = 72970, toy = 104262, },
    { x = 60.6, y = 63.8, id = 951, rare = 72970, toy = 104262, },
    { x = 23.6, y = 47.6, id = 951, rare = 73161, },
    { x = 23.8, y = 54.0, id = 951, rare = 73161, },
    { x = 22.0, y = 42.4, id = 951, rare = 73161, },
    { x = 30.6, y = 72.8, id = 951, rare = 72909, pet = 104291,   note = "Patrols Around", },
    { x = 30.4, y = 71.0, id = 951, rare = 72909, pet = 104291,   note = "Patrols Around", },
    { x = 31.6, y = 75.0, id = 951, rare = 72909, pet = 104291,   note = "Patrols Around", },
    { x = 68.2, y = 59.0, id = 951, rare = 73167, mount = 104269, note = "Patrols Around", },
    { x = 30.2, y = 36.6, id = 951, rare = 73163, pet = 104161,   note = "Can spawn in the place of any Death Adder", },
    { x = 25.8, y = 46.6, id = 951, rare = 73163, pet = 104161,   note = "Can spawn in the place of any Death Adder", },
    { x = 27.4, y = 61.4, id = 951, rare = 73163, pet = 104161,   note = "Can spawn in the place of any Death Adder", },
    { x = 29.6, y = 45.8, id = 951, rare = 73160, },
    { x = 30.2, y = 71.4, id = 951, rare = 73160, },
    { x = 32.0, y = 59.0, id = 951, rare = 73160, },
    { x = 53.6, y = 83.0, id = 951, rare = 73169, toy = 104331, },
    { x = 33.8, y = 85.8, id = 951, rare = 72193, },
    { x = 67.6, y = 44.0, id = 951, rare = 73277, pet = 104156, },
    { x = 21.4, y = 32.6, id = 951, rare = 73166, pet = 104168,   note = "Can spawn in the place of any crab around the island."},
    { x = 21.4, y = 64.0, id = 951, rare = 73166, pet = 104168,   note = "Can spawn in the place of any crab around the island."},
    { x = 27.8, y = 74.4, id = 951, rare = 73166, pet = 104168,   note = "Can spawn in the place of any crab around the island."},
    { x = 60.6, y = 87.8, id = 951, rare = 72048, },
    { x = 44.2, y = 31.0, id = 951, rare = 73157,                 note = "Inside Cave", },
    { x = 59.0, y = 48.8, id = 951, rare = 71864, },
    { x = 45.4, y = 31.2, id = 951, rare = 72769, pet = 104307,   note = "Inside Cave", },
    { x = 44.0, y = 37.2, id = 951, rare = 72769, pet = 104307,   note = "Inside Cave", },
    { x = 44.8, y = 38.8, id = 951, rare = 72769, pet = 104307,   note = "Inside Cave", },
    { x = 71.4, y = 81.4, id = 951, rare = 73704, },
    { x = 54.2, y = 42.8, id = 951, rare = 72808, },
    { x = 44.2, y = 26.6, id = 951, rare = 73173,                 note = "Patrols Around", },
    { x = 57.6, y = 77.2, id = 951, rare = 73170, },
    { x = 47.6, y = 87.8, id = 951, rare = 72245, },
    { x = 37.8, y = 77.2, id = 951, rare = 71919, pet = 104167,   note = "Killing 10 Alementals will cause Zhu-Gon to spawn.", },
}

addon.pinList["Jungle Stalker"] = {
    { x = 16.8, y = 49.4, id = 945, rare = 91374, }, -- Podlord Wakkawam
    { x = 39.2, y = 68.8, id = 945, rare = 91093, toy = 127652, }, -- Bramblefell
    { x = 41  , y = 67.6, id = 945, rare = 91093, toy = 127652, }, -- Bramblefell
    { x = 48.2, y = 28.4, id = 945, rare = 91087, }, -- Zeter'el
    { x = 52.8, y = 25.6, id = 945, rare = 91098, }, -- Felspark
    { x = 52.2, y = 27.4, id = 945, rare = 91098, }, -- Felspark
    { x = 31.4, y = 71.8, id = 945, rare = 90429, toy = 127655, }, -- Imp-Master Valessa
    { x = 25.6, y = 76.6, id = 945, rare = 90438, }, -- Lady Oran
    { x = 26.6, y = 75  , id = 945, rare = 90437, }, -- Jax'zor
    { x = 31.4, y = 68  , id = 945, rare = 90434, pet = 91823, }, -- Ceraxas
    { x = 26  , y = 79.4, id = 945, rare = 90442, }, -- Mistress Thavra
    { x = 44.6, y = 37.8, id = 945, rare = 90519, }, -- Cindral the Wildfire
    { x = 41.6, y = 37.8, id = 945, rare = 90024, }, -- Sergeant Mor'grak
    { x = 42.8, y = 36.4, id = 945, rare = 90024, }, -- Sergeant Mor'grak
    { x = 27.6, y = 32.6, id = 945, rare = 92451, }, -- Varyx the Damned
    { x = 17.2, y = 43.4, id = 945, rare = 90782, }, -- Rasthe
    { x = 53.6, y = 21.4, id = 945, rare = 92274, }, -- Painmistress Selora
    { x = 47  , y = 42.8, id = 945, rare = 91695, }, -- Grand Warlock Nethekurse
    { x = 46.2, y = 40.8, id = 945, rare = 91695, }, -- Grand Warlock Nethekurse
    { x = 46.8, y = 39.4, id = 945, rare = 91695, }, -- Grand Warlock Nethekurse
    { x = 65.4, y = 36.6, id = 945, rare = 92887, }, -- Steelsnout
    { x = 52.2, y = 65.2, id = 945, rare = 93002, }, -- Magwia
    { x = 15  , y = 54.2, id = 945, rare = 91232, }, -- Commander Krag'goth
    { x = 13.4, y = 56.8, id = 945, rare = 91243, }, -- Tho'gar Gorefist
    { x = 16  , y = 59.2, id = 945, rare = 93057, }, -- Grannok
    { x = 16  , y = 57  , id = 945, rare = 93001, }, -- Szirek the Twisted
    { x = 13  , y = 57  , id = 945, rare = 92977, }, -- The Iron Houndmaster
    { x = 23.6, y = 52  , id = 945, rare = 90884, }, -- Bilkor the Thrower
    { x = 20.4, y = 49.8, id = 945, rare = 90885, }, -- Rogond the Tracker
    { x = 22.8, y = 48.8, id = 945, rare = 90887, }, -- Dorg the Bloody
    { x = 24.8, y = 46.4, id = 945, rare = 90887, }, -- Dorg the Bloody
    { x = 25.4, y = 46.2, id = 945, rare = 90888, }, -- Drivnul
    { x = 23.4, y = 49.6, id = 945, rare = 90936, }, -- Bloodhunter Zulk
    { x = 21  , y = 52.4, id = 945, rare = 90936, }, -- Bloodhunter Zulk
    { x = 22.2, y = 54  , id = 945, rare = 90936, }, -- Bloodhunter Zulk
    { x = 26.2, y = 54.4, id = 945, rare = 92197, }, -- Relgor
    { x = 57.6, y = 67.2, id = 945, rare = 92429, }, -- Broodlord Ixkor
    { x = 62.6, y = 72.2, id = 945, rare = 92495, }, -- Soulslicer
    { x = 63.4, y = 81  , id = 945, rare = 92508, }, -- Gloomtalon
    { x = 52  , y = 83.6, id = 945, rare = 92517, }, -- Krell the Serene
    { x = 49.2, y = 73.6, id = 945, rare = 92465, }, -- The Blackfang
    { x = 34  , y = 44.4, id = 945, rare = 92574, }, -- Thromma the Gutslicer
    { x = 35.4, y = 46.8, id = 945, rare = 92552, }, -- Belgork
    { x = 41  , y = 78.6, id = 945, rare = 92606, }, -- Sylissa
    { x = 42.6, y = 76.4, id = 945, rare = 92627, }, -- Rendrak
    { x = 39.2, y = 70.8, id = 945, rare = 92627, }, -- Rendrak
    { x = 40.2, y = 74  , id = 945, rare = 92627, }, -- Rendrak
    { x = 43  , y = 74.4, id = 945, rare = 92636, }, -- The Night Haunter
    { x = 37.8, y = 72.6, id = 945, rare = 92636, }, -- The Night Haunter
    { x = 38.2, y = 76  , id = 945, rare = 92636, }, -- The Night Haunter
    { x = 34.4, y = 72.6, id = 945, rare = 92694, }, -- The Goreclaw
    { x = 33  , y = 35.8, id = 945, rare = 92941, }, -- Gorabosh
    { x = 20  , y = 53.6, id = 945, rare = 93028, }, -- Driss Vile
    { x = 36.2, y = 79  , id = 945, rare = 93076, toy = 127659, }, -- (The Real) Captain Ironbeard
    { x = 36  , y = 80.6, id = 945, rare = 93076, toy = 127659, }, -- (The Real) Captain Ironbeard
    { x = 34.6, y = 78  , id = 945, rare = 93125, }, -- Glub'glok
    { x = 28.8, y = 51  , id = 945, rare = 93168, }, -- Felbore
    { x = 54.2, y = 80.8, id = 945, rare = 92766, }, -- Akrrilo
    { x = 54.2, y = 80.8, id = 945, rare = 92817, }, -- Rendarr
    { x = 54.2, y = 80.8, id = 945, rare = 92819, }, -- Eyepiercer
    { x = 50.8, y = 74.4, id = 945, rare = 92657, }, -- Bleeding Hollow Horror
    { x = 39.6, y = 68.2, id = 945, rare = 93279, }, -- Kris'kar the Unredeemed
    { x = 49.8, y = 36.2, id = 945, rare = 91727, }, -- Executor Riloth
    { x = 52.6, y = 40.2, id = 945, rare = 91871, }, -- Argosh the Destroyer
    { x = 37  , y = 33  , id = 945, rare = 90122, }, -- Zoug the Heavy
    { x = 39.6, y = 32.6, id = 945, rare = 90094, }, -- Harbormaster Korak
    { x = 49.6, y = 61  , id = 945, rare = 93236, }, -- Shadowthrash
    { x = 45.8, y = 47  , id = 945, rare = 92647, }, -- Felsmith Damorka
    { x = 57  , y = 23  , id = 945, rare = 91009, }, -- Putre'thar
    { x = 60.2, y = 21  , id = 945, rare = 92408, }, -- Xanzith the Everlasting
    { x = 52.4, y = 19.2, id = 945, rare = 92411, }, -- Overlord Ma'gruth
    { x = 48.6, y = 57.2, id = 945, rare = 93264, }, -- Captain Grok'mar
    { x = 50.2, y = 43.4, id = 945, rare = 89675, }, -- Commander Org'mok
    { x = 47.4, y = 44.8, id = 945, rare = 89675, }, -- Commander Org'mok
    { x = 47.6, y = 46.6, id = 945, rare = 89675, }, -- Commander Org'mok

}