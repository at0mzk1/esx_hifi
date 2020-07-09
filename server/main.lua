ESX = nil
xSound = exports.xsound
local boomBoxes = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('boombox', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('boombox', 1)
	
	TriggerClientEvent('esx_boombox:place_boombox', source)
	xPlayer.showNotification(_U('put_boombox'))
end)

RegisterServerEvent('esx_boombox:remove_boombox')
AddEventHandler('esx_boombox:remove_boombox', function(coords)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.canCarryItem('boombox', 1) then
		xPlayer.addInventoryItem('boombox', 1)
	end
end)

RegisterServerEvent('esx_boombox:play_music')
AddEventHandler('esx_boombox:play_music', function(idMusic, url, volume, pos)
	xSound:PlayUrlPos(-1,idMusic, url, volume, pos)
	xSound:Distance(-1, idMusic, Config.distance)
	boomBoxes.idMusic = pos
	print(boomBoxes)
end)

RegisterServerEvent('esx_boombox:stop_music')
AddEventHandler('esx_boombox:stop_music', function(idMusic)
	xSound:Destroy(-1, idMusic)
end)

RegisterServerEvent('esx_boombox:set_volume')
AddEventHandler('esx_boombox:set_volume', function(idMusic, volume)
	xSound:setVolume(-1, idMusic, volume)
end)

RegisterServerEvent('esx_boombox:set_volume')
AddEventHandler('esx_boombox:set_volume', function(idMusic, volume)
	xSound:setVolume(-1, idMusic, volume)
end)

RegisterServerEvent('esx_boombox:get_boomboxes')
AddEventHandler('esx_boombox:get_boomboxes', function()
	return boomBoxes
end)