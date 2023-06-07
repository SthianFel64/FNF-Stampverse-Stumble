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

local numbaOfBottlesVisible = 0

function onCreatePost()
    if MilkMechanic == true then
        --ui shit
        --empty bottles
        makeLuaSprite('dadLeft', 'milk_empty', 0, 580)
        makeLuaSprite('dadLeft2', 'milk_empty', 80, 580)
        makeLuaSprite('dadLeft3', 'milk_empty', 160, 580)
        setObjectCamera('dadLeft', 'hud')
        scaleObject('dadLeft', 0.4, 0.4)
        addLuaSprite('dadLeft', true)
        setObjectCamera('dadLeft2', 'hud')
        scaleObject('dadLeft2', 0.4, 0.4)
        addLuaSprite('dadLeft2', true)
        setObjectCamera('dadLeft3', 'hud')
        scaleObject('dadLeft3', 0.4, 0.4)
        addLuaSprite('dadLeft3', true)

        --non empty bottles
        makeLuaSprite('dadIsBackYay', 'milk_wp', 0, 580)
        setObjectCamera('dadIsBackYay', 'hud')
        scaleObject('dadIsBackYay', 0.4, 0.4)
        addLuaSprite('dadIsBackYay', true)
        makeLuaSprite('dadIsBackYay2', 'milk_wp', 80, 580)
        setObjectCamera('dadIsBackYay2', 'hud')
        scaleObject('dadIsBackYay2', 0.4, 0.4)
        addLuaSprite('dadIsBackYay2', true)
        makeLuaSprite('dadIsBackYay3', 'milk_wp', 160, 580)
        setObjectCamera('dadIsBackYay3', 'hud')
        scaleObject('dadIsBackYay3', 0.4, 0.4)
        addLuaSprite('dadIsBackYay3', true)

        setProperty('dadIsBackYay.visible', false)
        setProperty('dadIsBackYay2.visible', false)
        setProperty('dadIsBackYay3.visible', false)
    end
end

function onUpdate()
    if MilkNoteHits == 1 then
        setProperty('dadIsBackYay.visible', true)
    end
    if MilkNoteHits == 2 then
        setProperty('dadIsBackYay2.visible', true)
    end
    if MilkNoteHits == 3 then
        setProperty('dadIsBackYay3.visible', true)
    end
end