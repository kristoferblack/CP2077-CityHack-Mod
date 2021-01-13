local Utility = {
    prefix = "[CITY H4CK] "
}

function Utility.Log(input)
    print(Utility.prefix..input)
end

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

-- dump object
function Utility.Dump()
    local player = Game.GetPlayer()
    local dump = Game.GetTargetingSystem():GetLookAtObject(player,false,false)
    print(Dump(dump, false))
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

function Utility.DumpController()
    local player = Game.GetPlayer()
    print(Dump(Game.GetTargetingSystem():GetLookAtObject(player,false,false):GetController(), false))
end

-- Bump device persistent state
function Utility.DumpPS()
    local player = Game.GetPlayer()
    print(Dump(Game.GetTargetingSystem():GetLookAtObject(player,false,false):GetDevicePS(), false))
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

return Utility