local function Autocheckgearstock()
local stockkkinggear={}
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
Autocheckgearstock()
