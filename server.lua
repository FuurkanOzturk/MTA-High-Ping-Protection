local pingCount = {}  
local freezeTime = 30
  function pingCheck ( ) 
	for index,player in ipairs( getElementsByType("player") ) do
		if getPlayerPing ( player ) >= 500 then 
			if pingCount[player] then 
				 pingCount[player] = pingCount[player] + 1 
			else 
				 pingCount[player] = 1 
			end 
				if pingCount[player] == 5 then  
    				outputChatBox("You're invisible and your movement is blocked for "..freezeTime.." seconds because your ping is high.", player, 255, 0, 0, true) --freeze notification
					setElementAlpha(player, 200) -- The player becomes semi-invisible
					toggleAllControls(player, false, false, false) -- Player controls are disabled
					setElementFrozen(player, true)
					setElementData(player, "highping", 1)
				setTimer(function(player)
					setElementAlpha(player, 255) -- The player becomes visible.
					setElementFrozen(player, false)
					toggleAllControls(player, true, true, true) -- Given the controls
					setElementData(player, "highping", 0)
				end, freezeTime*1000, 1, player)							
			end 
		else 
			pingCount[player] = 0 
		end 
	end
 end   
setTimer ( pingCheck, 2000, 0 )
