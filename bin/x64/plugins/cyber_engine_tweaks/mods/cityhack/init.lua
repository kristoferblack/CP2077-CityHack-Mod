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
--
-- Full license available at https://github.com/specik/CP2077-CityHack-Mod/blob/main/LICENSE.md
-------------------------------------------------------------------------------------------------------------------------------


CityHack = { 
    description = "CityHack",
    drawWindow = false
}

-- Hack: Forces required lua files to reload when using hot reload
-- for k, _ in pairs(package.loaded) do
--     if string.match(k, CityHack.rootPath .. ".*") then
--         package.loaded[k] = nil
--     end
-- end

function CityHack:new()

    -- setmetatable(CityHack, self)
    -- self.__index = self 

    -- START ImGui ---------------------------------------------------------------------------

    CityHack.Door = require("hacks/modules/door")
    CityHack.Elevator = require("hacks/modules/elevator")
    CityHack.Device = require("hacks/modules/device")
    CityHack.Vehicle = require("hacks/modules/vehicle")
    CityHack.NPC = require("hacks/modules/npc")
    CityHack.Other = require("hacks/modules/other")
    CityHack.Util = require("hacks/modules/utility")

    CityHack.Observer = require("observer")


    -- START CoreUI --------------------------------------------------------------------------

    CityHack.CoreUI = require("ui/core")

    -- START Hotkeys -------------------------------------------------------------------------

    registerHotkey("CityHack_Menu", "Toggle Window", function()
        CityHack.drawWindow = not CityHack.drawWindow
    end)


    -- START Events --------------------------------------------------------------------------
    
    registerForEvent("onInit", function()
        CityHack.Util.Log("Loaded! Go to Cyber Engine Tweaks window and click Hotkeys to assign a hotkey.")
    end)
      
    registerForEvent("onUpdate", function(deltaTime)
        CityHack.Observer.Tick(deltaTime)
    end)

    registerForEvent("onOverlayOpen", function()
        CityHack.drawWindow = true
    end)
      
    registerForEvent("onOverlayClose", function()
        CityHack.drawWindow = false
    end)

    registerForEvent("onDraw", function()

        if CityHack.drawWindow then

            CityHack.CoreUI.Create(CityHack)

        end
    end)    
end

return CityHack:new()