local Utility = {}


local function dumpToFile(obj, path)
	local dump = tostring(Dump(obj))
	local output = io.open(path or "output.txt", "w")
	
	print(dump)
	
	output:write(dump)
	output:close()
end

function Utility.Log(input)
    print("[CITY H4CK] "..input)
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

end

-- Bump device persistent state
function Utility.DumpPS()
    local player = Game.GetPlayer()
    print(Dump(Game.GetTargetingSystem():GetLookAtObject(player,false,false):GetDevicePS(), false))
end

return Utility