local QBCore = exports['qb-core']:GetCoreObject()

-- Auto Restarter 15 Minutes Tsunami Warning Email

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 900 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto15', -1)
    end
end)

-- Auto Restarter 5 Minutes Tsunami Warning Email

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 300 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto5', -1)
    end
end)

-- Auto Restarter 1 Minutes Tsunami Warning Email

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto1', -1)
    end
end)

-- Basic Broadcast Text Email

QBCore.Commands.Add('ealerts', "Send eMail to Everyone", {{name = 'Email', help = 'Text of Email'}}, true, function(source, args)
    local msg = table.concat(args, " ")
    local len = tonumber(string.len(msg))
    if len <= 255 then
        TriggerClientEvent('strez:client:SendMailAlertsBasic', -1, msg)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Exceeds maximum characters!', 'error')
    end
end, "god")

-- Manual Tsunami Broadcast Text Email

QBCore.Commands.Add('ealertstsunami', "Send eMail to Everyone", {{name = 'Email', help = 'Text of Email'}}, true, function(source, args)
    local msg = table.concat(args, " ")
    local len = tonumber(string.len(msg))
    if len <= 255 then
        TriggerClientEvent('strez:client:SendMailTsunamiManual', -1, msg)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Exceeds maximum characters!', 'error')
    end
end, "god")

-- Manual 15 Minutes Tsunami Warning Override Email

QBCore.Commands.Add('ealertstsunami', "Send TSUNAMI WARNING eMail to Everyone", {}, true, function(source, args)
    TriggerClientEvent('strez:client:SendMailTsunamiManualOverride', -1)
end, "god")
