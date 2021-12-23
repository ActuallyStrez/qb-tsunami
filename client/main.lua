local QBCore = exports['qb-core']:GetCoreObject()

function TsunamiEffect()
    local startStamina = 30
    while startStamina > 0 do 
        Wait(1000)
        startStamina = startStamina - 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 11 then
            if not IsPedRagdoll(PlayerPedId()) and IsPedOnFoot(PlayerPedId()) and not IsPedSwimming(PlayerPedId()) then
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08) -- change this float to increase/decrease camera shake
                SetPedToRagdollWithFall(PlayerPedId(), 7500, 9000, 1, GetEntityForwardVector(PlayerPedId()), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            end
        end
    end
    startStamina = 0
end

RegisterNetEvent('google:client:SendMailAlerts', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.7)
    Wait(math.random(7000, 13000))
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "District of Los Santos",
        subject = "Emergency Alert",
        message = text,
        button = {}
    })
end)

RegisterNetEvent('strez:client:SendMailTsunami', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.7)
    Wait(math.random(7000, 13000))
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "District of Los Santos",
        subject = "Emergency Alert",
        message = "The National Weather Service has issued a TSUNAMI WARNING for Los Santos, In 15 minutes! Please start heading home or somewhere local for SAFETY!",
        button = {}
    })
    Wait(math.random(15000, 25000))
    TriggerEvent('qb-weathersync:client:TsunamiAlert')
    Wait(math.random(13000, 23000))
    TsunamiEffect()
end)
