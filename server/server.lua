ESX = nil
local cache = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('id_mainmenu:getPlayerName', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local nameofplayer

    playername = MySQL.Sync.fetchAll("SELECT firstname,lastname FROM users WHERE identifier = ?",{xPlayer.identifier})[1]
    if playername~=nil then playername = playername~=nil and playername or {firstname="N/A",lastname="N/A"} end
    nameofplayer = playername.firstname.." "..playername.lastname or "Your full name is not loaded"

    cb(nameofplayer)
end)

ESX.RegisterServerCallback('id_mainmenu:getPhoneNumber', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local phonenumber

  number = MySQL.Sync.fetchAll("SELECT phone_number FROM users WHERE identifier = ?",{xPlayer.identifier})[1]
  if number~=nil then number = number~=nil and number or {phone_number="N/A"} end
  phonenumber = number.phone_number or "Your phone number is invalid"

  cb(phonenumber)
end)

ESX.RegisterServerCallback('id_mainmenu:getCash', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local cash

  cash = xPlayer.getMoney()

  cb(cash)
end)

ESX.RegisterServerCallback('id_mainmenu:getBank', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local bank

  bank = xPlayer.getAccount('bank').money

  cb(bank)
end)