local Door = {
    rootPath =  "cityhack."
}
local Util = require(Door.rootPath.."utility.utility")

function Door.Toggle(state)
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA("Door", getTarget) then
        local getTargetPS = getTarget:GetDevicePS()

        if state == "open" then
            getTargetPS:SetNewDoorType(1)
            getTargetPS:InitializeDoorTypes()

            if getTargetPS:IsLocked() then getTargetPS:ToggleLockOnDoor() end
            if getTargetPS:IsSealed() then getTargetPS:ToggleSealOnDoor() end

            getTarget:OpenDoor()

        elseif state == "close" then
            getTarget:CloseDoor()
        end

        return true

    elseif Util.IsA("FakeDoor", getTarget) then
        getTarget:Dispose()

        return true
    else
        return false
    end
end

function Door.SetType(type)
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA("Door", getTarget) then
        local getTargetPS = getTarget:GetDevicePS()

        --- DOOR TYPES ---
        -- NONE = 0,
        -- INTERACTIVE = 1,
        -- AUTOMATIC = 2,
        -- PHYSICAL = 3,
        -- REMOTELY_CONTROLLED = 4

        getTargetPS:SetNewDoorType(type)
        getTargetPS:InitializeDoorTypes()

        if getTargetPS:IsLocked() then getTargetPS:ToggleLockOnDoor() end
        if getTargetPS:IsSealed() then getTargetPS:ToggleSealOnDoor() end

        getTarget:OpenDoor()

        return true
    else
        return false
    end
end

function Door.ToggleLock()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA("Door", getTarget) then
        local getTargetPS = getTarget:GetDevicePS()

        getTargetPS:ToggleLockOnDoor()

        return true
    else
        return false
    end
end

function Door.ToggleSeal()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA("Door", getTarget) then
        local getTargetPS = getTarget:GetDevicePS()

        getTargetPS:ToggleSealOnDoor()

        return true
    else
        return false
    end
end
    
function Door.Reset()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    
    if Util.IsA("Door", getTarget) then
        local getTargetPS = getTarget:GetDevicePS()

        getTargetPS:ResetToDefault()

        return true
    else
        return false
    end
end

return Door