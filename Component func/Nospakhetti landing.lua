if not game:IsLoaded() then--wait till game load
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local VirtualInputManager = game:GetService("VirtualInputManager")

task.spawn(function()
    local _LoadingGui = PlayerGui:FindFirstChild("LoadingScreenGui")--check loading SCR
    if _LoadingGui then
        repeat
            task.wait(0.5)
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)--REM hit space
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
        until PlayerGui:GetAttribute("UIReady") == true--until UI ready
    end
end)

local function GetMyPlot()
    for _, plot in ipairs(workspace.Plots:GetChildren()) do
        if plot:GetAttribute("Owner") == LocalPlayer.UserId then
            print(plot)
            return plot
        end
    end
end

local PlotSelector = PlayerGui:WaitForChild("PlotSelector")
local Confirm = PlotSelector.Frame.MiddleBit.Confirm

repeat
    task.wait(0.5)
    firesignal(Confirm.MouseButton1Click)
until not PlotSelector.Frame.Visible and GetMyPlot()

warn("Enjoy SairyWare by Alert3z")