local activeWeapons = {}
local playerName = game:GetService("Players").LocalPlayer.Name
local assetFolder = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels
local Functions = {}

function Functions:swapWeaponSkins(normalWeaponName, skinName, State)
    if not normalWeaponName then
        return
    end
    
    local normalWeapon = assetFolder:FindFirstChild(normalWeaponName)
    if not normalWeapon then
        return
    end

    if State then
        if skinName then
            local skin = assetFolder:FindFirstChild(skinName)
            if not skin then
                return
            end

            normalWeapon:ClearAllChildren()
            for _, child in pairs(skin:GetChildren()) do
                local newChild = child:Clone()
                newChild.Parent = normalWeapon
            end
            activeWeapons[normalWeaponName] = true
        end
    else
        activeWeapons[normalWeaponName] = nil
    end
end
