local config = {
	[9059] = TOWNS_LIST.AB_DENDRIEL,
	[9056] = TOWNS_LIST.CARLIN,
	[9060] = TOWNS_LIST.KAZORDOON,
	[9057] = TOWNS_LIST.THAIS,
	[9058] = TOWNS_LIST.VENORE,
	[9061] = TOWNS_LIST.DARASHIA,
	[9062] = TOWNS_LIST.ANKRAHMUN,
	[9063] = TOWNS_LIST.EDRON,
	[9068] = TOWNS_LIST.FARMINE,
	[9064] = TOWNS_LIST.DARASHIA,
	[9065] = TOWNS_LIST.PORT_HOPE,
	[9066] = TOWNS_LIST.SVARGROND,
	[9067] = TOWNS_LIST.YALAHAR,
	[9240] = TOWNS_LIST.GRAY_BEACH,
	[9510] = TOWNS_LIST.RATHLETON,
	[9500] = TOWNS_LIST.ROSHAMUUL,
	[9515] = TOWNS_LIST.ISSAVI,
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local townId = config[item.uid]
	if not townId then
		return true
	end

	local town = Town(townId)
	if not town then
		return true
	end

	if town:getId() == 16 and player:getStorageValue(Storage.BarbarianTest.Questline) < 8 then
		player:sendTextMessage(MESSAGE_STATUS_WARNING, 'You first need to absolve the Barbarian Test Quest to become citizen!')
		player:teleportTo(town:getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	player:setTown(town)
	player:teleportTo(town:getTemplePosition())
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You are now a citizen of ' .. town:getName() .. '.')
	return true
end
