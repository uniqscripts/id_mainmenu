local QBCore = exports['qb-core']:GetCoreObject()
local cache = {}

QBCore.Functions.CreateCallback('id_mainmenu:getPlayerName', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local nameofplayer

    local ped = QBCore.Functions.GetPlayer(source)

    nameofplayer = ped.PlayerData.charinfo.firstname .. ' ' .. ped.PlayerData.charinfo.lastname

    cb(nameofplayer)
end)

QBCore.Functions.CreateCallback('id_mainmenu:getPhoneNumber', function(source, cb)
  local Player = QBCore.Functions.GetPlayer(source)
  local phonenumber

  phonenumber = Player.PlayerData.charinfo.phone

  cb(phonenumber)
end)

QBCore.Functions.CreateCallback('id_mainmenu:getCash', function(source, cb)
  local Player = QBCore.Functions.GetPlayer(source)
  local cash

  cash = Player.PlayerData.money['cash']

  cb(cash)
end)

QBCore.Functions.CreateCallback('id_mainmenu:getBank', function(source, cb)
  local Player = QBCore.Functions.GetPlayer(source)
  local bank

  bank = Player.PlayerData.money['bank']

  cb(bank)
end)