local QBCore = exports['qb-core']:GetCoreObject()
local inMenu = false

function QBCore.Functions.GetPlayerData(cb)
    if cb then
        cb(QBCore.PlayerData)
    else
        return QBCore.PlayerData
    end
end

local player = QBCore.Functions.GetPlayerData()

function SetDisplay(bool)
    SendNUIMessage({
        type = "show",
        status = bool,
    })

	SetNuiFocus(bool, bool)
    
    -- Player's character name
    QBCore.Functions.TriggerCallback('id_mainmenu:getPlayerName', function(playername)
        SendNUIMessage({action = 'playername', value = playername})
    end)
    
    -- Phone Number
    QBCore.Functions.TriggerCallback('id_mainmenu:getPhoneNumber', function(phonenumber)
        SendNUIMessage({action = 'phonenumber', value = phonenumber})
    end)

    -- Job Name and Grade
    SendNUIMessage({action = 'jobname', value = player.job.name .. ' - ' .. player.job.grade.name})

    -- Money in hand (cash)
    QBCore.Functions.TriggerCallback('id_mainmenu:getCash', function(walletamount)
        SendNUIMessage({action = 'walletamount', value = walletamount})
    end)

    -- Bank Money
    QBCore.Functions.TriggerCallback('id_mainmenu:getBank', function(bankamount)
        SendNUIMessage({action = 'bankamount', value = bankamount})
    end)
    
    -- Administration Contact
    if GlobalState.AdminContact then
        SendNUIMessage({
            type = "showadmincontact",
            status = true,
        })

    else
        SendNUIMessage({
            type = "showadmincontact",
            status = false,
        })
    end

    -- Level System
    if GlobalState.LevelSystem then
        SendNUIMessage({
            type = "showlevel",
            status = true,
        })

        SendNUIMessage({action = 'whatlevel', value = TriggerEvent("qb-core:getLevel")})
    else
        SendNUIMessage({
            type = "showlevel",
            status = false,
        })
    end

    inMenu = true
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 244) and not inMenu then
			SetDisplay(true, true)
		end
	end
end)

RegisterNUICallback("close", function(data)
    SetNuiFocus(false, false)

    inMenu = false
end)

RegisterNUICallback("inventory", function(data)
    SetDisplay(false, false)
    
    TriggerEvent('inventory:client:OpenInventory') -- trigger event for opening your inventory

    inMenu = false
end)

RegisterNUICallback("billing", function(data)
    SetDisplay(false, false)
    
    TriggerEvent('okokBilling:openUI') -- trigger event for showing billing

    inMenu = false
end)

RegisterNUICallback("cardealership", function(data)
    SetDisplay(false, false)

    TriggerEvent("qb-vehicleshop:client:homeMenu") -- trigger event for opening car dealership
    
    inMenu = false
end)

RegisterNUICallback("shop", function(data)
    SetDisplay(false, false)

    TriggerEvent("core_credits:showShop") -- trigger event for opening shop
    
    inMenu = false
end)

RegisterNUICallback("administratorcontact", function(data)
    SetDisplay(false, false)
    
    TriggerEvent("id_reportsystem:openUI") -- trigger event for sending message to an admin
    
    inMenu = false
end)

RegisterNUICallback("jobcenter", function(data)
    SetDisplay(false, false)
    
    TriggerEvent("id_jobcenter:openUI") -- trigger event for opening job center
    
    inMenu = false
end)