local Device = {
    rootPath = "cityhack."
}
local Utility = require(Device.rootPath.."utility.utility")

function Device.On()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    getTarget:TurnOnDevice()
end

function Device.Off()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    getTarget:TurnOffDevice()
end

function Device.ScreenOn()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    getTarget:TurnOnScreen()
end

function Device.ScreenOff()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    getTarget:TurnOffScreen()
end

function Device.CutPower()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    getTarget:CutPower()
end

return Device