local Players = game:GetService("Players")
local player = Players.LocalPlayer

local GUI = player:WaitForChild("PlayerGui"):WaitForChild("Count") --:WaitForChild чекає на "дитину", FindFirstChild --шукає та повертає першу дочірню одиницю об'єкта за її назвою, або nil, якщо така одиниця не знайдена.
local text = GUI:WaitForChild("Main"):WaitForChild("Text")
local TweenService = game:GetService("TweenService") --отримаємо сервис TweenService. Це як бібліотека, яка дозволяє об'єктам плавно пересуватись

GUI.Enabled = false

local FadeOut = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out
)

local tool = script.Parent
local light = tool:WaitForChild("Light")
local PointLight1 = light:WaitForChild("PointLight1")
local PointLight2 = light:WaitForChild("PointLight2")
local Flame = tool.Union:WaitForChild("ParticleEmitter")

local MAX_LIGHT = 1000 -- скільки всього світла
local CURRENT_LIGHT = MAX_LIGHT -- скільки світла на даний момент

local isRunning = false

--Анімація "затухання"
local LightPartOut = TweenService:Create(
	light, FadeOut, {Transparency = 1}
)

local PointLight1Out = TweenService:Create(
	PointLight1, FadeOut, {Brightness = 0}
)

local PointLight2Out = TweenService:Create(
	PointLight2, FadeOut, {Brightness = 0}
)

tool.Equipped:Connect(function() --якщо предмет в руці.
	GUI.Enabled = true
	if isRunning then
		return
	end

	isRunning = true
	
	while CURRENT_LIGHT > 0 do --цикл, який віднімає 1 від CURRENT_LIGHT кожні 2 секунди
		task.wait(2)
		CURRENT_LIGHT -= 1
		text.Text = CURRENT_LIGHT.."/"..MAX_LIGHT
	end

  --"Затухання"
	LightPartOut:Play()
	PointLight1Out:Play()
	PointLight2Out:Play()
	Flame.Enabled = false
	print("Lights Out")

  --видаляємо об'єкти
	task.wait(0.5)
	Flame:Destroy()
	light:Destroy()
	task.wait(6)
	tool:Destroy()
	GUI.Enabled = false
	isRunning = false
end)

tool.Unequipped:Connect(function() --якщо предмет в інвентарі.
	GUI.Enabled = false
end)
