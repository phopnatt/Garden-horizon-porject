local function Autousegear4snakeman(Gearname)
game:GetService("ReplicatedStorage").RemoteEvents.UseGear:FireServer(Gearname,{
        ["position"] = Vector3.new(unpack(Startaxist))
    })
end