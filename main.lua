– Load Orion Library
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

– Create Window
local Window = OrionLib:MakeWindow({
Name = “My Hub Script v1.0”,
HidePremium = false,
SaveConfig = true,
ConfigFolder = “MyHubConfig”,
IntroEnabled = true,
IntroText = “Welcome to My Hub!”,
IntroIcon = “rbxassetid://4483345998”
})

– Notification saat script dimuat
OrionLib:MakeNotification({
Name = “Script Loaded!”,
Content = “Hub script berhasil dimuat.”,
Image = “rbxassetid://4483345998”,
Time = 5
})

– ===== TAB 1: MAIN =====
local MainTab = Window:MakeTab({
Name = “Main”,
Icon = “rbxassetid://4483345998”,
PremiumOnly = false
})

local MainSection = MainTab:AddSection({
Name = “Main Features”
})

– Speed Slider
MainTab:AddSlider({
Name = “WalkSpeed”,
Min = 16,
Max = 200,
Default = 16,
Color = Color3.fromRGB(255, 255, 255),
Increment = 1,
ValueName = “Speed”,
Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end  
})

– Jump Power Slider
MainTab:AddSlider({
Name = “JumpPower”,
Min = 50,
Max = 200,
Default = 50,
Color = Color3.fromRGB(255, 255, 255),
Increment = 1,
ValueName = “Power”,
Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end  
})

– Reset Character Button
MainTab:AddButton({
Name = “Reset Character”,
Callback = function()
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end  
})

– ===== TAB 2: COMBAT =====
local CombatTab = Window:MakeTab({
Name = “Combat”,
Icon = “rbxassetid://4483345998”,
PremiumOnly = false
})

local CombatSection = CombatTab:AddSection({
Name = “Combat Features”
})

– God Mode Toggle
CombatTab:AddToggle({
Name = “God Mode”,
Default = false,
Save = true,
Flag = “GodMode”,
Callback = function(Value)
if Value then
game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
else
game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 100
game.Players.LocalPlayer.Character.Humanoid.Health = 100
end
end  
})

– Infinite Jump Toggle
local InfiniteJumpEnabled = false
CombatTab:AddToggle({
Name = “Infinite Jump”,
Default = false,
Save = true,
Flag = “InfJump”,
Callback = function(Value)
InfiniteJumpEnabled = Value
game:GetService(“UserInputService”).JumpRequest:connect(function()
if InfiniteJumpEnabled then
game.Players.LocalPlayer.Character:FindFirstChildOfClass(“Humanoid”):ChangeState(“Jumping”)
end
end)
end  
})

– ===== TAB 3: VISUAL =====
local VisualTab = Window:MakeTab({
Name = “Visual”,
Icon = “rbxassetid://4483345998”,
PremiumOnly = false
})

local VisualSection = VisualTab:AddSection({
Name = “Visual Features”
})

– ESP Toggle
VisualTab:AddToggle({
Name = “ESP Players”,
Default = false,
Save = true,
Flag = “ESP”,
Callback = function(Value)
if Value then
for _, player in pairs(game.Players:GetPlayers()) do
if player ~= game.Players.LocalPlayer and player.Character then
local highlight = Instance.new(“Highlight”)
highlight.Parent = player.Character
highlight.FillColor = Color3.fromRGB(255, 0, 0)
highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
end
end
else
for _, player in pairs(game.Players:GetPlayers()) do
if player.Character and player.Character:FindFirstChild(“Highlight”) then
player.Character.Highlight:Destroy()
end
end
end
end  
})

– FOV Slider
VisualTab:AddSlider({
Name = “Field of View”,
Min = 70,
Max = 120,
Default = 70,
Color = Color3.fromRGB(255, 255, 255),
Increment = 1,
ValueName = “FOV”,
Callback = function(Value)
game.Workspace.CurrentCamera.FieldOfView = Value
end  
})

– Color Picker
VisualTab:AddColorpicker({
Name = “Ambient Color”,
Default = Color3.fromRGB(255, 255, 255),
Callback = function(Value)
game.Lighting.Ambient = Value
end
})

– ===== TAB 4: TELEPORT =====
local TeleportTab = Window:MakeTab({
Name = “Teleport”,
Icon = “rbxassetid://4483345998”,
PremiumOnly = false
})

local TeleportSection = TeleportTab:AddSection({
Name = “Teleport Locations”
})

– Dropdown for teleport locations
TeleportTab:AddDropdown({
Name = “Select Location”,
Default = “Spawn”,
Options = {“Spawn”, “Location 1”, “Location 2”, “Location 3”},
Callback = function(Value)
– Ganti coordinates sesuai game
local locations = {
[“Spawn”] = Vector3.new(0, 50, 0),
[“Location 1”] = Vector3.new(100, 50, 100),
[“Location 2”] = Vector3.new(-100, 50, -100),
[“Location 3”] = Vector3.new(200, 50, 200)
}

```
    if locations[Value] then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(locations[Value])
    end
end    
```

})

– ===== TAB 5: MISC =====
local MiscTab = Window:MakeTab({
Name = “Misc”,
Icon = “rbxassetid://4483345998”,
PremiumOnly = false
})

local MiscSection = MiscTab:AddSection({
Name = “Miscellaneous”
})

– Anti-AFK Toggle
MiscTab:AddToggle({
Name = “Anti-AFK”,
Default = false,
Save = true,
Flag = “AntiAFK”,
Callback = function(Value)
if Value then
local vu = game:GetService(“VirtualUser”)
game:GetService(“Players”).LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end
end  
})

– Text Box
MiscTab:AddTextbox({
Name = “Your Name”,
Default = “Player”,
TextDisappear = false,
Callback = function(Value)
print(“Name entered: “ .. Value)
end  
})

– Keybind
MiscTab:AddBind({
Name = “Toggle UI”,
Default = Enum.KeyCode.RightControl,
Hold = false,
Callback = function()
OrionLib:Toggle()
end  
})

– Paragraph
MiscTab:AddParagraph(“Info”, “Script ini dibuat untuk tujuan edukasi. Gunakan dengan bijak!”)

– ===== TAB 6: SETTINGS =====
local SettingsTab = Window:MakeTab({
Name = “Settings”,
Icon = “rbxassetid://4483345998”,
PremiumOnly = false
})

local SettingsSection = SettingsTab:AddSection({
Name = “Script Settings”
})

– Destroy UI Button
SettingsTab:AddButton({
Name = “Destroy UI”,
Callback = function()
OrionLib:Destroy()
end  
})

– ===== INITIALIZATION =====
OrionLib:Init()

– Print untuk debugging
print(“Hub Script loaded successfully!”)
