local Fluent = loadstring(game:HttpGet(“https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua”))()

local Window = Fluent:CreateWindow({
Title = “iSylHub”,
SubTitle = “Script Hub v1.0”,
TabWidth = 100,
Size = UDim2.fromOffset(450, 300),
Acrylic = true,
Theme = “Dark”,
MinimizeKey = Enum.KeyCode.LeftControl
})

– Variabel untuk fitur
local speedMultiplier = 1
local jumpPowerMultiplier = 1
local speedEnabled = false
local jumpEnabled = false

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild(“Humanoid”)
local rootPart = character:WaitForChild(“HumanoidRootPart”)

– Function untuk Speed Hack
local function enableSpeedHack(multiplier)
if not speedEnabled then
speedEnabled = true
humanoid.WalkSpeed = 16 * multiplier
end
end

local function disableSpeedHack()
speedEnabled = false
humanoid.WalkSpeed = 16
end

– Function untuk Jump Power
local function enableJumpPower(multiplier)
if not jumpEnabled then
jumpEnabled = true
humanoid.JumpPower = 50 * multiplier
end
end

local function disableJumpPower()
jumpEnabled = false
humanoid.JumpPower = 50
end

– TAB MAIN
local Tab = Window:AddTab({
Title = “Home”,
Icon = “home”
})

Tab:AddParagraph({
Title = “Selamat Datang”,
Content = “iSylHub - Script Hub Executor\nVersi 1.0”
})

– TAB FITUR
local FeatureTab = Window:AddTab({
Title = “Fitur”,
Icon = “zap”
})

– Speed Hack Section
FeatureTab:AddSection(“Speed Hack”)

local speedSlider = FeatureTab:AddSlider(“SpeedSlider”, {
Title = “Speed Multiplier”,
Default = 1,
Min = 1,
Max = 5,
Rounding = 1,
Callback = function(Value)
speedMultiplier = Value
if speedEnabled then
humanoid.WalkSpeed = 16 * Value
end
end
})

FeatureTab:AddButton({
Title = “Enable Speed”,
Callback = function()
enableSpeedHack(speedMultiplier)
print(“Speed Hack Enabled!”)
end
})

FeatureTab:AddButton({
Title = “Disable Speed”,
Callback = function()
disableSpeedHack()
print(“Speed Hack Disabled!”)
end
})

– Jump Power Section
FeatureTab:AddSection(“Jump Power”)

local jumpSlider = FeatureTab:AddSlider(“JumpSlider”, {
Title = “Jump Power Multiplier”,
Default = 1,
Min = 1,
Max = 5,
Rounding = 1,
Callback = function(Value)
jumpPowerMultiplier = Value
if jumpEnabled then
humanoid.JumpPower = 50 * Value
end
end
})

FeatureTab:AddButton({
Title = “Enable Jump Power”,
Callback = function()
enableJumpPower(jumpPowerMultiplier)
print(“Jump Power Enabled!”)
end
})

FeatureTab:AddButton({
Title = “Disable Jump Power”,
Callback = function()
disableJumpPower()
print(“Jump Power Disabled!”)
end
})

– TAB SETTINGS
local SettingsTab = Window:AddTab({
Title = “Settings”,
Icon = “settings”
})

SettingsTab:AddParagraph({
Title = “Informasi”,
Content = “iSylHub v1.0\nScript Hub Executor\nby iSylvester”
})

SettingsTab:AddButton({
Title = “Reset All”,
Callback = function()
disableSpeedHack()
disableJumpPower()
speedSlider:SetValue(1)
jumpSlider:SetValue(1)
print(“All features reset!”)
end
})

– Handle character respawn
player.CharacterAdded:Connect(function(newCharacter)
character = newCharacter
humanoid = character:WaitForChild(“Humanoid”)
rootPart = character:WaitForChild(“HumanoidRootPart”)

```
-- Reset fitur saat respawn
speedEnabled = false
jumpEnabled = false
humanoid.WalkSpeed = 16
humanoid.JumpPower = 50
```

end)

print(“iSylHub Loaded Successfully!”)
