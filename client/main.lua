local QBCore = exports['qb-core']:GetCoreObject()

function TsunamiEffect()
    local startStamina = 30
    while startStamina > 0 do 
        Wait(1000)
        startStamina = startStamina - 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 51 then
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.09)
        end
    end
    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
end

RegisterNetEvent('google:client:SendMailAlerts', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.7)
    Wait(math.random(5000, 10000))
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "District of Los Santos",
        subject = "Emergency Alert",
        message = text,
        button = {}
    })
end)

RegisterNetEvent('strez:client:SendMailTsunami', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.7)
    Wait(math.random(5000, 10000))
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "District of Los Santos",
        subject = "Emergency Alert",
        message = "The National Weather Service has issued a TSUNAMI WARNING for Los Santos, In 15 minutes! Please start heading home or somewhere local for SAFETY!",
        button = {}
    })
    Wait(math.random(5000, 10000))
    TriggerEvent('qb-weathersync:client:TsunamiAlert')
    Wait(math.random(5000, 10000))
    TsunamiEffect()
    Wait(30000)
    TriggerServerEvent('qb-multicharacter:server:disconnect')
end)
