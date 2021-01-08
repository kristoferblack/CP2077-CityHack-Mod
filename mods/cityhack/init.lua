CityHack = { 
    description = "",
    rootPath =  "cityhack."
}

function CityHack:new()

    setmetatable(CityHack, self)
    self.__index = self 

    CityHack.Utility = require(CityHack.rootPath.."utility.utility")
    
    CityHack.Utility.Log("Loaded!")

    CityHack.Door = require(CityHack.rootPath.."door.door")
    CityHack.Device = require(CityHack.rootPath.."device.device")
    CityHack.Car = require(CityHack.rootPath.."car.car")
    CityHack.NPC = require(CityHack.rootPath.."npc.npc")

    registerForEvent("onInit", function()

    end)
      
    registerForEvent("onUpdate", function(deltaTime)
        if (ImGui.IsKeyPressed(0x71, false)) then 
          drawWindow = not drawWindow
        end
    end)

    registerForEvent("onConsoleOpen", function()
        drawWindow = true
      end)
      
    registerForEvent("onConsoleClose", function()
        drawWindow = false
    end)

    registerForEvent("onDraw", function()

        ImGui.SetNextWindowPos(500, 500, ImGuiCond.FirstUseEver)
        ImGui.SetNextWindowSize(250, 250, ImGuiCond.Appearing)

        if (drawWindow) then

            ImGui.PushStyleColor(ImGuiCol.Border, 0.56, 0.06, 0.03, 1)
            ImGui.PushStyleColor(ImGuiCol.Tab, 1, 0.2, 0.2, 0.5)
            ImGui.PushStyleColor(ImGuiCol.TabHovered, 1, 0.2, 0.2, 0.85)
            ImGui.PushStyleColor(ImGuiCol.TabActive, 1, 0.2, 0.2, 1)
            ImGui.PushStyleColor(ImGuiCol.TitleBg, 0.56, 0.06, 0.03, 0.5)
            ImGui.PushStyleColor(ImGuiCol.TitleBgActive, 0.56, 0.06, 0.03, 1)
            ImGui.PushStyleColor(ImGuiCol.TitleBgCollapsed, 0.56, 0.06, 0.03, 0.25)
            ImGui.PushStyleColor(ImGuiCol.Button, 0.56, 0.06, 0.03, 0.6)
            ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.56, 0.06, 0.03, 0.75)
            ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.56, 0.06, 0.03, 1)
            ImGui.PushStyleColor(ImGuiCol.ResizeGrip, 0.56, 0.06, 0.03, 0.6)
            ImGui.PushStyleColor(ImGuiCol.ResizeGripHovered, 0.56, 0.06, 0.03, 0.75)
            ImGui.PushStyleColor(ImGuiCol.ResizeGripActive, 0.56, 0.06, 0.03, 1)
                

            if (ImGui.Begin("CITY H4CK")) then
                
                local style = {
                    buttonWidth = -1,
                    buttonHeight = 20,
                    halfButtonWidth = (ImGui.GetWindowContentRegionWidth() / 2) - 4.3
                }

                if (ImGui.BeginTabBar("CITYH4CKTABS")) then
                    -- Begin Door Tab
                    if (ImGui.BeginTabItem("Doors")) then

                        -- Door Group
                        ImGui.Text("Basic")
                        ImGui.Spacing()
                        ImGui.SameLine(8)

                        if (ImGui.Button("Open", style.halfButtonWidth, style.buttonHeight)) then
                            CityHack.Door.Open()
                        end

                        ImGui.SameLine()
                        if (ImGui.Button("Close", style.halfButtonWidth, style.buttonHeight)) then
                            CityHack.Door.Close()
                        end
                        -- End Door Group

                        ImGui.Spacing()

                        -- Toggle Lock Group
                        ImGui.Text("Locks / Seals")
                        ImGui.Spacing()
                        ImGui.SameLine(8)

                        if (ImGui.Button("Toggle Lock", style.halfButtonWidth, style.buttonHeight)) then
                            CityHack.Door.ToggleLock()
                        end

                        ImGui.SameLine()
                        if (ImGui.Button("Toggle Seal", style.halfButtonWidth, style.buttonHeight)) then
                            CityHack.Door.ToggleSeal()
                        end
                        -- End Lock Group

                        ImGui.Spacing()

                        -- Other Buttons 
                        ImGui.Text("Other")
                        if (ImGui.Button("Set Auto Door", buttonWidth, style.buttonHeight)) then
                            CityHack.Door.Auto()
                        end
                        -- End Other Buttons
   
                    ImGui.EndTabItem()
                    end
                    -- End Door Tab
                    
                    -- Begin Devices Tab
                    if (ImGui.BeginTabItem("Devices")) then
                        ImGui.Spacing()

                        if (ImGui.Button("Turn On", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Device.On()
                        end

                        if (ImGui.Button("Turn Off", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Device.Off()
                        end

                        if (ImGui.Button("Cut Power", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Device.CutPower()
                        end
                    ImGui.EndTabItem()
                    end
                    -- End Devices Tab

                    -- Begin Cars Tab
                    if (ImGui.BeginTabItem("Cars")) then
                        ImGui.Spacing()

                        if (ImGui.Button("Detach All Parts", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Car.DetachAll()
                        end

                        if (ImGui.Button("Open All Doors", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Car.OpenAllDoors()
                        end
        
                        if (ImGui.Button("Close All Doors", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Car.CloseAllDoors()
                        end

                        if (ImGui.Button("Lock All Doors", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Car.LockAllDoors()
                        end

                        if (ImGui.Button("Unlock All Doors", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Car.UnlockAllDoors()
                        end

                        
                        if (ImGui.Button("Open All Windows", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Car.OpenAllWindows()
                        end

                        if (ImGui.Button("Close All Windows", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Car.CloseAllWindows()
                        end

                        if (ImGui.Button("Destroy Car", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Car.Destroy()
                        end

                        if (ImGui.Button("Repair Car", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Car.Repair()
                        end

                        if (ImGui.Button("Honk & Flash", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Car.HonkFlash()
                        end

                        if (ImGui.Button("Set Immortality", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Car.SetGod()
                        end
                    ImGui.EndTabItem()
                    end
                    -- End Cars Tab

                    -- Begin NPC Tab
                    if (ImGui.BeginTabItem("NPC")) then
                        ImGui.Spacing()

                        if (ImGui.Button("Kill", style.buttonWidth, style.buttonHeight)) then
                            CityHack.NPC.Kill()
                        end

                    ImGui.EndTabItem()
                    end
                    -- End NPC Tab

                    -- Begin Util Tab
                    if (ImGui.BeginTabItem("Util")) then
                        ImGui.Spacing()

                        ImGui.PushTextWrapPos()
                        ImGui.Text("These are debug utilites to dump different types of data into console. They have no effect in the game.")
                        ImGui.PopTextWrapPos()

                        ImGui.Spacing()

                        if (ImGui.Button("Dump", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Utility.Dump()
                        end
    
                        if (ImGui.Button("Dump Device PS", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Utility.DumpPS()
                        end

                        if (ImGui.Button("Dump Vehicle PS", style.buttonWidth, style.buttonHeight)) then
                            CityHack.Car.DumpPS()
                        end
                    ImGui.EndTabItem()
                    end
                    -- End Util Tab
                ImGui.EndTabBar()
                end
            ImGui.PopStyleColor(13)
            end
            ImGui.End()
        end
    end)    
      

	return CityHack
end

return CityHack:new()