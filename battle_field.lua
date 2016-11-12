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

battle = require ("battle_library")
duel = require("duel_library")

local battlefield = {}
grid_width = display.contentWidth - 48
grid_height = display.contentHeight - 36

-- DEBUG
print "grid_width"
print (grid_width)

battlefield.open_battlefield = function()
    main_game_scn = display.newImage( "images/field4.jpg", W_screen, H_screen, true)

    -----------------------------------------------------------------------------
    -- GRID DISPLAY
    -----------------------------------------------------------------------------
	-- Horizontal lines
	-- start.x start.y end.x end.y
	-- 0 + 50 + 18 means start point is 0. Then 50 pixel for making grid center (top 50 px, bottom 50 px added), 
	-- and 18 is making grid center as well (height is 1536. Grid using 1400. top 50 + bottom 50. then remain 36 px / 2 = 18 px)
	--
	-- X-axis: 0 is 24
	-- Y-axis: 0 is 0 + 50 + 18. And then, add 200. ex) 68, 268, 468, 668, 868, .... 1468
	------------------------------------------------------------------------------
	-- Grid position 
	------------------------------------------------------------------------------------------------------------------------
	-- 124,168  | 324,168  | 524,168  | 724,168  | 924,168  | 1124,168  | 1324,168  | 1524,168  | 1724,168  | 1924,168
	-- 124,368  | 324,368  | 524,368  | 724,368  | 924,368  | 1124,368  | 1324,368  | 1524,368  | 1724,368  | 1924,368
	-- 124,568  | 324,568  | 524,568  | 724,568  | 924,568  | 1124,568  | 1324,568  | 1524,568  | 1724,568  | 1924,568
	-- 124,768  | 324,768  | 524,768  | 724,768  | 924,768  | 1124,768  | 1324,768  | 1524,768  | 1724,768  | 1924,768
	-- 124,968  | 324,968  | 524,968  | 724,868  | 924,968  | 1124,968  | 1324,968  | 1524,968  | 1724,968  | 1924,968
	-- 124,1168 | 324,1168 | 524,1168 | 724,1168 | 924,1168 | 1124,1168 | 1324,1168 | 1524,1168 | 1724,1168 | 1924,1168
	-- 124,1368 | 324,1368 | 524,1368 | 724,1368 | 924,1368 | 1124,1368 | 1324,1368 | 1524,1368 | 1724,1368 | 1924,1368
	------------------------------------------------------------------------------------------------------------------------

    str_line1 = display.newLine( 24, 0+50+18, 2024, 0+50+18 )
    str_line1:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	str_line1.strokeWidth = 3

    str_line2 = display.newLine( 24, 200+50+18, 2024, 200+50+18 )
    str_line2:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	str_line2.strokeWidth = 3

    str_line3 = display.newLine( 24, 400+50+18, 2024, 400+50+18 )
    str_line3:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	str_line3.strokeWidth = 3

    str_line4 = display.newLine( 24, 600+50+18, 2024, 600+50+18 )
    str_line4:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	str_line4.strokeWidth = 3

    str_line5 = display.newLine( 24, 800+50+18, 2024, 800+50+18 )
    str_line5:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	str_line5.strokeWidth = 3

    str_line6 = display.newLine( 24, 1000+50+18, 2024, 1000+50+18 )
    str_line6:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	str_line6.strokeWidth = 3

    str_line7 = display.newLine( 24, 1200+50+18, 2024, 1200+50+18 )
    str_line7:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	str_line7.strokeWidth = 3

    str_line8 = display.newLine( 24, 1400+50+18, 2024, 1400+50+18 )
    str_line8:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	str_line8.strokeWidth = 3


-- Vertical lines
    --vtc_line1 = display.newLine( x.start, y.start, x.end, y.end )
    vtc_line1 = display.newLine( 24, 0+50+18, 24, 1400+50+18 )
    vtc_line1:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	vtc_line1.strokeWidth = 3

    vtc_line2 = display.newLine( 224, 0+50+18, 224, 1400+50+18 )
    vtc_line2:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	vtc_line2.strokeWidth = 3

    vtc_line3 = display.newLine( 424, 0+50+18, 424, 1400+50+18 )
    vtc_line3:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	vtc_line3.strokeWidth = 3

    vtc_line4 = display.newLine( 624, 0+50+18, 624, 1400+50+18 )
    vtc_line4:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	vtc_line4.strokeWidth = 3

    vtc_line5 = display.newLine( 824, 0+50+18, 824, 1400+50+18 )
    vtc_line5:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	vtc_line5.strokeWidth = 3

    vtc_line6 = display.newLine( 1024, 0+50+18, 1024, 1400+50+18 )
    vtc_line6:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	vtc_line6.strokeWidth = 3

    vtc_line7 = display.newLine( 1224, 0+50+18, 1224, 1400+50+18 )
    vtc_line7:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	vtc_line7.strokeWidth = 3

    vtc_line8 = display.newLine( 1424, 0+50+18, 1424, 1400+50+18 )
    vtc_line8:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	vtc_line8.strokeWidth = 3

    vtc_line9 = display.newLine( 1624, 0+50+18, 1624, 1400+50+18 )
    vtc_line9:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	vtc_line9.strokeWidth = 3

    vtc_line10 = display.newLine( 1824, 0+50+18, 1824, 1400+50+18 )
    vtc_line10:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	vtc_line10.strokeWidth = 3

    vtc_line11 = display.newLine( 2024, 0+50+18, 2024, 1400+50+18 )
    vtc_line11:setStrokeColor( 1.0, 1.0, 1.0, 1.0 )
	vtc_line11.strokeWidth = 3


    print "Let's print character array here!!!"
    print (angel_team[0])
    -- Global var testing
    if angel_team[0] == "choa" then
	    angel_choa = display.newImage( "images/choa_head.png",300+24 , 300+50+18, true)
    end
	cave_troll    = display.newImage( "images/cave_troll_face.png", 700+24 , 300+50+18, true)

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

		-- REMOVE ANGEL_CHOA & RE-DISPLAY
		-- Why? if we don't replace angel_choa, it will display 'move_range' and 'attack_range' at the same time if
		-- we hit the angel_choa's original location when it is displaying move_range.

		-- remove original angel_choa
		angel_choa:removeSelf()
		angel_choa = nil

		-- insert new angel_choa
		angel_choa = display.newImage( "images/choa_head.png", current_x, current_y, true)


		----------------------------------------
		-------- Display moving range ----------
		----------------------------------------
		choa_move_range = 2
		choa_move_area = {}
		choa_avail_range = 0


		-- Moving range: from character to the top
		for i = 0, choa_move_range, 1 do
			if current_y - (i*200) > 167 and current_y - (i*200) < 1369 then -- if a move_range rectangle is out of grid (above) 
				if current_x == 724 and current_y - (i*200) == 368 then -- avoid Ogre's position
				else
					choa_move_area[choa_avail_range] = display.newRect( current_x, current_y - (i*200), 200, 200 )
					choa_move_area[choa_avail_range]:setFillColor( 0.2, 0.8, 0.7, 0.4)
					choa_move_area[choa_avail_range]:addEventListener("touch", choa_move)
					choa_avail_range = choa_avail_range + 1
				end

				for j = choa_move_range - i, 1, -1 do
					if current_x - (j*200) > 123 and current_x - (j*200) < 1925 then -- Draw rectangles only if it is in grid (not left side of grid)
						if current_x - (j*200) == 724 and current_y == 368 then
						else
							choa_move_area[choa_avail_range] = display.newRect( current_x - (j*200), current_y - (i*200), 200, 200 )
							choa_move_area[choa_avail_range]:setFillColor( 0.2, 0.8, 0.7, 0.4)
							choa_move_area[choa_avail_range]:addEventListener("touch", choa_move)
							choa_avail_range = choa_avail_range + 1
						end
					end

					if current_x + (j*200) > 123 and current_x + (j*200) < 1925 then -- Draw rectangles only if it is in the grid 
						-- I put this because if a character is located at left bottom, left rectangle should not display but
						-- right rectangles should display
						if current_x + (j*200) == 724 and current_y == 368 then
						else
							choa_move_area[choa_avail_range] = display.newRect( current_x + (j*200), current_y - (i*200), 200, 200 )
							choa_move_area[choa_avail_range]:setFillColor( 0.2, 0.8, 0.7, 0.4)
							choa_move_area[choa_avail_range]:addEventListener("touch", choa_move)
							choa_avail_range = choa_avail_range + 1
						end
					end
				end
			end
		end

		-- Moving range: from character (but not include) to the bottom
		for i = -1, -(choa_move_range), -1 do
			if current_y - (i*200) > 167 and current_y - (i*200) < 1369 then
				if current_x == 724 and current_y - (i*200) == 368 then
				else
					choa_move_area[choa_avail_range] = display.newRect( current_x, current_y - (i*200), 200, 200 )
					choa_move_area[choa_avail_range]:setFillColor( 0.2, 0.8, 0.7, 0.4)
					choa_move_area[choa_avail_range]:addEventListener("touch", choa_move)
					choa_avail_range = choa_avail_range + 1
				end

				for j = choa_move_range + i, 1, -1 do
					if current_x - (j*200) > 123 and current_x - (j*200) < 1925 then
						if current_x - (j*200) == 724 and current_y == 368 then
						else
							choa_move_area[choa_avail_range] = display.newRect( current_x - (j*200), current_y - (i*200), 200, 200 )
							choa_move_area[choa_avail_range]:setFillColor( 0.2, 0.8, 0.7, 0.4)
							choa_move_area[choa_avail_range]:addEventListener("touch", choa_move)
							choa_avail_range = choa_avail_range + 1
						end
					end

					if current_x + (j*200) > 123 and current_x + (j*200) < 1925 then
						if current_x + (j*200) == 724 and current_y == 368 then
						else
							choa_move_area[choa_avail_range] = display.newRect( current_x + (j*200), current_y - (i*200), 200, 200 )
							choa_move_area[choa_avail_range]:setFillColor( 0.2, 0.8, 0.7, 0.4)
							choa_move_area[choa_avail_range]:addEventListener("touch", choa_move)
							choa_avail_range = choa_avail_range + 1
						end
					end
				end
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

		-- Get Choa's new position
		current_x = angel_choa.x
		current_y = angel_choa.y

		choa_attk_range = 4
		choa_attk_area = {}
		choa_attk_range_nbr = 0

		-- Attack range: from character to the top
		for i = 0, choa_attk_range, 1 do
			if (current_y - (i*200)) > 167 and current_y - (i*200) < 1369 then
				choa_attk_area[choa_attk_range_nbr] = display.newRect( angel_choa.x, angel_choa.y - (i*200), 200, 200 )
				choa_attk_area[choa_attk_range_nbr]:setFillColor( 0.9, 0.3, 0.1, 0.4)
				choa_attk_area[choa_attk_range_nbr]:addEventListener("touch", open_battlescene)
				choa_attk_range_nbr = choa_attk_range_nbr + 1

				for j = choa_attk_range - i, 1, -1 do
					if current_x - (j*200) > 123 and current_x - (j*200) < 1925 then
						choa_attk_area[choa_attk_range_nbr] = display.newRect( angel_choa.x - (j*200), angel_choa.y - (i*200), 200, 200 )
						choa_attk_area[choa_attk_range_nbr]:setFillColor( 0.9, 0.3, 0.1, 0.4)
						choa_attk_area[choa_attk_range_nbr]:addEventListener("touch", open_battlescene)
						choa_attk_range_nbr = choa_attk_range_nbr + 1
					end

					if current_x + (j*200) > 123 and current_x + (j*200) < 1925 then
						choa_attk_area[choa_attk_range_nbr] = display.newRect( angel_choa.x + (j*200), angel_choa.y - (i*200), 200, 200 )
						choa_attk_area[choa_attk_range_nbr]:setFillColor( 0.9, 0.3, 0.1, 0.4)
						choa_attk_area[choa_attk_range_nbr]:addEventListener("touch", open_battlescene)
						choa_attk_range_nbr = choa_attk_range_nbr + 1
					end
				end
			end
		end

		-- Moving range: from character (but not include) to the bottom
		for i = -1, -(choa_attk_range), -1 do
			if current_y - (i*200) > 167 and current_y - (i*200) < 1369 then
				choa_attk_area[choa_attk_range_nbr] = display.newRect( angel_choa.x, angel_choa.y - (i*200), 200, 200 )
				choa_attk_area[choa_attk_range_nbr]:setFillColor( 0.9, 0.3, 0.1, 0.4)
				choa_attk_area[choa_attk_range_nbr]:addEventListener("touch", open_battlescene)
				choa_attk_range_nbr = choa_attk_range_nbr + 1

				for j = choa_attk_range + i, 1, -1 do
					if current_x - (j*200) > 123 and current_x - (j*200) < 1925 then
						choa_attk_area[choa_attk_range_nbr] = display.newRect( angel_choa.x - (j*200), angel_choa.y - (i*200), 200, 200 )
						choa_attk_area[choa_attk_range_nbr]:setFillColor( 0.9, 0.3, 0.1, 0.4)
						choa_attk_area[choa_attk_range_nbr]:addEventListener("touch", open_battlescene)
						choa_attk_range_nbr = choa_attk_range_nbr + 1
					end

					if current_x + (j*200) > 123 and current_x + (j*200) < 1925 then
						choa_attk_area[choa_attk_range_nbr] = display.newRect( angel_choa.x + (j*200), angel_choa.y - (i*200), 200, 200 )
						choa_attk_area[choa_attk_range_nbr]:setFillColor( 0.9, 0.3, 0.1, 0.4)
						choa_attk_area[choa_attk_range_nbr]:addEventListener("touch", open_battlescene)
						choa_attk_range_nbr = choa_attk_range_nbr + 1
					end
				end
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

        -- SEND CHOA & TROLL AS PARAMETER!!!
		local tm = timer.performWithDelay( 2000, cast_spell)
		tm.params = { myParam1 = fighter_choa, myParam2 = gargoyle }

		duel.prepare_battle_stage()
    end
end

--[[
function cast_spell( event )
	-- RECEIVE CHOA AND TROLL AS PARAMETER!!!!
	local params = event.source.params
end
]]--

return battlefield
