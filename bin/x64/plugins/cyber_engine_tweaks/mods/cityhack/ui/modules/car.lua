local CarUI = {}

local CarLightState = 0


function CarUI.Create(style)

    if ImGui.BeginTabItem("Cars") then
        ImGui.SetWindowSize(265, 570)
        ImGui.Spacing()

        ---------------- CAR DOORS ---------------- 
        ImGui.Text("Doors")
        ImGui.Spacing()

        ImGui.Columns(2, "CarDoors", false)
        if ImGui.Button("Open All", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.Doors("open") then 
                CityHack.Util.Response("car doors", "open", true, false)
            else 
                CityHack.Util.Response("car doors", "open", false, false)
            end
        end

        if ImGui.Button("Close All", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.Doors("close") then 
                CityHack.Util.Response("car doors", "close", true, false)
            else 
                CityHack.Util.Response("car doors", "close", false, false)
            end
        end

        ImGui.NextColumn()

        if ImGui.Button("Lock All", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.Doors("lock") then 
                CityHack.Util.Response("car doors", "lock", true, false)
            else 
                CityHack.Util.Response("car doors", "lock", false, false)
            end
        end

        if ImGui.Button("Unlock All", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.Doors("lock") then 
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

        ImGui.Text("Windows")
        ImGui.Spacing()

        ImGui.PushID("CarWindowOpenAll")
        if ImGui.Button("Open All", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.Windows("open") then 
                CityHack.Util.Response("car windows", "open", true, false)
            else 
                CityHack.Util.Response("car windows", "open", false, false)
            end
        end
        ImGui.PopID()

        ImGui.PushID("CarWindowCloseAll")
        if ImGui.Button("Close All", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.Windows("close") then 
                CityHack.Util.Response("car windows", "close", true, false)
            else 
                CityHack.Util.Response("car windows", "close", false, false)
            end
        end
        ImGui.PopID()
        ImGui.NextColumn()

        ---------------- CAR LIGHTS ---------------- 
        ImGui.Text("Car Lights")
        ImGui.Spacing()

        local lightStates = {"Off", "Normal", "High Beams\0"}
        local lights = table.concat(lightStates, "\0")

        ImGui.PushItemWidth(style.buttonWidth)
        CarLightState = ImGui.Combo("##Car Light State", CarLightState, lights)
        ImGui.PopItemWidth()

        if ImGui.Button("Set Lights", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.Lights(CarLightState) then
                CityHack.Util.Response("car lights", "set", true, false)
            else
                CityHack.Util.Response("car lights", "set", false, false)
            end
        end

        ImGui.Spacing()
        ImGui.Separator()
        ImGui.Spacing()
        ImGui.Columns(1)

        ---------------- CAR ENGINE ---------------- 
        ImGui.Columns(2, "CarEngine", false)
        ImGui.Text("Engine")
        ImGui.Spacing()

            
        if ImGui.Button("Turn On", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.Engine("on") then
                CityHack.Util.Response("car engine", "on", true, false)
            else
                CityHack.Util.Response("car engine", "on", false, false)
            end
        end

        if ImGui.Button("Turn Off", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.Engine("off") then
                CityHack.Util.Response("car engine", "off", true, false)
            else
                CityHack.Util.Response("car engine", "off", false, false)
            end
        end

        ImGui.NextColumn()
        ImGui.Text("Utility")
        ImGui.Spacing()

        ---------------- CAR UTILITY ---------------- 
        if ImGui.Button("Repair Car", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.Repair() then
                CityHack.Util.Response("car", "repair", true, false)
            else
                CityHack.Util.Response("car", "repair", false, false)
            end
        end

        if ImGui.IsItemHovered() then
            ImGui.SetTooltip("This will visually repair the vehicle but will\r\nnot re-attach missing parts or fix broken lights.")
        end

        if ImGui.Button("Honk & Flash", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.HonkFlash() then
                CityHack.Util.Response("car", "honk & flash", true, false)
            else
                CityHack.Util.Response("car", "honk & flash", false, false)
            end
        end

        if ImGui.Button("Set Immortal", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.SetGod() then
                CityHack.Util.Response("car", "set immortal", true, false)
            else
                CityHack.Util.Response("car", "set immortal", false, false)
            end
        end

        if ImGui.IsItemHovered() then
            ImGui.SetTooltip("Sets car to immortality meaning it can't be fully destroyed.\r\nWill still take visual damage.")
        end

        ImGui.Columns(1)
        ImGui.Spacing()
        ImGui.Separator()
        ImGui.Spacing()


        ---------------- CAR MAYHEM ---------------- 
        ImGui.Text("Mayhem")
        ImGui.Spacing()

        if ImGui.Button("Detach All Parts", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.DetachAll() then
                CityHack.Util.Response("car", "detach all", true, false)
            else
                CityHack.Util.Response("car", "detach all", false, false)
            end
        end

        if ImGui.Button("Destroy Car", style.buttonWidth, style.buttonHeight) then
            if CityHack.Car.Destroy() then
                CityHack.Util.Response("car", "destroy", true, false)
            else
                CityHack.Util.Response("car", "destroy", false, false)
            end
        end

        if ImGui.IsItemHovered() then
            ImGui.SetTooltip("WARNING: Stand back! The explosion may kill you!")
        end

    ImGui.EndTabItem()
    end

end

return CarUI