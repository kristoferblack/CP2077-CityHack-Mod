local DoorUI = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
    ValidDoorTypes = {
        "Door",
        "FakeDoor"
    }
}

local Theme = require(DoorUI.rootPath.."ui.theme")
local Util = require(DoorUI.rootPath.."hacks.modules.utility")

function DoorUI.Create(CityHack, Style, Observer)
    
    if Util.IfArrayHasValue(DoorUI.ValidDoorTypes, Observer.LookedObject()) then
        
        Theme.PushStyleColor(ImGuiCol.Text,	Theme.TextWhite)

        if ImGui.BeginTabItem("Doors") then

            ImGui.PopStyleColor()
            Theme.PushStyleColor(ImGuiCol.Text,	Theme.Text)
            ImGui.SetWindowSize(280, 440)

            if Observer.LookedObject() == "Door" then
                
                ---------------- BASIC ---------------- 
                ImGui.Columns(2, "DoorsBasic", false)

                Theme.DisplayLabel("Basic")

                if ImGui.Button("Open", Style.buttonWidth, Style.buttonHeight) then
                    if CityHack.Door.Toggle("open") then
                        CityHack.Util.Response("door", "open", true, false)
                    else
                        CityHack.Util.Response("door", "open", false, false)
                    end
                end
                
                if ImGui.IsItemHovered() then
                    ImGui.SetTooltip("This will automatically unseal and unlock any door and make it open.\r\nFor fake doors, it will delete them but be warned you'll probably fall through the map.")
                end

                if ImGui.Button("Close", Style.buttonWidth, Style.buttonHeight) then
                    if CityHack.Door.Toggle("close") then
                        CityHack.Util.Response("door", "close", true, false)
                    else
                        CityHack.Util.Response("door", "close", false, false)
                    end
                end

                if ImGui.Button("Reset", Style.buttonWidth, Style.buttonHeight) then
                    if not CityHack.Door.Reset() then
                        CityHack.Util.Response("door", "reset", false, false)
                    end
                end

                ImGui.Spacing()
                ImGui.NextColumn()

                Theme.DisplayLabel("Toggles")

                if ImGui.Button("Toggle Lock", Style.buttonWidth, Style.buttonHeight) then
                    if CityHack.Door.ToggleLock() then
                        CityHack.Util.Response("door", "toggle lock", true, false)
                    else
                        CityHack.Util.Response("door", "toggle lock", false, false)
                    end
                end

                if ImGui.Button("Toggle Seal", Style.buttonWidth, Style.buttonHeight) then
                    if CityHack.Door.ToggleSeal() then
                        CityHack.Util.Response("door", "toggle seal", true, false)
                    else
                        CityHack.Util.Response("door", "toggle seal", false, false)
                    end
                end

                ImGui.Columns(1)

                ImGui.Columns(2, "ElevatorOther", false)

                ---------------- OTHER BUTTONS ---------------- 
                Theme.DisplayLabel("Others")

                if ImGui.Button("Set Auto", Style.buttonWidth, Style.buttonHeight) then
                    if CityHack.Door.SetType(2) then
                        CityHack.Util.Response("door", "auto", true, false)
                    else
                        CityHack.Util.Response("door", "auto", false, false)
                    end
                end

                if ImGui.IsItemHovered() then
                    ImGui.SetTooltip("Set a door to auto, meaning it will automatically open when you approach.")
                end

                if ImGui.Button("Set Manual", Style.buttonWidth, Style.buttonHeight) then
                    if CityHack.Door.SetType(1) then
                        CityHack.Util.Response("door", "manual", true, false)
                    else
                        CityHack.Util.Response("door", "manual", false, false)
                    end
                end

                if ImGui.IsItemHovered() then
                    ImGui.SetTooltip("Sets door back to manual so interaction is required to open door.")
                end

                ImGui.Columns(1)

            elseif Observer.LookedObject() == "FakeDoor" then
                ImGui.Spacing()
                if ImGui.Button("Delete Fake Door", Style.buttonWidth, Style.buttonHeight) then
                    if CityHack.Door.Dispose() then
                        CityHack.Util.Response("fake door", "dispose", true, true)
                    else
                        CityHack.Util.Response("fake door", "dispose", false, false)
                    end
                end
            end

        ImGui.EndTabItem()
        end
    end
end

return DoorUI