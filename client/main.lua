local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('google:client:SendMail', function(text)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "District of Los Santos",
        subject = "Emergency Alert",
        message = text,
        button = {}
    })
end)