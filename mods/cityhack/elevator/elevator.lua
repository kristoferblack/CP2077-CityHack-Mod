Elevator = { 
    description = "",
    rootPath =  "cityhack."
}

local Utility = require(Elevator.rootPath.."utility.utility")

function Elevator.RestoreAccess()
    local function handleLiftControllerPS(liftControllerPS)
        if not liftControllerPS or not liftControllerPS:IsExactlyA("LiftControllerPS") then
            print(
                "Invalid game type detected: expected LiftControllerPS, received",
                liftControllerPS
            )
            return
        end
        liftControllerPS:ForceEnableDevice()
        liftControllerPS:ForceDeviceON()
 
        for _, eftcPS in ipairs(liftControllerPS:GetImmediateSlaves()) do
            if eftcPS and eftcPS:IsExactlyA("ElevatorFloorTerminalControllerPS") then
                eftcPS:PowerDevice()
                eftcPS:ForceDeviceON()
                eftcPS:ForceEnableDevice()
                eftcPS:TurnAuthorizationModuleOFF()
            end
        end
 
        -- Show all floors
        for i = 0, #liftControllerPS:GetFloors() do
            local actionShowFloor = liftControllerPS:ActionQuestShowFloor()
            actionShowFloor:SetProperties(i)
            Game.GetPersistencySystem():QueuePSEvent(liftControllerPS:GetID(), liftControllerPS:GetClassName(), actionShowFloor)
        end
 
        liftControllerPS:WakeUpDevice()
    end
 
    local function handleFloorTerminal(floorTerminal)
        if not floorTerminal or not floorTerminal:IsExactlyA("ElevatorFloorTerminal") then
            print(
                "Invalid game type detected: expected ElevatorFloorTerminal, received",
                floorTerminal
            )
            return
        end
 
        for _, v in ipairs(floorTerminal:GetDevicePS():GetImmediateParents()) do
            if v and v:IsExactlyA("LiftControllerPS") then
                return handleLiftControllerPS(v)
            end
        end
 
        print("Failed to find LiftControllerPS related to ElevatorFloorTerminal!")
    end
 
    local obj = Game.GetTargetingSystem():GetLookAtObject(Game.GetPlayer(), false, false)
 
    if obj and obj:IsExactlyA("ElevatorFloorTerminal") then
        CityHack.Utility.Log("ELEVATOR ACCESS RESTORED")
        return handleFloorTerminal(obj)
    end
 
    if obj and obj:IsExactlyA("LiftDevice") then
        CityHack.Utility.Log("ELEVATOR ACCESS RESTORED")
        return handleLiftControllerPS(obj:GetDevicePS())
    end
 
    print("Player is not looking at a valid object, exiting Cheat:Elevator")
end

return Elevator