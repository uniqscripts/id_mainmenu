ESX = nil
local inMenu = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do 
        Wait(250)
    end
    
    ESX.PlayerData = ESX.GetPlayerData()
end)

function SetDisplay(bool)
    SendNUIMessage({
        type = "show",
        status = bool,
    })

	SetNuiFocus(bool, bool)
    
    -- Player's character name
    ESX.TriggerServerCallback('id_mainmenu:getPlayerName', function(playername)
        SendNUIMessage({action = 'playername', value = playername})
    end)
    
    -- Phone Number
    ESX.TriggerServerCallback('id_mainmenu:getPhoneNumber', function(phonenumber)
        SendNUIMessage({action = 'phonenumber', value = phonenumber})
    end)

    -- Job Name and Grade
    SendNUIMessage({action = 'jobname', value = ESX.PlayerData.job.name .. ' - ' .. ESX.PlayerData.job.grade_name})

    -- Money in hand (cash)
    ESX.TriggerServerCallback('id_mainmenu:getCash', function(walletamount)
        SendNUIMessage({action = 'walletamount', value = walletamount})
    end)

    -- Bank Money
    ESX.TriggerServerCallback('id_mainmenu:getBank', function(bankamount)
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

        SendNUIMessage({action = 'whatlevel', value = exports.esx_xp:ESXP_GetRank()})
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
    
    if GlobalState.OXInventory then
        exports.ox_inventory:openInventory(1)
    else
        TriggerEvent('esx_inventoryhud:openInventory') -- trigger event for opening your inventory
    end

    inMenu = false
end)

RegisterNUICallback("billing", function(data)
    SetDisplay(false, false)
    
    if GlobalState.ESX_Billing then
        TriggerEvent("esx_billing:showBilling")
    else
        TriggerEvent('okokBilling:openUI') -- trigger event for showing billing
    end

    inMenu = false
end)

RegisterNUICallback("cardealership", function(data)
    SetDisplay(false, false)

    TriggerEvent("esx_vehicleshop:openShopMenu") -- trigger event for opening car dealership
    
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
