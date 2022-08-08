local Bedwars = loadstring(game:HttpGet("https://raw.githubusercontent.com/Mastadawn/AstralV2/main/Bedwars.lua", true))()

Utility = {
    Predict = function(player)
        return player.Character.HumanoidRootPart.Position + Vector3.new(player.Character.HumanoidRootPart.Velocity.X/10,player.Character.HumanoidRootPart.Velocity.Y/50,player.Character.HumanoidRootPart.Velocity.Z/10)
    end,
    GetNearbyPlayers = function(range,addself)
        local nearby = {}
        for _,Player in pairs(game:GetService("Players"):GetPlayers()) do
            if Player.Character and Player.Character.PrimaryPart then
                if (Player.Character.PrimaryPart.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude <= range then
                    if Player.UserId == game.Players.LocalPlayer.UserId then
                        if addself == true then
                            table.insert(nearby,Player)
                        end
                    else
                        table.insert(nearby,Player)
                    end
                end
            end
        end
        return nearby
    end,
    IsAlive = function(Entity)
        if Entity and Entity.PrimaryPart and Entity:FindFirstChild("Humanoid") and Entity.Humanoid.Health > 0 then
            return true
        else
            return false
        end
    end,
    GetBestSword = function()
        local bestsword = nil
        local bestrank = 0
        for i, v in pairs(game.Players.LocalPlayer.Character.InventoryFolder.Value:GetChildren()) do
            if v.Name:match("sword") or v.Name:match("blade") then
                for _, data in pairs(Bedwars.SwordInfo) do
                    if data["Name"] == v.Name then
                        if bestrank <= data["Rank"] then
                            bestrank = data["Rank"]
                            bestsword = v
                        end
                    end
                end
            end
        end
        return bestsword
    end,
}

return Utility
