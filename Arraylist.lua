local array = Instance.new("ScreenGui", game.CoreGui)

spawn(function()
        array.Enabled = getgenv().Array
end)

local arrayFrame = Instance.new("Frame", array)

getgenv().Array = array

local gridlayout = Instance.new("UIGridLayout", arrayFrame)
gridlayout.CellPadding = UDim2.new(0, 0, 1.5e-3, 0)
gridlayout.SortOrder = Enum.SortOrder.LayoutOrder
gridlayout.CellSize = UDim2.new(1, 0, 0.024, 0)
gridlayout.HorizontalAlignment = "Left"
array.Name = math.random(100, 1e8)
array.Enabled = true
arrayFrame.Size = UDim2.new(0.2, 0, 1, 0)
arrayFrame.Position = UDim2.new(0.795, 0, 0, 0)
arrayFrame.BackgroundTransparency = 1
local colorbox = Color3.fromRGB(170, 0, 170)
local selectedcol = nil

getlowerthing = function(length,n)
    local lastlowerthing = length
    local same
    for i, v in pairs(arrayFrame:GetChildren()) do if v:IsA"Frame" then end end
    for i, v in pairs(arrayFrame:GetChildren()) do
        if v:IsA"Frame" and v.Name ~= n then
            if v.LayoutOrder * -1 < length then
                if lastlowerthing > length - v.LayoutOrder * -1 then lastlowerthing = length - v.LayoutOrder * -1 end
            end
        end
    end
    return lastlowerthing
end

array = {
    removething = function(name)
        local thingy = arrayFrame:FindFirstChild(name)
        if thingy then thingy:Destroy() end
    end,

    addthing = function(name)
        local TextService = game:GetService"TextService"
        -- arrayFrame.Size = arrayFrame.Size + UDim2.new(0,0,.03,0)
        local ArrayListedFrame = Instance.new("Frame", arrayFrame)
        local ArrayListedText = Instance.new("TextLabel", ArrayListedFrame)
        local BackSide = Instance.new("Frame", ArrayListedFrame)
        BackSide.Size = UDim2.new(0.03, 0, 1.1, 0)
        BackSide.BorderSizePixel = 0
        BackSide.Position = UDim2.new(1.006, 0, 0, 0)
        ArrayListedFrame.Name = name
        ArrayListedFrame.BackgroundTransparency = 1
        for i, v in pairs(ArrayListedFrame:GetChildren()) do
            if v:IsA"Frame" and not v.LayoutOrder == ArrayListedFrame.LayoutOrder then v.LayoutOrder = v.LayoutOrder - 1 end
        end
        ArrayListedText.Size = UDim2.new(string.len(name) / 38, 0, 1.05, 0)
        ArrayListedText.Text = name .. "   "
        ArrayListedText.TextScaled = false
        ArrayListedText.TextSize = ArrayListedText.AbsoluteSize.X * 7e-3 + ArrayListedText.AbsoluteSize.Y * 0.75
        ArrayListedText.TextStrokeTransparency = 1
        ArrayListedText.TextTransparency = 0
        ArrayListedText.BorderSizePixel = 0
        ArrayListedText.Font = Enum.Font.Gotham
        ArrayListedText.TextColor3 = Color3.fromRGB(220, 220, 220)
        ArrayListedText.BackgroundTransparency = .6
        ArrayListedText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        ArrayListedText.Position = UDim2.new(1 - string.len(name) / 39, 0, 0, 0)
        ArrayListedText.TextXAlignment = "Right"
        ArrayListedText.Name = "artxt"
        ArrayListedText.TextStrokeTransparency = 0.7
        local function getTextBounds()
            local message = name
            local size = Vector2.new(0, 0)
            local bounds = TextService:GetTextSize(message, ArrayListedText.AbsoluteSize.X * 7e-3 + ArrayListedText.AbsoluteSize.Y * 0.65, "Gotham", size)
            return bounds + Vector2.new(0, 0)
        end
        ArrayListedText.Size = UDim2.new(string.len(name) / 38, 0, 1.05, 0)
        ArrayListedFrame.LayoutOrder = getTextBounds().X * -1
        coroutine.wrap(function()
            repeat
                task.wait()
                BackSide.BackgroundColor3 = getgenv().ArrayColor
                ArrayListedText.TextColor3 = getgenv().ArrayColor
                ArrayListedText.BackgroundTransparency = getgenv().ArrayTransparency
                BackSide.BackgroundTransparency = getgenv().ArrayBackTransparency
            until not ArrayListedFrame
        end)()
    end,
}

return array
