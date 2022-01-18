 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "errand") or msgcontains(msg, "gold") then
		if player:getStorageValue(Storage.TheShatteredIsles.TheErrand) == 1 then
			npcHandler:say("Oh, so you brought some gold from Eleonore to me?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:removeMoneyNpc(200) then
				npcHandler:say("Hmm, it seems that Eleonore does trust you. Perhaps she is even right. However. Since we need some help right now I guess we can't be too picky. Return to Eleonore and tell her the secret password: 'peg leg'. She will tell you more about her problem.", cid)
				player:setStorageValue(Storage.TheShatteredIsles.TheErrand, 2)
				npcHandler.topic[cid] = 2
			else
				npcHandler:say("You don't have enough...", cid)
			end
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] >= 1 then
			npcHandler:say("Then no.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Ah, welcome! Welcome |PLAYERNAME|! If you need druid spells, you've come to the right place. Otherwise it's just nice to have a visitor.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Oh well.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())


keywordHandler:addSpellKeyword({'animate','dead'}, {npcHandler = npcHandler, spellName = 'Animate Dead', price = 1200, level = 27, vocation ={2}})
	keywordHandler:addSpellKeyword({'avalanche'}, {npcHandler = npcHandler, spellName = 'Avalanche', price = 1200, level = 30, vocation ={2}})
	keywordHandler:addSpellKeyword({'chameleon'}, {npcHandler = npcHandler, spellName = 'Chameleon', price = 1300, level = 27, vocation ={2}})
	keywordHandler:addSpellKeyword({'convince','creature'}, {npcHandler = npcHandler, spellName = 'Convince Creature', price = 800, level = 16, vocation ={2}})
	keywordHandler:addSpellKeyword({'creature','illusion'}, {npcHandler = npcHandler, spellName = 'Creature Illusion', price = 1000, level = 23, vocation ={2}})
	keywordHandler:addSpellKeyword({'cure','poison'}, {npcHandler = npcHandler, spellName = 'Cure Poison', price = 150, level = 10, vocation ={2}})
	keywordHandler:addSpellKeyword({'cure','poison','rune'}, {npcHandler = npcHandler, spellName = 'Cure Poison Rune', price = 600, level = 15, vocation ={2}})
	keywordHandler:addSpellKeyword({'destroy','field'}, {npcHandler = npcHandler, spellName = 'Destroy Field', price = 700, level = 17, vocation ={2}})
	keywordHandler:addSpellKeyword({'disintegrate'}, {npcHandler = npcHandler, spellName = 'Disintegrate', price = 900, level = 21, vocation ={2}})
	keywordHandler:addSpellKeyword({'energy','field'}, {npcHandler = npcHandler, spellName = 'Energy Field', price = 700, level = 18, vocation ={2}})
	keywordHandler:addSpellKeyword({'energy','strike'}, {npcHandler = npcHandler, spellName = 'Energy Strike', price = 800, level = 12, vocation ={2}})
	keywordHandler:addSpellKeyword({'energy','wall'}, {npcHandler = npcHandler, spellName = 'Energy Wall', price = 2500, level = 41, vocation ={2}})
	keywordHandler:addSpellKeyword({'explosion'}, {npcHandler = npcHandler, spellName = 'Explosion', price = 1800, level = 31, vocation ={2}})
	keywordHandler:addSpellKeyword({'find','person'}, {npcHandler = npcHandler, spellName = 'Find Person', price = 80, level = 8, vocation ={2}})
	keywordHandler:addSpellKeyword({'fire','bomb'}, {npcHandler = npcHandler, spellName = 'Fire Bomb', price = 1500, level = 27, vocation ={2}})
	keywordHandler:addSpellKeyword({'fire','field'}, {npcHandler = npcHandler, spellName = 'Fire Field', price = 500, level = 15, vocation ={2}})
	keywordHandler:addSpellKeyword({'fire','wall'}, {npcHandler = npcHandler, spellName = 'Fire Wall', price = 2000, level = 33, vocation ={2}})
	keywordHandler:addSpellKeyword({'flame','strike'}, {npcHandler = npcHandler, spellName = 'Flame Strike', price = 800, level = 14, vocation ={2}})
	keywordHandler:addSpellKeyword({'food'}, {npcHandler = npcHandler, spellName = 'Food', price = 300, level = 14, vocation ={2}})
	keywordHandler:addSpellKeyword({'great','light'}, {npcHandler = npcHandler, spellName = 'Great Light', price = 500, level = 13, vocation ={2}})
	keywordHandler:addSpellKeyword({'haste'}, {npcHandler = npcHandler, spellName = 'Haste', price = 600, level = 14, vocation ={2}})
	keywordHandler:addSpellKeyword({'heal','friend'}, {npcHandler = npcHandler, spellName = 'Heal Friend', price = 800, level = 18, vocation ={2}})
	keywordHandler:addSpellKeyword({'heavy','magic','missile'}, {npcHandler = npcHandler, spellName = 'Heavy Magic Missile', price = 1500, level = 25, vocation ={2}})
	keywordHandler:addSpellKeyword({'ice','strike'}, {npcHandler = npcHandler, spellName = 'Ice Strike', price = 800, level = 15, vocation ={2}})
	keywordHandler:addSpellKeyword({'ice','wave'}, {npcHandler = npcHandler, spellName = 'Ice Wave', price = 850, level = 18, vocation ={2}})
	keywordHandler:addSpellKeyword({'icicle'}, {npcHandler = npcHandler, spellName = 'Icicle', price = 1700, level = 28, vocation ={2}})
	keywordHandler:addSpellKeyword({'intense','healing','rune'}, {npcHandler = npcHandler, spellName = 'Intense Healing Rune', price = 600, level = 15, vocation ={2}})
	keywordHandler:addSpellKeyword({'invisible'}, {npcHandler = npcHandler, spellName = 'Invisible', price = 2000, level = 35, vocation ={2}})
	keywordHandler:addSpellKeyword({'levitate'}, {npcHandler = npcHandler, spellName = 'Levitate', price = 500, level = 12, vocation ={2}})
	keywordHandler:addSpellKeyword({'light'}, {npcHandler = npcHandler, spellName = 'Light', price = 0, level = 8, vocation ={2}})
	keywordHandler:addSpellKeyword({'light','healing'}, {npcHandler = npcHandler, spellName = 'Light Healing', price = 0, level = 8, vocation ={2}})
	keywordHandler:addSpellKeyword({'light','magic','missile'}, {npcHandler = npcHandler, spellName = 'Light Magic Missile', price = 500, level = 15, vocation ={2}})
	keywordHandler:addSpellKeyword({'magic','rope'}, {npcHandler = npcHandler, spellName = 'Magic Rope', price = 200, level = 9, vocation ={2}})
	keywordHandler:addSpellKeyword({'magic','shield'}, {npcHandler = npcHandler, spellName = 'Magic Shield', price = 450, level = 14, vocation ={2}})
	keywordHandler:addSpellKeyword({'mass','healing'}, {npcHandler = npcHandler, spellName = 'Mass Healing', price = 2200, level = 36, vocation ={2}})
	keywordHandler:addSpellKeyword({'poison','bomb'}, {npcHandler = npcHandler, spellName = 'Poison Bomb', price = 1000, level = 25, vocation ={2}})
	keywordHandler:addSpellKeyword({'poison','field'}, {npcHandler = npcHandler, spellName = 'Poison Field', price = 300, level = 14, vocation ={2}})
	keywordHandler:addSpellKeyword({'poison','wall'}, {npcHandler = npcHandler, spellName = 'Poison Wall', price = 1600, level = 29, vocation ={2}})
	keywordHandler:addSpellKeyword({'soulfire'}, {npcHandler = npcHandler, spellName = 'Soulfire', price = 1800, level = 27, vocation ={2}})
	keywordHandler:addSpellKeyword({'stalagmite'}, {npcHandler = npcHandler, spellName = 'Stalagmite', price = 1400, level = 24, vocation ={2}})
	keywordHandler:addSpellKeyword({'stone','shower'}, {npcHandler = npcHandler, spellName = 'Stone Shower', price = 1100, level = 28, vocation ={2}})
	keywordHandler:addSpellKeyword({'strong','haste'}, {npcHandler = npcHandler, spellName = 'Strong Haste', price = 1300, level = 20, vocation ={2}})
	keywordHandler:addSpellKeyword({'summon','creature'}, {npcHandler = npcHandler, spellName = 'Summon Creature', price = 2000, level = 25, vocation ={2}})
	keywordHandler:addSpellKeyword({'summon','grovebeast'}, {npcHandler = npcHandler, spellName = 'Summon Grovebeast', price = 50000, level = 200, vocation ={2}})
	keywordHandler:addSpellKeyword({'terra','strike'}, {npcHandler = npcHandler, spellName = 'Terra Strike', price = 800, level = 13, vocation ={2}})
	keywordHandler:addSpellKeyword({'terra','wave'}, {npcHandler = npcHandler, spellName = 'Terra Wave', price = 2500, level = 38, vocation ={2}})
	keywordHandler:addSpellKeyword({'ultimate','healing'}, {npcHandler = npcHandler, spellName = 'Ultimate Healing', price = 1000, level = 30, vocation ={2}})
	keywordHandler:addSpellKeyword({'ultimate','light'}, {npcHandler = npcHandler, spellName = 'Ultimate Light', price = 1600, level = 26, vocation ={2}})
	keywordHandler:addKeyword({'attack', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Energy Strike}', '{Flame Strike}', '{Ice Strike}', '{Ice Wave}', '{Terra Strike}' and '{Terra Wave}'."})
	keywordHandler:addKeyword({'healing', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Cure Poison}', '{Heal Friend}', '{Light Healing}', '{Mass Healing}' and '{Ultimate Healing}'."})
	keywordHandler:addKeyword({'support', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Animate Dead}', '{Avalanche}', '{Chameleon}', '{Convince Creature}', '{Creature Illusion}', '{Cure Poison Rune}', '{Destroy Field}', '{Disintegrate}', '{Energy Field}', '{Energy Wall}', '{Explosion}', '{Find Person}', '{Fire Bomb}', '{Fire Field}', '{Fire Wall}', '{Food}', '{Great Light}', '{Haste}', '{Heavy Magic Missile}', '{Icicle}', '{Intense Healing Rune}', '{Invisible}', '{Levitate}', '{Light}', '{Light Magic Missile}', '{Magic Rope}', '{Magic Shield}', '{Poison Bomb}', '{Poison Field}', '{Poison Wall}', '{Soulfire}', '{Stalagmite}', '{Stone Shower}', '{Strong Haste}', '{Summon Creature}', '{Summon Grovebeast}' and '{Ultimate Light}'."})
	keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, text = 'I can teach you {Attack spells}, {Healing spells} and {Support spells}.'})