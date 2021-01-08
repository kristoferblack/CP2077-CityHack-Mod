local NPC = {
    rootPath =  "cityhack."
}
local Utility = require(NPC.rootPath.."utility.utility")

function NPC.Kill()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false) 

    getTarget:Kill(getPlayer, false, false)
end

return NPC