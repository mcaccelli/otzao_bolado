function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if math.random(10) == 1 then
		player:getPosition():sendMagicEffect(CONST_ME_SOUND_YELLOW)
		item:transform(5958)
	else
		item:getPosition():sendMagicEffect(CONST_ME_POFF)
		item:remove(1)
	end
	return true
end
