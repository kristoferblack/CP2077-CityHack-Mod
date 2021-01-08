local Door = {
    rootPath =  "cityhack."
}
local Utility = require(Door.rootPath.."utility.utility")

function Door.Open()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    Utility.Log("Attempting to open door...")

    if getTarget:IsA(CName.new "Door") then
        getTarget:OpenDoor()
        Utility.Log("SUCCESS - Door Opened!")
    else
        Utility.Log("ERROR - This object is not a door!")
    end
end

function Door.Close()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    Utility.Log("Attempting to close door...")

    if getTarget:IsA(CName.new "Door") then
        getTarget:OpenDoor()
        Utility.Log("SUCCESS - Door Closed!")
    else
        Utility.Log("ERROR - This object is not a door!")
    end
end

function Door.Auto()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetDevicePS()

    if getTarget:IsA(CName.new "Door") then
        Utility.Log("Attempting to make door automatic...")

        getTargetPS:SetNewDoorType(2)
        getTargetPS:InitializeDoorTypes()

        if getTargetPS:IsLocked() then
            getTargetPS:ToggleLockOnDoor()
        end

        getTarget:OpenDoor()

        Utility.Log("SUCCESS - Door set to automatic!")
    else
        Utility.Log("ERROR - Could not set door to automatic!")
    end
end

function Door.ToggleLock()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetDevicePS()

    if getTarget:IsA(CName.new "Door") then
        getTargetPS:ToggleLockOnDoor()
    end
end

function Door.ToggleSeal()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetDevicePS()

    if getTarget:IsA(CName.new "Door") then
        getTargetPS:ToggleSealOnDoor()
    end
end


function Door.Reset()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetDevicePS()

    Utility.Log("Resetting door to default state...")

    getTargetPS:ResetToDefault()
end

return Door