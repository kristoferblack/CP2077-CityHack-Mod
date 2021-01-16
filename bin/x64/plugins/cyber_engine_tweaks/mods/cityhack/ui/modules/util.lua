UtilUI = {}

function UtilUI.Create(CityHack, style) 

    Theme.PushStyleColor(ImGuiCol.Text,	Theme.TextWhite)
    if ImGui.BeginTabItem("Util") then
        ImGui.PopStyleColor()
        Theme.PushStyleColor(ImGuiCol.Text,	Theme.Text)
        ImGui.SetWindowSize(280, 360)
        ImGui.Spacing()

        ImGui.PushTextWrapPos()
        Theme.PushStyleColor(ImGuiCol.Text,	Theme.CustomToggleOn)
        ImGui.Text("These are debug utilites to dump different types of data into console. They have no effect in the game.")
        ImGui.PopStyleColor()
        ImGui.PopTextWrapPos()

        ImGui.Spacing()
        ImGui.Spacing()
        ImGui.Spacing()

        if ImGui.Button("Dump", style.buttonWidth, style.buttonHeight) then
            CityHack.Util.Dump()
        end

        if ImGui.Button("Dump Controller", style.buttonWidth, style.buttonHeight) then
            CityHack.Util.DumpController()
        end

        if ImGui.Button("Dump Device PS", style.buttonWidth, style.buttonHeight) then
            CityHack.Util.DumpPS()
        end

        if ImGui.Button("Dump Device Parents", style.buttonWidth, style.buttonHeight) then
            CityHack.Util.DumpParents()
        end

        if ImGui.Button("Dump Vehicle PS", style.buttonWidth, style.buttonHeight) then
            CityHack.Car.DumpPS()
        end

        if ImGui.Button("Dump Player Vehicles", style.buttonWidth, style.buttonHeight) then
            CityHack.Util.PlayerVehicles()
        end
    ImGui.EndTabItem()
    end

end

return UtilUI