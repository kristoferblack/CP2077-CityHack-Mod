local DeviceUI = {}

function DeviceUI.Create(style)

    if ImGui.BeginTabItem("Devices") then
        ImGui.SetWindowSize(265, 275)
        ImGui.Spacing()

        if ImGui.Button("Turn On", style.buttonWidth, style.buttonHeight) then
            CityHack.Device.On()
        end

        if ImGui.Button("Turn Off", style.buttonWidth, style.buttonHeight) then
            CityHack.Device.Off()
        end

        if ImGui.Button("Activate", style.buttonWidth, style.buttonHeight) then
            CityHack.Device.Activate()
        end

        if ImGui.Button("Deactivate", style.buttonWidth, style.buttonHeight) then
            CityHack.Device.Deactivate()
        end

        if ImGui.Button("Cut Power", style.buttonWidth, style.buttonHeight) then
            CityHack.Device.CutPower()
        end
    ImGui.EndTabItem()
    end

end

return DeviceUI