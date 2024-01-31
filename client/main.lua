-------------------- Strez Tsunami --------------------
local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('onClientResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    local success = LoadWaterFromPath(GetCurrentResourceName(), 'flood.xml')
    local waterQuadCount = GetWaterQuadCount()
    local calmingQuadCount = GetCalmingQuadCount()
    local waveQuadCount = GetWaveQuadCount()
end)

-------------------- Gloabl Player Emails --------------------

-- Emergency Alert
RegisterNetEvent('strez:client:SendEmergencyEmail', function(text)
    Wait(math.random(7000, 13000))
    if Config.Phone == 'qb' then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "City of Los Santos",
        subject = "Emergency Alert",
        message = text,
        button = {}
    })
    elseif Config.Phone == 'qs' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
        sender = "City of Los Santos",
        subject = "Emergency Alert",
        message = text,
        button = {}
    })
    elseif Config.Phone == 'gks' then
        TriggerServerEvent('gksphone:NewMail', {
        sender = "City of Los Santos",
        subject = "Emergency Alert",
        message = text,
        button = {}
    })
    end 
end)

-- Announcement Email
RegisterNetEvent('strez:client:SendAnnouncementEmail', function(text)
    Wait(math.random(7000, 13000))
    if Config.Phone == 'qb' then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "City of Los Santos",
        subject = "Announcement",
        message = text,
        button = {}
    })
    elseif Config.Phone == 'qs' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
        sender = "City of Los Santos",
        subject = "Announcement",
        message = text,
        button = {}
    })
    elseif Config.Phone == 'gks' then
        TriggerServerEvent('gksphone:NewMail', {
        sender = "City of Los Santos",
        subject = "Announcement",
        message = text,
        button = {}
    })
    end 
end)

-------------------- Manual Tsunami Restart --------------------

-- Manual Warning Email
RegisterNetEvent('strez:client:TsunamiManual', function(text)
    local message = 'The National Weather Service has issued a TSUNAMI WARNING for Los Santos, In 15 minutes! Please start heading home or somewhere local for SAFETY!',
    Wait(math.random(5000, 15000))
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.1)
    Wait(math.random(5000, 15000))
    if Config.Notify == 'qb' then
        TriggerEvent('QBCore:Notify', message, 'success', 15000)
    elseif Config.Notify == 'ox' then
        lib.notify({ description = message, duration = 15000,type = 'info', position = 'top-right'})
    elseif Config.Notify == 'email' then
        if Config.Phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = 'District of Los Santos',
                subject = 'Emergency Broadcast',
                message =  message,
                button = {}
            })
        elseif Config.Phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                sender = 'District of Los Santos',
                subject = 'Emergency Broadcast',
                message =  message,
                button = {}
            })
        elseif Config.Phone == 'gks' then
            TriggerServerEvent('gksphone:NewMail', {
            sender = "District of Los Santos",
            subject = "Emergency Broadcast",
            message = message,
            button = {}
        })
        end
    end
    Wait(math.random(5000, 15000))
    TriggerServerEvent('qb-weathersync:server:setWeather', 'THUNDER')
    Wait(math.random(5000, 15000))
    TriggerEvent('strez:raisewater')
    Wait(math.random(5000, 15000))
    TriggerServerEvent('qb-weathersync:server:toggleBlackout')
end)

-------------------- Tsunami Showcase  --------------------

-- Tsunami Showcase 
RegisterNetEvent('strez:client:TsunamiShowcase', function(text)
    Wait(math.random(15000, 30000))
    if Config.Showcase == 'qb' then
        TriggerEvent('QBCore:Notify', 'Stage 1/30min Restart: Will get a Weather Alert letting everyone know its a CLEAR day', 'success', 15000)
    elseif Config.Showcase == 'ox' then
        lib.notify({ description = 'Stage 1/30min Restart: Will get a Weather Alert letting everyone know its a CLEAR day', duration = 15000,type = 'info', position = 'top-right'})
    end
    TriggerServerEvent('qb-weathersync:server:setWeather', 'CLEAR')
    Wait(math.random(15000, 30000))
    if Config.Showcase == 'qb' then
        TriggerEvent('QBCore:Notify', 'Stage 2/15min Restart: Will get a Weather Alert letting everyone know the weather took a turn and is now RAINING', 'success', 15000)
    elseif Config.Showcase == 'ox' then
        lib.notify({ description = 'Stage 2/15min Restart: Will get a Weather Alert letting everyone know the weather took a turn and is now RAINING', duration = 15000,type = 'info', position = 'top-right'})
    end
    TriggerServerEvent('qb-weathersync:server:setWeather', 'RAIN')
    Wait(math.random(15000, 30000))
    if Config.Showcase == 'qb' then
        TriggerEvent('QBCore:Notify', 'Stage 3/5min Restart: Will get a Weather Alert letting everyone know the weather took a turn and is now THUNDER', 'success', 15000)
    elseif Config.Showcase == 'ox' then
        lib.notify({ description = 'Stage 3/5min Restart: Will get a Weather Alert letting everyone know the weather took a turn and is now THUNDER', duration = 15000,type = 'info', position = 'top-right'})
    end
    TriggerServerEvent('qb-weathersync:server:setWeather', 'THUNDER')
    Wait(math.random(15000, 30000))
    if Config.Showcase == 'qb' then
        TriggerEvent('QBCore:Notify', 'Stage 3/5min Restart: Will play a global warning sound to alert all players Tsunami is coming get to high ground (water rising)', 'success', 15000)
    elseif Config.Showcase == 'ox' then
        lib.notify({ description = 'Stage 3/5min Restart: Will play a global warning sound to alert all players Tsunami is coming get to high ground (water rising)', duration = 15000,type = 'info', position = 'top-right'})
    end
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.1)
    TriggerEvent('strez:raisewater')
    Wait(math.random(15000, 30000))
    if Config.Showcase == 'qb' then
        TriggerEvent('QBCore:Notify', 'Stage 4/1min Restart: Will get a final email warning to get to high ground for safety & BLACKOUT to the city', 'success', 15000)
    elseif Config.Showcase == 'ox' then
        lib.notify({ description = 'Stage 4/1min Restart: Will get a final email warning to get to high ground for safety & BLACKOUT to the city', duration = 15000,type = 'info', position = 'top-right'})
    end
    TriggerServerEvent('qb-weathersync:server:toggleBlackout')
    Wait(math.random(15000, 30000))
    ExecuteCommand("ensure qb-tsunami")
end)

-------------------- TxAdmin Auto Restart Tsunami --------------------

-- 30 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto30', function(text)
    Wait(math.random(5000, 15000))
    local message = 'We\'re happy to report that we have clear skies dominating the forecast, and there is no rain expected in the foreseeable future.'
    if Config.Notify == 'qb' then
        TriggerEvent('QBCore:Notify', message, 'success', 15000)
    elseif Config.Notify == 'ox' then
        lib.notify({ description = message, duration = 15000,type = 'info', position = 'top-right'})
    elseif Config.Notify == 'email' then
        if Config.Phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = 'District of Los Santos',
                subject = 'Weather Broadcast',
                message =  message,
                button = {}
            })
        elseif Config.Phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                sender = 'District of Los Santos',
                subject = 'Weather Broadcast',
                message =  message,
                button = {}
            })
        elseif Config.Phone == 'gks' then
            TriggerServerEvent('gksphone:NewMail', {
            sender = "City of Los Santos",
            subject = "Weather Broadcast",
            message = message,
            button = {}
        })
        end
    end
    Wait(5000)
    TriggerServerEvent('qb-weathersync:server:setWeather', 'CLEAR')
end)

-- 15 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto15', function(text)
    Wait(math.random(5000, 15000))
    local message = 'We apologize for the inaccurate forecasts earlier, and I understand your concern. It appears that the weather has taken an unexpected turn, and rain is now falling.'
    if Config.Notify == 'qb' then
        TriggerEvent('QBCore:Notify', message, 'success', 15000)
    elseif Config.Notify == 'ox' then
        lib.notify({ description = message, duration = 15000,type = 'info', position = 'top-right'})
    elseif Config.Notify == 'email' then
        if Config.Phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = 'District of Los Santos',
                subject = 'Weather Broadcast',
                message =  message,
                button = {}
            })
        elseif Config.Phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                sender = 'District of Los Santos',
                subject = 'Weather Broadcast',
                message =  message,
                button = {}
            })
        elseif Config.Phone == 'gks' then
            TriggerServerEvent('gksphone:NewMail', {
            sender = "City of Los Santos",
            subject = "Weather Broadcast",
            message = message,
            button = {}
        })
        end
    end
    Wait(5000)
    TriggerServerEvent('qb-weathersync:server:setWeather', 'RAIN')
end)

-- 5 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto5', function(text)
    local message = 'This is an emergency weather update. A tsunami is predicted to make contact in less than 5 minutes. If you are in a coastal area, it is imperative to take immediate action to move to higher ground and seek safety. Please follow any official alerts, instructions, and evacuation orders issued by local authorities. Stay away from beaches and low-lying areas.'
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.1)
    Wait(math.random(5000, 15000))
    if Config.Notify == 'qb' then
        TriggerEvent('QBCore:Notify', message, 'success', 15000)
    elseif Config.Notify == 'ox' then
        lib.notify({ description = message, duration = 15000,type = 'info', position = 'top-right'})
    elseif Config.Notify == 'email' then
        if Config.Phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = 'District of Los Santos',
                subject = 'Emergency Broadcast',
                message =  message,
                button = {}
            })
        elseif Config.Phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                sender = 'District of Los Santos',
                subject = 'Emergency Broadcast',
                message =  message,
                button = {}
            })
        elseif Config.Phone == 'gks' then
            TriggerServerEvent('gksphone:NewMail', {
            sender = "City of Los Santos",
            subject = "Emergency Broadcast",
            message = message,
            button = {}
        })
        end
    end
    Wait(math.random(15000, 30000))
    TriggerServerEvent('qb-weathersync:server:setWeather', 'THUNDER')
    Wait(math.random(15000, 30000))
    TriggerEvent('strez:raisewater')
    Wait(math.random(15000, 30000))
    TriggerServerEvent('qb-weathersync:server:toggleBlackout')
end)

-- 1 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto1', function(text)
    local message = 'This is an emergency weather update. A tsunami is imminent. If you are in a coastal area, it is imperative to take immediate action to move to higher ground and seek safety. Please follow any official alerts, instructions, and evacuation orders issued by local authorities. Stay away from beaches and low-lying areas.'
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.1)
    Wait(math.random(5000, 15000))
    if Config.Notify == 'qb' then
        TriggerEvent('QBCore:Notify', message, 'success', 15000)
    elseif Config.Notify == 'ox' then
        lib.notify({ description =  message, duration = 15000,type = 'info', position = 'top-right'})
    elseif Config.Notify == 'email' then
        if Config.Phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = 'District of Los Santos',
                subject = 'Emergency Broadcast',
                message =  message,
                button = {}
            })
        elseif Config.Phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                sender = 'District of Los Santos',
                subject = 'Emergency Broadcast',
                message =  message,
                button = {}
            })
        elseif Config.Phone == 'gks' then
            TriggerServerEvent('gksphone:NewMail', {
            sender = "City of Los Santos",
            subject = "Emergency Broadcast",
            message = message,
            button = {}
        })
        end
    end
end)

-------------------- Water Raising --------------------

RegisterNetEvent('strez:raisewater', function()
    CreateThread(function()
        
        local waterQuadCount = GetWaterQuadCount()
        local isFlooding = true

        local maxFloodHeight = 29 -- Change this value to set the maximum flood height

        local increaseRate = 0.1 -- Change this value to increase/decrease the rate at which the water height changes

        local threadWait = 500 -- Change this value to increase/decrease the time it takes to reach maxFloodHeight.

        while isFlooding do
            for i = 1, waterQuadCount, 1 do
                local success, waterQuadLevel = GetWaterQuadLevel(i)
                if success == 1 then
                    SetWaterQuadLevel(i, waterQuadLevel + increaseRate)
                end

                if waterQuadLevel >= maxFloodHeight then
                    isFlooding = false
                end
            end
            Wait(threadWait)
        end

        local pCoords, wCoords, allPeds = nil, nil, nil
        local ped = PlayerPedId()

        while true do
            pCoords = GetEntityCoords(ped)
            wCoords = GetWaterQuadAtCoords_3d(pCoords.x, pCoords.y, pCoords.z)

            if wCoords ~= -1 then
                allPeds = GetGamePool('CPed')
                for i = 1, #allPeds do
                    SetPedConfigFlag(allPeds[i], 65, true)
                    SetPedDiesInWater(allPeds[i], true)
                end
            end
            Wait(5000)
        end
    end)
end)