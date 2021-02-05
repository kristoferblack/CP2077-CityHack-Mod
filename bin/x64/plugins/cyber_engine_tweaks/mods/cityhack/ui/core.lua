UICore = {
    devMode = true
}

UICore.Theme = require("ui/theme")

function UICore.Create(CityHack)
    UICore.Observer = require("observer")

    UICore.DoorUI = require("ui/modules/door")
    UICore.DeviceUI = require("ui/modules/device")
    UICore.VehicleUI = require("ui/modules/vehicle")
    -- UICore.NpcUI = require("ui/modules/npc")
    UICore.OtherUI = require("ui/modules/other")
    UICore.UtilUI = require("ui/modules/util")

    UICore.Theme.Start()

    ImGui.SetNextWindowPos(0, 500, ImGuiCond.FirstUseEver)
    ImGui.SetNextWindowSize(265, 600, ImGuiCond.Appearing)

    if ImGui.Begin("CITY H4CK") then
        ImGui.SetWindowFontScale(1)

        local Style = {
            buttonWidth = -1,
            buttonHeight = 25,
            halfButtonWidth = ((ImGui.GetWindowContentRegionWidth() / 2) - 4.3)
        }

        ImGui.PushStyleVar(ImGuiStyleVar.WindowPadding, 10, 10)

        if ImGui.BeginChild("ObserverChild", -1, 65, true) then
            UICore.Theme.DisplayLabel("Object")
            ImGui.Text(tostring(UICore.Observer.LookedObject(true)))
        end
        ImGui.EndChild()

        ImGui.PopStyleVar()

        UICore.Theme.Spacing(3)


        ---------------- DOORS TAB ---------------- 
        UICore.DoorUI.Create(CityHack, Style, UICore.Observer)
        
        -- ---------------- DEVICES TAB ---------------- 
        UICore.DeviceUI.Create(CityHack, Style, UICore.Observer)

        -- ---------------- CARS TAB ---------------- 
        UICore.VehicleUI.Create(CityHack, Style, UICore.Observer)

        -- ---------------- NPC TAB ---------------- 
        -- UICore.NpcUI.Create(CityHack, Style, UICore.Observer)

        -- ---------------- OTHER TAB ---------------- 
        UICore.OtherUI.Create(CityHack, Style, UICore.Observer)

        if UICore.devMode then
        ---------------- UTIL TAB ---------------- 
            UICore.UtilUI.Create(CityHack, Style, UICore.Observer)
        end
        
    end
    ImGui.End()
    UICore.Theme.End()
end

return UICore