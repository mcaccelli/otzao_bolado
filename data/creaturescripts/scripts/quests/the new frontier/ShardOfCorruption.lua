function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end
	local player = creature:getPlayer()

	--An Uneasy Alliance
	if targetMonster:getName():lower() == 'renegade orc' then
		if player:getStorageValue(45220) == 1 then		
			player:setStorageValue(45220, 2) 
		end
		return true
	end

	if targetMonster:getName():lower() ~= 'shard of corruption' then
		return true
	end

	
	if player:getStorageValue(Storage.TheNewFrontier.Questline) == 12 then
		--Questlog, The New Frontier Quest 'Mission 04: The Mine Is Mine'
		player:setStorageValue(Storage.TheNewFrontier.Mission04, 2)
		player:setStorageValue(Storage.TheNewFrontier.Questline, 13)
	end
	return true
end
