-------------------- Strez Tsunami --------------------
local QBCore = exports['qb-core']:GetCoreObject()

-------------------- Emails --------------------

-- Emergency Alert
RegisterNetEvent('strez:client:SendEmergencyEmail', function(text)
    Wait(math.random(7000, 13000))
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "City of Los Santos",
        subject = "Emergency Alert",
        message = text,
        button = {}
    })
end)

-- Announcement Email
RegisterNetEvent('strez:client:SendAnnouncementEmail', function(text)
    Wait(math.random(7000, 13000))
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "City of Los Santos",
        subject = "Announcement",
        message = text,
        button = {}
    })
    Wait(500)
end)

-------------------- Manual Tsunami Email --------------------

-- Manual Warning Email
RegisterNetEvent('strez:client:TsunamiManual', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.1)
    Wait(math.random(7000, 13000))
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'District of Los Santos',
        subject = 'Emergency Broadcast',
        message = 'The National Weather Service has issued a TSUNAMI WARNING for Los Santos, In 15 minutes! Please start heading home or somewhere local for SAFETY!',
        button = {}
    })
    Wait(math.random(30000, 60000))
    TriggerServerEvent('qb-weathersync:server:setWeather', 'THUNDER')
end)

-------------------- Auto Restart Tsunami Email --------------------

-- 30 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto30', function(text)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'Los Santos Weather',
        subject = 'Weather Forecast',
        message = 'We\'re happy to report that we have clear skies dominating the forecast, and there is no rain expected in the foreseeable future.',
        button = {}
    })
    Wait(5000)
    TriggerServerEvent('qb-weathersync:server:setWeather', 'CLEAR')
end)

-- 15 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto15', function(text)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'Los Santos Weather',
        subject = 'Weather Update',
        message = 'We apologize for the inaccurate forecasts earlier, and I understand your concern. It appears that the weather has taken an unexpected turn, and rain is now falling.',
        button = {}
    })
    Wait(5000)
    TriggerServerEvent('qb-weathersync:server:setWeather', 'RAIN')
end)


-- 5 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto5', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.1)
    Wait(10000)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'Los Santos Weather',
        subject = 'Emergency Weather',
        message = 'This is an emergency weather update. A tsunami is predicted to make contact in less than 5 minutes. If you are in a coastal area, it is imperative to take immediate action to move to higher ground and seek safety. Please follow any official alerts, instructions, and evacuation orders issued by local authorities. Stay away from beaches and low-lying areas.',
        button = {}
    })
    Wait(5000)
    TriggerServerEvent('qb-weathersync:server:setWeather', 'THUNDER')
end)

-- 1 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto1', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.1)
    Wait(10000)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'Los Santos Weather',
        subject = 'Emergency Weather',
        message = 'This is an emergency weather update. A tsunami is imminent. <br> <br> If you are in a coastal area, it is imperative to take immediate action to move to higher ground and seek safety. Please follow any official alerts, instructions, and evacuation orders issued by local authorities. Stay away from beaches and low-lying areas.',
        button = {}
    })
    Wait(5000)
    TriggerServerEvent('qb-weathersync:server:toggleBlackout')
end)