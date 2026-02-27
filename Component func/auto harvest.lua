local function Autoharvest()
local folderplantpath = game.Workspace.ClientPlants
local plantposition = {}

--locate position and put it in table
for i, plant in pairs(folderplantpath:GetChildren()) do
    for j, rootpart in pairs(plant:GetDescendants()) do
        if (rootpart.Name == "FruitAnchor" or rootpart.Name == "PlantAnchor") and rootpart:IsA("BasePart") then
            table.insert(plantposition, rootpart.Position)
        end
    end
end

--loop TP
for i, pos in ipairs(plantposition) do
    local char = game.Players.LocalPlayer.Character
    local hrp = char:FindFirstChild("HumanoidRootPart")
    
    if hrp then
        -- Res velo prev take off
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero

       --new pos but +3y prev drowning
        hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))

        task.wait(0.2)
        
        -- fake hit E
        local vim = game:GetService("VirtualInputManager")
        vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        task.wait(0.1)
        vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        
        task.wait(0.5) 
    end
end
end