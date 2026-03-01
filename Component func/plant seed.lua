local function Autoplant(Plant)
game:GetService("ReplicatedStorage").RemoteEvents.PlantSeed:InvokeServer(Plant,Vector3.new(unpack(Startaxist) ))
end