local milkHits = 0
local milkSong = true

function setOnLuas(varName, valueInput)
    if not setOnLuas_init then --makes the var holder
        setOnLuas_init = true
        runHaxeCode('setVar("setOnLuas_varHolder", null);')
    end
    setProperty('setOnLuas_varHolder', {varName, valueInput}) --sets the temp shit
    --actually set the whatever
    runHaxeCode("game.setOnLuas(getVar('setOnLuas_varHolder')[0], getVar('setOnLuas_varHolder')[1]);")
    setProperty('setOnLuas_varHolder', nil) --go away DIE DIE DIE!!!!!!!!
    --if its onCreate then it doesnt work because the lua file wouldn't be in the luaArray yet
    if _G[varName] == nil then _G[varName] = valueInput end
end

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Milk Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Milk Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'milk'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.0475'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
			
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
end

function onCreate()
    setOnLuas('MilkMechanic', milkSong)
end
function onUpdate()
    setOnLuas('MilkNoteHits', milkHits)
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Milk Note' then
		-- put something here if you want
		milkHits = milkHits + 1
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Milk Note' then
		-- put something here if you want
	end
end