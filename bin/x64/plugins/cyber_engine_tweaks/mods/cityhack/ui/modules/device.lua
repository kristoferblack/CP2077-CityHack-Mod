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
}

local Theme = require(DeviceUI.rootPath.."ui.theme")
local Util = require(DeviceUI.rootPath.."hacks.modules.utility")


function DeviceUI.Create(CityHack, Style, Observer)

    local LookedObject = Observer.LookedObject()

    if Util.IfArrayHasValue(DeviceUI.ValidDeviceTypes, LookedObject) then
        
        ImGui.SetNextItemOpen(true)

        if ImGui.CollapsingHeader(DeviceUI.DeviceHeaderLabel) then
            ImGui.Spacing()

            ImGui.Columns(2, "DeviceState", false)

            Theme.DisplayLabel("Power")

            if not CityHack.Device.Is("On", LookedObject) then
                if ImGui.Button("Turn On", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.State("PowerOn")
                end
            end

            if CityHack.Device.Is("On", LookedObject) then
                if ImGui.Button("Turn Off", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.State("PowerOff")
                end
            end


            if Util.IfArrayHasValue({"TV", "Computer", "VendingMachine", "BillboardDevice", "DropPoint"}, LookedObject) then

                ImGui.NextColumn()

                Theme.DisplayLabel("Controls")

                print( LookedObject:GetDevicePS():IsGlitching() )


                    if ImGui.Button("Start", Style.halfButtonWidth / 2, Style.buttonHeight) then
                        CityHack.Device.State("StartGlitching")
                    end

                    ImGui.SameLine()
                    if ImGui.Button("Stop", Style.halfButtonWidth / 2, Style.buttonHeight) then
                        CityHack.Device.State("StopGlitching")
                    end


                if Util.IsA("TV", LookedObject) then

                    Theme.Spacing(3)

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

            if Util.IsA("VendingMachine", LookedObject) then

                if ImGui.Button("Dispense All", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Device.VendingMachine("DispenseAll")
                end

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