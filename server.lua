ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
    while true do
        local akturagodzinaPytaRodzina = os.date("%H:%M")
        if Config.GodzinyRozdan[akturagodzinaPytaRodzina] then
            local akturagodzinaPytaRodzina = os.date("%H:%M")
            local Players = ESX.GetExtendedPlayers()

            for k, player in pairs(Players) do
                player.addInventoryItem("legalna", 3)
            end
        
            local ilecweli = #GetPlayers()
        
            local jsonData = json.encode({
                embeds = {{
                    title = 'Automatyczny Drop!',
                    description = 'Rozdano skrzynki wszystkim graczom o zaplanowanej godzinie: **' .. akturagodzinaPytaRodzina .. '** dla **' .. ilecweli .. '** graczy',
                    color = 3447003,
                    footer = {
                        text = "SuperSerwerRP :: Automatyczne rozdanie",
                    },
                }}
            })
            PerformHttpRequest(Config.Webhook, function(statusCode, responseText, headers)
            end, 'POST', jsonData, { ['Content-Type'] = 'application/json' })
            TriggerClientEvent("esx:showNotification", -1, 'Otrzymałeś ' .. itemson .. " w ilości " .. ilosc .. "x")
        end
        Citizen.Wait(60000)
    end
end)