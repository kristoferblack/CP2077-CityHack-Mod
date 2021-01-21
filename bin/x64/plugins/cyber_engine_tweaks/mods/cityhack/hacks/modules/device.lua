local Device = {
    rootPath =  "plugins.cyber_engine_tweaks.mods.cityhack.",
}
local Util = require(Device.rootPath.."hacks.modules.utility")

function Device.State(state, param, target)
    local targetPS = target:GetDevicePS()

    if state == "PowerOn" then
        target:TurnOnDevice()

        if targetPS then targetPS:PowerDevice() end
        
        Device.State("Activate")

    elseif state == "PowerOff" then
        target:TurnOffDevice()

        if targetPS then targetPS:UnpowerDevice() end

        Device.State("Dectivate")
    
    elseif state == "PowerCut" then
        target:CutPower()

    elseif state == "Activate" then
        target:ActivateDevice()
    
    elseif state == "Deactivate" then
        target:DeactivateDevice()

    elseif state == "ScreenOn" then
        target:TurnOnScreen()
    
    elseif state == "ScreenOff" then
        target:TurnOffScreen()

    elseif state == "StartGlitching" then
        target:StartGlitching(1, 0.2)

    elseif state == "StopGlitching" then
        target:StopGlitching()

    elseif state == "StartBlinking" then
        target:StartBlinking()

    elseif state == "StopBlinking" then
        target:StopBlinking()

    elseif state == "SetChannel" then
        target:SelectChannel(param)

    end
end

function Device.VendingMachine(action)
    if action == "DispenseAll" then
        local player = Game.GetPlayer()
        local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)
        local targetPS = target:GetDevicePS()
        local scriptSystem =  Game.GetScriptableSystemsContainer()
        local marketSystem = scriptSystem:Get('MarketSystem')
        local vendor = marketSystem:GetVendor(target)

        vendor:RegenerateStock()

        for _, item in ipairs(vendor:GetStock()) do
            local quantity = item.quantity

            for i = 1, quantity do
                local dispenseRequest = target:CreateDispenseRequest(false, items)
                target:DispenseItems(dispenseRequest)
            end
        end

        target:PlayItemFall()

    else
        Util.Response("Vending Machine", "Dispense All", false, "Not looking at Vending Machine")
    end
end

function Device.Is(state, target)

    if not target then return end

    local devicePS = target:GetDevicePS()

    if state == "On" then
        return devicePS:IsON()

    elseif state == "Glitching" then
        -- print( devicePS:GetDeviceStatus() )
        return devicePS.isGlitching
    end
end

return Device