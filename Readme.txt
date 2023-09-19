
Welcome to Tsunami Quality of Life

Welcome to the Tsunami Quality of Life script, I have designed the script to allow auto-restart through txAdmin to bring having restarts more ingame depth.

This is a 4-tier restarter, 30 minutes, 15 minutes, 5 minutes, and 1 minute.

I have designed the script to allow txAdmin to auto-restart to send Phone Emails in-game to players, This way people are aware of server restarts without having to break Character.



New custom emails one for Announcements and  one for Emergency Alerts

30 Minute Warning - Email & Weather Chance (CLEAR)

15 Minute Warning - Email & Weather Change (Rain)

5 Minute Warning - Email & Weather Change (Thunder)

1 Minute Warning - Email & Blackout & Weather Change (Thunder)



-------------------- Commands --------------------

/emergencyemail 'Send emergency email to everyone

/announcementemail 'Send announcement email to everyone

/tsunamimanual '15 minute tsunami warning'



-------------------- Dependencies --------------------

- [qb-core](https://github.com/qbcore-framework/qb-core)

- [qb-phone](https://github.com/qbcore-framework/qb-phone)



-------------------- GKS Phone Support --------------------

If you are using https://fivem.gkshop.org/package/4862478 (QBCore)

You will need to edit the following lines and replace them with this.

Search "TriggerServerEvent('qb-phone:server:sendNewMail', {"

Replace with "TriggerServerEvent('gksphone:NewMail', {"



-------------------- V2 UPDATE --------------------

-- Completely removed screen shake/ped movement

-- Add a 30min Alert

-- added Emergency Alert/Announcement email commands to avoid using txadmin announcements this way players can not rush to read.



P.S. Thank you for all the love and support given for this script, This is probably the final stage.
