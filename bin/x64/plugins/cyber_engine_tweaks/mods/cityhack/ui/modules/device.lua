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
        "BillboardDevice",
        "Reflector"
    },

    TVChannel = 0,
    DeviceHeaderLabel = "DEVICES",
    TVChannels = {"1", "2", "3", "4", "5"},
    TVChannelsCurrent = "1"
}

local Theme = require(DeviceUI.rootPath.."ui.theme")
local Util = require(DeviceUI.rootPath.."hacks.modules.utility")


function DeviceUI.Create(CityHack, Style, Observer)

    local LookedObject = Observer.LookedObject()

    if Util.IfArrayHasValue(DeviceUI.ValidDeviceTypes, LookedObject) then
        
        ImGui.SetNextItemOpen(true)

        if ImGui.CollapsingHeader(LookedObject:ToString()) then
            ImGui.Spacing()

            ImGui.Columns(2, "DeviceState", false)

            Theme.DisplayLabel("Power")

            if not CityHack.Device.Is("On", LookedObject) then
                if ImGui.Button("Turn On", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.State("PowerOn", false, LookedObject)
                end
            end

            if CityHack.Device.Is("On", LookedObject) then
                if ImGui.Button("Turn Off", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.State("PowerOff", false, LookedObject)
                end
            end

            Theme.Spacing()

            if Util.IfArrayHasValue({"TV", "Computer", "VendingMachine", "BillboardDevice", "DropPoint"}, LookedObject) then

                ImGui.NextColumn()

                Theme.DisplayLabel("Glitching")


                if ImGui.Button("Start", Style.halfButtonWidth, Style.buttonHeight) then
                    CityHack.Device.State("StartGlitching")
                end

                if ImGui.Button("Stop", Style.halfButtonWidth, Style.buttonHeight) then
                    CityHack.Device.State("StopGlitching")
                end

                ImGui.Columns(1)
                ImGui.Columns(2, "DeviceTVChannels", false)

                if Util.IsA("TV", LookedObject) then

                    Theme.Spacing(3)

                    Theme.DisplayLabel("TV Channel")

                    -- local TVChannels = {"1", "2", "3", "4", "5\0"}
                    -- local ChannelTable = table.concat(TVChannels, "\0")

                    if ImGui.BeginCombo("##TVChannels", DeviceUI.TVChannelsCurrent) then

                        for i, channel in ipairs(TVChannels) do
                            if ImGui.Selectable(channel, (channel == DeviceUI.TVChannelsCurrent)) then
                                DeviceUI.TVChannelsCurrent = channel
                                ImGui.SetItemDefaultFocus();
                            end
                        end
            
                    ImGui.EndCombo()
                    end

                    -- ImGui.PushItemWidth(Style.buttonWidth)
                    -- DeviceUI.TVChannel = ImGui.Combo("##Channel", DeviceUI.TVChannel, ChannelTable)
                    -- ImGui.PopItemWidth()
                    
                    if ImGui.Button("Set Channel", Style.buttonWidth, Style.buttonHeight) then
                        CityHack.Device.State("SetChannel", DeviceUI.TVChannel, LookedObject)
                    end

                    Theme.Spacing(3)
                end
            end

            if Util.IsA("Reflector", LookedObject) then

                ImGui.NextColumn()
                Theme.DisplayLabel("Blinking")

                if ImGui.Button("Start Blinking", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.State("StartBlinking")
                end

                if ImGui.Button("Stop Blinking", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.State("StopBlinking")
                end

            end

            ImGui.Columns(1)

            
            if Util.IsA("VendingMachine", LookedObject) then
                Theme.DisplayLabel("Mayhem")

                if ImGui.Button("Dispense All", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.VendingMachine("DispenseAll")
                end

                Theme.Tooltip("WARNING! This will cause a vending machine to dispense all its inventory at once.\r\nPressing this many times will result in a game crash due to too many objects being present!")

            end


            if Util.IfArrayHasValue({"CrossingLight", "TrafficLight"}, LookedObject) then

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
        end
    end

end

return DeviceUI