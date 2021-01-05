CityHack = { 
	description = ""
}

function CityHack:new()
	CityHack = {
        Door = {},
        Device = {},
        Screen = {}
    }

    setmetatable(CityHack, self)
    self.__index = self 
    
    print("=== CITY HAX LOADED ===")

    function CityHack.Door.Open()
        local player = Game.GetPlayer()
        Game.GetTargetingSystem():GetLookAtObject(player,false,false):OpenDoor()
    end

    function CityHack.Door.Close()
        local player = Game.GetPlayer()
        Game.GetTargetingSystem():GetLookAtObject(player,false,false):CloseDoor()
    end

    function CityHack.Door.Auto()
        local player = Game.GetPlayer()
        Game.GetTargetingSystem():GetLookAtObject(player,false,false):GetDevicePS():SetNewDoorType(2)
        Game.GetTargetingSystem():GetLookAtObject(player,false,false):GetDevicePS():InitializeDoorTypes()
        Game.GetTargetingSystem():GetLookAtObject(player,false,false):GetDevicePS():ToggleLockOnDoor()
    end

    function CityHack.Device.On()
        local player = Game.GetPlayer()
        Game.GetTargetingSystem():GetLookAtObject(player,false,false):TurnOnDevice()
    end

    function CityHack.Device.Off()
        local player = Game.GetPlayer()
        Game.GetTargetingSystem():GetLookAtObject(player,false,false):TurnOffDevice()
    end

    function CityHack.Device.ScreenOn()
        local player = Game.GetPlayer()
        Game.GetTargetingSystem():GetLookAtObject(player,false,false):TurnOnScreen()
    end

    function CityHack.Device.ScreenOff()
        local player = Game.GetPlayer()
        Game.GetTargetingSystem():GetLookAtObject(player,false,false):TurnOffScreen()
    end

    -- dump object
    function CityHack.Dump()
        local player = Game.GetPlayer()
        print(Dump(Game.GetTargetingSystem():GetLookAtObject(player,false,false)))
    end 

    -- Bump device persistent state
    function CityHack.DumpPS()
        local player = Game.GetPlayer()
        print(Dump(Game.GetTargetingSystem():GetLookAtObject(player,false,false):GetDevicePS()))
    end

	return CityHack
end

return CityHack:new()