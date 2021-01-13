--      ___           ___           ___           ___                                   ___           ___                 
--     /  /\         /  /\         /  /\         /__/\        ___           ___        /  /\         /  /\          ___   
--    /  /::\       /  /::\       /  /:/         \  \:\      /  /\         /  /\      /  /:/_       /  /:/         /  /\  
--   /  /:/\:\     /  /:/\:\     /  /:/           \__\:\    /  /:/        /  /:/     /  /:/ /\     /  /:/         /  /:/  
--  /  /:/~/::\   /  /:/~/:/    /  /:/  ___   ___ /  /::\  /__/::\       /  /:/     /  /:/ /:/_   /  /:/  ___    /  /:/   
-- /__/:/ /:/\:\ /__/:/ /:/___ /__/:/  /  /\ /__/\  /:/\:\ \__\/\:\__   /  /::\    /__/:/ /:/ /\ /__/:/  /  /\  /  /::\   
-- \  \:\/:/__\/ \  \:\/:::::/ \  \:\ /  /:/ \  \:\/:/__\/    \  \:\/\ /__/:/\:\   \  \:\/:/ /:/ \  \:\ /  /:/ /__/:/\:\  
--  \  \::/       \  \::/~~~~   \  \:\  /:/   \  \::/          \__\::/ \__\/  \:\   \  \::/ /:/   \  \:\  /:/  \__\/  \:\ 
--   \  \:\        \  \:\        \  \:\/:/     \  \:\          /__/:/       \  \:\   \  \:\/:/     \  \:\/:/        \  \:\
--    \  \:\        \  \:\        \  \::/       \  \:\         \__\/         \__\/    \  \::/       \  \::/          \__\/
--     \__\/         \__\/         \__\/         \__\/                                 \__\/         \__\/                 
-------------------------------------------------------------------------------------------------------------------------------
-- This mod was created by Architect from CP2077 Modding Tools Discord. 
-- https://github.com/specik/CP2077-CityHack-Mod
--
-- You are free to use this mod as long as you follow the following license guidelines:
--    * It may not be uploaded to any other site without my express permission.
--    * Using any code contained herein in another mod requires full credits.
--    * You may not fork this code and make your own competing version of this mod available for download.
-------------------------------------------------------------------------------------------------------------------------------


CityHack = { 
    description = "",
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack."
}

-- Hack: Forces required lua files to reload when using hot reload
for k, _ in pairs(package.loaded) do
    if string.match(k, CityHack.rootPath .. ".*") then
        package.loaded[k] = nil
    end
end

function CityHack:new()

    setmetatable(CityHack, self)
    self.__index = self 

    CityHack.Door = require(CityHack.rootPath.."hacks.modules.door")
    CityHack.Elevator = require(CityHack.rootPath.."hacks.modules.elevator")
    CityHack.Device = require(CityHack.rootPath.."hacks.modules.device")
    CityHack.Vehicle = require(CityHack.rootPath.."hacks.modules.vehicle")
    CityHack.Npc = require(CityHack.rootPath.."hacks.modules.npc")
    CityHack.Util = require(CityHack.rootPath.."hacks.modules.utility")


    CityHack.CoreUI = require(CityHack.rootPath.."ui.core")


    --------------------------------------- START ImGui ---------------------------------------

    registerVKBind("CityHack_Menu", "Toggle Window", { 0x71 }, function()
        drawWindow = not drawWindow
    end)
    
    registerForEvent("onInit", function()
        CityHack.Util.Log("Loaded! Press F2 to toggle the UI.")
    end)
      
    registerForEvent("onUpdate", function(deltaTime)

    end)

    registerForEvent("onToolbarOpen", function()
        drawWindow = true
      end)
      
    registerForEvent("onToolbarClose", function()
        drawWindow = false
    end)

    registerForEvent("onDraw", function()
        ImGui.SetNextWindowPos(500, 500, ImGuiCond.FirstUseEver)
        ImGui.SetNextWindowSize(265, 250, ImGuiCond.Appearing)

        if drawWindow then

            CityHack.CoreUI.Create(CityHack)

        end
    end)    
      

	return CityHack
end

return CityHack:new()