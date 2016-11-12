-----------------------------------------------------------------------------------------
--
-- story.lua
--
-- Base device: Retina iPad (2048 * 1536)
--
-- This file contains main functions of scenarios, story telling, events, and character talking
-- Story.lua will have sub-function  
--
-----------------------------------------------------------------------------------------

bf = require ("battle_field")
--battle = require ("battle_library")


local story = {}
--grid_width = display.contentWidth - 48
--grid_height = display.contentHeight - 56

story.open_chapter_screen = function()
    main_chapter_scn = display.newImage( "images/battle_field1.jpg", W_screen, H_screen, true)
    --main_chapter_scn = display.newImage( "images/aoa_main_2.jpg", W_screen, H_screen, true)
    chTextStr = display.newText( " Let's battle ", W_screen, H_screen - 80, native.systemFont, 116 )
    chTextStr:setFillColor( 0.5, 0, 0.5 )

    print "Let's print character array here!!!"
    print (angel_team[0])


	main_chapter_scn:addEventListener("touch", go_to_battle_scn)
	--local tm = angel_choa:addEventListener("touch", move_range)
	--tm.params = { char1 = angel_choa, char2 = cave_troll }
end


function go_to_battle_scn( event )
	if event.phase == "ended" then
		main_chapter_scn:removeSelf()
		main_chapter_scn = nil
		chTextStr:removeSelf()
		chTextStr = nil

		bf.open_battlefield()
	end
end


return story
