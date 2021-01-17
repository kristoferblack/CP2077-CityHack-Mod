local Other = {}

function Other.RoadBlockToggle()
    local player = Game.GetPlayer()
    local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)
    local targetPS = target:GetDevicePS()

    target:ToggleBlockade()
end

return Other