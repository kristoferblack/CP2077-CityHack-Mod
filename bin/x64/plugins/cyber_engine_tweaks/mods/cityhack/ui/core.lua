UICore = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack."
}

function UICore.Create(CityHack)
    ImGui.PushStyleColor(ImGuiCol.Border, 0.56, 0.06, 0.03, 1)
    ImGui.PushStyleColor(ImGuiCol.PopupBg, 0.353, 0.016, 0.016, 1)
    ImGui.PushStyleColor(ImGuiCol.TitleBg, 0.56, 0.06, 0.03, 0.5)
    ImGui.PushStyleColor(ImGuiCol.TitleBgActive, 0.56, 0.06, 0.03, 0.75)
    ImGui.PushStyleColor(ImGuiCol.TitleBgCollapsed, 0.56, 0.06, 0.03, 0.25)
    ImGui.PushStyleColor(ImGuiCol.Tab, 0.56, 0.06, 0.03, 0.5)
    ImGui.PushStyleColor(ImGuiCol.TabHovered, 0.56, 0.06, 0.03, 0.85)
    ImGui.PushStyleColor(ImGuiCol.TabActive, 0.56, 0.06, 0.03, 1)
    ImGui.PushStyleColor(ImGuiCol.Button, 0.56, 0.06, 0.03, 0.50)
    ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.56, 0.06, 0.03, 0.75)
    ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.56, 0.06, 0.03, 1)
    ImGui.PushStyleColor(ImGuiCol.FrameBg, 0.56, 0.06, 0.03, 0.50)
    ImGui.PushStyleColor(ImGuiCol.FrameBgHovered, 0.56, 0.06, 0.03, 0.75)
    ImGui.PushStyleColor(ImGuiCol.FrameBgActive, 0.56, 0.06, 0.03, 1)
    ImGui.PushStyleColor(ImGuiCol.ResizeGrip, 0.56, 0.06, 0.03, 0.6)
    ImGui.PushStyleColor(ImGuiCol.ResizeGripHovered, 0.56, 0.06, 0.03, 0.75)
    ImGui.PushStyleColor(ImGuiCol.ResizeGripActive, 0.56, 0.06, 0.03, 1)
    ImGui.PushStyleColor(ImGuiCol.Separator, 0.56, 0.06, 0.03, 0.6)
    -- ImGui.PushStyleColor(ImGuiCol.ComboBg, 0, 0, 0, 1) -- does not work 
    

    UICore.DoorUI = require(UICore.rootPath.."ui.modules.door")
    UICore.DeviceUI = require(UICore.rootPath.."ui.modules.device")
    UICore.VehicleUI = require(UICore.rootPath.."ui.modules.vehicle")
    UICore.NpcUI = require(UICore.rootPath.."ui.modules.npc")
    UICore.UtilUI = require(UICore.rootPath.."ui.modules.util")


    if ImGui.Begin("CITY H4CK") then
        
        local style = {
            buttonWidth = -1,
            buttonHeight = 35,
            halfButtonWidth = ((ImGui.GetWindowContentRegionWidth() / 2) - 4.3)
        }

        if ImGui.BeginTabBar("CITYH4CKTABS") then
            ---------------- DOORS TAB ---------------- 
            UICore.DoorUI.Create(CityHack, style)
            
            ---------------- DEVICES TAB ---------------- 
            UICore.DeviceUI.Create(CityHack, style)

            ---------------- CARS TAB ---------------- 
            UICore.VehicleUI.Create(CityHack, style)

            ---------------- NPC TAB ---------------- 
            UICore.NpcUI.Create(CityHack, style)

            ---------------- UTIL TAB ---------------- 
            UICore.UtilUI.Create(CityHack, style)

        end
        ImGui.EndTabBar()
        
    end
    ImGui.PopStyleColor(18)
    ImGui.End()
end

return UICore