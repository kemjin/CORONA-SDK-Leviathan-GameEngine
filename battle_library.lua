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

--bf = require ("battle_field")


local battlefield = {}
grid_width = display.contentWidth - 48
grid_height = display.contentHeight - 56

battlefield.open_battlefield = function()
    main_game_scn = display.newImage( "images/field4.jpg", W_screen, H_screen, true)

    -----------------------------------------------------------------------------
    -- GRID DISPLAY
    -----------------------------------------------------------------------------
	-- Horizontal lines
    str_line1 = display.newLine( grid_width, 50, 24, 50 )
    str_line1:setStrokeColor( 0.2, 0.2, 0.2, 0.8 )
	str_line1.strokeWidth = 2

    str_line2 = display.newLine( grid_width, 80 + 200, 24, 80 + 200 )
    str_line2:setStrokeColor( 0.2, 0.2, 0.2, 0.8 )
	str_line2.strokeWidth = 2

    str_line3 = display.newLine( grid_width, 80 + 400, 24, 80 + 400 )
    str_line3:setStrokeColor( 0.2, 0.2, 0.2, 0.8 )
	str_line3.strokeWidth = 2

    str_line4 = display.newLine( grid_width, 80 + 600, 24, 80 + 600 )
    str_line4:setStrokeColor( 0.2, 0.2, 0.2, 0.8 )
	str_line4.strokeWidth = 2

    str_line5 = display.newLine( grid_width, 80 + 800, 24, 80 + 800 )
    str_line5:setStrokeColor( 0.2, 0.2, 0.2, 0.8 )
	str_line5.strokeWidth = 2

    str_line6 = display.newLine( grid_width, 80 + 1000, 24, 80 + 1000 )
    str_line6:setStrokeColor( 0.2, 0.2, 0.2, 0.8 )
	str_line6.strokeWidth = 2

    str_line7 = display.newLine( grid_width, 80 + 1200, 24, 80 + 1200 )
    str_line7:setStrokeColor( 0.2, 0.2, 0.2, 0.8 )
	str_line7.strokeWidth = 2

    str_line8 = display.newLine( grid_width, 80 + 1400, 24, 80 + 1400 )
    str_line8:setStrokeColor( 0.2, 0.2, 0.2, 0.8 )
	str_line8.strokeWidth = 2


-- Vertical lines
    vtc_line1 = display.newLine( grid_height, 80, 24, 1480 )
    vtc_line1:setStrokeColor( 0.2, 0.2, 0.2, 0.8 )
	vtc_line1.strokeWidth = 2


    print "Let's print character array here!!!"
    print (angel_team[0])
    -- Global var testing
    if angel_team[0] == "choa" then
	    angel_choa = display.newImage( "images/choa_head.png",1000 , 800, true)
    end
	cave_troll    = display.newImage( "images/cave_troll_face.png", 800 , 400, true)

	-- Attach multiple parameters
	angel_choa.cave_troll_x = cave_troll.x
	angel_choa.cave_troll_y = cave_troll.y

	angel_choa:addEventListener("touch", move_range)
	--local tm = angel_choa:addEventListener("touch", move_range)
	--tm.params = { char1 = angel_choa, char2 = cave_troll }
end


function move_range( event )
	if event.phase == "ended" then

		-- Received passed-variables
		--local params = event.source.params
		--event.target.num

		-- Suppose Choa movement is 4
		current_x = angel_choa.x
		current_y = angel_choa.y

		----------------------------------------
		-------- Display moving range ----------
		----------------------------------------
		choa_move_range = 2
		choa_move_area = {}
		choa_avail_range = 0

		-- Moving range: from character to the top
		for i = 0, choa_move_range, 1 do
			choa_move_area[choa_avail_range] = display.newRect( current_x, current_y - (i*200), 200, 200 )
			choa_move_area[choa_avail_range]:setFillColor( 0.2, 0.8, 0.7, 0.4)
			choa_move_area[choa_avail_range]:addEventListener("touch", choa_move)
			choa_avail_range = choa_avail_range + 1

			for j = choa_move_range - i, 1, -1 do
				choa_move_area[choa_avail_range] = display.newRect( current_x - (j*200), current_y - (i*200), 200, 200 )
				choa_move_area[choa_avail_range]:setFillColor( 0.2, 0.8, 0.7, 0.4)
				choa_move_area[choa_avail_range]:addEventListener("touch", choa_move)
				choa_avail_range = choa_avail_range + 1

				choa_move_area[choa_avail_range] = display.newRect( current_x + (j*200), current_y - (i*200), 200, 200 )
				choa_move_area[choa_avail_range]:setFillColor( 0.2, 0.8, 0.7, 0.4)
				choa_move_area[choa_avail_range]:addEventListener("touch", choa_move)
				choa_avail_range = choa_avail_range + 1
			end
		end

		-- Moving range: from character (but not include) to the bottom
		for i = -1, -(choa_move_range), -1 do
			choa_move_area[choa_avail_range] = display.newRect( current_x, current_y - (i*200), 200, 200 )
			choa_move_area[choa_avail_range]:setFillColor( 0.2, 0.8, 0.7, 0.4)
			choa_move_area[choa_avail_range]:addEventListener("touch", choa_move)
			choa_avail_range = choa_avail_range + 1

			for j = choa_move_range + i, 1, -1 do
				choa_move_area[choa_avail_range] = display.newRect( current_x - (j*200), current_y - (i*200), 200, 200 )
				choa_move_area[choa_avail_range]:setFillColor( 0.2, 0.8, 0.7, 0.4)
				choa_move_area[choa_avail_range]:addEventListener("touch", choa_move)
				choa_avail_range = choa_avail_range + 1

				choa_move_area[choa_avail_range] = display.newRect( current_x + (j*200), current_y - (i*200), 200, 200 )
				choa_move_area[choa_avail_range]:setFillColor( 0.2, 0.8, 0.7, 0.4)
				choa_move_area[choa_avail_range]:addEventListener("touch", choa_move)
				choa_avail_range = choa_avail_range + 1
			end
		end
	end
end


function choa_move( event )
	if event.phase == "ended" then

		-- Get new position
		local t = event.target
		angel_choa.x = t.x
		angel_choa.y = t.y

		local clock = os.clock
		local function sleep(n)
			local t0 = clock()
			while clock() - t0 <= n do end
		end

		--[[
		-- Move x axis first, one by one
		if angel_choa.x > t.x then
			for i = angel_choa.x, (t.x+200), -200 do
				sleep(1)
			end
		end

		if angel_choa.x < t.x then
			for i = angel_choa.x, (t.x-200), 200 do
				angel_choa.x = angel_choa.x + 200
				angel_choa.y = angel_choa.y
				sleep(1)
			end
		end
		]]--


		-- Delete all 'moving range rectangles'
		for i = 0, (#choa_move_area), 1 do
			choa_move_area[i]:removeSelf()
			choa_move_area[i] = nil
		end

		----------------------------------------
		-------- Display Attack range ----------
		----------------------------------------
		choa_attk_range = 3
		choa_attk_area = {}
		choa_attk_range_nbr = 0

		-- Moving range: from character to the top
		for i = 0, choa_attk_range, 1 do
			choa_attk_area[choa_attk_range_nbr] = display.newRect( angel_choa.x, angel_choa.y - (i*200), 200, 200 )
			choa_attk_area[choa_attk_range_nbr]:setFillColor( 0.9, 0.3, 0.1, 0.4)
			choa_attk_area[choa_attk_range_nbr]:addEventListener("touch", open_battlescene)
			choa_attk_range_nbr = choa_attk_range_nbr + 1

			for j = choa_attk_range - i, 1, -1 do
				choa_attk_area[choa_attk_range_nbr] = display.newRect( angel_choa.x - (j*200), angel_choa.y - (i*200), 200, 200 )
				choa_attk_area[choa_attk_range_nbr]:setFillColor( 0.9, 0.3, 0.1, 0.4)
				choa_attk_area[choa_attk_range_nbr]:addEventListener("touch", open_battlescene)
				choa_attk_range_nbr = choa_attk_range_nbr + 1

				choa_attk_area[choa_attk_range_nbr] = display.newRect( angel_choa.x + (j*200), angel_choa.y - (i*200), 200, 200 )
				choa_attk_area[choa_attk_range_nbr]:setFillColor( 0.9, 0.3, 0.1, 0.4)
				choa_attk_area[choa_attk_range_nbr]:addEventListener("touch", open_battlescene)
				choa_attk_range_nbr = choa_attk_range_nbr + 1
			end
		end

		-- Moving range: from character (but not include) to the bottom
		for i = -1, -(choa_attk_range), -1 do
			choa_attk_area[choa_attk_range_nbr] = display.newRect( angel_choa.x, angel_choa.y - (i*200), 200, 200 )
			choa_attk_area[choa_attk_range_nbr]:setFillColor( 0.9, 0.3, 0.1, 0.4)
			choa_attk_area[choa_attk_range_nbr]:addEventListener("touch", open_battlescene)
			choa_attk_range_nbr = choa_attk_range_nbr + 1

			for j = choa_attk_range + i, 1, -1 do
				choa_attk_area[choa_attk_range_nbr] = display.newRect( angel_choa.x - (j*200), angel_choa.y - (i*200), 200, 200 )
				choa_attk_area[choa_attk_range_nbr]:setFillColor( 0.9, 0.3, 0.1, 0.4)
				choa_attk_area[choa_attk_range_nbr]:addEventListener("touch", open_battlescene)
				choa_attk_range_nbr = choa_attk_range_nbr + 1

				choa_attk_area[choa_attk_range_nbr] = display.newRect( angel_choa.x + (j*200), angel_choa.y - (i*200), 200, 200 )
				choa_attk_area[choa_attk_range_nbr]:setFillColor( 0.9, 0.3, 0.1, 0.4)
				choa_attk_area[choa_attk_range_nbr]:addEventListener("touch", open_battlescene)
				choa_attk_range_nbr = choa_attk_range_nbr + 1
			end
		end
	end
end


function open_battlescene( event )
    if event.phase == "ended" then

		-- Remove "Attack Range" squares
		-- Delete all 'moving range rectangles'
		for i = 0, (#choa_attk_area), 1 do
			choa_attk_area[i]:removeSelf()
			choa_attk_area[i] = nil
		end

        battle_game_scn   = display.newImage( "images/field2.jpg", W_screen, H_screen, true)
        fighter_choa    = display.newImage( "images/Choa-Ice-Spear.png", W_screen / 2, H_screen * 0.9, true)
        gargoyle        = display.newImage( "images/cave_troll2.png", W_screen * 1.5, H_screen * 0.9, true)

        -- SEND CHOA & TROLL AS PARAMETER!!!
		local tm = timer.performWithDelay( 2000, cast_spell)
		tm.params = { myParam1 = fighter_choa, myParam2 = gargoyle }
    end
end

function cast_spell( event )
	-- RECEIVE CHOA AND TROLL AS PARAMETER!!!!
	local params = event.source.params
end

return battlefield
