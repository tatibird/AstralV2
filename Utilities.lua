Utility = {
    Predict = function(player)
        return player.Character.HumanoidRootPart.Position + Vector3.new(player.Character.HumanoidRootPart.Velocity.X/10,player.Character.HumanoidRootPart.Velocity.Y/50,player.Character.HumanoidRootPart.Velocity.Z/10)
    end,
    GetNearbyPlayers = function(range,self)
        local nearby = {}
        for _,Player in pairs(game:GetService("Players"):GetPlayers()) do
            if Player.Character and Player.Character.PrimaryPart then
                if (Player.Character.PrimaryPart.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude <= range then
                    if Player.UserId == game.Players.LocalPlayer.UserId then
                        if self == true then
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
}

return Utility
