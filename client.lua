RegisterNetEvent('autorevive_menu:yesSelected')
AddEventHandler('autorevive_menu:yesSelected', function()
    TriggerServerEvent('hospital:server:RespawnAtHospital', 1)
end)

lib.registerContext({
    id = 'autorevive_menu',
    title = Config.MenuTitle,
    options = {
        {
            title = 'Yes',
            description = 'Dead In Gang Situation Or Burned Situation',
            onSelect = function()
                TriggerEvent('autorevive_menu:yesSelected')
            end
        },
        {
            title = 'No',
            description = 'Dead in Random situation like Food Low',
            onSelect = function()
                TriggerServerEvent('checkEMSAvailability', function(emsAvailable)

                end)
            end
        }
    }
})

RegisterCommand(Config.MenuCommand, function()
    lib.showContext('autorevive_menu')
end)

RegisterNetEvent('notifyEMSAvailability')
AddEventHandler('notifyEMSAvailability', function(isAvailable)
    local description = isAvailable and 'EMS Units Are Available' or 'You Are being revived By DR GREY'
    local iconColor = isAvailable and '#AAFF00' or '#FF0000'
    lib.notify({
        title = 'AG Autorevive',
        description = description,
        showDuration = true,
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
                color = '#909296'
            }
        },
        icon = 'success',
        iconColor = iconColor
    })
    lib.progressBar({
        duration = 10000, -- in milisecond
        label = 'You Are being revived By DR GREY',
        useWhileDead = true,
        canCancel = false,
        disable = {
            car = true,
        },
    })
    TriggerEvent('hospital:client:Revive')
end)

AddEventHandler('baseevents:onPlayerDied', function()
    lib.showContext('autorevive_menu')
end)

AddEventHandler('baseevents:onPlayerKilled', function()
    lib.showContext('autorevive_menu')
end)
