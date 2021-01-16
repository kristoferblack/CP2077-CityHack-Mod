local Vehicle = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
    objectType = "vehicleCarBaseObject",
    objectTypeBike = "vehicleBikeBaseObject",
    objectTypeAV = "vehicleAVBaseObject"
}

local Util = require(Vehicle.rootPath.."hacks.modules.utility")

function Vehicle.SetAsPlayerVehicle()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    local getTargetPS = getTarget:GetVehiclePS()

    getTargetPS:SetIsPlayerVehicle(1)
end

function Vehicle.Doors(state)
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Vehicle.objectType, getTarget) or Util.IsA(Vehicle.objectTypeAV, getTarget) then
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

function Vehicle.Windows(state)
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Vehicle.objectType, getTarget) then
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

function Vehicle.DetachAll()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Vehicle.objectType, getTarget) then
        getTarget:DetachAllParts()
        return true
    else
        return false
    end
end

function Vehicle.Destroy()  
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Vehicle.objectType, getTarget) then
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

function Vehicle.Repair()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Vehicle.objectType, getTarget) or Util.IsA(Vehicle.objectTypeBike, getTarget) then
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

function Vehicle.HonkFlash()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Vehicle.objectType, getTarget) or Util.IsA(Vehicle.objectTypeBike, getTarget) then
        local getTargetVC = getTarget:GetVehicleComponent()

        getTargetVC:HonkAndFlash()

        return true
    else
        return false
    end
end 

function Vehicle.Lights(state)
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Vehicle.objectType, getTarget) or Util.IsA(Vehicle.objectTypeBike, getTarget) or Util.IsA(Vehicle.objectTypeAV, getTarget) then
        local getTargetVC = getTarget:GetVehicleComponent()
        local getTargetVCPS = getTargetVC:GetVehicleControllerPS()

        getTargetVCPS:SetLightMode(state)

        return true
    else
        return false
    end
end

function Vehicle.Engine(state)
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Vehicle.objectType, getTarget) or Util.IsA(Vehicle.objectTypeBike, getTarget) or Util.IsA(Vehicle.objectTypeAV, getTarget) then
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

function Vehicle.Reset()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)
    
    if Util.IsA(Vehicle.objectType, getTarget) or Util.IsA(Vehicle.objectTypeBike, getTarget) then
        local getTargetVC = getTarget:GetVehicleComponent()

        getTargetVC:ResetVehicle()
    end
end

function Vehicle.SetGod()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Vehicle.objectType, getTarget) or Util.IsA(Vehicle.objectTypeBike, getTarget) then
        local getTargetVC = getTarget:GetVehicleComponent()

        getTargetVC:SetImmortalityMode()

        return true
    else
        return false
    end
end

function Vehicle.ToggleSummonMode()
    local vehicleSystem = Game.GetVehicleSystem()

    vehicleSystem:ToggleSummonMode()

    return true
end

function Vehicle.CycleAppearance()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Vehicle.objectType, getTarget) or Util.IsA(Vehicle.objectTypeBike, getTarget) then
        getTarget:ScheduleAppearanceChange("Randomize")
        
        return true
    else
        return false
    end
end

function Vehicle.Despawn()
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)
    local vehicleSystem = Game.GetVehicleSystem()
    local id = target:GetRecord():GetID()

    print(id)
    vehicleSystem.DespawnPlayerVehicle(id)

    --print(Game.GetTargetingSystem():GetLookAtObject(Game.GetPlayer(), false, false):GetRecord())

end

function Vehicle.DumpPS()
    local getPlayer = Game.GetPlayer()
    local getTarget = Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false)

    if Util.IsA(Vehicle.objectType, getTarget) then
        local getTargetPS = getTarget:GetVehiclePS()

        print(Dump(getTargetPS, false))
    end
end

return Vehicle

-- Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false):GetVehiclePS():SetDoorState(0, 1)