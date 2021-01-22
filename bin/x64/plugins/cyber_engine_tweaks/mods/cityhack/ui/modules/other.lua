local OtherUI = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
    ValidTypes = {
        "ElevatorFloorTerminal",
        -- "RoadBlock"
    },
    States = {
        CityLights = "Default",
        Police = "Default"
    },

    HeaderLabel = "OTHER",
    HeaderCitywideLabel = "CITY WIDE"
}

local Theme = require(OtherUI.rootPath.."ui.theme")
local Util = require(OtherUI.rootPath.."hacks.modules.utility")

function OtherUI.Create(CityHack, Style, Observer)

    local LookedObject = Observer.LookedObject()

    
    if Util.IfArrayHasValue(OtherUI.ValidTypes, LookedObject) then
        ImGui.SetNextItemOpen(true)

        if ImGui.CollapsingHeader(OtherUI.HeaderLabel) then
            
            if Observer.IsA("ElevatorFloorTerminal") then
                
                Theme.DisplayLabel("Elevator")
            
                if ImGui.Button("Restore Access", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Elevator.RestoreAccess()
                end
                
                if ImGui.IsItemHovered() then
                    ImGui.SetTooltip("Look at elevator call panel to use this. Will restore access to any\r\nelevator that shows OFF on the call panel.\r\nUseful for exploring mission areas after mission is over.")
                end

                Theme.Spacing(1)
            end
            
            -- if Observer.IsA("RoadBlock") then
                
            --     Theme.DisplayLabel("Road Block")
                
            --     if ImGui.Button("Toggle Open", Style.buttonWidth, Style.buttonHeight) then
            --         CityHack.Other.RoadBlockToggle()
            --     end
            -- end
            
        end
    end

    if ImGui.CollapsingHeader(OtherUI.HeaderCitywideLabel) then
        
        local cityLightState = CityHack.Other.GetCityWideLightState()

        Theme.DisplayLabel("City Lights: "..cityLightState)

        if ImGui.Button("Turn On All", Style.halfButtonWidth, Style.buttonHeight) then
            CityHack.Other.SetCityWideLight("AllOn")
            OtherUI.States.CityLights = "All On"
        end

        ImGui.SameLine()

        if ImGui.Button("Turn Off All", Style.halfButtonWidth, Style.buttonHeight) then
            CityHack.Other.SetCityWideLight("AllOff")
            OtherUI.States.CityLights = "All Off"
        end

        Theme.Spacing(1)

        if ImGui.Button("Reset All Lights", Style.buttonWidth, Style.buttonHeight) then
            CityHack.Other.SetCityWideLight("Reset")
            OtherUI.States.CityLights = "Default"
        end

        Theme.InsertSeparator()


        Theme.DisplayLabel("Police")

        if ImGui.Button("Enable", Style.halfButtonWidth, Style.buttonHeight) then
            CityHack.Other.PoliceToggle("On")
        end

        ImGui.SameLine()

        if ImGui.Button("Disable", Style.halfButtonWidth, Style.buttonHeight) then
            CityHack.Other.PoliceToggle("Off")
        end

        Theme.Spacing(1)

    end
end

return OtherUI
