UtilUI = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
}

local Theme = require(UtilUI.rootPath.."ui.theme")

function UtilUI.Create(CityHack, style) 

    Theme.TabStart()

    if ImGui.BeginTabItem("Util") then
        Theme.TabInner()
        ImGui.SetWindowSize(280, 460)

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

        if ImGui.Button("Dump Vendor Stock", style.buttonWidth, style.buttonHeight) then
            CityHack.Util.DumpVendorItems()
        end
    ImGui.EndTabItem()
    end

end

return UtilUI