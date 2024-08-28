-- Author: Alan Chapman
-- Date: 2024-03-07
--
-- This file is the entry point for the Hammerspoon configuration.
-- It loads the private modules and sets up the hotkey combinations.
-- It also sets up the auto-reload of the configuration file when it changes.

-- load hs modules
require("hs.ipc")
require("hs.notify")
-- require("hs.reload")

-- load private modules
require("private.clipboard-history")
require("private.safari")
require("private.showkeycodes")
-- require("private.paperwm")
-- require("private.config")
-- require("private.window")

-- Set up hotkey combinations
local hyper = { "ctrl", "alt", "cmd" }
local meh = { "ctrl", "alt", "shift" }
local dumb = { "ctrl", "shift", "alt", "cmd" }

-- load awesomeconfig if it exists
-- privatepath = hs.fs.pathToAbsolute(hs.configdir .. "/private")
-- if privatepath == nil then
-- 	hs.fs.mkdir(hs.configdir .. "/private")
-- end
-- privateconf = hs.fs.pathToAbsolute(hs.configdir .. "/private/awesomeconfig.lua")
-- if privateconf ~= nil then
-- 	require("private/awesomeconfig")
-- end
--
-- -- Auto reload config when a file in the config directory changes
-- function reloadConfig(files)
-- 	doReload = false
-- 	for _, file in pairs(files) do
-- 		if file:sub(-4) == ".lua" then
-- 			doReload = true
-- 		end
-- 	end
-- 	if doReload then
-- 		hs.reload()
-- 	end
-- end
--
-- myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
-- hs.alert.show("Config loaded")
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
-- end auto reload config

-- FocusHighlight.spoon
hs.loadSpoon("FocusHighlight")
--spoon.FocusHighlight:start()

spoon.FocusHighlight.color = "#e28743"
spoon.FocusHighlight.windowFilter = hs.window.filter.default
spoon.FocusHighlight.arrowSize = 256
spoon.FocusHighlight.arrowFadeOutDuration = 1
spoon.FocusHighlight.highlightFadeOutDuration = 1
spoon.FocusHighlight.highlightFillAlpha = 0.1

-- end FocusHighlight.spoon


-- Password Generator
hs.loadSpoon("PasswordGenerator")
spoon.PasswordGenerator:bindHotkeys({
	copy = { hyper, "g" },
	paste = { hyper, "p" },
})
-- end Password Generator  Chef-buckwheat-aftermost

-- MiroWindowsMamnager
hs.loadSpoon("MiroWindowsManager")
hs.window.animationDuration = 0.1
spoon.MiroWindowsManager:bindHotkeys({
	up = { hyper, "up" },
	right = { hyper, "right" },
	down = { hyper, "down" },
	left = { hyper, "left" },
	fullscreen = { hyper, "f" },
	nextscreen = { hyper, "n" },
})
-- end MiroWindowsManager

-- AppLauncher
hs.loadSpoon("AppLauncher")
spoon.AppLauncher:bindHotkeys({
	i = "iTerm",
	s = "Slack",
	w = "Warp",
	a = "Safari",
	d = "Discord",
	z = "Zoom.us",
	o = "Outlook",
	f = "Firefox",
	e = "Edge",
})
-- end AppLauncher

-- tutorial
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "w", function()
	hs.notify.new({ title = "Hammerspoon", informativeText = "Hello World" }):send()
end)
-- end tutorial
--

hs.loadSpoon("AClock")
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "c", function()
	spoon.AClock:toggleShow()
end)

-- Select Window Spoon
hs.loadSpoon("hs_select_window")
-- customize bindings to your preference
local SWbindings = {
	all_windows = { { "alt" }, "b" },
	app_windows = { { "alt", "shift" }, "b" },
}
spoon.hs_select_window:bindHotkeys(SWbindings)

-- hs.loadSpoon("FocusHighlight")
-- spoon.FocusHighlight:start()

-- showkeycoades
