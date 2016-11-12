-----------------------------------------------------------------------------------------
--
-- main.lua
--
--
-- Base device: Retina iPad (2048 * 1536)
--
--
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar );

-----------------------------------------------------------------------------------------
-- 
-- This main.lua is about the title screen
--
-- This will call next function. Here is flow chart
--
-- Main -> Story (character, talking, events) -> battle_filed (battle happenes)
--
-----------------------------------------------------------------------------------------
-- Global Variables
-----------------------------------------------------------------------------------------

--bf = require ("battle_field")
stry = require("story")

-- Global Variable --
-- This is working
battlefield_grid = {}
angel_team = {}
angel_team[0] = 'choa'
angel_team[1] = 'jimin'
angel_team[2] = 'HyeJeong'
angel_team[3] = 'SeolHyun'
angel_team[4] = 'Mina'

enemy_team = {}
enemy_team[0] = 'Ogre1'
enemy_team[1] = 'Ogre1'
enemy_team[2] = 'Ogre1'
enemy_team[3] = 'Ogre1'
enemy_team[4] = 'Ogre1'


-----------------------------------------------------------------------------------------
--
-- Main menu and instruction
--
-----------------------------------------------------------------------------------------

-- W_screen and H_screen are middle value
W_screen = display.contentWidth / 2
H_screen = display.contentHeight / 2

-- width_length, height_length are the screen size
width_length = display.contentWidth
height_length = display.contentHeight

-- DEBUG
print "This screen's width value"
print (width_length)
print "This screen's height value"
print (height_length)

grid_width = display.contentWidth - 48
grid_height = display.contentHeight - 56

local main_menu = display.newImage( "images/aoa_main_1.jpg", W_screen, H_screen, true)
local textStr1 = display.newText( " The Legend of the Sword ", W_screen, H_screen - 80, native.systemFont, 116 )
textStr1:setFillColor( 1, 1, 1 )
local textStr2 = display.newText( " - Tech Demo Ver -", W_screen, H_screen + 80, native.systemFont, 76 )
textStr2:setFillColor( 0, 0, 0 )

-- Instruction page: Explain how to play


function instruction( event )
    if event.phase == "ended" then
        main_menu:removeSelf()
        main_menu = nil
        textStr1:removeSelf()
        textStr1 = nil
        textStr2:removeSelf()
        textStr2 = nil

        stry.open_chapter_screen()

        --instruction_screen = display.newImage( "images/aoa_main_3.jpg", W_screen, H_screen, true)
		--textStr11 = display.newText( " Fallen Angels ", W_screen, H_screen - 60, native.systemFont, 90 )
		--textStr22 = display.newText( " ~ First episode ~ ", W_screen, H_screen + 40, native.systemFont, 55 )
        --instruction_screen:addEventListener("touch", battle_stage)
    end
end

main_menu:addEventListener("touch", instruction)


