if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(1)

local vim = game:GetService("VirtualInputManager")
local replicatedStorage = game:GetService("ReplicatedStorage")
local plots = workspace:WaitForChild("Plots")

-- pot cord
local plotCoordinates = {
    {189.7528, 185.5998, 321.2134}, -- Plot1
    {415.9359, 208.6028, 402.1802}, -- Plot2
    {405.2184, 215.0998, 768.2178}, -- Plot3
    {138.9387, 187.0998, 956.3518}, -- Plot4
    {-106.5394, 197.0998, 847.1944}, -- Plot5
    {-88.4531, 202.1029, 352.5502}   -- Plot6
}

-- hit space
vim:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.1)
vim:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
task.wait(1)

local chosenPlotIndex = nil
local Startaxist = {}

-- lf for avail pot
for i = 1, 6 do
    local plotName = "Plot" .. i
    local owner = plots[plotName].Owner.Value
    
    print(plotName .. " owner: " .. (owner ~= "" and owner or "Empty"))
    
    if string.len(owner) <= 0 then
        chosenPlotIndex = i
        Startaxist = plotCoordinates[i]
        break -- break if pot found
    end
end

-- if there's no avail pot pick pot 6
if not chosenPlotIndex then
    chosenPlotIndex = 6
    Startaxist = plotCoordinates[6]
end

--pick pot
local plotName = "Plot" .. chosenPlotIndex
replicatedStorage.RemoteEvents.ClaimSelectedPlot:FireServer(plotName)
task.wait(0.1)
replicatedStorage.RemoteEvents.SetStreamingFocus:FireServer("stop")

print(plotName .. " chosen: " .. table.concat(Startaxist, ", "))

