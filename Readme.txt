-------------------- Strez Tsunami --------------------

Welcome to Tsunami Quality of life script, I have designed the script to allow auto-restart though txAdmin to bring having restarts more ingame depth.
This is a 3 tier restarter, 15 minute, 5 minute, 1 minute each comes with different effect and a stage.

I have designed the script to allow txAdmin to auto-restart to send Phone Emails ingame to players, This way people are aware of server restarts without having to break Character.

15 Minute Warning - Email & Weather Change (Thunder/Rain)

5 Minute Warning - Email & Blackout & Aftershock

1 Minute Warning - Email & Blackout & Aftershock

## Dependencies ##
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-phone](https://github.com/qbcore-framework/qb-phone)

-------------------- Sound Interactions --------------------

Please place all the .ogg sounds into interact-sound\client\sounds

-------------------- GKS Phone Support --------------------

If you are using https://fivem.gkshop.org/package/4862478 (QBCore)

You will need to edit the follow lines and replace with this.

Search "TriggerServerEvent('qb-phone:server:sendNewMail', {"

Replace with "TriggerServerEvent('gksphone:NewMail', {"

Also you will need to remove the qb-phone Dependencie from the fxmanifest
