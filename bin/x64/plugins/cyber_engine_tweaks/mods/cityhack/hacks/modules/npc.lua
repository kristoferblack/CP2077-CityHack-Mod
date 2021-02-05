local NPC = {
    objectType = "NPCPuppet"
}   

local Util = require("hacks/modules/utility")

function NPC.Kill()
    Game.Kill()
end

-- function NPC.MakeVendor()
--     -- local player = Game.GetPlayer()
--     -- local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)
--     -- local scriptSystem =  Game.GetScriptableSystemsContainer()
--     -- local marketSystem = scriptSystem:Get('MarketSystem')

--     -- local entityID = target:GetEntityID()
--     -- local vendorTweakID = marketSystem:GetVendorHashMap(entityID):GetVendorTweakID() -- ToTweakDBID{ hash = 0x2A5ECFA0, length = 27 }
--     -- local vendorType = marketSystem:GetVendorHashMap(entityID):GetVendorType()
--     -- local vendorRecord = marketSystem:GetVendorHashMap(entityID):GetVendorRecord()

--     -- print(target)

--     -- -- marketSystem:AddVendor(target)



--     -- marketSystem:GetVendorHashMap(target:GetEntityID()):GetVendorTweakID()
--     -- marketSystem:GetVendorHashMap(trg:GetEntityID())
--     -- print(ms:GetVendorHashMap(trg:GetEntityID()):GetVendorType())



-- end

return NPC