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

function Utility.DumpController()

end

-- Bump device persistent state
function Utility.DumpPS()
    local player = Game.GetPlayer()
    print(Dump(Game.GetTargetingSystem():GetLookAtObject(player,false,false):GetDevicePS(), false))
end

return Utility