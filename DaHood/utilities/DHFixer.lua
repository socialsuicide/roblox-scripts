--[[

    This script will stop annoying shit from breaking your macro.
    
    Loadstring Version: loadstring(game:HttpGet("https://raw.githubusercontent.com/socialsuicide/roblox-scripts/main/DaHood/utilities/DHFixer.lua", true))();
    
]]--

-- // Await until game is fully loaded
repeat task.wait() until game:IsLoaded()
repeat task.wait() until game:GetService("Workspace").Players:FindFirstChild(game:GetService("Players").LocalPlayer.Name)

-- // Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

-- // Variables
local LocalPlayer = Players.LocalPlayer

-- // ANTI AFK
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
end)

-- // Destroying the annoying ADs
if Workspace:FindFirstChild("ForwardPortal") then
    Workspace.ForwardPortal:Destroy()
end

-- // Disabling Seats
for _, v in pairs(Workspace:GetDescendants()) do
    if v:IsA("Seat") then
        v.Disabled = true
    end
end

-- // Destroying Pickups
for _, v in pairs(Workspace.Ignored.ItemsDrop:GetChildren()) do
    v:Destroy()
end
