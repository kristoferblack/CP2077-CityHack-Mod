UtilUI = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
}

local Theme = require(UtilUI.rootPath.."ui.theme")

function UtilUI.Create(CityHack, Style, Observer) 

    if ImGui.CollapsingHeader("UTILITY") then

        local LookedObject = Observer.LookedObject()

        ImGui.PushTextWrapPos()
        Theme.PushStyleColor(ImGuiCol.Text,	Theme.CustomToggleOn)
        ImGui.Text("These are debug utilites to dump different types of data into console. They have no effect in the game.")
        ImGui.PopStyleColor()
        ImGui.PopTextWrapPos()

        ImGui.Spacing()
        ImGui.Spacing()
        ImGui.Spacing()

        if ImGui.Button("Dump", Style.buttonWidth, Style.buttonHeight) then
            CityHack.Util.Dump()
        end

        if ImGui.Button("Dump Controller", Style.buttonWidth, Style.buttonHeight) then
            CityHack.Util.DumpController()
        end

        if ImGui.Button("Dump Device PS", Style.buttonWidth, Style.buttonHeight) then
            CityHack.Util.DumpPS()
        end

        if ImGui.Button("Dump Device Parents", Style.buttonWidth, Style.buttonHeight) then
            CityHack.Util.DumpParents()
        end

        if ImGui.Button("Dump Vehicle PS", Style.buttonWidth, Style.buttonHeight) then
            CityHack.Vehicle.DumpPS(LookedObject)
        end

        if ImGui.Button("Dump Player Vehicles", Style.buttonWidth, Style.buttonHeight) then
            CityHack.Util.PlayerVehicles()
        end

        if ImGui.Button("Dump Vendor Stock", Style.buttonWidth, Style.buttonHeight) then
            CityHack.Util.DumpVendorItems()
        end

        if ImGui.Button("Dump TweakDBID", Style.buttonWidth, Style.buttonHeight) then
            CityHack.Util.DumpTweakDBID()
        end

        if ImGui.Button("Dump Observer Component", Style.buttonWidth, Style.buttonHeight) then
            CityHack.Observer.LookedComponent()
        end

    end

end

return UtilUI