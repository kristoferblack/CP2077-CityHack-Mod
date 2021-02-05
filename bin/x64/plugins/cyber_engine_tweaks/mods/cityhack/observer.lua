Observer = {
    loading = true,
    deltaTime = 0,
    LookingAt = "Nothing"
}

local Util = require("hacks/modules/utility")


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

        if target then
            Observer.LookingAt = target

        else
            Observer.LookingAt = "Nothing"
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

function Observer.IsA(type)

    if type == Observer.LookedObject(true) then 
        return true
    else 
        return false 
    end


end

return Observer