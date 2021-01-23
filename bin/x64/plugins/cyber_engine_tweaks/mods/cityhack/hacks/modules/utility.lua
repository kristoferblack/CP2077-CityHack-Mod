local Utility = {
    prefix = "[CITY H4CK] "
}

function Utility.Log(input)
    print(Utility.prefix..input)
end

function Utility.IfArrayHasValue(items, val)
    local innerVal = val

    if type(val) ~= "string" then innerVal = val:ToString() end

    for index, value in ipairs(items) do
        if value == innerVal then
            return true
        end
    end

    return false
end

-- Lua doesnt have regex, ree?
-- function Utility.FormatText(text)
--     if not text then return end
    
--     return Regex.Replace(tostring(text), "([a-z?])[_ ]?([A-Z])", "$1 $2")
-- end

function Utility.Response(system, action, result, context)

    separator = " - "

    if not context then
        contextSeparator = ""
        context = ""
    else
        contextSeparator = separator
    end

    if result then
        result = "SUCCESS"
    else
        result = "FAILURE"
        contextSeparator = separator
        context = "Not looking at correct object type"
    end

    print(Utility.prefix .. system.upper(system) .. separator .. action.upper(action) .. separator .. result.upper(result) .. contextSeparator .. context)

end

function Utility.IsA(kind, value)
    if type(value) == kind then
        return true
    end

    if value == nil or (type(value) ~= "userdata" and type(value) ~= "table") then
        return false
    end

    if value["IsA"] then
        return value:IsA(kind)
    end

    if value["ToString"] then
        return value:ToString() == kind
    end

    return false
end

-- dump object
function Utility.Dump()
    local player = Game.GetPlayer()
    local dump = Game.GetTargetingSystem():GetLookAtObject(player,false,false)
    print(Dump(dump, false))
end 

function Utility.DumpController()
    local player = Game.GetPlayer()
    print(Dump(Game.GetTargetingSystem():GetLookAtObject(player,false,false):GetController(), false))
end

-- Bump device persistent state
function Utility.DumpPS()
    local player = Game.GetPlayer()
    print(Dump(Game.GetTargetingSystem():GetLookAtObject(player,false,false):GetDevicePS(), false))
    -- print(Dump(Game.GetTargetingSystem():GetLookAtObject(player,false,false):GetDevicePS():GetSecuritySystem(), false))
end

-- Bump device persistent state
function Utility.DumpParents()
    local player = Game.GetPlayer()
    local devicePS = Game.GetTargetingSystem():GetLookAtObject(player,false,false):GetDevicePS()
    local deviceParents = devicePS:GetImmediateParents()

    if deviceParents == nil or #deviceParents == 0 then
        print("No parents found for", devicePS:ToString())

        return
    end

    for _, parent in ipairs(deviceParents) do
        print(Dump(parent, false))
    end
end

function Utility.PlayerVehicles()
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player,false,false)
    local unlockedVehicles = Game.GetVehicleSystem():GetPlayerUnlockedVehicles()

    if unlockedVehicles == nil or #unlockedVehicles == 0 then
        print("No parents found for", devicePS:ToString())

        return
    end

    for _, vehicle in ipairs(unlockedVehicles) do
        print(vehicle.recordID)
    end
end

function Utility.DumpTweakDBID()
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player,false,false)

    print( target:GetRecordID() )
end

function Utility.DumpLightComponents()
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player,false,false)
    local comps = target.lightComponents

    print(#comps)

    for _, component in ipairs(comps) do
        print(_)
        -- print(component)
        print(GameDump(component))

    end
end

function Utility.DumpVendorItems()
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)
    -- local targetPS = target:GetDevicePS()
    local scriptSystem =  Game.GetScriptableSystemsContainer()
    local marketSystem = scriptSystem:Get('MarketSystem')
    local subCharSystem = scriptSystem:Get("SubCharacterSystem")
    local cityLightSystem = scriptSystem:Get("CityLightSystem")

    print( Dump(cityLightSystem, false) )
    -- local vendor = marketSystem:GetVendor(target)

    -- subCharSystem:AddFlathead()

    -- print( Dump( subCharSystem,false ) )

    -- print(target:GetRecordID())

    -- print( GameDump( subCharSystem:GetAllSubCharacters() ) )

    -- print( subCharSystem:GetFlathead():GetEntityID() )

    -- print( subCharSystem:IsFlatheadFollowing() )

    -- subCharSystem:AddFlathead()
    -- subCharSystem:AddSubCharacter(target)
    -- subCharSystem:ShowFlatheadUI(false)


    -- vendor:RegenerateStock()

    -- for _, item in ipairs(vendor:GetStock()) do
    --     local quantity = item.quantity

    --     print(Dump(item,false))
    -- end

    -- target:PlayItemFall()
end

return Utility