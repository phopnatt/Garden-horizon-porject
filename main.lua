local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
if not game:IsLoaded() then
    game.Loaded:Wait()
end
pcall(function()
 Fluent:Notify({
        Title = "J4Z4 HUB loadding UI",
        Content = "Fluent UI by dawid-scripts https://github.com/dawid-scripts/Fluent",
        
        Duration = 4 -- Set to nil to make the notification not disappear
    })
end)
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






task.spawn(function()
    local vu = game:GetService("VirtualUser")
    local player = game:GetService("Players").LocalPlayer
    while true do
        vu:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(0.5) 
        vu:Button1Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(600) 
    end
end)
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
      if Kuy==false then
   break
      end
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
 stockkkinggear={}
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

local function Autoharvestremote()
local m = workspace.ClientPlants
local Harremote = game:GetService("ReplicatedStorage").RemoteEvents.HarvestFruit
for i, v in pairs(m:GetChildren()) do
    local uuid = v:GetAttribute("Uuid") 
    print(uuid)
   GrowthAnchorIndex=0
   for i=1,10 do
       
   GrowthAnchorIndex=1+GrowthAnchorIndex
   print(GrowthAnchorIndex)
   Harremote:FireServer(
    {
        {
            GrowthAnchorIndex = 1,
            Uuid = tostring(uuid)
        }
    }
) 
     end

task.wait()
Harremote:FireServer(
    {
        {
            Uuid = tostring(uuid)
        }
    }
)
task.wait(0.1)
end
end



task.spawn(function()
    while true do
        Autocheckseedstock() 
        task.wait(60)
local seedStock={}
    end
    end)


local Window = Fluent:CreateWindow({
    Title = "J4Z4 HUB " .. "Release V.3",
    SubTitle = "by darkflower",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Shops = Window:AddTab({ Title = "Shops", Icon = "" }),
    Kaiton = Window:AddTab({ Title = "Kaiton", Icon = "" }),
    Misc = Window:AddTab({ Title = "Miscellaneous", Icon = "" }),
    Webhook = Window:AddTab({ Title = "Webhook", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "J4Z4 HUB",
        Content = "© 2026 J4Z4. All rights reserved. No part of this project may be reproduced, distributed, or modified for commercial purposes without prior written permission.",
        SubContent = "SubContent", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })



    Tabs.Main:AddParagraph({
        Title = "Auto Farm",
        Content = "All Auto Farm function will be placed here"
    })



    Tabs.Shops:AddButton({
        Title = "Sell all",
        Description = "Click to sell all",
        Callback = function()
            Window:Dialog({
                Title = "Auto sell all",
                Content = "Would you like to sell all fruits?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Selling items")
                            for i=1,3 do 
                                Autosellall()
                            end
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled")
                        end
                    }
                }
            })
        end
    })



    local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Auto Harvest", Default = false })

    Toggle:OnChanged(function()
        print("Auto harvest: ", Options.MyToggle.Value)
    end)
        task.spawn(function()
    while true do
        task.wait(0.5) -- ปรับเวลาเช็ค Toggle ให้เหมาะสม ไม่ต้องเร็วเกินไป
        
        if Options.MyToggle.Value then
            local folderplantpath = workspace:FindFirstChild("ClientPlants")
            if not folderplantpath then continue end

            
            local plantposition = {}
            for _, plant in ipairs(folderplantpath:GetChildren()) do
                for _, rootpart in ipairs(plant:GetDescendants()) do
                    if (rootpart.Name == "FruitAnchor" or rootpart.Name == "PlantAnchor") and rootpart:IsA("BasePart") then
                        table.insert(plantposition, rootpart.Position)
                    end
                end
            end

            
            for _, pos in ipairs(plantposition) do
                
                if not Options.MyToggle.Value then break end

                local char = game.Players.LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                
                if hrp then
                    
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    hrp.AssemblyAngularVelocity = Vector3.zero

                    
                    hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))

                    task.wait(0.2)
                    
                    
                    local vim = game:GetService("VirtualInputManager")
                    vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    task.wait(0.05)
                    vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                    
                    task.wait(0.5) 
                end
            end
        end
    end
end)

local Toggle67 = Tabs.Main:AddToggle("MyToggle67", {Title = "Auto Harvest Aura(Recommended)", Default = false })

Toggle67:OnChanged(function()
    print("Auto harvest: ", Toggle67.Value)
    if Toggle67.Value then
        task.spawn(function()
            while Toggle67.Value do
                Autotp2startaxist()
                Autoharvestremote()
                task.wait(1) 
            end
        end)
    end
end) 

    
        local Toggle2 = Tabs.Main:AddToggle("MyToggle2", {Title = "Auto plant seed", Default = false})

Toggle2:OnChanged(function()
    print("Toggle changed:", Options.MyToggle2.Value)
end)

task.spawn(function()
    while true do
        task.wait(0.1) 
       
        if Options.MyToggle2.Value==true then
            Autotp2startaxist()
            pcall(function() AutoEquipseed() end)
            
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()

            
            repeat
                if  Options.MyToggle2.Value==false then break end
                
                
                local currentSeed = nil
                for _, v in pairs(char:GetChildren()) do
                    if string.find(v.Name, "Seed") then
                        currentSeed = v
                        break 
                    end
                end

                if currentSeed then
                    local seedName = currentSeed.Name
                    local plantType = currentSeed:GetAttribute("PlantType")
                    
                    if plantType then
                        print("Planting:", plantType)
                        pcall(function() Autoplant(plantType) end)
                    end
                    
                    
                    local success, isVisible = pcall(function()
                        return player.PlayerGui.Notification.Frame:GetChildren()[5].Visible
                    end)

                    if success and isVisible then
                        print("Inventory full or limit reached")
                        break
                    end
                else
                    print("No seed found in character")
                    break 
                end

                task.wait(0.5) 
            until not char:FindFirstChild(currentSeed and currentSeed.Name or "") or not Options.MyToggle2.Value
        end
    end
end)

 local Toggle82 = Tabs.Main:AddToggle("MyToggle82", {Title = "Auto Shove all plant(please be careful using this)", Default = false })

    Toggle82:OnChanged(function()
        print("Toggle changed:", Options.MyToggle82.Value)
    end)
    task.spawn(function()
    while true do
        if Options.MyToggle82.Value==true then
    
    local m = workspace.ClientPlants
Autotp2startaxist()
for i, v in pairs(m:GetChildren()) do
    local uuid = v:GetAttribute("Uuid") 
    print(uuid)
    
    
local shove = game:GetService("ReplicatedStorage").RemoteEvents.RemovePlant
if Options.MyToggle82.Value==false then break end
shove:FireServer(tostring(uuid),nil)
task.wait(1)
end
    end
task.wait(1)
end
end)
     
    

   

    





    
  Tabs.Shops:AddParagraph({
        Title = "Auto buy seed",
        Content = "Every seed function will be placed here"
    })
    


    pcall(function()task.spawn(function()
        while true do
            
        Autocheckseedstock() 
    task.wait(2)
    seedStock={}
        end
    end) end)
    local MultiDropdown = Tabs.Shops:AddDropdown("MultiDropdown", {
        Title = "Seed sniper",
        Description = "Select seed sniper list",
        Values = seedlist,
        Multi = true,
        Default = {},
    })

    MultiDropdown:SetValue({
        three = true,
        five = true,
        seven = false
    })

    MultiDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("Mutlidropdown changed:", table.concat(Values, ", "))
    end)



    local Toggle3 = Tabs.Shops:AddToggle("MyToggle3", {Title = "Auto Seed sniper", Default = false })

     task.spawn(function()
    while true do
        if Options.MyToggle3.Value == true then
            
            for seedName, isSelected in pairs(MultiDropdown.Value) do
                if isSelected then
                    local fullName = seedName .. " Seed"
                    
                    
                    if table.find(seedStock, fullName) then
                        print("Founded: " .. fullName .. "buying")
                        Autobuyseed(fullName)
                        task.wait(0.1) 
                    else
                       
                        print("There's no following seed in stock : " .. fullName )
                    end
                end
            end
        end
        task.wait(1) 
    end
end)

     local Toggle4 = Tabs.Shops:AddToggle("MyToggle4", {Title = "Auto buy all seeds", Default = false })

Toggle4:OnChanged(function()
    print("Toggle changed:", Options.MyToggle4.Value)
end)


task.spawn(function()
    
    while true do
        if Options.MyToggle4.Value == true then
        
            for i = 1, 3 do
                for _, seedFullName in pairs(seedStock) do
                    Autobuyseed(seedFullName)
                    task.wait(0.1) 
                end
                if Options.MyToggle4.Value == false then break end
            end
            task.wait(5) 
        end
        
        task.wait(1)
    
    end
end)
  Tabs.Shops:AddParagraph({
        Title = "Gear shop",
        Content = "Gear shop function will be placed here"
    })
task.spawn(function()
    while true do 
        
        Autocheckgearstock()
        
        task.wait(30)
        stockkkinggear={}
    end
end)
        local MultiDropdown2 = Tabs.Shops:AddDropdown("MultiDropdown2", {
        Title = "Gear sniper",
        Description = "Select your gear sniper list",
        Values = {"Super sprinkler","Turbo Sprinkler","Basic Sprinkler","Watering Can","Harvest Bell","Trowel","Favorite Tool"},
        Multi = true,
        Default = {},
    })

    MultiDropdown2:SetValue({
        three = true,
        five = true,
        seven = false
    })

    MultiDropdown2:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("Mutlidropdown changed:", table.concat(Values, ", "))
    end)
    
       local Toggle8 = Tabs.Shops:AddToggle("MyToggle8", {Title = "Auto gear sniper", Default = false })

    Toggle8:OnChanged(function()
        print("Toggle changed:", Options.MyToggle8.Value)
    end)
    task.spawn(function()
while true do
        if Options.MyToggle8.Value == true then
            
            for seedName, isSelected in pairs(MultiDropdown2.Value) do
                if isSelected then
                    local fullName = seedName 
                    
                    
                    if table.find(stockkkinggear, fullName) then
                        print("Founded: " .. fullName .. "buying")
                        Autobuygearshop(fullName)
                        task.wait(0.1) 
                    else
                       
                        print("There's no following gear in stock : " .. fullName )
                    end
                end
            end
        end
        task.wait(1) 
    end

end)
   
    

   
    

    
    
    Tabs.Kaiton:AddParagraph({
        Title = "Kaiton 1 click",
        Content = "Hit only one button and it will automaticaly farm for you"
    })
    
    local Toggle5 = Tabs.Kaiton:AddToggle("MyToggle5", {Title = "Auto Farm 1 click (Kaiton 1 click) ", Default = false })

    Toggle5:OnChanged(function()
        print("Toggle changed:", Options.MyToggle5.Value)
    end)
task.spawn(function()

while true do
    task.wait(1)
    if Options.MyToggle5.Value==true then
    task.wait(1)
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

Autotp2startaxist()
pcall(function()task.spawn(function()Autoharvestremote() end) end)
pcall(function()AutoEquipgear("Sprinkler") end)-- equip sprinkler
task.wait(4)
for i,u in pairs(Gearshoplist) do
Autousesprinkler(u)
end
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
pcall(function()print(char[tostring(randomedseed)]:GetAttribute("PlantType")) end)
pcall(function()Autoplant(char[tostring(randomedseed)]:GetAttribute("PlantType")) end)
    
local success, isVisible = pcall(function()
    return game:GetService("Players").LocalPlayer.PlayerGui.Notification.Frame:GetChildren()[5].Visible
end)

 
   
for i,v in pairs(char:GetChildren()) do
    task.wait(0.1)
if string.find(v.Name,"Seed") then
    print(v)
    randomedseed=v.Name
end
end


task.wait(0.1)
until not pcall(function() char:FindFirstChild(randomedseed) end) or (success and isVisible == true)
print(randomedseed)
randomedseed=nil
pcall(function()AutoEquipgear("Watering Can")
end)--equip gear

task.spawn(function()
for i=1,10 do
task.wait(0.1)
Autousegear("Watering Can")
end
end)
task.wait(0.5)
Autotp2startaxist()
task.wait(30)
for i=1,3 do
    task.wait(1)
Autosellall()
end
task.spawn(function()
    Autoclaimquest()
end)
if Options.MyToggle5.Value==false then break end
end
end

 end)



 
Tabs.Misc:AddParagraph({
        Title = "Miscellaneous",
        Content = "Notthing just misc"
    })

    local Toggle10 = Tabs.Misc:AddToggle("MyToggle10", {Title = "Fast mode", Default = false })

    Toggle10:OnChanged(function()
        print("Toggle changed:", Options.MyToggle10.Value)
    end)
    task.spawn(function()
        while true do
        if Options.MyToggle10.Value==true then
local args = {
    [1] = "LowDetail",
    [2] = true
}

game:GetService("ReplicatedStorage").RemoteEvents.UpdateSettings:FireServer(unpack(args))
else
  
local args = {
    [1] = "LowDetail",
    [2] = false
}

game:GetService("ReplicatedStorage").RemoteEvents.UpdateSettings:FireServer(unpack(args))

        end
        task.wait(1)
        end
    end)
  local Input = Tabs.Misc:AddInput("Input", {

        Title = "Your FPS cap",
        Default = "60",
        Placeholder = "Placeholder",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })
    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)

     local Toggle10 = Tabs.Misc:AddToggle("MyToggle10", {Title = "Set FPS cap", Default = false })
    Toggle10:OnChanged(function()
        print("Toggle changed:", Options.MyToggle10.Value)

    end)
    task.spawn(function()
    while true do
        if Options.MyToggle10.Value == true then
            setfpscap(tonumber(Input.Value))
        end
        task.wait(0.1)
    end
end)

Tabs.Webhook:AddParagraph({
        Title = "Webhook",
        Content = "Webhook will be added soon"
    })


end










-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("J4Z4HUB")
SaveManager:SetFolder("J4Z4HUB/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "J4Z4 HUB",
    Content = "UI has been loaded suscessfully",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
