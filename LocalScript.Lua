
script.Parent.MouseButton1Click:Connect(function() -- GUI click function
	script.Parent.Visible = false --Fancy text
	script.Parent.Parent.Code.Text = "<Firing Server>" --Fancy text
	wait(1) --waits 1 second
	script.Parent.Parent.Code.Text = "<Waiting for server to respond>" --Fancy text
	local String = game.ReplicatedStorage.RandomCodeGenerator.GenerateCode:InvokeServer(game.Players.LocalPlayer) --Invokes server to generate the code and filter it. (local script yields until it gets a code from the server.)
	local StringTable = {} -Empty table
	StringTable = string.split(String," ") --Splits the string where ever there is a space
	script.Parent.Parent.Code.Text = "" --Fancy text
	for i = 1, #StringTable do --Loops through string table (this makes the cool appearing text effect)
		script.Parent.Parent.Code.Text = script.Parent.Parent.Code.Text..StringTable[i] --adds i in the string table to the text
		wait(0.5) -- waits 0.5 seconds
		script.Parent.Parent.Code.Text = script.Parent.Parent.Code.Text.."-" --Fancy text
		wait(0.5) -- waits 0.5 seconds
	end -- ends the loop
	wait(3) waits 3 seconds
	script.Parent.Visible = true --Fancy text
end) --ends the click function
