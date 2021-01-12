local DoorUI = {}

function DoorUI.Create(CityHack, style)
    if ImGui.BeginTabItem("Doors") then
        ImGui.SetWindowSize(265, 340)

        ---------------- BASIC ---------------- 
        ImGui.Columns(2, "DoorsBasic", false)

        ImGui.Spacing()
        ImGui.Text("Basic")
        ImGui.Spacing()

        if ImGui.Button("Open", style.buttonWidth, style.buttonHeight) then
            if CityHack.Door.Toggle("open") then
                CityHack.Util.Response("door", "open", true, false)
            else
                CityHack.Util.Response("door", "open", false, false)
            end
        end
        
        if ImGui.IsItemHovered() then
            ImGui.SetTooltip("This will automatically unseal and unlock any door and make it open.\r\nFor fake doors, it will delete them but be warned you'll probably fall through the map.")
        end

        if ImGui.Button("Close", style.buttonWidth, style.buttonHeight) then
            if CityHack.Door.Toggle("close") then
                CityHack.Util.Response("door", "close", true, false)
            else
                CityHack.Util.Response("door", "close", false, false)
            end
        end

        if ImGui.Button("Reset", style.buttonWidth, style.buttonHeight) then
            if not CityHack.Door.Reset() then
                CityHack.Util.Response("door", "reset", false, false)
            end
        end

        ImGui.Spacing()
        ImGui.NextColumn()


        ImGui.Columns(2, "ElevatorOther", false)
        
        ---------------- ELEVATOR GROUP ---------------- 
        ImGui.Spacing()
        ImGui.Text("Elevators")
        ImGui.Spacing()

        if ImGui.Button("Restore Access", style.buttonWidth, style.buttonHeight) then
            CityHack.Elevator.RestoreAccess()
        end

        if ImGui.IsItemHovered() then
            ImGui.SetTooltip("Look at elevator call panel to use this. Will restore access to any\r\nelevator that shows OFF on the call panel.\r\nUseful for exploring mission areas after mission is over.")
        end

        ImGui.Spacing()
        ImGui.NextColumn()

        ImGui.Separator()
        ImGui.Spacing()

        ---------------- OTHER BUTTONS ---------------- 
        ImGui.Text("Other")
        ImGui.Spacing()

        if ImGui.Button("Set Auto", style.buttonWidth, style.buttonHeight) then
            if CityHack.Door.SetType(2) then
                CityHack.Util.Response("door", "auto", true, false)
            else
                CityHack.Util.Response("door", "auto", false, false)
            end
        end

        if ImGui.IsItemHovered() then
            ImGui.SetTooltip("Set a door to auto, meaning it will automatically open when you approach.")
        end

        if ImGui.Button("Set Manual", style.buttonWidth, style.buttonHeight) then
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

    ImGui.EndTabItem()
    end
end

return DoorUI