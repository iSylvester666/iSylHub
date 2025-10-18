local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Bikin Window
local Window = Fluent:CreateWindow({
    Title = "iSylHub",
    SubTitle = "Script Hub",
    TabWidth = 100,
    Size = UDim2.fromOffset(500, 350),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Buat Tab
local Home = Window:AddTab({
    Title = "Home",
    Icon = "home"
})

local Main = Window:AddTab({
    Title = "Main",
    Icon = "user"
})

local Auto = Window:AddTab({
    Title = "Auto",
    Icon = "git-branch"
})

local Shop = Window:AddTab({
    Title = "Shop",
    Icon = "shopping-cart"
})

local Vuln = Window:AddTab({
    Title = "Vuln",
    Icon = "alert-circle"
})

local Config = Window:AddTab({
    Title = "Config",
    Icon = "settings"
})

-- Isi Tab Home
Home:AddParagraph({
    Title = "Welcome to iSylHub!",
    Content = "Script hub untuk berbagai game Roblox. Pilih tab sesuai kebutuhan Anda."
})

Home:AddButton({
    Title = "Check Version",
    Description = "Cek versi script di console.",
    Callback = function()
        print("iSylHub v1.0 aktif")
    end
})


Window:SelectTab(Home)
