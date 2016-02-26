-- Made by Luk
-- http://steamcommunity.com/id/doctorluk/
-- Version: 1.0

if SERVER then

-- Choose the language of the announcer, there is "english" and "german"
ROUNDANNOUNCER_LANGUAGE = "english"

-- IGNORE EVERYTHING BELOW THIS LINE
------------------------------------

	hook.Add( "TTTBeginRound", "roundannouncer", function()
		local detectives, traitors, innocents = 0, 0, 0
		
		for k, v in pairs( player.GetAll() ) do
			if v:Alive() then
				if v:IsDetective() then
					detectives = detectives + 1
				elseif v:IsTraitor() then
					traitors = traitors + 1
				else
					innocents = innocents + 1
				end
			end
		end
		
		for k, v in pairs( player.GetAll() ) do
			if ROUNDANNOUNCER_LANGUAGE == "german" then
				ULib.tsayColor( v, true, 
				Color( 255, 255, 255, 255 ), "Die Runde beginnt! Es gibt ",
				Color( 255, 80, 80, 255 ), traitors .. " Verräter",
				Color( 255, 255, 255, 255 ), ", ",
				Color( 80, 80, 255, 255 ), detectives .. " Detektive",
				Color( 255, 255, 255, 255 ), " und ",
				Color( 80, 255, 80, 255 ), innocents .. " Unschuldige",
				Color( 255, 255, 255, 255 ), "!")
			else
				ULib.tsayColor( v, true, 
				Color( 255, 255, 255, 255 ), "Round has started! There are ",
				Color( 255, 80, 80, 255 ), traitors .. " Traitor(s)",
				Color( 255, 255, 255, 255 ), ", ",
				Color( 80, 80, 255, 255 ), detectives .. " Detective(s)",
				Color( 255, 255, 255, 255 ), " und ",
				Color( 80, 255, 80, 255 ), innocents .. " Innocent(s)",
				Color( 255, 255, 255, 255 ), "!")
			end
		end
	end )

end

