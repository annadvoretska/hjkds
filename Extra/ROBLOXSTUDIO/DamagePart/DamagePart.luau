local part = script.Parent --наш Part
local debounce = false --перезарядка

part.Touched:Connect(function(hit) --Івент дотику
	if debounce == false then
		debounce = true
		local character = hit.Parent
		local humanoid = character:FindFirstChild("Humanoid")
		if humanoid then
			humanoid.Health = humanoid.Health - 30 --віднімаємо від humanoid.Health 30. Не humanoid.MaxHealth, бо це дасть персонажу 30 макс.здоро'я, а не віднімить його.
		end
		task.wait(1)
		debounce = false
	end
end)
