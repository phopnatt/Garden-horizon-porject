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