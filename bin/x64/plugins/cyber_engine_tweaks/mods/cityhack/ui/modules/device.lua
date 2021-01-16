local DeviceUI = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
    ValidDeviceTypes = {
        "TV",
        "ArcadeMachine",
        "PachinkoMachine",
        "SurveillanceCamera",
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
        "Computer"
    }
}

local Util = require(DeviceUI.rootPath.."hacks.modules.utility")

function DeviceUI.Create(CityHack, Style, Observer)

    Theme = require(DeviceUI.rootPath.."ui.theme")

    Theme.PushStyleColor(ImGuiCol.Text,	Theme.TextWhite)

    if Util.IfArrayHasValue(DeviceUI.ValidDeviceTypes, Observer.LookedObject()) then

        if ImGui.BeginTabItem("Devices", true) then
            ImGui.PopStyleColor()
            Theme.PushStyleColor(ImGuiCol.Text,	Theme.Text)
            ImGui.SetWindowSize(280, 225)
            ImGui.Spacing()

            ImGui.Columns(2, "DeviceState", false)

            Theme.PushStyleColor(ImGuiCol.Text,	Theme.CustomToggleOn)
            ImGui.LabelText("##","POWER")
            ImGui.PopStyleColor()
            ImGui.Spacing()

            if ImGui.Button("Turn On", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Device.State("PowerOn")
            end

            if ImGui.Button("Turn Off", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Device.State("PowerOff")
            end

            if ImGui.Button("Cut Power", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Device.State("PowerCut")
            end

            ImGui.Columns(1)

        ImGui.EndTabItem()
        end
    end

end

return DeviceUI