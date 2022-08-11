local NotificationGui = Instance.new("ScreenGui",game.CoreGui)
local Notifications = {}

local NotificationLibrary = {
    Notify = function(HeaderText,BodyText,time,IconColor)
        spawn(function()
            for i,v in pairs(Notifications) do
                v.Position = v.Position - UDim2.new(0,0,0.075,0)
            end
            local Frame = Instance.new("Frame",NotificationGui)
            table.insert(Notifications,Frame)
            Frame.Size = UDim2.new(0.151, 0, 0.067, 0)
            Frame.Position = UDim2.new(1.849, 0, 0.877, 0)
            Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            local Rounded = Instance.new("UICorner",Frame)
            local Edge = Instance.new("Frame",Frame)
            Edge.Size = UDim2.new(0.068, 0, 1, 0)
            Edge.BackgroundColor3 = Color3.fromRGB(34,34,34)
            Edge.BorderSizePixel = 0
            Edge.Position = UDim2.new(0.932, 0, 0, 0)
            local Header = Instance.new("TextLabel",Frame)
            Header.BackgroundTransparency = 1
            Header.Text = HeaderText
            Header.Font = Enum.Font.GothamSemibold
            Header.TextXAlignment = "Left"
            Header.TextColor3 = Color3.fromRGB(200,200,200)
            Header.Position = UDim2.new(0.081, 0, 0.16, 0)
            Header.Size = UDim2.new(0.908, 0, 0.326, 0)
            Header.TextSize = Header.AbsoluteSize.X * 0.06
            local Body = Instance.new("TextLabel",Frame)
            Body.BackgroundTransparency = 1
            Body.Text = BodyText
            Body.Font = Enum.Font.Gotham
            Body.TextXAlignment = "Left"
            Body.TextColor3 = Color3.fromRGB(200,200,200)
            Body.Position = UDim2.new(0.081, 0, 0.486, 0)
            Body.Size = UDim2.new(0.851, 0, 0.354, 0)
            Body.TextSize = Body.AbsoluteSize.X * 0.06
            local Detail = Instance.new("Frame",Frame)
            local Rounded2 = Instance.new("UICorner",Detail)
            Detail.Position = UDim2.new(0.031, 0, 0.16, 0)
            Detail.Size = UDim2.new(0.009, 0, 0.68, 0)
            Detail.BackgroundColor3 = IconColor
            for i = 1,40 do
                Frame.Position = Frame.Position - UDim2.new(1/40,0,0,0)
                task.wait()
            end
            task.wait(time)
            for i = 1,40 do
                Frame.Position = Frame.Position + UDim2.new(1/40,0,0,0)
                task.wait()
            end
            Frame:Destroy()
        end)
    end,
}

return NotificationLibrary

--[[
    example
    
NotificationLibrary.Notify("Test","Test",3,Color3.fromRGB(75, 151, 75))
]]
