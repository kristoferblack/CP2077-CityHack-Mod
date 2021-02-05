local Vehicle = {
    objectType = "vehicleCarBaseObject",
    objectTypeBike = "vehicleBikeBaseObject",
    objectTypeAV = "vehicleAVBaseObject"
}

local Util = require("hacks/modules/utility")

function Vehicle.SetAsPlayerVehicle(target)
    local getTargetPS = target:GetVehiclePS()

    getTargetPS:SetIsPlayerVehicle(1)
end

function Vehicle.Doors(state, target)
    if Util.IsA(Vehicle.objectType, target) or Util.IsA(Vehicle.objectTypeAV, target) then
        local getTargetPS = target:GetVehiclePS()
        
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

function Vehicle.Windows(state, target)
    if Util.IsA(Vehicle.objectType, target) then
        local getTargetPS = target:GetVehiclePS()

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

function Vehicle.DetachAll(target)
    if Util.IsA(Vehicle.objectType, target) then
        target:DetachAllParts()
        return true
    else
        return false
    end
end

function Vehicle.Destroy(target)  
    if Util.IsA(Vehicle.objectType, target) then
        local getTargetPS = target:GetVehiclePS()
        local getTargetVC = target:GetVehicleComponent()

        getTargetVC:DestroyVehicle()
        getTargetVC:LoadExplodedState()
        getTargetVC:ExplodeVehicle(Game.GetPlayer())
        getTargetPS:ForcePersistentStateChanged()
        
        return true
    else
        return false
    end
end

function Vehicle.Repair(target)
    if Util.IsA(Vehicle.objectType, target) or Util.IsA(Vehicle.objectTypeBike, target) then
        local getTargetPS = target:GetVehiclePS()
        local getTargetVC = target:GetVehicleComponent()

        target:DestructionResetGrid()
        target:DestructionResetGlass()

        getTargetVC:RepairVehicle()
        getTargetPS:ForcePersistentStateChanged()

        return true
    else
        return false
    end
end

function Vehicle.HonkFlash(target)
    if Util.IsA(Vehicle.objectType, target) or Util.IsA(Vehicle.objectTypeBike, target) then
        local getTargetVC = target:GetVehicleComponent()

        getTargetVC:HonkAndFlash()

        return true
    else
        return false
    end
end 

function Vehicle.Lights(state, target)
    if Util.IsA(Vehicle.objectType, target) or Util.IsA(Vehicle.objectTypeBike, target) or Util.IsA(Vehicle.objectTypeAV, target) then
        local getTargetVC = target:GetVehicleComponent()
        local getTargetVCPS = getTargetVC:GetVehicleControllerPS()

        getTargetVCPS:SetLightMode(state)

        return true
    else
        return false
    end
end

function Vehicle.Engine(state, target)
    if Util.IsA(Vehicle.objectType, target) or Util.IsA(Vehicle.objectTypeBike, target) or Util.IsA(Vehicle.objectTypeAV, target) then
        local getTargetVC = target:GetVehicleComponent()
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

function Vehicle.Reset(target)
    if Util.IsA(Vehicle.objectType, target) or Util.IsA(Vehicle.objectTypeBike, target) then
        local getTargetVC = target:GetVehicleComponent()

        getTargetVC:ResetVehicle()
    end
end

function Vehicle.SetGod(target)
    if Util.IsA(Vehicle.objectType, target) or Util.IsA(Vehicle.objectTypeBike, target) then
        local getTargetVC = target:GetVehicleComponent()

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

function Vehicle.CycleAppearance(target)
    if Util.IsA(Vehicle.objectType, target) or Util.IsA(Vehicle.objectTypeBike, target) then
        target:ScheduleAppearanceChange("Randomize")
        
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
end

function Vehicle.PartState(part, target)
    vehiclePS = target:GetVehiclePS()

    if part == "door" then
        return vehiclePS:GetDoorState(1).value

    elseif part == "window" then
        return vehiclePS:GetWindowState(1).value
        
    elseif part == "lock" then
        return vehiclePS:GetDoorInteractionState(1).value
    end
end

function Vehicle.DumpPS(target)

    if Util.IsA(Vehicle.objectType, target) then
        local getTargetPS = target:GetVehiclePS()

        print(Dump(getTargetPS, false))
    end
end

return Vehicle

-- Game.GetTargetingSystem():GetLookAtObject(getPlayer, false, false):GetVehiclePS():SetDoorState(0, 1)