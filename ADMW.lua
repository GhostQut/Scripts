local webhook =
   "https://discord.com/api/webhooks/1255191299859152988/4v4Iq3p8I10gbb7bhA1k-zm4BAa2ZMOkPYUiKoMkqug2ta1A5VGyvI3-Eo0n4ivo5FN4/messages/1255206898924257280"
local interval = 5

local plr = game:GetService('Players').LocalPlayer
local standtartUnits = {}
local limitUnits = {
    ['Rare'] = 'Fire Swordsman',
    ['Epic'] = 'Blood Demon',
    ['Legendary'] = 'Cursed Archer',
    ['Mythic'] = 'Muscular Sorcer',
    ['Secret'] = 'Rift Sorcer'
}


function getSummon()
    for i,v in pairs(plr.PlayerGui.PAGES.SummonPage.ChancesFrame.UnitHolder:GetChildren()) do
        if v.Name ~= 'UIGridLayout' then
            for i2,v2 in pairs(v:GetChildren()) do
                if v2.SummonRarityLabel.Text == "Rare" then
                    standtartUnits['Rare'] = v2.UnitNameLabel.Text
                end
                if v2.SummonRarityLabel.Text == "Epic" then
                    standtartUnits['Epic'] = v2.UnitNameLabel.Text
                end
                if v2.SummonRarityLabel.Text == "Legendary" then
                    standtartUnits['Legendary'] = v2.UnitNameLabel.Text
                end
                if v2.SummonRarityLabel.Text == "Mythic" then
                    standtartUnits['Mythic'] = v2.UnitNameLabel.Text
                end
                if v2.SummonRarityLabel.Text == "Secret" then
                    standtartUnits['Secret'] = v2.UnitNameLabel.Text
                end
            end
        end
    end
end

while true do

    -- Variables
    local currentTime = os.time(os.date("!*t"))
    local bupd = plr.PlayerGui.PAGES.SummonPage.Holder.ExpiresFrame.ExpireLabel.Text

    getSummon()

    local data = {
        ["embeds"] = {
            {
                ["title"] = "**JSQ | Public Banner Display**",
                ["description"] = "Последнее обновление: ".."<t:"..currentTime..":R>".."\n Banner "..bupd,
                ["type"] = "rich",
                ["color"] = 6165903,
                ["fields"] = {
                    {
                        ["name"] = "Standard Banner",
                        ["value"] = "🔵 Rare (27.5%): "..standtartUnits['Rare'].."\n🟣 Epic (15.25%): "..standtartUnits['Epic'].."\n🟡 Legendary (2%): "..standtartUnits['Legendary'].."\n⭐ Mythic (0.25%): "..standtartUnits['Mythic'].."\n "..":004aastar:".."Secret (0.001%): "..standtartUnits['Secret'],
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Limited Banner",
                        ["value"] = "🔵 Rare (82.495%): "..limitUnits['Rare'].."\n🟣 Epic (15.25%): "..limitUnits['Epic'].."\n🟡 Legendary (2%): "..limitUnits['Legendary'].."\n⭐ Mythic (0.25%): "..limitUnits['Mythic'].."\n "..":004aastar: ".."Secret (0.001%): "..limitUnits['Secret'],
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Current Challenge 1",
                        ["value"] = "Map + Challenge Info: Mob City - Tank Enemies\nAct: (Reckoning Of the Mind's Eye)\nRewards: Star Rift (Purple), Star Rift (Red), Star Rift (Yellow), Gems, Star Rift (Rainbow), Star Rift (Green), Energy Crystal, Star Rift (Dark), Star Rift (Blue)\nRefreshes in: 00:32:14"
                    },
                    {
                        ["name"] = "Current Challenge 2",
                        ["value"] = "Map + Challenge Info: Mob City - Tank Enemies\nAct: (Unraveling The Psychic Mystery)\nRewards: Energy Crystal, Gems, Frost Bind, Risky Dice\nRefreshes in: 00:32:14"
                    },
                    {
                        ["name"] = "Current Challenge 3",
                        ["value"] = "Map + Challenge Info: Swordsman Dojo - Tank Enemies\nAct: (Warrior's Path)\nRewards: Ancient Scroll, Gems, Trait Crystal\nRefreshes in: 00:32:14"
                    },
                    {
                        ["name"] = "Raid Info",
                        ["value"] = "Raids Status: Open!\n**Raids Open/Close In:** ()"
                    },
                    {
                        ["name"] = "Raid Shop Info 1",
                        ["value"] = "Item 1:  **[Currency] 30x Gems**\nCost: **25**\nStock: **5**\n\nItem 2:  **[Item] 1x Trait Crystal**\nCost: **15**\nStock: **3**\n\nItem 3:  **[Item] 1x Risky Dice**\nCost: **18**\nStock: **3**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Raid Shop Info 2",
                        ["value"] = "Item 4:  **[Item] 1x Frost Bind**\nCost: **20**\nStock: **3**\n\nItem 5:  **[Unit] 1x Bear King**\nCost: **2000**\nStock: **1**\n\nItem 6:  **[Item] 1x Otherworldly Gauntlet**\nCost: **990**\nStock: **1**",
                        ["inline"] = true
                    }
                }
            }
        }
    }

    local newdata = game:GetService("HttpService"):JSONEncode(data)
     
    local headers = {
        ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = webhook, Body = newdata, Method = "PATCH", Headers = headers}
    request(abcdef)
    wait(interval)
end
