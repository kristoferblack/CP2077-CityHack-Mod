local DoorUI = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
    ValidDoorTypes = {
        "Door",
        "FakeDoor"
    },

    DoorHeaderLabel = "DOORS",
    ButtonLockedLabel = nil,
    ButtonSealedLabel = nil,
    ButtonAutoLabel = "Set Auto",
    ButtonManualLabel = "Set Manual",
    ButtonResetLabel = "Reset"
}

local Theme = require(DoorUI.rootPath.."ui.theme")
local Util = require(DoorUI.rootPath.."hacks.modules.utility")

function DoorUI.Create(CityHack, Style, Observer)

    local LookedObject = Observer.LookedObject()

    if Util.IfArrayHasValue(DoorUI.ValidDoorTypes, LookedObject) then

        if Util.IsA("Door", LookedObject) then

            if CityHack.Door.Is("Locked", LookedObject) then
                DoorUI.ButtonLockedLabel = "Unlock"
            else
                DoorUI.ButtonLockedLabel = "Lock"
            end

            if CityHack.Door.Is("Sealed", LookedObject) then
                DoorUI.ButtonSealedLabel = "Unseal"
            else
                DoorUI.ButtonSealedLabel = "Seal"
            end

            ImGui.SetNextItemOpen(true)
        else
            ImGui.SetNextItemOpen(false)
        end


        if ImGui.CollapsingHeader(DoorUI.DoorHeaderLabel) then
            
            ---------------- BASIC ---------------- 
            Theme.DisplayLabel("Basic") 

            if Util.IsA("Door", LookedObject) then
                if not CityHack.Door.Is("Open", LookedObject) then
                    if ImGui.Button("Open", Style.buttonWidth, Style.buttonHeight) then
                        CityHack.Door.Toggle("open", LookedObject)
                    end

                    if ImGui.IsItemHovered() then
                        ImGui.SetTooltip("This will automatically unseal and unlock any door and make it open.")
                    end
                end

                if CityHack.Door.Is("Open", LookedObject) then
                    if ImGui.Button("Close", Style.buttonWidth, Style.buttonHeight) then
                        CityHack.Door.Toggle("close", LookedObject)
                    end
                end
            end

            if Util.IsA("FakeDoor", LookedObject) then
                if ImGui.Button("Delete Fake Door", Style.buttonWidth, Style.buttonHeight) then
                    CityHack.Door.Dispose(LookedObject)
                end

                if ImGui.IsItemHovered() then
                    ImGui.SetTooltip("WARNING! This will PERMANENTLY delete this fake door. You'll have to reload a\r\nprevious save to get it back.")
                end
            end

            Theme.InsertSeparator()

            Theme.DisplayLabel("Toggles")

            if ImGui.Button(DoorUI.ButtonLockedLabel, Style.halfButtonWidth, Style.buttonHeight) then
                CityHack.Door.ToggleLock(LookedObject)
            end

            ImGui.SameLine()

            if ImGui.Button(DoorUI.ButtonSealedLabel, Style.halfButtonWidth, Style.buttonHeight) then
                CityHack.Door.ToggleSeal(LookedObject)
            end

            Theme.InsertSeparator()

            ---------------- OTHER BUTTONS ---------------- 
            Theme.DisplayLabel("Other")

            if CityHack.Door.Is("Type", LookedObject) == 1 then
                if ImGui.Button(DoorUI.ButtonAutoLabel, Style.halfButtonWidth, Style.buttonHeight) then
                    CityHack.Door.SetType(2, LookedObject)
                end

                if ImGui.IsItemHovered() then
                    ImGui.SetTooltip("Set a door to auto, meaning it will automatically open when you approach.")
                end

            elseif CityHack.Door.Is("Type", LookedObject) == 2 then
                if ImGui.Button(DoorUI.ButtonManualLabel, Style.halfButtonWidth, Style.buttonHeight) then
                    CityHack.Door.SetType(1, LookedObject)
                end

                if ImGui.IsItemHovered() then
                    ImGui.SetTooltip("Sets door back to manual so interaction is required to open door.")
                end
            end

            ImGui.SameLine()

            if ImGui.Button(DoorUI.ButtonResetLabel, Style.halfButtonWidth, Style.buttonHeight) then
                CityHack.Door.Reset(LookedObject)
            end

            if ImGui.IsItemHovered() then
                ImGui.SetTooltip("Reset the door to it's default game state.")
            end



            Theme.Spacing(3)

        end
    end
end

return DoorUI