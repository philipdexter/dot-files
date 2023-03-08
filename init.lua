-- hs.hotkey.bind({"alt", "shift"}, "r", function()
--   hs.application.launchOrFocus("Slack")
-- end)

-- hs.hotkey.bind({"alt", "shift"}, "f", function()
--   hs.application.launchOrFocus("iTerm")
-- end)

-- hs.hotkey.bind({"alt", "shift"}, "d", function()
--   hs.application.launchOrFocus("Google Chrome")
-- end)
--

-- hs.hotkey.bind({"cmd", "shift"}, "8", function()
--   hs.execute("~/switch_external.sh")
-- end)

-- hs.hotkey.bind({"cmd", "shift"}, "7", function()
--   hs.execute("~/switch_internal.sh")
-- end)

hs.midi.deviceCallback(function(devices, virtualDevices)
     print(hs.inspect(devices))
     print(hs.inspect(virtualDevices))
     open = false
     if next(virtualDevices) ~= nil then
         return
     end
     for _, l in ipairs(devices) do
         if l == "SL STUDIO" then
             open = true
         end
     end
     if open then
         hs.execute("open ~/Music/Logic/instruments.logicx", true)
     else
         app = hs.application.get("Logic Pro")
         if app ~= nil then
             app:kill()
         end
     end
end)

-- hs.hotkey.bind({"cmd", "shift"}, "c", function()
--     local device = hs.audiodevice.findOutputByName("External Headphones")
--     if device then
--         device:setDefaultOutputDevice()
--     end
-- end)

-- hs.hotkey.bind({"cmd", "shift"}, "x", function()
--     local device = hs.audiodevice.findOutputByName("Scarlett Solo USB")
--     if device then
--         device:setDefaultOutputDevice()
--     end
-- end)


hs.hotkey.bind({"cmd", "shift"}, "v", function()
  hs.application.launchOrFocus("Things")
end)

hs.hotkey.bind({"cmd", "shift"}, "i", function()
  hs.spotify.playpause()
end)

hs.hotkey.bind({"cmd", "shift"}, "u", function()
  hs.spotify.previous()
end)

hs.hotkey.bind({"cmd", "shift"}, "o", function()
  hs.spotify.next()
end)

hs.hotkey.bind({"cmd", "shift"}, "p", function()
  hs.application.launchOrFocus("Spotify")
end)

hs.hotkey.bind({"cmd", "shift"}, "f", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind({"cmd", "shift"}, "d", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind({"cmd", "shift"}, "r", function()
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
  hs.spotify.playpause()
end)

hs.hotkey.bind({"cmd"}, "\\", function()
  hs.execute("sh ~/scripts/mc.sh", true)
end)
