--[[

    I made this because i wanted a working monkey tycoon script. (most are broken xd)

    Loadstring version: loadstring(game:HttpGet("https://raw.githubusercontent.com/socialsuicide/roblox-scripts/main/Tycoons/MonkeyTycoon.lua", true))();

]]

-- // Services
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Variables
local LocalPlayer = Players.LocalPlayer

-- // Check if game is loaded
if not game:IsLoaded() then
    repeat
        task.wait()
    until game:IsLoaded()
end

-- // Check if already loaded
if getgenv().Loaded then
    warn("Already Loaded.")
    return
else
    getgenv().Loaded = true
end

-- // UI Libary
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local UI = Library.new("Monkey Tycoon UI | Halloween#0001", 5013109572)

-- // Anti AFK
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
end)

-- // UI Variables
local Page1 = UI:addPage("Monkeys", 5012544693)
local Page2 = UI:addPage("Dropper", 5012544693)
local Page3 = UI:addPage("Bananas", 5012544693)
local Page4 = UI:addPage("Settings", 5012544693)
local Section1 = Page1:addSection("Toggles")
local Section2 = Page2:addSection("Toggles")
local Section3 = Page3:addSection("Toggles")
local Section4 = Page4:addSection("Settings")

Section1:addToggle("Auto Purchase x1 Monkey", nil, function(boolen)
    getgenv().Auto_Purchase_X1 = boolen
    while Auto_Purchase_X1 do
        task.wait()
        ReplicatedStorage.GTycoonClient.Remotes.BuyDropper:FireServer(1)
    end
end)

Section1:addToggle("Auto Purchase x5 Monkeys", nil, function(boolen)
    getgenv().Auto_Purchase_X5 = boolen
    while Auto_Purchase_X5 do
        task.wait()
        ReplicatedStorage.GTycoonClient.Remotes.BuyDropper:FireServer(5)
    end
end)

Section1:addButton("Purchase Max Monkeys", function()
    ReplicatedStorage.GTycoonClient.Remotes.BuyDropperMax:FireServer()
end)

Section1:addToggle("Auto Merge Monkeys", nil, function(boolen)
    getgenv().Auto_Merge_Monkeys = boolen
    while Auto_Merge_Monkeys do
        task.wait()
        ReplicatedStorage.GTycoonClient.Remotes.MergeDroppers:FireServer()
    end
end)

Section2:addToggle("Auto Purchase Dropper Speed", nil, function(boolen)
    getgenv().Auto_Dropper_Speed = boolen
    while Auto_Dropper_Speed do
        task.wait()
        ReplicatedStorage.GTycoonClient.Remotes.BuySpeed:FireServer(1)
    end
end)

Section3:addToggle("Auto Collect Bananas", nil, function(boolen)
    getgenv().Auto_Collect_Bananas = boolen
    while Auto_Collect_Bananas do
        task.wait()
        ReplicatedStorage.GTycoonClient.Remotes.GrabDrops:FireServer(tonumber(math.huge))
        for _, v in pairs(Workspace.Drops:GetChildren()) do
            v:Destroy()
        end
    end
end)

Section3:addToggle("Auto Deposit Bananas", nil, function(boolen)
    getgenv().Auto_Deposit_Bananas = boolen
    while Auto_Deposit_Bananas do
        task.wait()
        ReplicatedStorage.GTycoonClient.Remotes.DepositDrops:FireServer()
    end
end)

Section4:addKeybind("Toggle Keybind", Enum.KeyCode.V, function()
    UI:toggle()
end)

Section4:addButton("Disable Sound", function()
    UserSettings().GameSettings.MasterVolume = 0
end)

Libary:SelectPage(Library.pages[1], true)
