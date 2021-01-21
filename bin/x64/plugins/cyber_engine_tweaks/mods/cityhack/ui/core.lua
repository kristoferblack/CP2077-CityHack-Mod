UICore = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack."
}

UICore.Theme = require(UICore.rootPath.."ui.theme")

function UICore.Create(CityHack)
    UICore.Observer = require(UICore.rootPath.."observer")

    UICore.DoorUI = require(UICore.rootPath.."ui.modules.door")
    UICore.DeviceUI = require(UICore.rootPath.."ui.modules.device")
    -- UICore.VehicleUI = require(UICore.rootPath.."ui.modules.vehicle")
    -- UICore.NpcUI = require(UICore.rootPath.."ui.modules.npc")
    UICore.OtherUI = require(UICore.rootPath.."ui.modules.other")
    UICore.UtilUI = require(UICore.rootPath.."ui.modules.util")

    UICore.Theme.Start()
    
    if ImGui.Begin("CITY H4CK") then
        ImGui.PopStyleVar(4)

        local Style = {
            buttonWidth = -1,
            buttonHeight = 25,
            halfButtonWidth = ((ImGui.GetWindowContentRegionWidth() / 2) - 4.3)
        }

        ImGui.PushStyleVar(ImGuiStyleVar.WindowPadding, 5, 5)

        if ImGui.BeginChild("ObserverChild", -1, 65, true) then
            UICore.Theme.DisplayLabel("Looking At")
            ImGui.Text(tostring(UICore.Observer.LookedObject(true)))
        end

        ImGui.EndChild()

        ImGui.PopStyleVar()

        UICore.Theme.Spacing(3)


        ---------------- DOORS TAB ---------------- 
        UICore.DoorUI.Create(CityHack, Style, UICore.Observer)
        
        -- ---------------- DEVICES TAB ---------------- 
        UICore.DeviceUI.Create(CityHack, Style, UICore.Observer)

        -- ---------------- CARS TAB ---------------- 
        -- UICore.VehicleUI.Create(CityHack, Style, UICore.Observer)

        -- ---------------- NPC TAB ---------------- 
        -- UICore.NpcUI.Create(CityHack, Style, UICore.Observer)

        -- ---------------- OTHER TAB ---------------- 
        UICore.OtherUI.Create(CityHack, Style, UICore.Observer)

        ---------------- UTIL TAB ---------------- 
        UICore.UtilUI.Create(CityHack, Style)
        
    end
    UICore.Theme.End()
    ImGui.End()
end

return UICore