--Buy gear shop 212.79725646972656, 204.04000854492188, 609.1134643554688
local function Autobuygearshop(Gear)
    

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(212.79725646972656, 204.04000854492188, 609.1134643554688)
task.wait(0.5)
game:GetService("ReplicatedStorage").RemoteEvents.PurchaseShopItem:InvokeServer("GearShop",Gear)
end
