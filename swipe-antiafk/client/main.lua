--   ______  __       ______ ________ __    __ ________       ______  ______ _______  ________ 
--  /      \|  \     |      \        \  \  |  \        \     /      \|      \       \|        \
-- |  ▓▓▓▓▓▓\ ▓▓      \▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓ ▓▓\ | ▓▓\▓▓▓▓▓▓▓▓    |  ▓▓▓▓▓▓\\▓▓▓▓▓▓ ▓▓▓▓▓▓▓\ ▓▓▓▓▓▓▓▓
-- | ▓▓   \▓▓ ▓▓       | ▓▓ | ▓▓__   | ▓▓▓\| ▓▓  | ▓▓       | ▓▓___\▓▓ | ▓▓ | ▓▓  | ▓▓ ▓▓__    
-- | ▓▓     | ▓▓       | ▓▓ | ▓▓  \  | ▓▓▓▓\ ▓▓  | ▓▓        \▓▓    \  | ▓▓ | ▓▓  | ▓▓ ▓▓  \   
-- | ▓▓   __| ▓▓       | ▓▓ | ▓▓▓▓▓  | ▓▓\▓▓ ▓▓  | ▓▓        _\▓▓▓▓▓▓\ | ▓▓ | ▓▓  | ▓▓ ▓▓▓▓▓   
-- | ▓▓__/  \ ▓▓_____ _| ▓▓_| ▓▓_____| ▓▓ \▓▓▓▓  | ▓▓       |  \__| ▓▓_| ▓▓_| ▓▓__/ ▓▓ ▓▓_____ 
--  \▓▓    ▓▓ ▓▓     \   ▓▓ \ ▓▓     \ ▓▓  \▓▓▓  | ▓▓        \▓▓    ▓▓   ▓▓ \ ▓▓    ▓▓ ▓▓     \
--   \▓▓▓▓▓▓ \▓▓▓▓▓▓▓▓\▓▓▓▓▓▓\▓▓▓▓▓▓▓▓\▓▓   \▓▓   \▓▓         \▓▓▓▓▓▓ \▓▓▓▓▓▓\▓▓▓▓▓▓▓ \▓▓▓▓▓▓▓▓


local lastActive = GetGameTimer()
local warned = false

-- Convert minutes to ms
local maxIdleTime = Config.MaxAFKMinutes * 60 * 1000

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local ped = PlayerPedId()
        if IsPedOnFoot(ped) and not IsPedStill(ped) then
            lastActive = GetGameTimer()
            warned = false
        elseif IsControlPressed(0, 1) or IsControlPressed(0, 2) then
            lastActive = GetGameTimer()
            warned = false
        end

        local idleTime = GetGameTimer() - lastActive

        if idleTime > maxIdleTime and not warned then
            print('[AntiAFK] Idle time exceeded. WarnBeforeKick:', Config.WarnBeforeKick)
            if Config.WarnBeforeKick then
                warned = true
                print('[AntiAFK] Triggering warning event')
                TriggerEvent('antiafk:warn')
            else
                print('[AntiAFK] Kicking player immediately')
                TriggerServerEvent('antiafk:kick')
            end
        end
    end
end)

RegisterNetEvent('antiafk:warn')
AddEventHandler('antiafk:warn', function()
    print('[AntiAFK] Warning event triggered')
    local countdown = Config.WarningDuration

    while countdown > 0 do
        Notify("You are AFK! Moving in " .. countdown .. " seconds or you will be kicked.")
        print('[AntiAFK] Warning countdown:', countdown)
        Citizen.Wait(1000)
        countdown = countdown - 1

        -- Reset warning if player moves
        local ped = PlayerPedId()
        if not IsPedStill(ped) then
            print('[AntiAFK] Player moved during warning countdown, resetting warning.')
            lastActive = GetGameTimer()
            warned = false
            return
        end
    end

    -- Time’s up — kick!
    print('[AntiAFK] Warning countdown finished, kicking player.')
    TriggerServerEvent('antiafk:kick')
end)

function Notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(false, false)
end
