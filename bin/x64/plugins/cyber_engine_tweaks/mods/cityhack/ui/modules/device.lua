local DeviceUI = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
    ValidDeviceTypes = {
        "TV",
        "ArcadeMachine",
        "PachinkoMachine",
        "SurveillanceCamera",
        "ElectricLight",
        "DropPoint",
        "LcdScreen",
        "SecurityTurret",
        "Radio",
        "Jukebox",
        "HoloTable",
        "Speaker",
        "CrossingLight",
        "TrafficLight",
        "VendingMachine",
        "ExitLight",
        "DropPoint",
        "ConfessionBooth",
        "Computer",
        "BillboardDevice"
    },
    TVChannel = 0
}

local Theme = require(DeviceUI.rootPath.."ui.theme")
local Util = require(DeviceUI.rootPath.."hacks.modules.utility")


function DeviceUI.Create(CityHack, Style, Observer)

    Theme.PushStyleColor(ImGuiCol.Text,	Theme.TextWhite)

    if Util.IfArrayHasValue(DeviceUI.ValidDeviceTypes, Observer.LookedObject()) then

        if ImGui.BeginTabItem("Devices") then
            ImGui.PopStyleColor()
            Theme.PushStyleColor(ImGuiCol.Text,	Theme.Text)
            ImGui.SetWindowSize(280, 325)
            ImGui.Spacing()

            ImGui.Columns(2, "DeviceState", false)

            Theme.DisplayLabel("Power")

            if ImGui.Button("Turn On", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Device.State("PowerOn")
            end

            if ImGui.Button("Turn Off", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Device.State("PowerOff")
            end


            if Util.IfArrayHasValue({"TV", "Computer", "VendingMachine", "BillboardDevice"}, Observer.LookedObject()) then

                ImGui.NextColumn()

                Theme.DisplayLabel("Controls")

                if ImGui.Button("Start Glitching", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.State("StartGlitching")
                end

                if ImGui.Button("Stop Glitching", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.State("StopGlitching")
                end

                if Observer.IsA("TV") then
                    ImGui.SetWindowSize(280, 375)

                    ImGui.Spacing()
                    ImGui.Spacing()
                    ImGui.Spacing()

                    Theme.DisplayLabel("TV Channel")

                    local TVChannels = {"1", "2", "3", "4", "5\0"}
                    local ChannelTable = table.concat(TVChannels, "\0")

                    ImGui.PushItemWidth(Style.buttonWidth)
                    DeviceUI.TVChannel = ImGui.Combo("##Channel", DeviceUI.TVChannel, ChannelTable)
                    ImGui.PopItemWidth()
                    
                    if ImGui.Button("Set Channel", Style.buttonWidth, Style.buttonHeight) then
                        CityHack.Device.State("SetChannel", DeviceUI.TVChannel)
                    end
                end
            end

            if Observer.LookedObject() == "VendingMachine" then

                if ImGui.Button("Dispense All", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.VendingMachine("DispenseAll")
                end
            end


            if Util.IfArrayHasValue({"CrossingLight", "TrafficLight"}, Observer.LookedObject()) then

                ImGui.NextColumn()
                
                Theme.DisplayLabel("Mayhem")

                if ImGui.Button("Break", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.State("Deactivate")
                end
    
                if ImGui.Button("Restore", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.State("Activate")
                end
            end

            ImGui.Columns(1)
            ImGui.EndTabItem()
        end
    end

end

return DeviceUI