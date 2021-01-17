local Observer = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
    loading = true,
    deltaTime = 0,
    LookingAt = "Nothing"
}

local Util = require(Observer.rootPath.."hacks.modules.utility")


function Observer.Tick(deltaTime)
    Observer.deltaTime = Observer.deltaTime + deltaTime

    -- if Observer.loading then 
    --     if Observer.deltaTime > 5 then
    --         Observer.loading = false
    --         Observer.deltaTime = 0
    --     end

    -- else
    if Observer.deltaTime > 1 then
        Observer.Update()
        Observer.deltaTime = Observer.deltaTime - 2
    end
    -- end
end

function Observer.Update()
    local player = Game.GetPlayer()
    
    if player then
        local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)

        if target then
            Observer.LookingAt = target:ToString()
        else 
            Observer.LookingAt = "Nothing"
        end
    end
end

function Observer.LookedObject()
    return Observer.LookingAt
end

function Observer.IsA(type)

    if type == Observer.LookingAt then 
        return true
    else 
        return false 
    end

end

return Observer