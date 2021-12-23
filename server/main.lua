local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('ealerts', "Send eMail to Everyone", {{name = 'Email', help = 'Text of Email'}}, true, function(source, args)
    local msg = table.concat(args, " ")
    local len = tonumber(string.len(msg))
    if len <= 255 then
        TriggerClientEvent('google:client:SendMailAlerts', -1, msg)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Exceeds maximum characters!', 'error')
    end
end, "god")

QBCore.Commands.Add('ealertstsunami', "Send TSUNAMI WARNING eMail to Everyone", {}, true, function(source, args)
    TriggerClientEvent('strez:client:SendMailTsunami', -1)
end, "god")
