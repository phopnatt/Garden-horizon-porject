local function plant(Plant)
local args = {
    [1] = Plant,
    [2] = Vector3.new(unpack(Startaxist))
}

game:GetService("ReplicatedStorage").RemoteEvents.PlantSeed:InvokeServer(unpack(args))
end