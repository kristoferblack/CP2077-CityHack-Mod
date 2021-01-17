local OtherUI = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
    ValidTypes = {
        "ElevatorFloorTerminal"
    }
}

local Theme = require(OtherUI.rootPath.."ui.theme")
local Util = require(OtherUI.rootPath.."hacks.modules.utility")

function OtherUI.Create(CityHack, Style, Observer)

    if Util.IfArrayHasValue(OtherUI.ValidTypes, Observer.LookedObject()) then

        Theme.TabStart()

        if ImGui.BeginTabItem("Other") then
            
            Theme.TabInner()
            ImGui.SetWindowSize(280, 220)

            Theme.DisplayLabel("Elevator Panel")

            if ImGui.Button("Restore Access", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Elevator.RestoreAccess()
            end

            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("Look at elevator call panel to use this. Will restore access to any\r\nelevator that shows OFF on the call panel.\r\nUseful for exploring mission areas after mission is over.")
            end
            
        ImGui.EndTabItem()
        end
    end
end

return OtherUI
