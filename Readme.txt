-------------------- Strez Tsunami --------------------

Welcome to Tsunami Quality of life script, I have designed the script to allow auto-restart though txAdmin to bring having restarts more ingame depth.
This is a 3 tier restarter, 15 minute, 5 minute, 1 minute each comes with different effect and a stage.

I have designed the script to allow txAdmin to auto-restart to send Phone Emails ingame to players, This way people are aware of server restarts without having to break Character.

New custom emails one for Announcements and Emergency Alerts

30 Minute Warning - Email & Weather Chance (CLEAR)

15 Minute Warning - Email & Weather Change (Rain)

5 Minute Warning - Email & Weather Change (THUNDER)

1 Minute Warning - Email & Blackout & Weather Change (THUNDER)

## Dependencies ##
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-phone](https://github.com/qbcore-framework/qb-phone)

-------------------- GKS Phone Support --------------------

If you are using https://fivem.gkshop.org/package/4862478 (QBCore)

You will need to edit the follow lines and replace with this.

Search "TriggerServerEvent('qb-phone:server:sendNewMail', {"

Replace with "TriggerServerEvent('gksphone:NewMail', {"

UPDATED V2

-- Completely removed screenshake/ped movement
-- Add a 30min Alert
-- added Emergency Alert/Announcemt email commands to avoice using txadmin announcements this way players can not rush to read.

P.S. Thank you for all the love and support given for this script, I This is probably the final stage.