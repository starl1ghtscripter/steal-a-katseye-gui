local bases = workspace:WaitForChild("Bases")

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")

for _, base in ipairs(bases:GetChildren()) do
	task.spawn(function()
		local config = base:FindFirstChild("Configuration")
		if not config then return end

		local basePlayer = config.Player.Value
		if basePlayer ~= plr then return end

		local lock = base:FindFirstChild("Lock")
		if not lock then continue end
		local touch = lock:FindFirstChildOfClass("TouchTransmitter")
		if touch then
			firetouchinterest(lock, root, 0)
			firetouchinterest(lock, root, 1)
		end
	end)
end
