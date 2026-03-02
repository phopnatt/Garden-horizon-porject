local function AutoEquipseed()
local x=game:GetService("Players")["LocalPlayer"].Backpack:GetChildren()
local seedinbackpack={}
for i,v in pairs(x) do
    if string.find(v.Name,"Seed") and not string.find(v.Name,"Pack") then
table.insert(seedinbackpack,v)
end
end
math.randomseed(os.time()) 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local randomedseed = seedinbackpack[math.random(#seedinbackpack)]

print(randomedseed)

character.Humanoid:EquipTool(randomedseed)
end
AutoEquipseed()