local NpcUI = {}

function NpcUI.Create(CityHack, style)

    if ImGui.BeginTabItem("NPC") then
        ImGui.SetWindowSize(265, 200)
        ImGui.Spacing()

        ImGui.PushTextWrapPos()
        ImGui.Text("Currently Looked at NPC")
        ImGui.PopTextWrapPos()
        ImGui.Spacing()

        if ImGui.Button("Kill", style.buttonWidth, style.buttonHeight) then
            if CityHack.NPC.Kill() then
                CityHack.Util.Response("npc", "kill", true, false)
            else
                CityHack.Util.Response("npc", "kill", false, false)
            end
        end

        -- if ImGui.Button("Make Vendor", style.buttonWidth, style.buttonHeight) then
        --     player = Game.GetPlayer()
        --     ssc = Game.GetScriptableSystemsContainer()
        --     ms = ssc:Get('MarketSystem')
        --     ts = Game.GetTargetingSystem()

        --     trg = ts:GetLookAtObject(player, false, false)
        --     ms:AddVendor(trg)
        -- end

    ImGui.EndTabItem()
    end

end

return NpcUI