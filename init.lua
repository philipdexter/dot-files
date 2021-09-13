hs.hotkey.bind({"cmd", "shift"}, "v", function()
  hs.application.launchOrFocus("MuseScore 3")
end)

hs.hotkey.bind({"cmd", "shift"}, "r", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind({"cmd", "shift"}, "i", function()
  hs.execute("cmus-remote -u", true)
end)

hs.hotkey.bind({"cmd", "shift"}, "u", function()
  hs.execute("cmus-remote --prev", true)
end)

hs.hotkey.bind({"cmd", "shift"}, "o", function()
  hs.execute("cmus-remote --next", true)
end)

hs.hotkey.bind({"cmd", "shift"}, "p", function()
  hs.osascript.applescript('tell application "iTerm2" \n set newiterm to (create window with default profile) \n activate \n tell current session of newiterm \n write text "tma music" \n  end tell \n end tell')
end)

hs.hotkey.bind({"cmd", "shift"}, "f", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind({"cmd", "shift"}, "d", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind({"cmd", "shift"}, "l", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "shift"}, "h", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "shift"}, "n", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "l", function()
  hs.caffeinate.systemSleep()
end)

hs.hotkey.bind({"cmd"}, "\\", function()
  hs.execute("sh ~/scripts/mc.sh", true)
end)
