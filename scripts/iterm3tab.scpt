tell application "iTerm"
	create window with ssh profile
	-- Create the first tab
	try
		set newWindow to (create window with ssh profile)
	on error
		set newWindow to current window
	end try
	tell newWindow
		tell current session
			write text "admin"
			delay 5 -- Adjust delay as needed to allow SSH connection to establish
			write text "t2up sol"
			set name to "Sol"
		end tell
		-- Create the second tab and run the second command
		set secondTab to (create tab with ssh profile)
		tell secondTab
			tell current session
				write text "warewulf"
				delay 5 -- Adjust delay as needed to allow SSH connection to establish
				write text "pc 001"
				write text "t2up phx"
				set name to "Phx"
			end tell
		end tell
		-- Create the third tab and run the third command
		set thirdTab to (create tab with ssh profile)
		tell thirdTab
			tell current session
				write text "t2up"
				set name to "local"
			end tell
		end tell
	end tell
end tell
