local function Autocheckstock()
local stockkkingseed={}
local x=game:GetService("Players")["LocalPlayer"].PlayerGui.SeedShop.Frame.ScrollingFrame:GetChildren()
for i,seedlist in pairs(x) do
   if seedlist:IsA("Frame") and seedlist.Name~="ItemTemplate" and seedlist.DataCost>50   then
        print(seedlist.MainInfo.NoStock.Visible)
        if seedlist.MainInfo.NoStock.Visible==false then
            table.insert(stockkkingseed,seedlist.Name)
        end
    end
    
end
print(unpack(stockkkingseed))
end

