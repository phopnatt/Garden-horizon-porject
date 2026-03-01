local function AutoequipSeed()
    -- 1if it is working or die then break
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local isEquipping = false
    if isEquipping then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end

    -- if holding seed then break
    local currentTool = character:FindFirstChildOfClass("Tool")
    if currentTool and string.find(currentTool.Name:lower(), "seed") then
        return 
    end

   
    local success, err = pcall(function()
        for _, item in pairs(backpack:GetChildren()) do
            -- Search for "Seed"
            if item:IsA("Tool") and string.find(item.Name:lower(), "seed") then
                
                isEquipping = true --start
                humanoid:EquipTool(item)
                task.wait(0.3) 
                isEquipping = false 
                
                -- check if item is out of hand
                item.Unequipped:Connect(function()
                    if isEquipping then return end
                    task.wait(0.1)
                    
                    -- if item lost exec again
                    if item.Parent == backpack or not item.Parent then
                        AutoequipSeed()
                    end
                end)
                
                return -- Founded end loop
            end
        end
    end)

    if not success then
        warn("Autoequip Error: " .. err)
        isEquipping = false -- if not complete dequip
    end
end