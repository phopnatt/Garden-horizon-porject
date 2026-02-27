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