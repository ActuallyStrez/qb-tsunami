local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('ealerts', "Send eMail to Everyone", {{name = 'Email', help = 'Text of Email'}}, true, function(source, args)
    local msg = table.concat(args, " ")
    local len = tonumber(string.len(msg))
    if len <= 255 then
        TriggerClientEvent('google:client:SendMail', -1, msg)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Exceeds maximum characters!', 'error')
    end
end, "god")