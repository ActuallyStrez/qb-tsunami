# qb-ealerts
QBCore Emergency Alerts Email

A basic script that allows Admins to send an Emergency Email to everyone in the city, Is great for incoming Tsunami and many other possibilities.

Command: /ealerts (Max characters 255)
	 /ealertstsunami (Send's TSUNAMI WARNING eMail to Everyone)

Credits: Google <3

Please add following to qb-weathersync

qb-weathersync/client.lua/line36

```lua 
RegisterNetEvent('qb-weathersync:client:TsunamiAlert', function()
	disable = true
	CreateThread(function()
		while disable do
			SetRainLevel(0.5)
			SetWeatherTypePersist('THUNDER')
			SetWeatherTypeNow('THUNDER')
			SetWeatherTypeNowPersist('THUNDER')
            Wait(5000)
		end
	end)
end)
```
