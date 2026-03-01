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
local seedlist={"Carrot","Corn","Onion","Strawberry","Mushroom","Beetroot","Tomato","Apple","Banana","Plum","Potato","Cabbage","Cherry"}
local Gearshoplist={"Watering Can","Basic Sprinkler","Turbo Sprinkler","Super sprinkler"}
local Startaxist=nil




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
            plotaxits=plotaxits[tostring(plot)]
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
 -- Prev enless loop


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

local function Autoplant(Plant)
game:GetService("ReplicatedStorage").RemoteEvents.PlantSeed:InvokeServer(Plant,Vector3.new(unpack(Startaxist) ))
end

local function Autobuygearshop(Gear)
    

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(212.79725646972656, 204.04000854492188, 609.1134643554688)
task.wait(0.5)
game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem:InvokeServer("GearShop",Gear)
end

local function Autousegear4snakeman(Gearname)
game:GetService("ReplicatedStorage").RemoteEvents.UseGear:FireServer(Gearname,{
        ["position"] = Vector3.new(unpack(Startaxist))
    })
end

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

while true do
    task.wait(1)
for i,pants in pairs(seedlist) do
for i= 1,5 do
    task.wait(0.5)
    Autobuyseed(pants.." ".."Seed")
end
end

 local targetPos = Vector3.new(unpack(Startaxist)) + Vector3.new(0, 5, 6)
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(targetPos))
AutoequipSeed()

for i,seedss in pairs(seedlist) do
for i=1,30 do
task.wait(0.5)
pcall(function()
    Autoplant("Carrot") 
end)
Autoplant(seedss)
end
end

pcall(function()
    Autoharvest()
end)
local targetPos = Vector3.new(unpack(Startaxist)) + Vector3.new(0, 5, 6)
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(targetPos))

for i=1,4 do
task.wait(0.5)
Autosellall()
end

end  