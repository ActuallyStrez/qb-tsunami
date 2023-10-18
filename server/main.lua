RegisterCommand('emergencyemail', function(source, args, rawCommand)
    local msg = table.concat(args, ' ')
    local len = tonumber(string.len(msg))
    if len <= 255 then
        TriggerClientEvent('strez:client:SendEmergencyEmail', -1, msg)
    else
        TriggerClientEvent('chatMessage', source, '^1[Error]^0 Exceeds maximum characters!', {255, 0, 0})
    end
end, true)

RegisterCommand('announcementemail', function(source, args, rawCommand)
    local msg = table.concat(args, ' ')
    local len = tonumber(string.len(msg))
    if len <= 255 then
        TriggerClientEvent('strez:client:SendAnnouncementEmail', -1, msg)
    else
        TriggerClientEvent('chatMessage', source, '^1[Error]^0 Exceeds maximum characters!', {255, 0, 0})
    end
end, true)


-------------------- Manual Tsunami Email --------------------


-------------------- Auto Restart Tsunami Email --------------------

-- 30 minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 1800 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto30', -1)
    end
end)



-- 5 Minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 300 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto5', -1)
    end
end)

-- 1 Minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto1', -1)
    end
end)
