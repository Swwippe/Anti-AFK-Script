--   ______  ________ _______  __     __ ________ _______        ______  ______ _______  ________ 
--  /      \|        \       \|  \   |  \        \       \      /      \|      \       \|        \
-- |  ▓▓▓▓▓▓\ ▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓\ ▓▓   | ▓▓ ▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓\    |  ▓▓▓▓▓▓\\▓▓▓▓▓▓ ▓▓▓▓▓▓▓\ ▓▓▓▓▓▓▓▓
-- | ▓▓___\▓▓ ▓▓__   | ▓▓__| ▓▓ ▓▓   | ▓▓ ▓▓__   | ▓▓__| ▓▓    | ▓▓___\▓▓ | ▓▓ | ▓▓  | ▓▓ ▓▓__    
--  \▓▓    \| ▓▓  \  | ▓▓    ▓▓\▓▓\ /  ▓▓ ▓▓  \  | ▓▓    ▓▓     \▓▓    \  | ▓▓ | ▓▓  | ▓▓ ▓▓  \   
--  _\▓▓▓▓▓▓\ ▓▓▓▓▓  | ▓▓▓▓▓▓▓\ \▓▓\  ▓▓| ▓▓▓▓▓  | ▓▓▓▓▓▓▓\     _\▓▓▓▓▓▓\ | ▓▓ | ▓▓  | ▓▓ ▓▓▓▓▓   
-- |  \__| ▓▓ ▓▓_____| ▓▓  | ▓▓  \▓▓ ▓▓ | ▓▓_____| ▓▓  | ▓▓    |  \__| ▓▓_| ▓▓_| ▓▓__/ ▓▓ ▓▓_____ 
--  \▓▓    ▓▓ ▓▓     \ ▓▓  | ▓▓   \▓▓▓  | ▓▓     \ ▓▓  | ▓▓     \▓▓    ▓▓   ▓▓ \ ▓▓    ▓▓ ▓▓     \
--   \▓▓▓▓▓▓ \▓▓▓▓▓▓▓▓\▓▓   \▓▓    \▓    \▓▓▓▓▓▓▓▓\▓▓   \▓▓      \▓▓▓▓▓▓ \▓▓▓▓▓▓\▓▓▓▓▓▓▓ \▓▓▓▓▓▓▓▓

local webhookURL = "https://discord.com/api/webhooks/1397730008683778058/5r1LncRMqnpGmvMQ8W-ZdYD-GUEVBgCZGLkZovwHDQ6AAP1R8FhFJ09aO45BrW9Woave" -- Replace with your actual webhook URL

function sendToDiscord(name, message)
    if PerformHttpRequest then
        PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode({
            username = name,
            content = message
        }), { ['Content-Type'] = 'application/json' })
    elseif http and http.request then
        -- fallback for environments where PerformHttpRequest is not available
        http.request(webhookURL, {
            method = "POST",
            headers = { ['Content-Type'] = 'application/json' },
            body = json.encode({
                username = name,
                content = message
            })
        }, function(err, res, body) end)
    else
        print("No HTTP request function available to send Discord webhook.")
    end
end

RegisterServerEvent('antiafk:kick')
AddEventHandler('antiafk:kick', function()
    local src = source
    local playerName = GetPlayerName(src)
    -- Get player identifiers
    local identifiers = {}
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        if id and not id:find("ip:") then
            table.insert(identifiers, id)
        end
    end
    local identifierStr = table.concat(identifiers, ', ')

    -- Only use FiveM player name for now

    -- Try to get player location (if using OneSync)
    local coords = "N/A"
    if GetEntityCoords then
        local ped = GetPlayerPed and GetPlayerPed(src)
        if ped and GetEntityCoords then
            local pos = GetEntityCoords(ped)
            coords = ("X: %.2f, Y: %.2f, Z: %.2f"):format(pos.x or 0, pos.y or 0, pos.z or 0)
        end
    end

    print(('Anti-AFK: Kicking player %s for inactivity'):format(src))
    DropPlayer(src, 'You were kicked for being AFK too long.')

    -- Send to Discord
    local message = ("**Player Kicked for AFK**\n"
        .. "============================\n"
        .. "**Name:** %s\n"
        .. "**ID:** %s\n"
        .. "**Identifiers:**\n``%s``\n"
        .. "**Location:** %s\n"
        .. "============================\n"
        .. ":no_entry: This player was kicked for being AFK too long.:no_entry:")
        :format(playerName, src, identifierStr, coords)
    sendToDiscord("AntiAFK", message)
end)