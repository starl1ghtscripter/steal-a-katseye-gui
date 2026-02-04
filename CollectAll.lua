local bases = workspace:WaitForChild("Bases")

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local head = char:WaitForChild("HumanoidRootPart")

for _, base in ipairs(bases:GetChildren()) do
	task.spawn(function()
		local config = base:FindFirstChild("Configuration")
		if not config then return end

		local basePlayer = config.Player.Value
		if basePlayer ~= plr then return end

		for _, slot in ipairs(base.Slots:GetChildren()) do
			local collect = slot:FindFirstChild("Collect")
			if not collect then continue end
			local touch = collect:FindFirstChildOfClass("TouchTransmitter")
			if touch then
				firetouchinterest(collect, head, 0)
				firetouchinterest(collect, head, 1)
			end
		end
	end)
end
