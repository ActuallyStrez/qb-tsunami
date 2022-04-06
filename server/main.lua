-------------------- Strez Tsunami --------------------
-- Code
local QBCore = exports['qb-core']:GetCoreObject()

-------------------- Custom Tsunami Email --------------------

-- Custom Warning Email
QBCore.Commands.Add('tsunamialert', 'Send Custom eMail to Everyone', {{name = 'Email', help = 'Text of Email'}}, true, function(source, args)
    local msg = table.concat(args, ' ')
    local len = tonumber(string.len(msg))
    if len <= 255 then
        TriggerClientEvent('strez:client:SendMailTsunamiCustom', -1, msg)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Exceeds maximum characters!', 'error')
    end
end, 'god')

-------------------- Manual Tsunami Email --------------------

-- Manual 15 Minute Tsunami Warning
QBCore.Commands.Add('tsunamidefault', 'Send TSUNAMI WARNING eMail to Everyone', {}, true, function(source, args)
    TriggerClientEvent('strez:client:SendMailTsunamiManual', -1)
end, 'god')

-------------------- Auto Restart Tsunami Email --------------------

-- 15 Minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 900 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto15', -1)
    end
end)
-- 5 Minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 600 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto5', -1)
    end
end)
-- 1 Minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto1', -1)
    end
end)