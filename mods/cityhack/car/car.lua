local Car = {
    rootPath =  "cityhack."
}

local Utility = require(Car.rootPath.."utility.utility")

function Car.DetachAll()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    Utility.Log("Detaching all car parts!")

    getTarget:DetachAllParts()
end

function Car.SetAsPlayerVehicle()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()

    getTargetPS:SetIsPlayerVehicle(1)
end

function Car.SetExploded()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()

    getTargetPS:SetHasExploded(1)
end

function Car.OpenAllDoors()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()

    getTargetPS:OpenAllVehDoors()
end

function Car.CloseAllDoors()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()

    getTargetPS:CloseAllVehDoors()
end

function Car.LockAllDoors()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()

    getTargetPS:LockAllVehDoors()
end

function Car.UnlockAllDoors()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()

    getTargetPS:UnlockAllVehDoors()
end

function Car.OpenAllWindows()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()

    getTargetPS:OpenAllVehWindows()
end

function Car.CloseAllWindows()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()

    getTargetPS:CloseAllVehWindows()
end

function Car.Destroy()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()
    local getTargetVC = getTarget:GetVehicleComponent()

    getTargetVC:DestroyVehicle()
    getTargetVC:LoadExplodedState()
    getTargetVC:ExplodeVehicle(getPlayer)
    getTargetPS:ForcePersistentStateChanged()
end

function Car.Repair()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()
    local getTargetVC = getTarget:GetVehicleComponent()

    getTargetVC:RepairVehicle()
    getTargetPS:ForcePersistentStateChanged()
end

function Car.HonkFlash()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetVC = getTarget:GetVehicleComponent()

    getTargetVC:HonkAndFlash()
end 

function Car.Reset()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetVC = getTarget:GetVehicleComponent()

    getTargetVC:ResetVehicle()
end

function Car.SetGod()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetVC = getTarget:GetVehicleComponent()

    getTargetVC:SetImmortalityMode()
end

function Car.DumpPS()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()

    print(Dump(getTargetPS, false))
end

return Car