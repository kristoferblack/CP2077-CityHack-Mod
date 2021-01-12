local NPC = {
    rootPath =  "cityhack.",
    objectType = "NPCPuppet"
}   
local Util = require(NPC.rootPath.."utility.utility")

function NPC.Kill()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false) 

    if Util.IsA(NPC.objectType, getTarget) then
        getTarget:Kill(getPlayer, false, false)

        return true
    else
        return false
    end
end

return NPC