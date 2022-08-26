repeat task.wait() until game:IsLoaded()
task.wait()

warn([[ minecraft chat loaded ty mistercoolertyper for the cool chat stuff ]])

game.StarterGui:SetCore( 
    "ChatMakeSystemMessage",  { 
        Text = [[
Astral v2

changelog:
relased

astral command system
.tprandom
(requires telepearl)
.nameclient Astral v1
(renames the client text can be enabled via HUD Module)
        ]], 
        Color = Color3.fromRGB( 255,0,255 ), 
        Font = Enum.Font.Gotham, 
        FontSize = Enum.FontSize.Size24
    } 
)
 

function getremote(t)
    for i, v in pairs(t) do
        if v == "Client" then
            local tab = t[i + 1]
            return tab
        end
    end
    return ""
end

if getgenv().chatmod then
    for i,v in next, getgenv().chatmod.connections do
        v:Disconnect()
    end
end
getgenv().chatmod = {
    connections = {},
}
local lplr = game:GetService("Players").LocalPlayer

local Chat = lplr.PlayerGui.Chat
local ChatFrame = Chat.Frame
local resolution = workspace.CurrentCamera.ViewportSize
local Box = Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
local uis = game:GetService("UserInputService")
local Size = UDim2.new(0,577,0,273)
local Position = UDim2.new(0,-7,0,resolution.y-300)
local shiftheld
local pressed

ChatFrame.Size = Size
ChatFrame.Position = Position
ChatFrame.ChatBarParentFrame.Visible = false
ChatFrame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.ScrollingEnabled = false

getgenv().chatmod.connections[#getgenv().chatmod.connections+1] = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    resolution = workspace.CurrentCamera.ViewportSize
    if not pressed then
        Position = UDim2.new(0,-7,0,resolution.y-300)
        ChatFrame.Size = UDim2.new(0,577,0,273)
        ChatFrame.Position = Position
    end
end)

getgenv().chatmod.connections[#getgenv().chatmod.connections+1] = uis.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.Slash and not uis:GetFocusedTextBox() then
        if not pressed then
            pressed = true
            ChatFrame.Position = UDim2.new(0,0,0,0)
            ChatFrame.Size = UDim2.new(0,resolution.x,0,resolution.y)
            ChatFrame.ChatBarParentFrame.Visible = true
            Box:CaptureFocus()
            task.wait()
            Box.Text = ""
        else
            if not uis:GetFocusedTextBox() then
                pressed = false
                ChatFrame.ChatBarParentFrame.Visible = false
                ChatFrame.Size = Size
                ChatFrame.Position = Position
            end
        end
    elseif key.KeyCode == Enum.KeyCode.Return then
        if pressed then
            pressed = false
            ChatFrame.ChatBarParentFrame.Visible = false
            ChatFrame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller.ScrollingEnabled = false
            ChatFrame.Size = Size
            ChatFrame.Position = Position
        end
    end
end)

for i,v in next, getconnections(Box.FocusLost) do
	v:Disable()
end

local bypasses = {
    ["trollage"] = "troll\240\144\140\145age",
    --["discord.gg/"] = "Discord .ɡɡ/",
    --["discord."] = "Discord .",
    ["discord"] = "Discord",
    ["discord."] = "D\240\144\140\145\240\144\140\145\240\144\140\145i\240\144\140\145\240\144\140\145\240\144\140\145s\240\144\140\145\240\144\140\145\240\144\140\145c\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145ord .",
    --["discord."] = "d\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145і\240\144\140\145s\240\144\140\145\240\144\140\145\240\144\140\145c\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145o\240\144\140\145r\240\144\140\145d.",
    ["lmao"] = "lm \240\144\140\145 \205\156 \205\163ao",
    ["lmfao"] = "lm \240\144\140\145\205\156\205\163fɑo",
    ["LMFAO"] = "lm \240\144\140\145 \205\156 \205\163fao",
    --["discord"] = "dd\240\144\140\145\240\144\140\145\240\144\140\145i\240\144\140\145\240\144\140\145\240\144\140\145s\240\144\140\145\240\144\140\145\240\144\140\145c\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145ord",
    ["vape"] = "va\240\144\140\145 \205\156 \205\163pe",
    ["LMAO"] = "LM \240\144\140\145 \205\156 \205\163AO",
    ["fuck"] = "ff\240\144\140\145\240\144\140\145\240\144\140\145u\240\144\140\145\240\144\140\145\240\144\140\145ϲ\240\144\140\145\240\144\140\145\240\144\140\145k\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145",
    ["fucked"] = "ff\240\144\140\145\240\144\140\145\240\144\140\145u\240\144\140\145\240\144\140\145\240\144\140\145ϲ\240\144\140\145\240\144\140\145\240\144\140\145k\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145 ed",
    ["shit"] = "Sh\240\144\140\145 \205\156 \205\163 it",
    ["fuckyou"] = "ff\240\144\140\145\240\144\140\145\240\144\140\145u\240\144\140\145\240\144\140\145\240\144\140\145ϲ\240\144\140\145\240\144\140\145\240\144\140\145k\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145уou",
    ["kys"] = "ky\240\144\140\145 \205\156 \205\163s",
    ["wtf"] = "ѡ\240\144\140\145 \205\156 \205\163t\240\144\140\145 \205\156 \205\163f",
    ["WTF"] = "ѡ\240\144\140\145 \205\156 \205\163T\240\144\140\145 \205\156 \205\163F",
    ["fucker"] = "ff\240\144\140\145\240\144\140\145\240\144\140\145u\240\144\140\145\240\144\140\145\240\144\140\145ϲ\240\144\140\145\240\144\140\145\240\144\140\145k\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145er",
    ["fucking"] = "ff\240\144\140\145\240\144\140\145\240\144\140\145u\240\144\140\145\240\144\140\145\240\144\140\145ϲ\240\144\140\145\240\144\140\145\240\144\140\145k\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145ing",
}

local Utilities

if workspace:FindFirstChild("Map") then
	Utilities = loadstring(game:HttpGet("https://raw.githubusercontent.com/Mastadawn/AstralV2/main/Utilities.lua", true))()
end

local function teleport(position)
    local guid = game:GetService("HttpService"):GenerateGUID()
    if game.Players.LocalPlayer.Character.InventoryFolder.Value:FindFirstChild("telepearl") then
        local args = {
            [1] = game.Players.LocalPlayer.Character.InventoryFolder.Value.telepearl,
            [2] = "telepearl",
            [3] = "telepearl",
            [4] = position,
            [5] = game.Players.LocalPlayer.Character.PrimaryPart.Position,
            [6] = Vector3.new(0,-1,0),
            [7] = guid,
            [8] = {
                ["drawDurationSeconds"] = 10
            },
            [9] = workspace:GetServerTimeNow()
        }
		getremote(debug.getconstants(debug.getupvalues(getmetatable(KnitClient.Controllers.ProjectileController)["launchProjectileWithValues"])[2])):SendToServer(unpack(args)) 
	else
		getgenv().notifs.Notify("Player teleport","No telepearl found", 5, Color3.fromHSV(1,1,1))
    end
end

local function getrandomplayer()
    players = {}
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name and Utilities.IsAlive(v.Character) and v.Team ~= game.Players.LocalPlayer.Team then
            table.insert(players, v)
        end
    end
    local Choice = math.random(1,#players)
    return players[Choice]
end

getgenv().chatmod.connections[#getgenv().chatmod.connections+1] = Box.FocusLost:connect(function(enter)
    if enter then
        local getidentity = syn.get_thread_identity
        local setidentity = syn.set_thread_identity
        local newtext = ""
        local found = false
        firesignal(lplr.Chatted, "hi")
        if Box.Text == "swastika" then
            spawn(function()
                task.wait(0.5)
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\226\154\170\226\154\170\226\154\170\226\154\170\240\159\148\180\240\159\148\180\226\154\170", "All")
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\240\159\148\180\240\159\148\180\240\159\148\180\226\154\170\240\159\148\180\240\159\148\180\226\154\170", "All")
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\240\159\148\180\240\159\148\180\240\159\148\180\226\154\170\240\159\148\180\240\159\148\180\226\154\170", "All")
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\226\154\170\226\154\170\226\154\170\226\154\170\226\154\170\226\154\170\226\154\170", "All")
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\226\154\170\240\159\148\180\240\159\148\180\226\154\170\240\159\148\180\240\159\148\180\240\159\148\180", "All")
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\226\154\170\240\159\148\180\240\159\148\180\226\154\170\240\159\148\180\240\159\148\180\240\159\148\180", "All")
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\226\154\170\240\159\148\180\240\159\148\180\226\154\170\226\154\170\226\154\170\226\154\170", "All")
            end)
            Box.Text = 'To Chat click here or press "/" key'
            return
        end
	local command = Box.Text
	if string.find(command,".tp") then
            coroutine.wrap(function()
                if string.find(command,"random") then
            		local player = getrandomplayer()
            		teleport(player.Character.PrimaryPart.Position)
        	else
            		for i,v in pairs(game.Players:GetChildren()) do
               	 		if string.find(command,v.Name) then
                    			teleport(v.Character.PrimaryPart.Position)
                		end
            		end
        	end
            end)()
            Box.Text = 'To Chat click here or press "/" key'
            return
        end
        if Box.Text == "5$" then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[\204\178\204\133$\204\178\204\133(\204\178\204\1335\204\178\204\133)\204\178\204\133$\204\178\204\133]", "All")
            Box.Text = 'To Chat click here or press "/" key'
            return
        end
	if string.find(command,".nameclient") then
		local newStr, replaced = string.gsub(Box.Text, ".nameclient ", "")
		getgenv().ClientName = newStr
		return
	end
        if Box.Text:lower():find("fuck you") then
            newtext = Box.Text:gsub("fuck you", bypasses.fuckyou)
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(newtext, "All")
            Box.Text = 'To Chat click here or press "/" key'
            return
        end
        local split = Box.Text:split(" ")
        for i,v in next, bypasses do
            for i2,v2 in next, split do
                if v2 == i then
                    split[i2] = v2:gsub(i,v)
                end
            end
        end
        if Box.Text:find(";kick default") then
            newtext = ";kill default"
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(newtext, "All")
            task.wait(1)
        end
        newtext = table.concat(split, " ")
        if newtext ~= "" then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(newtext, "All")
        end
        Box.Text = 'To Chat click here or press "/" key'
    else
        Box.Text = 'To Chat click here or press "/" key'
    end
end)
