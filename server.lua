local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('checkEMSAvailability')
AddEventHandler('checkEMSAvailability', function()
    local src = source
    local emsAvailable = false
    
    for _, player in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(player)
        if Player.PlayerData.job.name == 'ambulance' then
            emsAvailable = true
            break
        end
    end
    
    TriggerClientEvent('notifyEMSAvailability', src, emsAvailable)
end)

RegisterServerEvent('autorevive:respawnPlayer')
AddEventHandler('autorevive:respawnPlayer', function()
    local respawnPos = Config.RespawnPos
    
    TriggerClientEvent('qb-spawn:client:SpawnPlayer', source, respawnPos)
end)
