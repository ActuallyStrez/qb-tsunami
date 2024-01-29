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
    if Config.phone == 'qb' then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "City of Los Santos",
        subject = "Emergency Alert",
        message = text,
            button = {}
        })
    elseif Config.phone == 'qs' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
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
    if Config.phone == 'qb' then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = 'City of Los Santos',
            subject = 'Announcemen',
            message =  text,
            button = {}
        })
    elseif Config.phone == 'qs' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
            sender = 'City of Los Santos',
            subject = 'Announcemen',
            message =  text,
            button = {}
        })
    end 
    Wait(500)
end)

-------------------- Manual Tsunami Restart --------------------

-- Manual Warning Email
RegisterNetEvent('strez:client:TsunamiManual', function(text)
    local message = 'The National Weather Service has issued a TSUNAMI WARNING for Los Santos, In 15 minutes! Please start heading home or somewhere local for SAFETY!',
    Wait(math.random(5000, 15000))
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.1)
    Wait(math.random(5000, 15000))
    if Config.Notify == 'qb' then
        TriggerEvent('QBCore:Notify', message, 'success', 5000)
    elseif Config.Notify == 'ox' then
        lib.notify({ description = message, duration = 5000,type = 'info', position = 'top-right'})
    elseif Config.Notify == 'email' then
        if Config.phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = 'District of Los Santos',
                subject = 'Emergency Broadcast',
                message =  message,
                button = {}
            })
        elseif Config.phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                sender = 'District of Los Santos',
                subject = 'Emergency Broadcast',
                message =  message,
                button = {}
            })
        end        
    end
    Wait(math.random(5000, 15000))
    TriggerServerEvent('qb-weathersync:server:setWeather', 'THUNDER')
    Wait(math.random(15000, 30000))
    TriggerEvent('strez:raisewater')
    Wait(math.random(60000, 120000))
    TriggerServerEvent('qb-weathersync:server:toggleBlackout')
end)

-------------------- TxAdmin Auto Restart Tsunami --------------------

-- 30 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto30', function(text)
    Wait(math.random(5000, 15000))
    local message = 'We\'re happy to report that we have clear skies dominating the forecast, and there is no rain expected in the foreseeable future.'
    if Config.Notify == 'qb' then
        TriggerEvent('QBCore:Notify', message, 'success', 5000)
    elseif Config.Notify == 'ox' then
        lib.notify({ description = message, duration = 5000,type = 'info', position = 'top-right'})
    elseif Config.Notify == 'email' the
        if Config.phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = 'Los Santos Weather',
                subject = 'Weather Forecast',
                message =  message,
                button = {}
            })
        elseif Config.phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                sender = 'Los Santos Weather',
                subject = 'Weather Forecast',
                message =  message,
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
        TriggerEvent('QBCore:Notify', message, 'success', 5000)
    elseif Config.Notify == 'ox' then
        lib.notify({ description = message, duration = 5000,type = 'info', position = 'top-right'})
    elseif Config.Notify == 'email' then
      if Config.phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = 'Los Santos Weather',
                subject = 'Emergency Weather',
                message =  message,
                button = {}
            })
        elseif Config.phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                sender = 'Los Santos Weather',
                subject = 'Emergency Weather',
                message =  message,
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
        TriggerEvent('QBCore:Notify', message, 'success', 5000)
    elseif Config.Notify == 'ox' then
        lib.notify({ description = message, duration = 5000,type = 'info', position = 'top-right'})
    elseif Config.Notify == 'email' then
      if Config.phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = 'Los Santos Weather',
                subject = 'Emergency Weather',
                message =  message,
                button = {}
            })
        elseif Config.phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                sender = 'Los Santos Weather',
                subject = 'Emergency Weather',
                message =  message,
                button = {}
            })
        end
    end
    Wait(math.random(5000, 15000))
    TriggerServerEvent('qb-weathersync:server:setWeather', 'THUNDER')
    Wait(math.random(15000, 30000))
    TriggerEvent('strez:raisewater')
    Wait(math.random(60000, 120000))
    TriggerServerEvent('qb-weathersync:server:toggleBlackout')
end)

-- 1 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto1', function(text)
    local message = 'This is an emergency weather update. A tsunami is imminent. If you are in a coastal area, it is imperative to take immediate action to move to higher ground and seek safety. Please follow any official alerts, instructions, and evacuation orders issued by local authorities. Stay away from beaches and low-lying areas.'
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.1)
    Wait(math.random(5000, 5000))
    if Config.Notify == 'qb' then
        TriggerEvent('QBCore:Notify', message, 'success', 5000)
    elseif Config.Notify == 'ox' then
        lib.notify({ description =  message, duration = 5000,type = 'info', position = 'top-right'})
    elseif Config.Notify == 'email' then
      if Config.phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = 'Los Santos Weather',
                subject = 'Emergency Weather',
                message =  message,
                button = {}
            })
        elseif Config.phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                sender = 'Los Santos Weather',
                subject = 'Emergency Weather',
                message =  message,
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
        -- Change this value to set the maximum flood height
        local maxFloodHeight = 29
        -- Change this value to increase/decrease the rate at which the water height changes
        local increaseRate = 0.1
        -- Change this value to increase/decrease the time it takes to reach maxFloodHeight.
        local threadWait = 500
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
            Citizen.Wait(threadWait)
        end
    end)
end)
