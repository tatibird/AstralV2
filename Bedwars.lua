local lp = game:GetService("Players").LocalPlayer

function getremote(t)
    for i, v in pairs(t) do
        if v == "Client" then
            local tab = t[i + 1]
            return tab
        end
    end
    return ""
end

Bedwars = {
    SwordInfo = {
        [1] = { Name = "wood_sword", Display = "Wood Sword", Rank = 1 },
        [2] = { Name = "stone_sword", Display = "Stone Sword", Rank = 2 },
        [3] = { Name = "iron_sword", Display = "Iron Sword", Rank = 3 },
        [4] = { Name = "diamond_sword", Display = "Diamond Sword", Rank = 4 },
        [5] = { Name = "emerald_sword", Display = "Emerald Sword", Rank = 5 },
        [6] = { Name = "rageblade", Display = "Rage Blade", Rank = 6 },
    },
    KnitClient = debug.getupvalue(require(lp.PlayerScripts.TS.knit).setup, 6),
    Client = require(game:GetService"ReplicatedStorage".TS.remotes).default.Client,
    AttackRemote = Client:Get(getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])))
}

return Bedwars