--я попробую згадати, як цей код працює.

local btn = script.Parent --створюємо перемінні, вказуючи шлях до об'єкту. Наш скрипт знаходиться в Part, тому воно э "батьком", а скрипт - "дитиною"

--ці перемінні зможуть нам допомогти, щоб зробити перезарядку кнопки та перевірку, чи доторкнувся наш персонаж до створенного скриптом кулі.
local touched = false
local debounce = false

btn.ClickDetector.MouseClick:Connect(function() --У нашого Part є ClickDetector, який дає нам змогу натискати на part.
	if debounce == false then --Якщо перезарядки у нас нема, то робимо debounce = true.
		script.Pop:Play()
		debounce = true

		--Створюємо кулю та його перевірку дотику.
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

			--Створюємо перемінні humanoid гравця, щоб надалі працювати зі здоров'ям
			local character = hit.Parent
			local humanoid = character:FindFirstChild("Humanoid")

			if not character or not humanoid then return end --Якщо це не гравець - повертаємо.


			--Але якщо це humanoid, тоді сстворюємо вибух
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
			--а після цього торкатись кулі буде неможливо
			task.wait(5)
			touched = false
			
		end)


		if not touched then --Але якщо його не чіпати, він знищиться.
			task.wait(4)
			newPart:Destroy()
		end
		task.wait(5)
		debounce = false --вимикаємо перезарядку.
	end
end)
