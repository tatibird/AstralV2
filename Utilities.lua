Utility = {
    Predict = function(player)
        return player.Character.HumanoidRootPart.Position + Vector3.new(player.Character.HumanoidRootPart.Velocity.X/10,player.Character.HumanoidRootPart.Velocity.Y/50,player.Character.HumanoidRootPart.Velocity.Z/10)
    end,
}

return Utility