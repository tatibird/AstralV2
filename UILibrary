getgenv().GUI = Instance.new("ScreenGui", game:GetService"CoreGui")
getgenv().GUI.Name = math.random(1,100000)
getgenv().HUDColor = Color3.fromRGB(150, 0, 240)
getgenv().HUDAnimations = true
getgenv().BlurAnimations = true
getgenv().SaveDefault = "AstralConfig"
getgenv().GUI.Enabled = false
getgenv().SaveName = getgenv().SaveDefault .. ".lua"
getgenv().HUDColor = Color3.fromRGB(13, 105, 172)

Modules = {}

local Tabs = 0
local TabInstances = {}
local UIS = game:GetService"UserInputService"
local HTTP = game:GetService"HttpService"
local Blur = Instance.new("BlurEffect", game:GetService"Lighting")
Blur.Enabled = false

local function Save()
	local save = HTTP:JSONEncode(Modules)
	writefile(getgenv().SaveName, save)
end

local function Load()
	if isfile(getgenv().SaveName) then
		local save = readfile(getgenv().SaveName)
		local decodedsave = HTTP:JSONDecode(save)
		Modules = decodedsave
	else
		warn("No configuration save was found!")
	end
end

local function AddEffect(GUIInstance, Duration)
	local effect = Instance.new("Frame", GUIInstance)
	effect.Size = UDim2.new(0, 0, 1, 0)
	effect.BorderSizePixel = 0
	effect.Transparency = 0.5
	for i = 1, 100 do
		task.wait(Duration / 2.5e3)
		effect.Size = effect.Size + UDim2.new(0.01, 0, 0, 0)
		effect.Transparency = effect.Transparency + 5e-3
	end
	effect:Destroy()
end

local function MakeDarker(color)
	local H, S, V = color:ToHSV()
	V = math.clamp(V / 2, 0.5, 0.5)
	return Color3.fromHSV(H, S, V)
end

local debounce = false
UIS.InputBegan:Connect(function()
	if UIS:IsKeyDown(Enum.KeyCode.RightShift) and debounce == false then
		if getgenv().BlurAnimations then
			spawn(function()
				task.wait(0.15)
				if getgenv().GUI.Enabled == true then
					Blur.Size = 1
					Blur.Enabled = not Blur.Enabled
					for i = 1, 50 do
						task.wait()
						Blur.Size = Blur.Size + 0.3
					end
				else
					for i = 1, 50 do
						task.wait()
						Blur.Size = Blur.Size - 0.3
					end
					Blur.Enabled = not Blur.Enabled
				end
			end)
		end
		getgenv().GUI.Enabled = not getgenv().GUI.Enabled
	end
end)
local UILibrary = {
	MakeTab = function(tabname)
		local newtab = Instance.new("Frame", getgenv().GUI)
		local Line = Instance.new("Frame", newtab)
		local Title = Instance.new("TextLabel", newtab)
		newtab.Size = UDim2.new(0.13, 0, 0.0365, 0)
		newtab.Position = UDim2.new(0.03 + 0.135 * Tabs, 0, 0.025, 0)
		newtab.BorderSizePixel = 0
		newtab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		Line.Size = UDim2.new(1, 0, 0.065, 0)
		Line.BorderSizePixel = 0
		Title.BackgroundTransparency = 1
		Title.Text = tabname
		Title.Font = Enum.Font.GothamBold
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.Size = UDim2.new(1, 0, 0.7, 0)
		Title.TextSize = Title.AbsoluteSize.X * 0.09
		Title.Position = UDim2.new(0, 0, 0.2, 0)
		spawn(function()
			while task.wait() do Line.BackgroundColor3 = getgenv().HUDColor end
		end)
		Tabs = Tabs + 1
		table.insert(TabInstances, newtab)
		return newtab
	end,
	MakeModule = function(Module)
		spawn(function()
			local BindCooldown = false
			local Tab = Module.Tab
			local Name = Module.Name
			local DropdownOpen = false
			local Description = Module.Description
			local DropdownCount = 0
			for i,v in pairs(Modules) do
				if v.Name == Module.Name then
					Module.Enabled = v.Enabled
					Module.Bind = v.Bind
					Module.Dropdowns = v.Dropdowns
				end
			end
			local TemporaryObjects = { ["DropdownGUI"] = {}, ["HoverGUI"] = {} }
			for i, v in pairs(Module.Dropdowns) do DropdownCount = DropdownCount + 1 end
			local newModule = Instance.new("Frame", Tab)
			local newbutton = Instance.new("TextButton", newModule)
			newModule.Size = UDim2.new(1, 0, 1, 0)
			newModule.BorderSizePixel = 0
			newModule.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			newModule.Position = UDim2.new(0, 0, #Tab:GetChildren() - 2, 0)
			newbutton.Size = UDim2.new(1, 0, 1, 0)
			newbutton.BackgroundTransparency = 1
			newbutton.Text = " " .. Name
			newbutton.TextSize = newbutton.AbsoluteSize.X * 0.075
			newbutton.Font = Enum.Font.GothamSemibold
			newbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
			if Module.Enabled == true then
				spawn(function()
					Module.Function(Module, Module.Dropdowns)
				end)
				spawn(function()
					while Module.Enabled == true do
						newModule.BackgroundColor3 = getgenv().HUDColor
						task.wait()
					end
				end)
			else newModule.BackgroundColor3 = Color3.fromRGB(42, 42, 42) end
			newbutton.TextXAlignment = "Left"
			local entered = false

			local found = false
			local counted = 0
			local function SaveSettings()
				for i,v in pairs(Modules) do
					if v.Name == Module.Name then
						counted = counted + 1
						found = true
						Module.Enabled = v.Enabled
						Module.Bind = v.Bind
						Module.Dropdowns = v.Dropdowns
						if counted > 1 then
							table.remove(Modules,i)
						end
					end
				end
				Save()
			end

			if found == false then
				table.insert(Modules,Module)
			end

			spawn(function()
				while wait(5) do
					SaveSettings()
				end
			end)

			newbutton.MouseEnter:Connect(function()
				entered = true
				local Hover = Instance.new("Frame", getgenv().GUI)
				Hover.Size = UDim2.new(4.35e-3 * string.len(Description), 0, 0.055, 0)
				Hover.BorderSizePixel = 0
				Hover.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				local Text = Instance.new("TextLabel", Hover)
				Text.Size = UDim2.new(1, 0, 0.35, 0)
				Text.Position = UDim2.new(0, 0, 0.025, 0)
				Text.Font = Enum.Font.GothamBold
				Text.BackgroundTransparency = 1
				Text.Text = "  " .. Name .. ":"
				Text.TextXAlignment = "Left"
				Text.TextColor3 = Color3.fromRGB(255, 255, 255)
				Text.TextSize = Text.AbsoluteSize.Y * 0.9
				local Text2 = Instance.new("TextLabel", Hover)
				Text2.Size = UDim2.new(1, 0, 0.5, 0)
				Text2.Position = UDim2.new(0, 0, 0.5, 0)
				Text2.Font = Enum.Font.GothamSemibold
				Text2.BackgroundTransparency = 1
				Text2.Text = "  " .. Description
				Text2.TextXAlignment = "Left"
				Text2.TextColor3 = Color3.fromRGB(255, 255, 255)
				Text2.TextSize = Text.AbsoluteSize.Y * 0.8
				table.insert(TemporaryObjects.HoverGUI, Hover)
				local Side = Instance.new("Frame", Hover)
				Side.Size = UDim2.new(0.4 / string.len(Description), 0, 1, 0)
				Side.BorderSizePixel = 0
				repeat
					if entered then
						Hover.Position = UDim2.new(0, UIS:GetMouseLocation().X, 0, UIS:GetMouseLocation().Y)
						Side.BackgroundColor3 = getgenv().HUDColor
						if Module.Enabled then Hover.BackgroundColor3 = MakeDarker(getgenv().HUDColor)
						else Hover.BackgroundColor3 = Color3.fromRGB(30, 30, 30) end
					end
					task.wait()
				until not entered
			end)
			newbutton.MouseLeave:Connect(function()
				entered = false
				for i, v in pairs(TemporaryObjects.HoverGUI) do v:Destroy() end
			end)
			newbutton.MouseButton1Click:Connect(function()
				spawn(function() AddEffect(newbutton, 0.45) end)
				if Module.Enabled == false then
					Module.Enabled = true
					spawn(function()
						spawn(function()
							while Module.Enabled == true do
								newModule.BackgroundColor3 = getgenv().HUDColor
								task.wait()
							end
						end)
						Module.Function(Module, Module.Dropdowns)
					end)
				else
					Module.Enabled = false
					task.wait(0.1)
					newModule.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
					Module.Enabled = false
				end
				SaveSettings()
			end)
			UIS.InputBegan:Connect(function(input)
				if Module.Bind and input.KeyCode == Enum.KeyCode[string.upper(Module.Bind)] and BindCooldown == false then
					spawn(function() AddEffect(newbutton, 0.45) end)
					if Module.Enabled == false then
						Module.Enabled = true
						spawn(function()
							spawn(function()
								while Module.Enabled == true do
									newModule.BackgroundColor3 = getgenv().HUDColor
									task.wait()
								end
							end)
							Module.Function(Module, Module.Dropdowns)
						end)
					else
						Module.Enabled = false
						task.wait(0.1)
						newModule.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
						Module.Enabled = false
					end
					SaveSettings()
				end
			end)
			newbutton.MouseButton2Click:Connect(function()
				spawn(function() AddEffect(newbutton, 0.45) end)
				if DropdownOpen == false then
					local AddedObjects = 0
					DropdownOpen = true
					local DropFrame = Instance.new("Frame", newbutton)
					table.insert(TemporaryObjects.DropdownGUI, DropFrame)
					DropFrame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
					DropFrame.Size = UDim2.new(1, 0, DropdownCount + 1, 0)
					DropFrame.BorderSizePixel = 0
					DropFrame.Position = UDim2.new(0, 0, 1, 0)
					for i, v in pairs(Tab:GetChildren()) do
						if v:IsA"Frame" and v.Position.Y.Scale > newModule.Position.Y.Scale then
							v.Position = v.Position + UDim2.new(0, 0, DropdownCount + 1, 0)
						end
					end
					for i, v in pairs(Module.Dropdowns) do
						AddedObjects = AddedObjects + 1
						local Frame = Instance.new("Frame", newbutton)
						Frame.BackgroundTransparency = 1
						Frame.Size = UDim2.new(1, 0, 1, 0)
						Frame.Position = UDim2.new(0, 0, AddedObjects, 0)
						table.insert(TemporaryObjects.DropdownGUI, Frame)
						local Type = v[1]
						local Name = v[2]
						if v[1] == "Slider" then
							local MinValue = v[3]
							local MaxValue = v[4]
							local CurrentValue = v[5]
							local Title = Instance.new("TextLabel", Frame)
							local BarBack = Instance.new("TextButton", Frame)
							local Bar = Instance.new("TextButton", BarBack)
							Title.Size = UDim2.new(0.9, 0, 0.375, 0)
							Title.Position = UDim2.new(0.05, 0, 0.1, 0)
							Title.BackgroundTransparency = 1
							Title.TextXAlignment = "Left"
							Title.TextSize = Title.AbsoluteSize.X * 0.06
							Title.TextColor3 = Color3.fromRGB(255, 255, 255)
							Title.Font = Enum.Font.GothamSemibold
							Title.Text = v[2] .. ": " .. math.round(CurrentValue)
							BarBack.Size = UDim2.new(0.9, 0, 0.25, 0)
							BarBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
							BarBack.Position = UDim2.new(0.05, 0, 0.7, 0)
							BarBack.BorderSizePixel = 0
							Bar.Size = UDim2.new(CurrentValue / MaxValue, 0, 1, 0)
							Bar.BorderSizePixel = 0
							Bar.Text = ""
							BarBack.Text = ""
							spawn(function()
								while task.wait() do Bar.BackgroundColor3 = getgenv().HUDColor end
							end)
							-- Slider Code
							local dragging = false
							BarBack.MouseButton1Down:Connect(function()
								dragging = true
								repeat
									task.wait()
									local mouseL = UIS:GetMouseLocation()
									local Relative = mouseL - Bar.AbsolutePosition
									local percent = math.clamp(Relative.X / BarBack.AbsoluteSize.X, 0, 1)
									Bar.Size = UDim2.new(percent, 0, 1, 0)
									v[5] = Bar.Size.X.Scale * v[4]
									Title.Text = v[2] .. ": " .. math.round(v[5])
								until dragging == false
								SaveSettings()
							end)
							Bar.MouseButton1Down:Connect(function()
								dragging = true
								repeat
									task.wait()
									local mouseL = UIS:GetMouseLocation()
									local Relative = mouseL - Bar.AbsolutePosition
									local percent = math.clamp(Relative.X / BarBack.AbsoluteSize.X, 0, 1)
									Bar.Size = UDim2.new(percent, 0, 1, 0)
									v[5] = Bar.Size.X.Scale * v[4]
									Title.Text = v[2] .. ": " .. math.round(v[5])
								until dragging == false
								SaveSettings()
							end)
							UIS.InputEnded:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
							end)
							Bar.Size = UDim2.new(v[5] / v[4], 0, 1, 0)
						elseif v[1] == "Toggle" then
							local CurrentValue = v[3]
							local Title = Instance.new("TextButton", Frame)
							Title.Size = UDim2.new(0.95, 0, 1, 0)
							Title.Position = UDim2.new(0.015, 0, 0, 0)
							Title.TextSize = Title.AbsoluteSize.X * 0.06
							Title.TextXAlignment = "Left"
							Title.BackgroundTransparency = 1
							Title.Text = "  " .. Name
							Title.TextColor3 = Color3.fromRGB(255, 255, 255)
							Title.Font = Enum.Font.GothamSemibold
							local ToggleBox = Instance.new("Frame", Title)
							ToggleBox.Size = UDim2.new(0.15, 0, 0.435, 0)
							ToggleBox.AnchorPoint = Vector2.new(0.5, 0.5)
							ToggleBox.BorderSizePixel = 0
							ToggleBox.Position = UDim2.new(0.9, 0, 0.5, 0)
							ToggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
							local ToggleBar = Instance.new("Frame", ToggleBox)
							ToggleBar.Size = UDim2.new(0.35, 0, 1, 0)
							ToggleBar.BorderSizePixel = 0
							if v[3] then
								spawn(function()
									repeat
										task.wait()
										ToggleBox.BackgroundColor3 = MakeDarker(getgenv().HUDColor)
									until v[3] == false
								end)
							end
							spawn(function()
								while task.wait() do ToggleBar.BackgroundColor3 = getgenv().HUDColor end
							end)
							if v[3] == true then ToggleBar.Position = UDim2.new(0.65, 0, 0, 0) end
							Title.MouseButton1Click:Connect(function()
								if v[3] == false then
									v[3] = true
									for i = 1, 50 do
										if math.random(1, 3) == 1 then task.wait() end
										ToggleBar.Position = ToggleBar.Position + UDim2.new(0.019, 0, 0, 0)
									end
									ToggleBar.Position = UDim2.new(0.65, 0, 0, 0)
									spawn(function()
										repeat
											task.wait()
											ToggleBox.BackgroundColor3 = MakeDarker(getgenv().HUDColor)
										until v[3] == false
									end)
								else
									v[3] = false
									for i = 1, 50 do
										if math.random(1, 3) == 1 then task.wait() end
										ToggleBar.Position = ToggleBar.Position - UDim2.new(0.019, 0, 0, 0)
									end
									ToggleBar.Position = UDim2.new(0, 0, 0, 0)
									ToggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
								end
								SaveSettings()
							end)
						elseif v[1] == "Selection" then
							local Click = Instance.new("TextButton", Frame)
							Click.Size = UDim2.new(0.9, 0, 0.65, 0)
							Click.BackgroundTransparency = 0
							Click.AnchorPoint = Vector2.new(0.5, 0.5)
							Click.Position = UDim2.new(0.5, 0, 0.5, 0)
							Click.Text = " Selected mode: " .. v[4][v[3]]
							Click.TextSize = Click.AbsoluteSize.X * 0.08
							Click.TextXAlignment = "Left"
							Click.Font = Enum.Font.GothamBold
							Click.TextColor3 = Color3.fromRGB(255, 255, 255)
							Click.BorderSizePixel = 0
							Click.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
							Click.MouseButton1Click:Connect(function()
								spawn(function() AddEffect(Click, 0.45) end)
								if v[4][v[3] + 1] then
									v[3] = v[3] + 1
									Click.Text = " Selected mode: " .. v[4][v[3]]
								else
									v[3] = 1
									Click.Text = " Selected mode: " .. v[4][1]
								end
								SaveSettings()
							end)
							Click.MouseButton2Click:Connect(function()
								spawn(function() AddEffect(Click, 0.45) end)
								if v[4][v[3] - 1] then
									v[3] = v[3] - 1
									Click.Text = " Selected mode: " .. v[4][v[3]]
								else
									local total = 0
									for i, v in pairs(v[4]) do total = total + 1 end
									v[3] = total
									Click.Text = " Selected mode: " .. v[4][1]
								end
								SaveSettings()
							end)
						end
					end
					AddedObjects = AddedObjects + 1
					local Frame = Instance.new("Frame", newbutton)
					Frame.BackgroundTransparency = 1
					Frame.Size = UDim2.new(1, 0, 1, 0)
					Frame.Position = UDim2.new(0, 0, AddedObjects, 0)
					table.insert(TemporaryObjects.DropdownGUI, Frame)
					local BindText = Instance.new("TextButton", Frame)
					if Module.Bind then BindText.Text = "   Bind: " .. Module.Bind
					else BindText.Text = "   Bind: none" end
					BindText.Size = UDim2.new(1, 0, 1, 0)
					BindText.BackgroundTransparency = 1
					BindText.TextSize = BindText.AbsoluteSize.X * 0.06
					BindText.TextXAlignment = "Left"
					BindText.Font = Enum.Font.GothamBold
					BindText.TextColor3 = Color3.fromRGB(255, 255, 255)
					BindText.MouseButton1Click:Connect(function()
						BindText.Text = "   Press a key/escape to remove"
						local OriginalBind = Module.Bind
						local set
						local BindEvent = UIS.InputBegan:Connect(function(input)
							spawn(function()
								BindCooldown = true
								task.wait(0.5)
								BindCooldown = false
							end)
							task.wait()
							if input.KeyCode ~= Enum.KeyCode.Escape then
								set = input.KeyCode
								Module.Bind = UIS:GetStringForKeyCode(input.KeyCode)
							else
								set = nil
								Module.Bind = nil
							end
							set = true
						end)
						repeat task.wait() until set
						BindEvent:Disconnect()
						if Module.Bind then BindText.Text = "   Bind: " .. Module.Bind
						else BindText.Text = "   Bind: none" end
						SaveSettings()
					end)
				else
					DropdownOpen = false
					for i, v in pairs(Tab:GetChildren()) do
						if v:IsA"Frame" and v.Position.Y.Scale > newModule.Position.Y.Scale then
							v.Position = v.Position - UDim2.new(0, 0, DropdownCount + 1, 0)
						end
					end
					for i, v in pairs(TemporaryObjects.DropdownGUI) do v:Destroy() end
				end
				SaveSettings()
			end)
		end)
	end
}

Load()

return UILibrary
