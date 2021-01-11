local Car = {
    rootPath =  "cityhack.",
    objectType = "vehicleCarBaseObject"
}

local Util = require(Car.rootPath.."utility.utility")

function Car.SetAsPlayerVehicle()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()

    getTargetPS:SetIsPlayerVehicle(1)
end

function Car.Doors(state)
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Car.objectType, getTarget) then
        local getTargetPS = getTarget:GetVehiclePS()
        
        if state == "open" then
            getTargetPS:OpenAllRegularVehDoors()
        elseif state == "close" then
            getTargetPS:CloseAllVehDoors()
        elseif state == "lock" then
            getTargetPS:LockAllVehDoors()
        elseif state == "unlock" then
            getTargetPS:UnlockAllVehDoors()
        end
        
        return true
    else
        return false
    end
end

function Car.Windows(state)
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Car.objectType, getTarget) then
        local getTargetPS = getTarget:GetVehiclePS()

        if state == "open" then 
            getTargetPS:OpenAllVehWindows()

        elseif state == "close" then
            getTargetPS:CloseAllVehWindows()
        end
            
        return true
    else
        return false
    end
end

function Car.DetachAll()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Car.objectType, getTarget) then
        getTarget:DetachAllParts()
        return true
    else
        return false
    end
end

function Car.Destroy()  
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Car.objectType, getTarget) then
        local getTargetPS = getTarget:GetVehiclePS()
        local getTargetVC = getTarget:GetVehicleComponent()

        getTargetVC:DestroyVehicle()
        getTargetVC:LoadExplodedState()
        getTargetVC:ExplodeVehicle(getPlayer)
        getTargetPS:ForcePersistentStateChanged()
        
        return true
    else
        return false
    end
end

function Car.Repair()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Car.objectType, getTarget) then
        local getTargetPS = getTarget:GetVehiclePS()
        local getTargetVC = getTarget:GetVehicleComponent()

        getTarget:DestructionResetGrid()
        getTarget:DestructionResetGlass()

        getTargetVC:RepairVehicle()
        getTargetPS:ForcePersistentStateChanged()

        return true
    else
        return false
    end
end

function Car.HonkFlash()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Car.objectType, getTarget) then
        local getTargetVC = getTarget:GetVehicleComponent()

        getTargetVC:HonkAndFlash()

        return true
    else
        return false
    end
end 

function Car.Lights(state)
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Car.objectType, getTarget) then
        local getTargetVC = getTarget:GetVehicleComponent()
        local getTargetVCPS = getTargetVC:GetVehicleControllerPS()

        getTargetVCPS:SetLightMode(state)

        return true
    else
        return false
    end
end

function Car.Engine(state)
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Car.objectType, getTarget) then
        local getTargetVC = getTarget:GetVehicleComponent()
        local getTargetVCPS = getTargetVC:GetVehicleControllerPS()

        if state == "on" then 
            getTargetVCPS:SetState(2)
        elseif state == "off" then
            getTargetVCPS:SetState(1)
        end

        return true
    else
        return false
    end 
end

function Car.Reset()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    
    if Util.IsA(Car.objectType, getTarget) then
        local getTargetVC = getTarget:GetVehicleComponent()

        getTargetVC:ResetVehicle()
    end
end

function Car.SetGod()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Car.objectType, getTarget) then
        local getTargetVC = getTarget:GetVehicleComponent()

        getTargetVC:SetImmortalityMode()

        return true
    else
        return false
    end
end

function Car.DumpPS()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Car.objectType, getTarget) then
        local getTargetPS = getTarget:GetVehiclePS()

        print(Dump(getTargetPS, false))
    end
end

return Car

-- Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false):GetVehiclePS():SetDoorState(0, 1)