Utility = {
    Predict = function(player)
        return player.Character.HumanoidRootPart.Position + Vector3.new(player.Character.HumanoidRootPart.Velocity.X/10,player.Character.HumanoidRootPart.Velocity.Y/50,player.Character.HumanoidRootPart.Velocity.Z/10)
    end,
    GetNearbyPlayers = function(range)
        local nearby = {}
        for _,Player in pairs(game:GetService("Players"):GetPlayers()) do
            if Player.Character and Player.Character.PrimaryPart then
                if (Player.Character.PrimaryPart.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude <= range then
                    table.insert(nearby,Player)
                end
            end
        end
        return nearby
    end,
}

return Utility
