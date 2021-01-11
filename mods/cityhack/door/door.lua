local Door = {
    rootPath =  "cityhack."
}
local Util = require(Door.rootPath.."utility.utility")

function Door.Toggle(state)
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA("Door", getTarget) then
        local getTargetPS = getTarget:GetDevicePS()

        if getTargetPS:IsLocked() then CityHack.Door.ToggleLock() end
        if getTargetPS:IsSealed() then CityHack.Door.ToggleSeal() end

        if state == "open" then
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

        if getTargetPS:IsLocked() then CityHack.Door.ToggleLock() end
        if getTargetPS:IsSealed() then CityHack.Door.ToggleSeal() end

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

        if getTargetPS:IsLocked() then
            getTargetPS:ToggleLockOnDoor()
            CityHack.Util.Log("DOOR WAS LOCKED - NOW UNLOCKED")

        elseif getTargetPS:IsLocked() == false then
            getTargetPS:ToggleLockOnDoor()
            CityHack.Util.Log("DOOR WAS UNLOCKED - NOW LOCKED")
        end

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
        
        if getTargetPS:IsSealed() then
            getTargetPS:ToggleSealOnDoor()
            CityHack.Util.Log("SUCCESS - DOOR WAS SEALED - NOW UNSEALED")

        elseif getTargetPS:IsSealed() == false then
            getTargetPS:ToggleSealOnDoor()
            CityHack.Util.Log("SUCCESS - DOOR WAS UNSEALED - NOW SEALED")
        end

        return true
    else
        return false
    end
end
    
function Door.Reset()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetDevicePS()

    CityHack.Util.Log("DOOR RESET - SUCCESS")

    getTargetPS:ResetToDefault()
end

return Door