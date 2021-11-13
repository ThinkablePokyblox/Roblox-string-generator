--Variables--
--Tables
local Characters = {"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"} -- table of all characters on a keyboard
--Services
local ChatService = game:GetService("Chat") -- gets the chat service
--Main Code--
local function GenerateString(player) -- created a local function that generates the string
	local Success = false -- variables to stop repeat loop
	repeat 
		--Variables
		local String = "" -- unfiltered string variables
		local FilteredString = "" -- filtered string variabl
		--Creating none filtered string
		for i = 1, 10 do -- loops 10 times i = 1 until i = 10
			local Char -- empty variable for that character
			Char = Characters[math.random(1,26)] -- gets a random character and assigns is to the char variablees
			if math.random(1,2) == 1 then --randomly sets the char variables to uppcase
				Char = string.upper(Char) -- sets char to upper case
			else
				Char = string.lower(Char) -- sets char to lower case
			end
			String = String.." "..Char -- adds a space to the string variable (basically helps with people with higher filtering to get it past filtering also looks cool) and adds char onto the other side of the space
			Char = nil -- sets char to nil for the next loop
		end-- ends the loop
		--Filtering
		local success,errormessage = pcall(function() -- starts a pcall (protected calls)
			FilteredString = ChatService:FilterStringForBroadcast(String,player) -- attempts to filter the string with the string that needs filtering and the player it's for.
			if FilteredString ~= String then -- checks if the string is not exactly = to the none filtered string (this is because roblox add #'s to every character filtered thus making filtered string not = string so it's filtered)
				error(player.Name.."'s Code generation request: "..FilteredString.." Has been filtered.") -- errors the script so the pcall doesn't success it fails and success variable at the start is still false repeating the loop
			end
		end)
		if success then -- checks if pcall succeeded
			Success = true -- set success to true so the loop doesn't go again
			return String -- returns the successful string to the local script to be displayed
		else
			Success = false -- sets success to false so the loop happens again until it finds a none filtered string
			print(errormessage) -- prints the error message
		end -- ends the if statement
		wait() -- waits
	until Success == true -- makes the loop happen until success == true
	Success = false -- sets success back to false once finished
end -- ends the local function
game.ReplicatedStorage.RandomCodeGenerator.GenerateCode.OnServerInvoke = GenerateString -- connects the generatestring local function to happen when the generatecode remote function invokes the server (happens in local script)
