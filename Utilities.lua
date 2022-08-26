repeat task.wait() until game:IsLoaded()

local origneck = game.Players.LocalPlayer.Character.Head.Neck.C0

local Bedwars = loadstring(game:HttpGet("https://raw.githubusercontent.com/Mastadawn/AstralV2/main/Bedwars.lua", true))()

getgenv().scriptExample = [==[


--[[
    Hello thank you for using astrals scripting system!
    this is very new and buggy so please report bugs.

    Examples:

TestModule = function(Module,Dropdowns)

	repeat
		task.wait(1)
		
		local ModuleEnabled = Module.Enabled				-- Returns true/false if the module is enabled
		local Test1Value = Dropdowns.Test1[5] 				-- Gets the current value on the slider
		local Test2Value = Dropdowns.Test2[3] 				-- Gets the selections value 
		local Test3Value = Dropdowns.Test3[3] 				-- Gets the true/false value of a toggle dropdown
		local Test2String = Dropdowns.Test2[4][Test2Value]		-- Gets the string value from a selection module

		local string = Test1Value.." - "..Test2Value.." - "..tostring(Test3Value).." - "..Test2String

		print(string)
	until Module.Enabled == false
end

Dropdowns = {
	Test1 = {
		"Slider",			-- Type ("Slider","Toggle","Selection")
		"Test1",			-- Name (string)
		0,				-- Min value (int)
		100,				-- Max value (int)
		50				-- Current value (int)
	},

	Test2 = {
		"Selection",			-- Type ("Slider","Toggle","Selection")
		"Test2",			-- Name (string)
		1,				-- Current (Selected mode in list)
		{				-- Options ("Strings" ex: "Test1",)
			"Test1",
			"Test2",
			"Test3",
		}
	},

	Test3 = {
		"Toggle", 			-- Type ("Slider","Toggle","Selection")
		"Test3",			-- Name (string)
		false,				-- Status (true/false)
	},

}

AstralScript.ImportScript("Test1",TestModule,Dropdowns,"Test module")
]]


]==]

Utility = {
    Predict = function(player)
        return player.Character.HumanoidRootPart.Position + (player.Character.HumanoidRootPart.Velocity * 0.075)
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
    Rotation = function(Position)
        local targetPos = Position
        local Head = game.Players.LocalPlayer.Character.Head
        local dir = (targetPos - Head.Position).Unit
        local Character = game.Players.LocalPlayer.Character
        local lookCFrame = CFrame.new(Vector3.new(), Character.PrimaryPart.CFrame:VectorToObjectSpace(dir))
        game.Players.LocalPlayer.Character.Head.Neck.C0 = lookCFrame + Vector3.new(0,.75,0)
    end,
    ResetRotation = function()
        game.Players.LocalPlayer.Character.Head.Neck.C0 = origneck 
    end,
    GetChests = function()
        chests = {}
        for i,v in pairs(workspace:GetChildren()) do
            if v.Name == "chest" then
                table.insert(chests,v)
            end
        end

        return chests
    end,
    GetCharacter = function()
        return game.Players.LocalPlayer.Character
    end,
}

return Utility
