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
-- Pets Pin List --
--------------------

addon.pinList["Pandarian Treasures"] = {
    { x = 26.2 , y = 32.4 , id = 806, flag = 31400, name = "Ancient Pandaren Tea Pot"        , note = "On table"                     , }, 
    { x = 24.0 , y = 53.0 , id = 806, flag = 31864, name = "Chest of Supplies"               , note = "Bottom of waterfall"          , }, 
    { x = 31.9 , y = 27.8 , id = 806, flag = 31401, name = "Lucky Pandaren Coin"             , note = "in fountain"                  , }, 
    { x = 46.0 , y = 81.0 , id = 806, flag = 31865, name = "Offering of Rememberance"        , note = "On shrine"                    , }, 
    { x = 23.5 , y = 35.0 , id = 806, flag = 31404, name = "Pandaren Ritual Stone"           , note = "In between 5 stones on island", }, 
    { x = 51.0 , y = 100.0, id = 806, flag = 31396, name = "Ship's Locker"                   , note = "Swim south"                   , }, 
    { x = 62.4 , y = 27.5 , id = 806, flag = 31866, name = "Stash of Gems"                   , }, 
    { x = 92.1 , y = 39.1 , id = 807, flag = 31869, name = "Boat-Building Instructions"      , }, 
    { x = 23.71, y = 28.33, id = 807, flag = 31405, name = "Virmen Treasure Cache"           , }, 
    { x = 43.5 , y = 37.4 , id = 807, flag = 31406, name = "Cache of Pilfered Goods"         , }, 
    { x = 75.1 , y = 55.1 , id = 807, flag = 31408, name = "Saurok Stone Tablet"             , }, 
    { x = 71.0 , y = 9.0  , id = 857, flag = 31408, name = "Saurok Stone Tablet entrance"    , }, 
    { x = 52.0 , y = 73.0 , id = 857, flag = 31863, name = "Stack of Papers"                 , }, 
    { x = 54.5 , y = 71.9 , id = 873, flag = 31867, name = "Forgotten Lockbox"               , }, 
    { x = 74.93, y = 76.48, id = 873, flag = 31428, name = "The Hammer of Folly"             , }, 
    { x = 64.2 , y = 45.1 , id = 809, flag = 31420, name = "Ancient Mogu Tablet"             , note = "In room with Lost Souls"      , }, 
    { x = 63.9 , y = 49.8 , id = 809, flag = 31420, name = "Ancient Mogu Tablet entrance"    , }, 
    { x = 49.0 , y = 59.0 , id = 809, flag = 31414, name = "Hozen Treasure Cache"            , note = "Next to 6 containers"         , }, 
    { x = 36.7 , y = 79.7 , id = 809, flag = 31418, name = "Lost Adventurer's Belongings"    , note = "Inside tent"                  , }, 
    { x = 47.9 , y = 73.3 , id = 809, flag = 31868, name = "Mo-Mo's Treasure Chest"          , note = "Small chest behind Mo-Mo"     , }, 
    { x = 52.6 , y = 51.5 , id = 809, flag = 31419, name = "Rikkitik's Tick Remover"         , }, 
    { x = 72.0 , y = 33.9 , id = 809, flag = 31416, name = "Statue of Xuen"                  , note = "At bottom of lake"            , }, 
    { x = 56.7 , y = 48.9 , id = 809, flag = 31415, name = "Stolen Sprite Treasure"          , note = "Back of cave"                 , }, 
    { x = 59.0 , y = 50.0 , id = 809, flag = 31415, name = "Stolen Sprite Treasure entrance" , }, 
    { x = 57.8 , y = 76.3 , id = 809, flag = 31422, name = "Terracotta Head"                 , note = "Statue head on the ground"    , }, 
    { x = 62.82, y = 34.05, id = 810, flag = 31427, name = "Abandoned Crate of Goods"        , note = "Inside tent with 2 containers", }, 
    { x = 65.83, y = 86.08, id = 810, flag = 31426, name = "Amber Encased Moth"              , note = "To the right of the tree root", }, 
    { x = 34.8 , y = 63.1 , id = 810, flag = 31423, name = "Fragment of Dread"               , }, 
    { x = 32.8 , y = 61.6 , id = 810, flag = 31423, name = "Fragment of Dread entrance"      , }, 
    { x = 52   , y = 60   , id = 810, flag = 31424, name = "Hardened Sap of Kri'vess"        , note = "Small yellow blub"            , }, 
    { x = 53   , y = 61   , id = 810, flag = 31424, name = "Hardened Sap of Kri'vess"        , note = "Small yellow blub"            , }, 
    { x = 56   , y = 55   , id = 810, flag = 31424, name = "Hardened Sap of Kri'vess"        , note = "Small yellow blub"            , }, 
    { x = 57   , y = 54   , id = 810, flag = 31424, name = "Hardened Sap of Kri'vess"        , note = "Small yellow blub"            , }, 
    { x = 53   , y = 58   , id = 810, flag = 31424, name = "Hardened Sap of Kri'vess"        , note = "Small yellow blub"            , }, 
    { x = 56   , y = 55   , id = 810, flag = 31424, name = "Hardened Sap of Kri'vess"        , note = "Small yellow blub"            , }, 
    { x = 52   , y = 60   , id = 810, flag = 31424, name = "Hardened Sap of Kri'vess"        , note = "Small yellow blub"            , }, 
    { x = 54   , y = 61   , id = 810, flag = 31424, name = "Hardened Sap of Kri'vess"        , note = "Small yellow blub"            , }, 
}

addon.pinList["Timeless Treasures"] = {
    { x = 36.7, y = 34.1, id = 951, flag = 33170, name = "Moss-Covered Chest" , }, 
    { x = 25.5, y = 27.2, id = 951, flag = 33171, name = "Moss-Covered Chest" , }, 
    { x = 27.4, y = 39.1, id = 951, flag = 33172, name = "Moss-Covered Chest" , }, 
    { x = 30.7, y = 36.5, id = 951, flag = 33173, name = "Moss-Covered Chest" , }, 
    { x = 22.4, y = 35.4, id = 951, flag = 33174, name = "Moss-Covered Chest" , }, 
    { x = 22.1, y = 49.3, id = 951, flag = 33175, name = "Moss-Covered Chest" , }, 
    { x = 24.8, y = 53.0, id = 951, flag = 33176, name = "Moss-Covered Chest" , }, 
    { x = 25.7, y = 45.8, id = 951, flag = 33177, name = "Moss-Covered Chest" , }, 
    { x = 22.3, y = 68.1, id = 951, flag = 33178, name = "Moss-Covered Chest" , }, 
    { x = 26.8, y = 68.7, id = 951, flag = 33179, name = "Moss-Covered Chest" , }, 
    { x = 31.0, y = 76.3, id = 951, flag = 33180, name = "Moss-Covered Chest" , }, 
    { x = 35.3, y = 76.4, id = 951, flag = 33181, name = "Moss-Covered Chest" , }, 
    { x = 38.7, y = 71.6, id = 951, flag = 33182, name = "Moss-Covered Chest" , }, 
    { x = 39.8, y = 79.5, id = 951, flag = 33183, name = "Moss-Covered Chest" , }, 
    { x = 34.8, y = 84.2, id = 951, flag = 33184, name = "Moss-Covered Chest" , }, 
    { x = 43.6, y = 84.1, id = 951, flag = 33185, name = "Moss-Covered Chest" , }, 
    { x = 47.0, y = 53.7, id = 951, flag = 33186, name = "Moss-Covered Chest" , }, 
    { x = 46.7, y = 46.7, id = 951, flag = 33187, name = "Moss-Covered Chest" , }, 
    { x = 51.2, y = 45.7, id = 951, flag = 33188, name = "Moss-Covered Chest" , }, 
    { x = 55.5, y = 44.3, id = 951, flag = 33189, name = "Moss-Covered Chest" , }, 
    { x = 58.0, y = 50.7, id = 951, flag = 33190, name = "Moss-Covered Chest" , }, 
    { x = 65.7, y = 47.8, id = 951, flag = 33191, name = "Moss-Covered Chest" , }, 
    { x = 63.8, y = 59.2, id = 951, flag = 33192, name = "Moss-Covered Chest" , }, 
    { x = 64.9, y = 75.6, id = 951, flag = 33193, name = "Moss-Covered Chest" , }, 
    { x = 60.2, y = 66.0, id = 951, flag = 33194, name = "Moss-Covered Chest" , }, 
    { x = 49.7, y = 65.7, id = 951, flag = 33195, name = "Moss-Covered Chest" , }, 
    { x = 53.1, y = 70.8, id = 951, flag = 33196, name = "Moss-Covered Chest" , }, 
    { x = 52.7, y = 62.7, id = 951, flag = 33197, name = "Moss-Covered Chest" , }, 
    { x = 61.7, y = 88.5, id = 951, flag = 33227, name = "Moss-Covered Chest" , }, 
    { x = 44.2, y = 65.3, id = 951, flag = 33198, name = "Moss-Covered Chest" , }, 
    { x = 26.0, y = 61.4, id = 951, flag = 33199, name = "Moss-Covered Chest" , }, 
    { x = 24.6, y = 38.5, id = 951, flag = 33200, name = "Moss-Covered Chest" , }, 
    { x = 29.7, y = 31.8, id = 951, flag = 33202, name = "Moss-Covered Chest" , }, 
    { x = 59.9, y = 31.3, id = 951, flag = 33201, name = "Moss-Covered Chest" , }, 
    { x = 28.2, y = 35.2, id = 951, flag = 33204, name = "Sturdy Chest"       , }, 
    { x = 26.8, y = 64.9, id = 951, flag = 33205, name = "Sturdy Chest"       , }, 
    { x = 64.6, y = 70.4, id = 951, flag = 33206, name = "Sturdy Chest"       , }, 
    { x = 59.2, y = 49.5, id = 951, flag = 33207, name = "Sturdy Chest"       , }, 
    { x = 69.5, y = 32.9, id = 951, flag = 33208, name = "Smoldering Chest"   , }, 
    { x = 54.0, y = 78.2, id = 951, flag = 33209, name = "Smoldering Chest"   , }, 
    { x = 47.6, y = 27.6, id = 951, flag = 33210, name = "Blazing Chest"      , }, 
    { x = 46.7, y = 32.3, id = 951, flag = 33203, name = "Skull-Covered Chest", }, 
}