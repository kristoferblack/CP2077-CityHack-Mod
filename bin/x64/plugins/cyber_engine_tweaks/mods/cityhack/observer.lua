local Observer = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
    loading = true,
    deltaTime = 0,
    LookingAt = "Nothing",
    LookingComp = "Nothing"
}

local Util = require(Observer.rootPath.."hacks.modules.utility")


function Observer.Tick(deltaTime)
    Observer.deltaTime = Observer.deltaTime + deltaTime

    if Observer.deltaTime > 1 then
        Observer.Update()
        Observer.deltaTime = Observer.deltaTime - 1
    end
end

function Observer.Update()
    local player = Game.GetPlayer()
    
    if player then
        local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)
        local targetComp = Game.GetTargetingSystem():GetLookAtComponent(player, false, false)

        if target then
            Observer.LookingAt = target
        end

        if targetComp then
            Observer.LookingComp = targetComp
        else
            Observer.LookingComp = "Nothing"
        end
    end
end

function Observer.LookedObject(string)
    if string and Observer.LookingAt ~= "Nothing" then
        return Observer.LookingAt:ToString()
    else
        return Observer.LookingAt
    end
end

function Observer.LookedComponent()
    if Observer.LookedComp ~= "Nothing" or Observer.LookedComp ~= nil then
        return Observer.LookingComp
    end
end

function Observer.DumpComponent()
    print(Dump(Observer.LookedComp,false))
end

function Observer.IsA(type)

    if type == Observer.LookedObject(true) then 
        return true
    else 
        return false 
    end


end

return Observer