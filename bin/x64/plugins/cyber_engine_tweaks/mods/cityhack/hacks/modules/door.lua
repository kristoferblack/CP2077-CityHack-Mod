local Door = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
}

local Util = require(Door.rootPath.."hacks.modules.utility")

function Door.Toggle(state, target)

    if Util.IsA("Door", target) then
        local targetPS = target:GetDevicePS()

        if state == "open" then

            if targetPS:IsLocked() then targetPS:ToggleLockOnDoor() end
            if targetPS:IsSealed() then targetPS:ToggleSealOnDoor() end

            target:OpenDoor()

        elseif state == "close" then
            target:CloseDoor()

        end

        return true

    else
        return false
    end
end

function Door.Dispose(target)

    if Util.IsA("FakeDoor", target) then
        target:Dispose()

        return true

    else
        return false
    end
    
end

function Door.SetType(type, observer)

    if not observer then return end

    if Util.IsA("Door", observer) then
        local targetPS = observer:GetDevicePS()

        --- DOOR TYPES ---
        -- NONE = 0,
        -- INTERACTIVE = 1,
        -- AUTOMATIC = 2,
        -- PHYSICAL = 3,
        -- REMOTELY_CONTROLLED = 4

        targetPS:SetNewDoorType(type)
        targetPS:InitializeDoorTypes()
        
        if targetPS:IsLocked() then targetPS:ToggleLockOnDoor() end
        if targetPS:IsSealed() then targetPS:ToggleSealOnDoor() end
        
        target:OpenDoor()

        return true
    else
        return false
    end

end

function Door.ToggleLock(target)

    if Util.IsA("Door", target) then
        local targetPS = target:GetDevicePS()

        targetPS:ToggleLockOnDoor()

        return true
    else
        return false
    end

end

function Door.ToggleSeal(target)

    if Util.IsA("Door", target) then
        local targetPS = target:GetDevicePS()

        targetPS:ToggleSealOnDoor()

        return true
    else
        return false
    end

end
    
function Door.Reset(target)
    
    if Util.IsA("Door", target) then
        local targetPS = target:GetDevicePS()

        targetPS:ResetToDefault()

        return true
    else
        return false
    end

end

function Door.Is(state, observer)

    if not observer then return end

    doorPS = observer:GetDevicePS()

    if state == "Open" then
        return doorPS:IsOpen()

    elseif state == "Locked" then
        return doorPS:IsLocked()

    elseif state == "Sealed" then
        return doorPS:IsSealed()

    elseif state == "Type" then
        local doorType = doorPS:GetDoorType()

        if doorType.value == "INTERACTIVE" then
            return 1
        
        elseif doorType.value == "AUTOMATIC" then
            return 2
        end
    end

end

return Door