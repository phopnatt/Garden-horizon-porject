if not game:IsLoaded() then
    game.Loaded:Wait()
end
local plotaxits=
{
["Plot1"]={189.7528076171875,185.5998077392578,321.2134094238281},
["Plot2"]={415.9359436035156,208.60287475585938,402.1802673339844},
["Plot3"]={405.2184143066406,215.09982299804688,768.2178344726562},
["Plot4"]={138.93870544433594,187.0998077392578,956.351806640625},
["Plot5"]={-106.53943634033203,197.0998077392578,847.1944580078125},
["Plot6"]={-88.45311737060547,202.1029815673828,352.55023193359375}
}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local VirtualInputManager = game:GetService("VirtualInputManager")
local seedlist={"Carrot","Corn","Onion","Strawberry","Mushroom","Beetroot","Tomato","Apple","Banana","Plum","Potato","Cabbage","Cherry","Dandelion","Sunpetal","Bellpepper","Goldenberry","Beetroot","Birch","Amber Pine","Wheat","Plum","Potato","Orange","Cabbage","Dawnfruit","Olive","Rose"}
local Gearshoplist={"Super sprinkler","Turbo Sprinkler","Basic Sprinkler"}
local Startaxist=nil
local seedStock={}
local randomedseed=nil



task.spawn(function()
    local _LoadingGui = PlayerGui:FindFirstChild("LoadingScreenGui")
    if _LoadingGui then
        repeat
            task.wait(0.5)
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.KeypadEnter, false, game)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.KeypadEnter, false, game)
        until PlayerGui:GetAttribute("UIReady") == true
    end
end)
local function GetMyPlot()
    for _, plot in ipairs(workspace.Plots:GetChildren()) do
        if plot:GetAttribute("Owner") == LocalPlayer.UserId then
            print(plot)
            plotaxits=plotaxits[plot]
            Startaxist=plotaxits
           
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
print(plotaxits)

local function Autosellall()
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

local function Autoplant(Plant)
game:GetService("ReplicatedStorage").RemoteEvents.PlantSeed:InvokeServer(Plant,Vector3.new(unpack(Startaxist) ))
end

local function Autobuygearshop(Gear)
    

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(212.79725646972656, 204.04000854492188, 609.1134643554688)
task.wait(0.5)
game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem:InvokeServer("GearShop",Gear)
end

local function Autousegear(Gearname)
game:GetService("ReplicatedStorage").RemoteEvents.UseGear:FireServer(Gearname,{
        ["position"] = Vector3.new(unpack(Startaxist))
    })
end
--Vector3.new(unpack(Startaxist)) + Vector3.new(0, 5, 6)
local function Autousesprinkler(Gearname)
game:GetService("ReplicatedStorage").RemoteEvents.UseGear:FireServer(Gearname,{
        ["position"] = Vector3.new(unpack(Startaxist)) + Vector3.new(0, 5, 6)
    })
end
--Vect

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
task.wait(2)
local function Autotp2startaxist()
    local targetPos = Vector3.new(unpack(Startaxist)) + Vector3.new(0, 5, 6)
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(targetPos))
end

local function Autocheckgearstock()
local stockkkinggear={}
local x=game:GetService("Players")["LocalPlayer"].PlayerGui.GearShop.Frame.ScrollingFrame:GetChildren()
for i,gearlist in pairs(x) do
   if gearlist:IsA("Frame") and gearlist.Name~="ItemTemplate" and gearlist.DataCost>50   then
        print(gearlist.MainInfo.NoStock.Visible)
        if gearlist.MainInfo.NoStock.Visible==false then
            table.insert(stockkkinggear,gearlist.Name)
        end
    end
    
end
print(unpack(stockkkinggear))
end

local function Autocheckseedstock()
local stockkkingseed={}
local x=game:GetService("Players")["LocalPlayer"].PlayerGui.SeedShop.Frame.ScrollingFrame:GetChildren()
for i,seedlist in pairs(x) do
   if seedlist:IsA("Frame") and seedlist.Name~="ItemTemplate" and seedlist.DataCost>50   then
        print(seedlist.MainInfo.NoStock.Visible)
        if seedlist.MainInfo.NoStock.Visible==false then
            table.insert(stockkkingseed,seedlist.Name.." ".."Seed")
            table.insert(seedStock,seedlist.Name.." ".."Seed")
    end    
end
end
print(unpack(stockkkingseed))
end

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
randomedseed = seedinbackpack[math.random(#seedinbackpack)]

print(randomedseed)

character.Humanoid:EquipTool(randomedseed)
end

local function AutoEquipgear(gearname)--you SHOLDDDD PCALLL THIS FUNCCCCCCCC
local x=game:GetService("Players")["LocalPlayer"].Backpack:GetChildren()
local gearinbackpack={}
for i,v in pairs(x) do
    if string.find(v.Name,gearname)   then
table.insert(gearinbackpack,v)
end
end
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local randomedgear = gearinbackpack[1]

print(randomedgear)

character.Humanoid:EquipTool(randomedgear)
end


pcall(function()Autocheckseedstock() end)
for i=1,3 do
for i,j in pairs(seedStock) do
    task.wait(1)
Autobuyseed(j)
end

end
if game:GetService("Players")["LocalPlayer"].leaderstats.Shillings.Value>30000 then
 Autobuygearshop("Watering Can")
end
if game:GetService("Players")["LocalPlayer"].leaderstats.Shillings.Value>50000 then
 Autobuygearshop("Basic Sprinkler")
end
if game:GetService("Players")["LocalPlayer"].leaderstats.Shillings.Value>100000 then
 Autobuygearshop("Turbo Sprinkler")
end
if game:GetService("Players")["LocalPlayer"].leaderstats.Shillings.Value>200000 then
 Autobuygearshop("Super Sprinkler")
end
seedStock={}
Autotp2startaxist()
pcall(function()AutoEquipgear("Sprinkler") end)-- equip sprinkler
task.wait(4)
for i,u in pairs(Gearshoplist) do
Autousesprinkler(u)
end
pcall(function()AutoEquipseed() end)
print("Kuytok")

pcall(function()AutoEquipseed() end)
local player=game:GetService("Players").LocalPlayer.Name  --Fix laterr
print(player)--this should not be gobal fixxxxx
for i,v in pairs(workspace:GetChildren()) do
    task.wait(0.1)
if player==v.Name then

    char =v
end
end
repeat



--workspace.sookerut_V1["x3 Tomato Seed"]
print(char[tostring(randomedseed)]:GetAttribute("PlantType"))
Autoplant(char[tostring(randomedseed)]:GetAttribute("PlantType"))
    
local success, isVisible = pcall(function()
    return game:GetService("Players").LocalPlayer.PlayerGui.Notification.Frame:GetChildren()[5].Visible
end)

if success and isVisible == true then
    break
end
for i,v in pairs(char:GetChildren()) do
    task.wait(0.1)
if string.find(v.Name,"Seed") then
    print(v)
    randomedseed=v.name
end
end


task.wait(0.1)
until not char:FindFirstChild(randomedseed)
print(randomedseed)
randomedseed=nil
pcall(function()AutoEquipgear("Watering Can")
end)--equip gear
task.spawn(function()
for i=1,10 do
task.wait(1)
Autousegear("Watering Can")
end
end)
task.wait(0.5)
pcall(function()Autoharvest() end)
for i=1,3 do
    task.wait(1)
Autosellall()
end
task.spawn(function()
    Autoclaimquest()
end)








