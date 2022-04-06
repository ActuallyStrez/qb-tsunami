-------------------- Strez Tsunami --------------------
-- Code
local QBCore = exports['qb-core']:GetCoreObject()

-- Tsunami Aftershock Effects
function TsunamiEffect()
    local startStamina = 30
    while startStamina > 0 do 
        Wait(1000)
        startStamina = startStamina - 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 9 then
            if not IsPedRagdoll(PlayerPedId()) and IsPedOnFoot(PlayerPedId()) and not IsPedSwimming(PlayerPedId()) then
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
                SetPedToRagdollWithFall(PlayerPedId(), 0, 0, 1, GetEntityForwardVector(PlayerPedId()), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            end
        end
    end
    startStamina = 0
end

-------------------- Custom Tsunami Email --------------------

RegisterNetEvent('strez:client:SendMailTsunamiCustom', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.5)
    Wait(math.random(7000, 13000))
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "District of Los Santos",
        subject = "Emergency Broadcast",
        message = text,
        button = {}
    })
end)

-------------------- Manual Tsunami Email --------------------

-- Manual Warning Email
RegisterNetEvent('strez:client:SendMailTsunamiManual', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.5)
    Wait(math.random(7000, 13000))
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'District of Los Santos',
        subject = 'Emergency Broadcast',
        message = 'The National Weather Service has issued a TSUNAMI WARNING for Los Santos, In 15 minutes! Please start heading home or somewhere local for SAFETY!',
        button = {}
    })
    Wait(math.random(30000, 60000))
    TriggerServerEvent('qb-weathersync:server:setWeather', 'THUNDER')
    Wait(math.random(25000, 35000))
    TriggerEvent('InteractSound_CL:PlayOnOne', 'raidsiren', 0.1)
    TsunamiEffect()
end)

-------------------- Auto Restart Tsunami Email --------------------

-- 15 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto15', function(text)
        TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.5)
        Wait(math.random(7000, 13000))
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = 'District of Los Santos',
            subject = 'Emergency Broadcast',
            message = 'The National Weather Service has issued a TSUNAMI WARNING for Los Santos, In 15 minutes! Please start heading home or somewhere local for SAFETY!',
            button = {}
        })
        Wait(math.random(15000, 25000))
        TriggerServerEvent('qb-weathersync:server:setWeather', 'THUNDER')
        Wait(math.random(13000, 23000))
        TsunamiEffect()
end)
-- 5 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto5', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.5)
    Wait(math.random(7000, 13000))
    Wait(35000)
	TriggerEvent('InteractSound_CL:PlayOnOne', 'raidsiren', 0.1)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'District of Los Santos',
        subject = 'Emergency Broadcast',
        message = 'The National Weather Service has issued a TSUNAMI WARNING for Los Santos, In 5 minutes! Los Santos is losing City Power, Please start heading home or somewhere local for SAFETY!',
        button = {}
    })
    Wait(math.random(10000, 20000))
    TriggerServerEvent('qb-weathersync:server:toggleBlackout')
    Wait(math.random(13000, 23000))
    TsunamiEffect()
end)
-- 1 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto1', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.5)
    Wait(math.random(7000, 13000))
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'District of Los Santos',
        subject = 'Emergency Broadcast',
        message = 'The National Weather Service has issued a TSUNAMI WARNING for Los Santos, In 1 minutes! Please start heading home or somewhere local for SAFETY!',
        button = {}
    })
    Wait(math.random(13000, 23000))
    TsunamiEffect()
end)
