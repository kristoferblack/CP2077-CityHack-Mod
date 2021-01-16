local VehicleUI = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",

    LightStateCurrent = 0,
    LightStates = {"Off", "Normal", "High Beams"},

    ValidVehicleTypes = {
        "vehicleCarBaseObject",
        "vehicleBikeBaseObject",
        "vehicleAVBaseObject"
    }
}

local Util = require(VehicleUI.rootPath.."hacks.modules.utility")

function VehicleUI.Create(CityHack, Style, Observer)

    Theme = require(VehicleUI.rootPath.."ui.theme")

    if Util.IfArrayHasValue(VehicleUI.ValidVehicleTypes, Observer.LookedObject()) then

        Theme.PushStyleColor(ImGuiCol.Text,	Theme.TextWhite)
        if ImGui.BeginTabItem("Vehicles", true) then
            ImGui.PopStyleColor()
            Theme.PushStyleColor(ImGuiCol.Text,	Theme.Text)
            ImGui.SetWindowSize(280, 545)
            ImGui.Spacing()

            ---------------- CAR DOORS ---------------- 
            Theme.PushStyleColor(ImGuiCol.Text,	Theme.CustomToggleOn)
            ImGui.LabelText("##","DOORS")
            ImGui.PopStyleColor()
            ImGui.Spacing()

            ImGui.Columns(2, "CarDoors", false)
            if ImGui.Button("Open All", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.Doors("open") then 
                    CityHack.Util.Response("car doors", "open", true, false)
                else 
                    CityHack.Util.Response("car doors", "open", false, false)
                end
            end

            if ImGui.Button("Close All", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.Doors("close") then 
                    CityHack.Util.Response("car doors", "close", true, false)
                else 
                    CityHack.Util.Response("car doors", "close", false, false)
                end
            end

            ImGui.NextColumn()

            if ImGui.Button("Lock All", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.Doors("lock") then 
                    CityHack.Util.Response("car doors", "lock", true, false)
                else 
                    CityHack.Util.Response("car doors", "lock", false, false)
                end
            end

            if ImGui.Button("Unlock All", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.Doors("lock") then 
                    CityHack.Util.Response("car doors", "unlock", true, false)
                else 
                    CityHack.Util.Response("car doors", "unlock", false, false)
                end
            end
            ImGui.Columns(1)

            ImGui.Spacing()
            ImGui.Separator()
            ImGui.Spacing()

            ---------------- CAR WINDOWS ---------------- 
            ImGui.Columns(2, "CarWindows", false)
            Theme.PushStyleColor(ImGuiCol.Text,	Theme.CustomToggleOn)
            ImGui.LabelText("##","WINDOWS")
            ImGui.PopStyleColor()
            ImGui.Spacing()

            ImGui.PushID("CarWindowOpenAll")
            if ImGui.Button("Open All", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.Windows("open") then 
                    CityHack.Util.Response("car windows", "open", true, false)
                else 
                    CityHack.Util.Response("car windows", "open", false, false)
                end
            end
            ImGui.PopID()

            ImGui.PushID("CarWindowCloseAll")
            if ImGui.Button("Close All", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.Windows("close") then 
                    CityHack.Util.Response("car windows", "close", true, false)
                else 
                    CityHack.Util.Response("car windows", "close", false, false)
                end
            end
            ImGui.PopID()
            ImGui.NextColumn()

            ---------------- CAR LIGHTS ---------------- 
            Theme.PushStyleColor(ImGuiCol.Text,	Theme.CustomToggleOn)
            ImGui.LabelText("##","LIGHTS")
            ImGui.PopStyleColor()
            ImGui.Spacing()

            local lights = table.concat(VehicleUI.LightStates, "\0")

            ImGui.PushItemWidth(Style.buttonWidth)
            VehicleUI.LightStateCurrent = ImGui.Combo("##Car Light State", VehicleUI.LightStateCurrent, lights, 3)
            ImGui.PopItemWidth()

            if ImGui.Button("Set Lights", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.Lights(VehicleUI.LightStateCurrent) then
                    CityHack.Util.Response("car lights", "set", true, false)
                else
                    CityHack.Util.Response("car lights", "set", false, false)
                end
            end

            ImGui.Spacing()
            ImGui.Spacing()
            ImGui.Spacing()
            ImGui.Spacing()
            ImGui.Separator()
            ImGui.Spacing()
            ImGui.Columns(1)

            ---------------- CAR ENGINE ---------------- 
            ImGui.Columns(2, "CarEngine", false)
            Theme.PushStyleColor(ImGuiCol.Text,	Theme.CustomToggleOn)
            ImGui.LabelText("##","ENGINE")
            ImGui.PopStyleColor()
            ImGui.Spacing()

                
            if ImGui.Button("Turn On", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.Engine("on") then
                    CityHack.Util.Response("vehicle engine", "on", true, false)
                else
                    CityHack.Util.Response("vehicle engine", "on", false, false)
                end
            end

            if ImGui.Button("Turn Off", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.Engine("off") then
                    CityHack.Util.Response("vehicle engine", "off", true, false)
                else
                    CityHack.Util.Response("vehicle engine", "off", false, false)
                end
            end

            ImGui.Spacing()
            ImGui.Spacing()

            ---------------- CAR MAYHEM ---------------- 
            Theme.PushStyleColor(ImGuiCol.Text,	Theme.CustomToggleOn)
            ImGui.LabelText("##","MAYHEM")
            ImGui.PopStyleColor()
            ImGui.Spacing()

            if ImGui.Button("Detach All Parts", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.DetachAll() then
                    CityHack.Util.Response("vehicle", "detach all", true, false)
                else
                    CityHack.Util.Response("vehicle", "detach all", false, false)
                end
            end

            if ImGui.Button("Destroy", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.Destroy() then
                    CityHack.Util.Response("vehicle", "destroy", true, false)
                else
                    CityHack.Util.Response("vehicle", "destroy", false, false)
                end
            end

            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("WARNING: Stand back! The explosion may kill you!")
            end

            ImGui.NextColumn()
            Theme.PushStyleColor(ImGuiCol.Text,	Theme.CustomToggleOn)
            ImGui.LabelText("##","UTILITY")
            ImGui.PopStyleColor()
            ImGui.Spacing()
            

            ---------------- CAR UTILITY ---------------- 
            if ImGui.Button("Repair", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.Repair() then
                    CityHack.Util.Response("vehicle", "repair", true, false)
                else
                    CityHack.Util.Response("vehicle", "repair", false, false)
                end
            end

            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("This will visually repair the vehicle but will\r\nnot re-attach missing parts or fix broken lights.")
            end

            if ImGui.Button("Honk & Flash", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.HonkFlash() then
                    CityHack.Util.Response("vehicle", "honk & flash", true, false)
                else
                    CityHack.Util.Response("vehicle", "honk & flash", false, false)
                end
            end

            if ImGui.Button("Set Immortal", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.SetGod() then
                    CityHack.Util.Response("vehicle", "set immortal", true, false)
                else
                    CityHack.Util.Response("vehicle", "set immortal", false, false)
                end
            end
            
            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("Sets vehicle to immortality meaning it can't be fully destroyed.\r\nWill still take visual damage.")
            end

            if ImGui.Button("Toggle Summon", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.ToggleSummonMode() then
                    CityHack.Util.Response("vehicle", "toggle summon mode", true, false)
                else
                    CityHack.Util.Response("vehicle", "toggle summon mode", false, false)
                end
            end

            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("Toggles between vehicle driving to you and car instant\r\nspawning in front of you when summoned.")
            end


            if ImGui.Button("! Cycle Look", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.CycleAppearance() then
                    CityHack.Util.Response("vehicle", "cycle appearance", true, false)
                else
                    CityHack.Util.Response("vehicle", "cycle appearance", false, false)
                end
            end

            if ImGui.Button("Despawn", Style.buttonWidth, Style.buttonHeight) then
                if CityHack.Vehicle.Despawn() then
                    CityHack.Util.Response("vehicle", "cycle appearance", true, false)
                else
                    CityHack.Util.Response("vehicle", "cycle appearance", false, false)
                end
            end

            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("! EXPERIMENTAL ! Cycle through vehicle appearances.")
            end

            ImGui.Columns(1)

        ImGui.EndTabItem()
        end
    end

end

return VehicleUI