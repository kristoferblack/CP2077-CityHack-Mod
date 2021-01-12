local Device = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
}
local Util = require(Device.rootPath.."hacks.modules.utility")

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

function Device.Activate()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    getTarget:ActivateDevice()
end

function Device.Deactivate()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    getTarget:DeactivateDevice()
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