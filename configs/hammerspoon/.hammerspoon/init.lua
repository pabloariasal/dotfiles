function launchOrFocusApp(appName)
    local app = hs.application.find(appName)
    if app then
        app:activate()
    else
        hs.application.launchOrFocus(appName)
    end
end

-- Bind hotkeys
hyper = {"cmd", "alt", "ctrl", "shift"}
hs.hotkey.bind(hyper, "1", function() launchOrFocusApp("iTerm") end)
hs.hotkey.bind(hyper, "m", function() launchOrFocusApp("iTerm") end)
hs.hotkey.bind(hyper, "6", function() launchOrFocusApp("Google Keep") end)
hs.hotkey.bind(hyper, "7", function() launchOrFocusApp("Google Chrome") end)
hs.hotkey.bind(hyper, "n", function() launchOrFocusApp("Google Chrome") end)
hs.hotkey.bind(hyper, "8", function() launchOrFocusApp("Spotify") end)
hs.hotkey.bind(hyper, "9", function() launchOrFocusApp("Google Kalender") end)
hs.hotkey.bind(hyper, "g", function() launchOrFocusApp("chatGPT") end)
