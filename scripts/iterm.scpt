tell application "iTerm2"
  activate

  -- Create the first tab
  set newTab to (create tab with default profile)
  tell current session of newTab
    set name to "Sol" -- Replace with your desired name
    write text "ssh admin -t 't4up sol'" -- Replace with your desired command
  end tell

  -- Create the second tab
  set newTab to (create tab with default profile)
  tell current session of newTab
    set name to "Phoenix" -- Replace with your desired name
    write text "warewulf" -- Replace with your desired command
  end tell

  -- Create the third tab
  set newTab to (create tab with default profile)
  tell current session of newTab
    set name to "Local" -- Replace with your desired name
    write text "Your Command 3" -- Replace with your desired command
  end tell
end tell
