-- Made by Luk
-- http://steamcommunity.com/id/doctorluk/
-- Version: 1.1

if SERVER then

-- Choose the language of the announcer, there is "english" and "german"
ROLEANNOUNCER_LANGUAGE = "english"

-- IGNORE EVERYTHING BELOW THIS LINE
------------------------------------

	hook.Add( "TTTBeginRound", "roleannouncer", function()
		local detectives, traitors, innocents = 0, 0, 0
		local detective_text, traitor_text, innocent_text = "", "", ""
		
		for k, v in pairs( util.GetAlivePlayers() ) do
			if v:GetRole() == ROLE_DETECTIVE then
				detectives = detectives + 1
			elseif v:GetRole() == ROLE_TRAITOR then
				traitors = traitors + 1
			elseif v:GetRole() == ROLE_INNOCENT then
				innocents = innocents + 1
			end
		end
		
		if ROLEANNOUNCER_LANGUAGE == "german" then
			if detectives > 1 or detectives == 0 then
				detective_text = " Detektive"
			else
				detective_text = " Detektiv"
			end
			
			traitor_text = " Verräter"
			
			if innocents > 1 or innocents == 0 then
				innocent_text = " Unschuldige"
			else
				innocent_text = " Unschuldigen"
			end
		else
			if detectives > 1 or detectives == 0 then
				detective_text = " Detectives"
			else
				detective_text = " Detective"
			end
			
			if traitors > 1 or traitors == 0 then
				traitor_text = " Traitors"
			else
				traitor_text = " Traitor"
			end
			
			if innocents > 1 or innocents == 0 then
				innocent_text = " Innocents"
			else
				innocent_text = " Innocent"
			end
		end
		
		
		
		for k, v in pairs( player.GetAll() ) do
			if ROLEANNOUNCER_LANGUAGE == "german" then
				ULib.tsayColor( v, true, 
				Color( 255, 255, 255, 255 ), "Die Runde beginnt! Es gibt ",
				Color( 255, 80, 80, 255 ), traitors .. traitor_text,
				Color( 255, 255, 255, 255 ), ", ",
				Color( 80, 80, 255, 255 ), detectives .. detective_text,
				Color( 255, 255, 255, 255 ), " und ",
				Color( 80, 255, 80, 255 ), innocents .. innocent_text,
				Color( 255, 255, 255, 255 ), "!")
			else
				ULib.tsayColor( v, true, 
				Color( 255, 255, 255, 255 ), "Round has started! There are ",
				Color( 255, 80, 80, 255 ), traitors .. traitor_text,
				Color( 255, 255, 255, 255 ), ", ",
				Color( 80, 80, 255, 255 ), detectives .. detective_text,
				Color( 255, 255, 255, 255 ), " and ",
				Color( 80, 255, 80, 255 ), innocents .. innocent_text,
				Color( 255, 255, 255, 255 ), "!")
			end
		end
	end )

end

