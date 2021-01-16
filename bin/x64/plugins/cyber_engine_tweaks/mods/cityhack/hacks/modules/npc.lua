local NPC = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
    objectType = "NPCPuppet"
}   
local Util = require(NPC.rootPath.."hacks.modules.utility")

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

function NPC.MakeVendor()
    -- local player = Game.GetPlayer()
    -- local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)
    -- local scriptSystem =  Game.GetScriptableSystemsContainer()
    -- local marketSystem = scriptSystem:Get('MarketSystem')

    -- local entityID = target:GetEntityID()
    -- local vendorTweakID = marketSystem:GetVendorHashMap(entityID):GetVendorTweakID() -- ToTweakDBID{ hash = 0x2A5ECFA0, length = 27 }
    -- local vendorType = marketSystem:GetVendorHashMap(entityID):GetVendorType()
    -- local vendorRecord = marketSystem:GetVendorHashMap(entityID):GetVendorRecord()

    -- print(target)

    -- -- marketSystem:AddVendor(target)



    -- marketSystem:GetVendorHashMap(target:GetEntityID()):GetVendorTweakID()
    -- marketSystem:GetVendorHashMap(trg:GetEntityID())
    -- print(ms:GetVendorHashMap(trg:GetEntityID()):GetVendorType())



end

return NPC