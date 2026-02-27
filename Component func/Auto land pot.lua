local function Checkpot2lan()
if not game:IsLoaded() then
    game.Loaded:Wait()
end
task.wait(1)
print("I ja gay")
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
print("Pot1 chosen")
elseif string.len(ownedhmai2)<=0 then
    game:GetService("ReplicatedStorage").RemoteEvents.ClaimSelectedPlot:FireServer("Plot2")
task.wait(0.1)
game:GetService("ReplicatedStorage").RemoteEvents.SetStreamingFocus:FireServer("stop")
print("Pot2 chosen")
elseif string.len(ownedhmai3)<=0 then
    game:GetService("ReplicatedStorage").RemoteEvents.ClaimSelectedPlot:FireServer("Plot3")
task.wait(0.1)
game:GetService("ReplicatedStorage").RemoteEvents.SetStreamingFocus:FireServer("stop")
print("Pot3 chosen")
elseif string.len(ownedhmai4)<=0 then
    game:GetService("ReplicatedStorage").RemoteEvents.ClaimSelectedPlot:FireServer("Plot4")
task.wait(0.1)
game:GetService("ReplicatedStorage").RemoteEvents.SetStreamingFocus:FireServer("stop")
print("Pot4 chosen")
elseif string.len(ownedhmai5)<=0 then
    game:GetService("ReplicatedStorage").RemoteEvents.ClaimSelectedPlot:FireServer("Plot5")
task.wait(0.1)
game:GetService("ReplicatedStorage").RemoteEvents.SetStreamingFocus:FireServer("stop")
print("Pot5 chosen")
else
  game:GetService("ReplicatedStorage").RemoteEvents.ClaimSelectedPlot:FireServer("Plot6")
task.wait(0.1)
game:GetService("ReplicatedStorage").RemoteEvents.SetStreamingFocus:FireServer("stop")
print("Pot6 chosen")
end
end