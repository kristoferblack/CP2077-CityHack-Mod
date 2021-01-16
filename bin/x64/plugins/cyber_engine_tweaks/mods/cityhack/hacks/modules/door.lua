local Door = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
}

local Util = require(Door.rootPath.."hacks.modules.utility")

function Door.Toggle(state)
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)

    if Util.IsA("Door", target) then
        local targetPS = target:GetDevicePS()

        if state == "open" then
            targetPS:SetNewDoorType(1)
            targetPS:InitializeDoorTypes()

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

function Door.Dispose()
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)

    if Util.IsA("FakeDoor", target) then
        target:Dispose()

        return true

    else
        return false
    end
end

function Door.SetType(type)
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)

    if Util.IsA("Door", getTarget) then
        local targetPS = target:GetDevicePS()

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

function Door.ToggleLock()
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)

    if Util.IsA("Door", target) then
        local targetPS = getTarget:GetDevicePS()

        targetPS:ToggleLockOnDoor()

        return true
    else
        return false
    end
end

function Door.ToggleSeal()
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)

    if Util.IsA("Door", target) then
        local targetPS = target:GetDevicePS()

        targetPS:ToggleSealOnDoor()

        return true
    else
        return false
    end
end
    
function Door.Reset()
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)
    
    if Util.IsA("Door", target) then
        local targetPS = target:GetDevicePS()

        targetPS:ResetToDefault()

        return true
    else
        return false
    end
end

return Door