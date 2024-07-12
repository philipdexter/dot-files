-- tiling

hs.hotkey.bind({"cmd", "ctrl"}, "h", function()
    window = hs.window.focusedWindow()
    window:focusWindowWest()
end)


hs.hotkey.bind({"cmd", "ctrl"}, "l", function()
    window = hs.window.focusedWindow()
    window:focusWindowEast()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "k", function()
    window = hs.window.focusedWindow()
    window:focusWindowNorth()
end)


hs.hotkey.bind({"cmd", "ctrl"}, "j", function()
    window = hs.window.focusedWindow()
    window:focusWindowSouth()
end)


-- app switching

hs.hotkey.bind({"cmd", "shift"}, "v", function()
  hs.application.launchOrFocus("Things3")
end)

hs.hotkey.bind({"cmd", "shift"}, "f", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind({"cmd", "shift"}, "g", function()
  hs.application.launchOrFocus("Notes")
end)

hs.hotkey.bind({"cmd", "shift"}, "r", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind({"cmd", "shift"}, "c", function()
  hs.application.launchOrFocus("iTerm")
end)


hs.hotkey.bind({"cmd", "shift"}, "i", function()
  _, folder = hs.dialog.textPrompt("Note opener 9000", "Who?")
  hs.applescript.applescript([[
    tell application "Notes"
      tell account "iCloud"
          tell folder "Wolt"
            tell folder "1:1"
              show folder "]] .. folder .. [["
            end tell
          end tell
      end tell
    end tell
  ]])
  hs.application.launchOrFocus("Notes")
  hs.applescript.applescript([[
    tell application "System Events" to tell process "Notes"
      click menu item "Open Note in New Window" of menu 1 of menu bar item "Window" of menu bar 1
    end tell
  ]])
end)

hs.hotkey.bind({"cmd", "shift"}, "o", function()
  _, folder = hs.dialog.textPrompt("Note opener 9000", "Who?")
  hs.applescript.applescript([[
    tell application "Notes"
      tell account "iCloud"
          tell folder "Wolt"
            tell folder "1:1"
              show folder "]] .. folder .. [["
              open note 1
            end tell
          end tell
      end tell
    end tell
  ]])
  hs.application.launchOrFocus("Notes")
end)


hs.hotkey.bind({"cmd", "shift"}, "return", function()
  if hs.application.find("iTerm") then
    hs.applescript.applescript([[
      tell application "iTerm"
        create window with default profile
      end tell
    ]])
    hs.application.launchOrFocus("iTerm")
  else
    hs.application.open("iTerm")
  end
end)

hs.hotkey.bind({"cmd"}, "\\", function()
  date, _, _ = hs.execute("date +'%Y-%m-%d'")
  hs.eventtap.keyStroke({"cmd", "shift"}, "h")
  hs.eventtap.keyStrokes(date)
end)
