if not game:IsLoaded() then
    game.Loaded:Wait()
end
task.wait(1)
print("I mai gay")
local vim = game:GetService("VirtualInputManager")-- fake hit space
vim:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.1)
vim:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
task.wait(1)
local ownedhmai1=game:GetService("Workspace").Plots.Plot1.Owner.value--check if pot n has owned yet
local ownedhmai2=game:GetService("Workspace").Plots.Plot2.Owner.value
local ownedhmai3=game:GetService("Workspace").Plots.Plot3.Owner.value
local ownedhmai4=game:GetService("Workspace").Plots.Plot4.Owner.value
local ownedhmai5=game:GetService("Workspace").Plots.Plot5.Owner.value
local ownedhmai6=game:GetService("Workspace").Plots.Plot6.Owner.value
local seedlist={"Carrot","Corn","Onion","Strawberry","Mushroom","Beetroot","Tomato","Apple","Banana","Plum","Potato","Cabbage","Cherry"}
local Gearshoplist={}

local seedinpocket={}
local Startaxist=
{
[1]=nil,
[2]=nil,
[3]=nil

}

print(ownedhmai1)
print(ownedhmai2)
print(ownedhmai3)
print(ownedhmai4)
print(ownedhmai5)
print(ownedhmai6)
if string.len(ownedhmai1)<=0 then --check avialable pot
    game:GetService("ReplicatedStorage").RemoteEvents.ClaimSelectedPlot:FireServer("Plot1")
task.wait(0.1)
game:GetService("ReplicatedStorage").RemoteEvents.SetStreamingFocus:FireServer("stop")
Startaxist={
[1]=189.7528076171875,
[2]=185.5998077392578,
[3]=321.2134094238281
}
print("Pot1 chosen")
elseif string.len(ownedhmai2)<=0 then
    game:GetService("ReplicatedStorage").RemoteEvents.ClaimSelectedPlot:FireServer("Plot2")
task.wait(0.1)
game:GetService("ReplicatedStorage").RemoteEvents.SetStreamingFocus:FireServer("stop")
Startaxist={
[1]=415.9359436035156,
[2]=208.60287475585938,
[3]=402.1802673339844
}
print("Pot2 chosen")
elseif string.len(ownedhmai3)<=0 then
    game:GetService("ReplicatedStorage").RemoteEvents.ClaimSelectedPlot:FireServer("Plot3")
task.wait(0.1)
game:GetService("ReplicatedStorage").RemoteEvents.SetStreamingFocus:FireServer("stop")
Startaxist={
[1]=405.2184143066406,
[2]=215.09982299804688,
[3]=768.2178344726562
}
print("Pot3 chosen")
elseif string.len(ownedhmai4)<=0 then
    game:GetService("ReplicatedStorage").RemoteEvents.ClaimSelectedPlot:FireServer("Plot4")
task.wait(0.1)
game:GetService("ReplicatedStorage").RemoteEvents.SetStreamingFocus:FireServer("stop")
Startaxist={
[1]=138.93870544433594,
[2]=187.0998077392578,
[3]=956.351806640625
}
print("Pot4 chosen")
elseif string.len(ownedhmai5)<=0 then
    game:GetService("ReplicatedStorage").RemoteEvents.ClaimSelectedPlot:FireServer("Plot5")
task.wait(0.1)
game:GetService("ReplicatedStorage").RemoteEvents.SetStreamingFocus:FireServer("stop")
Startaxist={
[1]=-106.53943634033203,
[2]=197.0998077392578,
[3]=847.1944580078125
}
print("Pot5 chosen")
else
  game:GetService("ReplicatedStorage").RemoteEvents.ClaimSelectedPlot:FireServer("Plot6")
task.wait(0.1)
game:GetService("ReplicatedStorage").RemoteEvents.SetStreamingFocus:FireServer("stop")
Startaxist={
[1]=-88.45311737060547,
[2]=202.1029815673828,
[3]=352.55023193359375

}
print("Pot6 chosen")
end
print(Startaxist[1] .. ", " .. Startaxist[2] .. ", " .. Startaxist[3])

local function Autoplant(Plant) --"{Name of plant}" like Carrot
local args = {
    [1] = Plant,
    [2] = Vector3.new(unpack(Startaxist))
}
game:GetService("ReplicatedStorage").RemoteEvents.PlantSeed:InvokeServer(unpack(args))
end

local function Autosellall() --sell all inv
sellipos =
{
[1]=149.39739990234375,--X
[2]=204.01199340820312,--Y
[3]=671.9998779296875--Z
}

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(unpack(sellipos))--sell pos
task.wait(0.1)
game:GetService("ReplicatedStorage").RemoteEvents.SellItems:InvokeServer("SellAll")--sell all plant
end

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
local function Autobuyseed(Name)--buyseed "{Name} Seed" Like Carrot Seed
shoppos={
[1]=176.7036895751953,
[2]=204.01797485351562,
[3]=672
}
local buyseed = {
    [1] = "SeedShop",
    [2] = Name
}

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(unpack(shoppos))--tp 2 seed shop
task.wait(0.1)

game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem:InvokeServer(unpack(buyseed))--remote to buy seed
end
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

local isEquipping = false -- Prev enless loop


local function AutoequipSeed()
    -- 1if it is working or die then break
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


task.wait(2)

while true do
for i,pants in pairs(seedlist) do
for i= 1,5 do
    Autobuyseed(pants.." ".."Seed")
end
end

 local targetPos = Vector3.new(unpack(Startaxist)) + Vector3.new(0, 5, 6)
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(targetPos))
AutoequipSeed()

for i,seedss in pairs(seedlist) do
for i=1,30 do
Autoplant("Carrot")
Autoplant(seedss)
end
end

Autoharvest()
local targetPos = Vector3.new(unpack(Startaxist)) + Vector3.new(0, 5, 6)
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(targetPos))





for i=1,4 do
Autosellall()
end

end  