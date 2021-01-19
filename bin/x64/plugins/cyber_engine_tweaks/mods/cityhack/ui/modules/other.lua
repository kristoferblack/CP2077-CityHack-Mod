local OtherUI = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
    ValidTypes = {
        "ElevatorFloorTerminal",
        "RoadBlock"
    },
    States = {
        CityLights = "Default",
        Police = "Default"
    }
}

local Theme = require(OtherUI.rootPath.."ui.theme")
local Util = require(OtherUI.rootPath.."hacks.modules.utility")

function OtherUI.Create(CityHack, Style, Observer)

    Theme.TabStart()

    if ImGui.BeginTabItem("Other") then

        Theme.TabInner()
        
        if Util.IfArrayHasValue(OtherUI.ValidTypes, Observer.LookedObject()) then
            
            if Observer.IsA("ElevatorFloorTerminal") then
                
                if ImGui.CollapsingHeader("ELEVATOR", ImGuiTreeNodeFlags.Selected) then
                
                    if ImGui.Button("Restore Access", Style.buttonWidth, Style.buttonHeight) then
                        CityHack.Elevator.RestoreAccess()
                    end
                    
                    if ImGui.IsItemHovered() then
                        ImGui.SetTooltip("Look at elevator call panel to use this. Will restore access to any\r\nelevator that shows OFF on the call panel.\r\nUseful for exploring mission areas after mission is over.")
                    end
                end
            end
            
            if Observer.IsA("RoadBlock") then
                ImGui.SetWindowSize(280, 220)
                
                Theme.DisplayLabel("Road Block")
                
                if ImGui.Button("Toggle Open", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Other.RoadBlockToggle()
                end
            end
            
        end
        
        if ImGui.CollapsingHeader("CITY LIGHTS") then
            Theme.DisplayLabel("City Lights: "..OtherUI.States.CityLights)

            if ImGui.Button("Turn On All Lights", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Other.CityWideLight("AllOn")
                OtherUI.States.CityLights = "All On"
            end

            if ImGui.Button("Turn Off All Lights", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Other.CityWideLight("AllOff")
                OtherUI.States.CityLights = "All Off"
            end

            if ImGui.Button("Reset All Lights", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Other.CityWideLight("Reset")
                OtherUI.States.CityLights = "Default"
            end

        end

        
        if ImGui.CollapsingHeader("POLICE") then
            Theme.DisplayLabel("Police")

            if ImGui.Button("Turn On Police", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Other.PoliceToggle("On")
            end

            if ImGui.Button("Turn Off Police", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Other.PoliceToggle("Off")
            end

        end
        ImGui.TreePop()

    ImGui.EndTabItem()
    end
end

return OtherUI
