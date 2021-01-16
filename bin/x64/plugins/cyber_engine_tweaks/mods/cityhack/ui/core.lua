UICore = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack."
}

function UICore.Create(CityHack)
    UICore.Theme = require(UICore.rootPath.."ui.theme")
    UICore.Observer = require(UICore.rootPath.."observer")

    UICore.DoorUI = require(UICore.rootPath.."ui.modules.door")
    UICore.DeviceUI = require(UICore.rootPath.."ui.modules.device")
    UICore.VehicleUI = require(UICore.rootPath.."ui.modules.vehicle")
    UICore.NpcUI = require(UICore.rootPath.."ui.modules.npc")
    UICore.UtilUI = require(UICore.rootPath.."ui.modules.util")
    

    UICore.Theme.Start()


    if ImGui.Begin("CITY H4CK") then

        ImGui.SetWindowFontScale(0.9)

        local Style = {
            buttonWidth = -1,
            buttonHeight = 35,
            halfButtonWidth = ((ImGui.GetWindowContentRegionWidth() / 2) - 4.3)
        }

        if ImGui.BeginChild("Name", -1, 65, true) then
            Theme.PushStyleColor(ImGuiCol.Text,	UICore.Theme.CustomToggleOn)
            ImGui.LabelText("##","LOOKING AT")
            ImGui.PopStyleColor()
            ImGui.Text(tostring(UICore.Observer.LookedObject()))
        end
        ImGui.EndChild()

        ImGui.Spacing()
        ImGui.Spacing()
        ImGui.Spacing()


        if ImGui.BeginTabBar("CITYH4CKTABS", ImGuiTabBarFlags.Reorderable) then
            ---------------- DOORS TAB ---------------- 
            UICore.DoorUI.Create(CityHack, Style, UICore.Observer)
            
            ---------------- DEVICES TAB ---------------- 
            UICore.DeviceUI.Create(CityHack, Style, UICore.Observer)

            ---------------- CARS TAB ---------------- 
            UICore.VehicleUI.Create(CityHack, Style, UICore.Observer)

            ---------------- NPC TAB ---------------- 
            UICore.NpcUI.Create(CityHack, Style, UICore.Observer)

            ---------------- UTIL TAB ---------------- 
            UICore.UtilUI.Create(CityHack, Style)

        end
        ImGui.EndTabBar()
        
    end
    UICore.Theme.End()
    ImGui.End()
end

return UICore