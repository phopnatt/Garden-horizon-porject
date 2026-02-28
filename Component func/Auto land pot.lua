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
local Startaxist=
{
[1]=nil,
[2]=nil,
[3]=nil

}
local function buysood(Name)--buyseed
shoppos={
[1]=176.7036895751953,
[2]=204.01797485351562,
[3]=672
}
local buyseed = {
    [1] = "SeedShop",
    [2] = (Name)
}

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(unpack(shoppos))--tp 2 seed shop
task.wait(0.5)

game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem:InvokeServer(unpack(buyseed))--remote to buy seed
end
local function selliall()
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
local function plant(Plant)
local args = {
    [1] = Plant,
    [2] = Vector3.new(unpack(Startaxist))
}

game:GetService("ReplicatedStorage").RemoteEvents.PlantSeed:InvokeServer(unpack(args))
end
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
