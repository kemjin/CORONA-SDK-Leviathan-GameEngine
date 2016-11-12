application =
{

	content =
	{
		width = 1536,
		height = 2048, 
		--scale = "letterBox",
		scale = "letterBox",
		fps = 30,
		
        imageSuffix = {
		    ["@2x"] = 2,
        ["@4x"] = 3.0,
		}
	},

	--[[
	-- Push notifications
	notification =
	{
		iphone =
		{
			types =
			{
				"badge", "sound", "alert", "newsstand"
			}
		}
	},
	--]]    
}
