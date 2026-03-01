local function Autoclaimquest()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClaimQuest = ReplicatedStorage.RemoteEvents.ClaimQuest
local questTypes = {"Weekly", "Daily"}

for j, qType in ipairs(questTypes) do
    for i = 1, 5 do
        local success, err = pcall(function()
            ClaimQuest:FireServer(qType, tostring(i))
        end)
        
        if not success then
            break
        end
    end
end
end