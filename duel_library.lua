-----------------------------------------------------------------------------------------
--
-- battle.lua
--
-- Base device: Retina iPad (2048 * 1536)
--
-- Battle Field library. 
-- This library will draw the battle field and more
--
-----------------------------------------------------------------------------------------

--duel = require("duel_library")


local duel = {}

duel.prepare_battle_stage = function()

    battle_game_scn   = display.newImage( "images/field2.jpg", W_screen, H_screen, true)
    fighter_choa    = display.newImage( "images/Choa-Ice-Spear.png", W_screen / 4, H_screen, true)
    gargoyle        = display.newImage( "images/cave_troll2.png", W_screen * 1.75, H_screen, true)

    -- SEND CHOA & TROLL AS PARAMETER!!!
	local tm = timer.performWithDelay( 2000, choa_warface)
	tm.params = { myParam1 = fighter_choa, myParam2 = gargoyle }
end

function choa_warface( event )

    choa_warface_scn   = display.newImage( "images/choa_big3.jpg", W_screen, H_screen, true)

    -- Draw Shape
	rect_01 = display.newRect( W_screen, H_screen / 5, 800, 200 )
	rect_01:setFillColor(  0.72, 0.9, 0.16, 0.78)
	-- Gradient Fill
	--[[
	local gradient = {
    type="gradient",
    color1={ 0.72, 0.9, 0.16, 0.78 }, color2={ 0.42, 0.6, 0.0, 0.78 }, direction="down"}
	rect_01:setFillColor( gradient )
	]]--
    textStr11 = display.newText( " Ice Storm! ", W_screen, H_screen / 5, native.systemFont, 90 )


    -- SEND CHOA & TROLL AS PARAMETER!!!
	local tm = timer.performWithDelay( 3000, go_to_duel)
	tm.params = { myParam1 = fighter_choa, myParam2 = gargoyle }
end

function go_to_duel( event )
	
	-- RECEIVE CHOA AND TROLL AS PARAMETER!!!!
	local params = event.source.params

	choa_warface_scn:removeSelf()
	choa_warface_scn = nil

	params.myParam1.fill.effect = "filter.bloom"

	params.myParam1.fill.effect.levels.white = 0.8
	params.myParam1.fill.effect.levels.black = 0.4
	params.myParam1.fill.effect.levels.gamma = 1
	params.myParam1.fill.effect.add.alpha = 0.8
	params.myParam1.fill.effect.blur.horizontal.blurSize = 20
	params.myParam1.fill.effect.blur.horizontal.sigma = 140
	params.myParam1.fill.effect.blur.vertical.blurSize = 20
	params.myParam1.fill.effect.blur.vertical.sigma = 240

	gameTimer = timer.performWithDelay( 1000, magic_particle )

end



function magic_particle( event )
        local pex = require("pex")
        local json = require("json")

        local function printTable( t, label, level )
		if label then print( label ) end
		level = level or 1

			if t then
				for k,v in pairs( t ) do
					local prefix = ""
					for i=1,level do
						prefix = prefix .. "\t"
					end

					print( prefix .. "[" .. tostring(k) .. "] = " .. tostring(v) )
					if type( v ) == "table" then
						print( prefix .. "{" )
						printTable( v, nil, level + 1 )
						print( prefix .. "}" )
					end
				end
			end
		end

		-- Helper function to load JSON/TMX files

		local function getFile( filename, base )
			if not base then base = system.ResourceDirectory; end
			local path = system.pathForFile( filename, base )
			local contents
			local file = io.open( path, "r" )
			if file then
				contents = file:read( "*a" )
				io.close( file )	-- close the file after using it
			else
				assert(filename .. " not found")
			end
			return contents
		end

		particle = pex.load("images/particle/jellyFish.pex", "images/particle/jellyFish.png")
		printTable(particle)
		print(particle[particleLifespan])

		emitter1 = display.newEmitter(particle)
		emitter1:scale( 4, 1.5)
		emitter1.x = display.contentCenterX / 0.7
		emitter1.y = display.contentCenterY * 1.4

		gargoyle.fill.effect = "filter.sobel"

		gameTimer = timer.performWithDelay( 3000, monster_damage )
end


function monster_damage( event )
	-- Good for getting damage
	gargoyle.fill.effect = "filter.blurVertical"
	gargoyle.fill.effect.blurSize = 30
	gargoyle.fill.effect.sigma = 100

	-- This effect will be good when Mob attacks player
	--gargoyle.fill.effect = "filter.bulge"
	--gargoyle.fill.effect.intensity = 1.8

	--gargoyle.x = W_screen * 1.2
	gameTimer = timer.performWithDelay( 1000, damage_done )
end


function damage_done( event )
	damageStr = display.newText( " -500 HP ", W_screen * 1.5, H_screen * 1, native.systemFont, 70 )

	gargoyle.fill.effect = nil
	fighter_choa.fill.effect = nil
	emitter1:removeSelf()
	emitter1 = nil
	textStr11:removeSelf()
	textStr11 = nil
	rect_01:removeSelf()
	rect_01 = nil
	--damageStr:setFillColor(  0.20, 0.9, 0.16, 0.78)
	gameTimer = timer.performWithDelay( 2000, back_to_field )
end

function back_to_field( event )

	damageStr:removeSelf()
	damageStr = nil
	gargoyle:removeSelf()
	gargoyle = nil
	fighter_choa:removeSelf()
	fighter_choa = nil
	battle_game_scn:removeSelf()
	battle_game_scn = nil

	gameTimer = timer.performWithDelay( 1000, ogre_turn_move )

end


----------------------------------------------------------------------
--
-- Ogre Turn
--
----------------------------------------------------------------------


function ogre_turn_move( event )


	gameTimer = timer.performWithDelay( 1000, ogre_turn_attack )

end


function ogre_turn_attack( event )

		rect_top_4 = display.newRect( cave_troll.x, cave_troll.y - 200, 200, 200 )
		rect_top_4:setFillColor( 0.9, 0.3, 0.1, 0.4)

		rect_bottom_4 = display.newRect( cave_troll.x, cave_troll.y + 200, 200, 200 )
		rect_bottom_4:setFillColor( 0.9, 0.3, 0.1, 0.4)

		rect_right_4 = display.newRect( cave_troll.x + 200, cave_troll.y, 200, 200 )
		rect_right_4:setFillColor( 0.9, 0.3, 0.1, 0.4)

		rect_left_4 = display.newRect( cave_troll.x - 200, cave_troll.y, 200, 200 )
		rect_left_4:setFillColor( 0.9, 0.3, 0.1, 0.4)

	gameTimer = timer.performWithDelay( 3000, ogre_battle_stage )

end



function ogre_battle_stage( event )

	-- Remove "Attack Range" squares
	rect_top_4:removeSelf()
	rect_top_4 = nil

	rect_bottom_4:removeSelf()
	rect_bottom_4 = nil

	rect_right_4:removeSelf()
	rect_right_4 = nil

	rect_left_4:removeSelf()
	rect_left_4 = nil

    battle_game_scn   = display.newImage( "images/field2.jpg", W_screen, H_screen, true)
    fighter_choa    = display.newImage( "images/Choa-Ice-Spear.png", W_screen / 2, H_screen * 0.9, true)
    gargoyle        = display.newImage( "images/cave_troll2.png", W_screen * 1.5, H_screen * 0.9, true)

    -- SEND CHOA & TROLL AS PARAMETER!!!
	local tm = timer.performWithDelay( 2000, ogre_melee)
	tm.params = { myParam1 = gargoyle, myParam2 = fighter_choa }
end


function ogre_melee( event )
	-- This effect gives pic highlight
	--fighter_choa.fill.effect = "filter.exposure"
	--fighter_choa.fill.effect.exposure = 0.8

	-- RECEIVE CHOA AND TROLL AS PARAMETER!!!!
	local params = event.source.params

	params.myParam1.fill.effect = "filter.bloom"

	params.myParam1.fill.effect.levels.white = 0.8
	params.myParam1.fill.effect.levels.black = 0.4
	params.myParam1.fill.effect.levels.gamma = 1
	params.myParam1.fill.effect.add.alpha = 0.8
	params.myParam1.fill.effect.blur.horizontal.blurSize = 20
	params.myParam1.fill.effect.blur.horizontal.sigma = 140
	params.myParam1.fill.effect.blur.vertical.blurSize = 20
	params.myParam1.fill.effect.blur.vertical.sigma = 240

	-- Draw Shape
	rect_01 = display.newRect( W_screen, H_screen / 5, 1000, 200 )
	rect_01:setFillColor(  0.72, 0.9, 0.16, 0.78)
    textStr11 = display.newText( " Gagolye: Fang Attack!! ", W_screen, H_screen / 5, native.systemFont, 90 )

	gameTimer = timer.performWithDelay( 1000, choa_damage )

end


function choa_damage( event )
	-- Good for getting damage
	fighter_choa.fill.effect = "filter.blurVertical"
	fighter_choa.fill.effect.blurSize = 30
	fighter_choa.fill.effect.sigma = 100

	-- This effect will be good when Mob attacks player
	gargoyle.fill.effect = "filter.bulge"
	gargoyle.fill.effect.intensity = 1.8

	--gargoyle.x = W_screen * 1.2
	gameTimer = timer.performWithDelay( 2000, ogre_damage_done )
end



function ogre_damage_done( event )
	damageStr2 = display.newText( " -478 HP ", W_screen * 0.5, H_screen * 1.7, native.systemFont, 70 )

	gargoyle.fill.effect = nil
	fighter_choa.fill.effect = nil
	textStr11:removeSelf()
	textStr11 = nil
	rect_01:removeSelf()
	rect_01 = nil
	--damageStr:setFillColor(  0.20, 0.9, 0.16, 0.78)
	gameTimer = timer.performWithDelay( 2000, ogre_back_to_field )
end

function ogre_back_to_field( event )

	damageStr2:removeSelf()
	damageStr2 = nil
	gargoyle:removeSelf()
	gargoyle = nil
	fighter_choa:removeSelf()
	fighter_choa = nil
	battle_game_scn:removeSelf()
	battle_game_scn = nil

	gameTimer = timer.performWithDelay( 2000, move_range )


end






return duel
