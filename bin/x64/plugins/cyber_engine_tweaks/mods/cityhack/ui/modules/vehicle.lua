local VehicleUI = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",

    VehicleHeaderLabel = "VEHICLES",

    LightStateCurrent = 0,
    LightStates = {"Off", "Normal", "High Beams"},

    ValidVehicleTypes = {
        "vehicleCarBaseObject",
        "vehicleBikeBaseObject",
        "vehicleAVBaseObject"
    }
}

local Theme = require(VehicleUI.rootPath.."ui.theme")
local Util = require(VehicleUI.rootPath.."hacks.modules.utility")

function VehicleUI.Create(CityHack, Style, Observer)

    local LookedObject = Observer.LookedObject()


    if Util.IfArrayHasValue(VehicleUI.ValidVehicleTypes, LookedObject) then

        ImGui.SetNextItemOpen(true)
        if ImGui.CollapsingHeader(VehicleUI.VehicleHeaderLabel) then

            ---------------- CAR DOORS ---------------- 
            Theme.DisplayLabel("Doors")

            ImGui.Columns(2, "CarDoors", false)

            if CityHack.Vehicle.PartState("door", LookedObject) == "Open" then

                if ImGui.Button("Close All", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Vehicle.Doors("close", LookedObject)
                end

            elseif CityHack.Vehicle.PartState("door", LookedObject) == "Closed" then

                if ImGui.Button("Open All", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Vehicle.Doors("open", LookedObject)
                end
            end

            ImGui.NextColumn()

            if CityHack.Vehicle.PartState("lock", LookedObject) == "Available" then

                if ImGui.Button("Lock All", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Vehicle.Doors("lock", LookedObject)
                end
            
            else
                if ImGui.Button("Unlock All", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Vehicle.Doors("unlock", LookedObject)
                end
            end
            ImGui.Columns(1)

            Theme.InsertSeparator()

            ---------------- CAR WINDOWS ---------------- 
            ImGui.Columns(2, "CarWindows", false)

            Theme.DisplayLabel("Windows")

            if CityHack.Vehicle.PartState("window", LookedObject) == "Open" then
                ImGui.PushID("CarWindowCloseAll")
                if ImGui.Button("Close All", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Vehicle.Windows("close", LookedObject)
                end
                ImGui.PopID()
                
            elseif CityHack.Vehicle.PartState("window", LookedObject) == "Closed" then
                ImGui.PushID("CarWindowOpenAll")
                if ImGui.Button("Open All", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Vehicle.Windows("open", LookedObject)
                end
                ImGui.PopID()
            end

            ImGui.NextColumn()

            ---------------- CAR LIGHTS ---------------- 
            Theme.DisplayLabel("Lights")

            local lights = table.concat(VehicleUI.LightStates, "\0")

            ImGui.PushItemWidth(Style.buttonWidth)
            VehicleUI.LightStateCurrent = ImGui.Combo("##Car Light State", VehicleUI.LightStateCurrent, lights, 3)
            ImGui.PopItemWidth()

            if ImGui.Button("Set Lights", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Vehicle.Lights(VehicleUI.LightStateCurrent, LookedObject)
            end

            Theme.InsertSeparator()
            ImGui.Columns(1)

            ---------------- CAR ENGINE ---------------- 
            ImGui.Columns(2, "CarEngine", false)

            Theme.DisplayLabel("Engine")

                
            if ImGui.Button("Turn On", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Vehicle.Engine("on", LookedObject)
            end

            if ImGui.Button("Turn Off", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Vehicle.Engine("off", LookedObject)
            end


            ---------------- CAR MAYHEM ---------------- 
            Theme.DisplayLabel("Mayhem")

            if ImGui.Button("Detach Parts", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Vehicle.DetachAll(LookedObject)
            end

            if ImGui.Button("Destroy", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Vehicle.Destroy(LookedObject)
            end

            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("WARNING: Stand back! The explosion may kill you!")
            end

            ImGui.NextColumn()

            Theme.DisplayLabel("Utility")
            

            ---------------- CAR UTILITY ---------------- 
            if ImGui.Button("Repair", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Vehicle.Repair(LookedObject)
            end

            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("This will visually repair the vehicle but will\r\nnot re-attach missing parts or fix broken lights.")
            end

            if ImGui.Button("Honk & Flash", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Vehicle.HonkFlash(LookedObject)
            end

            -- if ImGui.Button("Set Immortal", Style.buttonWidth, Style.buttonHeight) then
            --     CityHack.Vehicle.SetGod(LookedObject)
            -- end
            
            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("Sets vehicle to immortality meaning it can't be fully destroyed.\r\nWill still take visual damage.")
            end

            if ImGui.Button("Toggle Summon", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Vehicle.ToggleSummonMode(LookedObject)
            end

            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("Toggles between vehicle driving to you and car instant\r\nspawning in front of you when summoned.")
            end


            if ImGui.Button("! Cycle Look", Style.buttonWidth, Style.buttonHeight) then
                CityHack.Vehicle.CycleAppearance(LookedObject)
            end

            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("! EXPERIMENTAL ! Cycle through vehicle appearances.")
            end

            -- if ImGui.Button("Despawn", Style.buttonWidth, Style.buttonHeight) then
            --     if CityHack.Vehicle.Despawn() then
            --         CityHack.Util.Response("vehicle", "cycle appearance", true, false)
            --     else
            --         CityHack.Util.Response("vehicle", "cycle appearance", false, false)
            --     end
            -- end

            ImGui.Columns(1)

            Theme.Spacing(3)
        end
    end

end

return VehicleUI