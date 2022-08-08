repeat task.wait() until game:IsLoaded()

Animations = {
	["1_7_Autoblock"] = {CFrame = CFrame.new(-0.01, -3.51, -2.01) * CFrame.Angles(math.rad(-180), math.rad(85), math.rad(-180)), Time = 0},
	["Astral"] = {
		{
			CFrame = CFrame.new(-0.01, 0.49, -1.51) * CFrame.Angles(math.rad(90), math.rad(45), math.rad(-90)),
			Time = 0
		},
		{
			CFrame = CFrame.new(-0.01, 0.49, -1.51) * CFrame.Angles(math.rad(-51), math.rad(48), math.rad(24)),
			Time = 0.06
		},
		{
			CFrame = CFrame.new(-0.01, 0.49, -1.51) * CFrame.Angles(math.rad(90), math.rad(45), math.rad(-90)),
			Time = 0.06
		}
	},
	["Jerkin"] = {
		{
			CFrame = CFrame.new(-1.5, 0.08, -1.01) * CFrame.Angles(math.rad(-0), math.rad(0), math.rad(90)),
			Time = 0
		},
		{
			CFrame = CFrame.new(-1.51, 0.08, -2.51) * CFrame.Angles(math.rad(-0), math.rad(0), math.rad(90)),
			Time = 0.01
		},
		{
			CFrame = CFrame.new(-1.51, 0.08, -0.01) * CFrame.Angles(math.rad(-0), math.rad(0), math.rad(90)),
			Time = 0.01
		},
		{
			CFrame = CFrame.new(-1.5, 0.08, -1.01) * CFrame.Angles(math.rad(-0), math.rad(0), math.rad(90)),
			Time = 0.01
		}
	},
	["Karambit"] = {
		{
			CFrame = CFrame.new(-0.01, 0, -1.51) * CFrame.Angles(math.rad(-50), math.rad(0), math.rad(0)),
			Time = 0
		},
		{
			CFrame = CFrame.new(-0.01, -0.01, -1.51) * CFrame.Angles(math.rad(-155), math.rad(0), math.rad(-0)),
			Time = 0.03
		},
		{
			CFrame = CFrame.new(-0.01, -0.01, -1.51) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(0)),
			Time = 0.03
		},
		{
			CFrame = CFrame.new(-0.01, -0.01, -1.51) * CFrame.Angles(math.rad(30), math.rad(-0), math.rad(0)),
			Time = 0.03
		},
		{
			CFrame = CFrame.new(-0.01, 0, -1.51) * CFrame.Angles(math.rad(-50), math.rad(0), math.rad(0)),
			Time = 0.03
		}
	},
	["Swank"] = {
		{
			CFrame = CFrame.new(-0.01, 0, -1.51) * CFrame.Angles(math.rad(-0), math.rad(85), math.rad(0)),
			Time = 0
		},
		{
			CFrame = CFrame.new(-0.02, -0.01, -1.51) * CFrame.Angles(math.rad(59), math.rad(19), math.rad(-37)),
			Time = 0.03
		},
		{
			CFrame = CFrame.new(-0.01, 0, -1.51) * CFrame.Angles(math.rad(-0), math.rad(85), math.rad(0)),
			Time = 0.03
		},
	},
}
return Animations
