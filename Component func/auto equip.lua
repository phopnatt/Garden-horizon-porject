local function autoequip(Tool)
local player = game.Players.LocalPlayer
local char = player.Character 
local hum = char:WaitForChild("Humanoid")
local backpack = player:WaitForChild("Backpack")

-- check if shov in inv
local tool = backpack:FindFirstChild(Tool) 
 if tool.Parent == backpack then
        hum:EquipTool(tool)
 end
end