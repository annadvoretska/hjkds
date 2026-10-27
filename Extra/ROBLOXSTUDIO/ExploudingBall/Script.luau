local btn = script.Parent
local touched = false
local debounce = false

btn.ClickDetector.MouseClick:Connect(function()
	if debounce == false then
		script.Pop:Play()
		debounce = true
		--creating a new part and its touch event
		local newPart = Instance.new("Part")
		newPart.Size = Vector3.new(7.98, 7.98, 7.98)
		newPart.Position = Vector3.new(-0.88, 4.59, -14.92)
		newPart.Shape = Enum.PartType.Ball
		newPart.Color = Color3.new(1, 0, 0)
		newPart.Anchored = false
		newPart.Material = Enum.Material.Neon
		newPart.Parent = game.Workspace
		
		local decal = Instance.new("Texture")
		decal.Texture = "rbxassetid://132310482133355"
		decal.Parent = newPart
		decal.StudsPerTileU = 10
		decal.StudsPerTileV = 10

		newPart.Touched:Connect(function(hit)


			local character = hit.Parent
			local humanoid = character:FindFirstChild("Humanoid")

			if not character or not humanoid then return end


			--if humanoid then creating a explosion
			if humanoid and touched == false then
				touched = true
				script.FACTY:Play()
				task.wait(0.2)
				script.Boom:Play()
				local explosion = Instance.new("Explosion")
				explosion.Position = newPart.Position
				explosion.BlastRadius = 10
				explosion.BlastPressure = 500000
				explosion.Parent = game.Workspace
				newPart:Destroy()
				
			end

			task.wait(5)
			touched = false
			
		end)


		if not touched then
			task.wait(4)
			newPart:Destroy()
		end
		task.wait(5)
		debounce = false
	end
end)
