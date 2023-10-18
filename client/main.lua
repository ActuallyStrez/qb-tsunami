-------------------- Strez Tsunami --------------------

-------------------- Emails --------------------

RegisterNetEvent('strez:client:TsunamiManual', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.1)
    Wait(math.random(7000, 13000))
    
    Wait(math.random(30000, 60000))
        TriggerEvent('changeWeather', 'THUNDER')
        
end)

-------------------- Auto Restart Tsunami Email --------------------

-- 30 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto30', function(text)

    Wait(5000)
        TriggerEvent('changeWeather', 'CLEAR')
end)

-- 15 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto15', function(text)
    Wait(5000)
                TriggerEvent('changeWeather', 'RAIN')
end)


-- 5 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto5', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.1)
    Wait(10000)
    Wait(5000)
        TriggerEvent('changeWeather', 'THUNDER')
end)

-- 1 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto1', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.1)
    Wait(10000)
 -- need to do blackout

    end)

RegisterNetEvent('changeWeather')
AddEventHandler('changeWeather', function(weatherType)
    if IsAllowedToChangeWeather() then
        SetWeatherTypeNowPersist(weatherType)
        SetWeatherTypeNow(weatherType)
        Citizen.Wait(1000) 
    else
        TriggerEvent('chatMessage', '^1[Error]^0 You do not have permission to change the weather.')
    end
end)

function IsAllowedToChangeWeather()
    return true
end

