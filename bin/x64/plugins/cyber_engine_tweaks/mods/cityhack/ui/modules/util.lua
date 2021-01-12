UtilUI = {}

function UtilUI.Create(style) 

    if ImGui.BeginTabItem("Util") then
        ImGui.SetWindowSize(265, 360)
        ImGui.Spacing()

        ImGui.PushTextWrapPos()
        ImGui.Text("These are debug utilites to dump different types of data into console. They have no effect in the game.")
        ImGui.PopTextWrapPos()

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
    ImGui.EndTabItem()
    end

end

return UtilUI