local NpcUI = {}

function NpcUI.Create(CityHack, style)

    Theme.PushStyleColor(ImGuiCol.Text,	Theme.TextWhite)
    if ImGui.BeginTabItem("NPC") then
        ImGui.PopStyleColor()
        Theme.PushStyleColor(ImGuiCol.Text,	Theme.Text)
        ImGui.SetWindowSize(280, 200)
        ImGui.Spacing()

        if ImGui.Button("Kill", style.buttonWidth, style.buttonHeight) then
            if CityHack.NPC.Kill() then
                CityHack.Util.Response("npc", "kill", true, false)
            else
                CityHack.Util.Response("npc", "kill", false, false)
            end
        end


        if ImGui.Button("Make Vendor", style.buttonWidth, style.buttonHeight) then
            -- 		AddVendorHashMap(key: entEntityID, tweakID: TweakDBID, vendor: handle:IScriptable) => (Bool),

            -- player = Game.GetPlayer()
            -- ssc = Game.GetScriptableSystemsContainer()
            -- ms = ssc:Get('MarketSystem')
            -- ts = Game.GetTargetingSystem()

            -- trg = ts:GetLookAtObject(player, false, false)
            -- ms:AddVendor(trg)
            -- 9002450
            
            local player = Game.GetPlayer()
            local target = Game.GetTargetingSystem():GetLookAtObject(player, false, false)
            local targetPS = target:GetDevicePS()
            local scriptSystem =  Game.GetScriptableSystemsContainer()
            local marketSystem = scriptSystem:Get('MarketSystem')
        

            -- local entityID = target:GetEntityID() -- 9010447
            
            -- target:PrepareVendor()
            -- ms:AddVendor(target)
            -- ms:AddVendorHashMap(entityID, TweakDBID.new(0x2A5ECFA0, 27), target)
            
            -- target:StartUpdate()

            if entityID then
                local vendorHashMap = marketsystem:GetVendorHashMap(entityID)
                -- local vendorTweakID = vendorHashMap:GetVendorTweakID() -- ToTweakDBID{ hash = 0x2A5ECFA0, length = 27 }
                -- local vendorType = vendorHashMap:GetVendorType() -- gamedataVendorType : Food (6)
                -- local vendorRecord = vendorHashMap:GetVendorRecord()
                -- local vendorRecordID = vendorRecord:GetID() -- ToTweakDBID{ hash = 0x2A5ECFA0, length = 27 }
                -- print(marketSystem:GetVendor(target):GetVendorTweakID())
                -- print(marketSystem:GetVendorHashMap(target:GetEntityID()))

                print(Dump(marketSystem,false))
            else

                local vendor = marketSystem:GetVendor(target)

                for _, item in ipairs(vendor:GetStock()) do
                    local quantity = item.quantity

                    for i = 1, quantity do
                        -- print(Dump(item,false))
                        local dispenseRequest = target:CreateDispenseRequest(false, items)
                        -- print(dispenseRequest)
                        target:DispenseItems(dispenseRequest)
                        -- print(item.itemID)
                    end
                end

                targetPS:RefreshPS()


                -- print(Dump(marketSystem:GetVendor(target),false))
            end
                
        end

    ImGui.EndTabItem()
    end

end

return NpcUI