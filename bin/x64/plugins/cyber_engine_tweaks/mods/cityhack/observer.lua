local Observer = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
    deltaTime = 0,
    LookingAt = "Nothing"
}


local Cron = require(Observer.rootPath.."lib.cron")
local Util = require(Observer.rootPath.."hacks.modules.utility")

function Observer.Tick(time)
    Observer.deltaTime = Observer.deltaTime + time

    if Observer.deltaTime > 2 then
        local player = Game.GetPlayer()
        local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)

        if target then
            Observer.LookingAt = target:ToString()
        else 
            Observer.LookingAt = "Nothing"
        end

        Observer.deltaTime = Observer.deltaTime - 2
    end
end

function Observer.LookedObject()
    return Observer.LookingAt
end

return Observer