local Other = {}

function Other.RoadBlockToggle()
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)
    local targetPS = target:GetDevicePS()

    target:ToggleBlockade()
end

function Other.CityWideLight(state)
    local scriptSystem =  Game.GetScriptableSystemsContainer()
    local cityLightSystem = scriptSystem:Get('CityLightSystem')

    cityLightSystem:AddForcedStateRequest("ECLSForcedState.ForcedON", "EPriority.Absolute", false)

    -- STATES: 0 = default, 1 = forced on, 2 = forced off

    if state == "Reset" then
        cityLightSystem.state = 0

    elseif state == "AllOn" then
        cityLightSystem.state = 1

    elseif state == "AllOff" then
        cityLightSystem.state = 2
        
    end

    cityLightSystem:UpdateCLSForcedState()
end

function Other.PoliceToggle(state) 
    if state == "On" then
        Game.PrevSys_on()

    elseif state == "Off" then
        Game.PrevSys_off()
    end
end

return Other