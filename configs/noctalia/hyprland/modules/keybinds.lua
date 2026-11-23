local conf = require("modules.defaults")

-- ### Noctalia
hl.bind(conf.mainMod .. " + Space", hl.dsp.exec_cmd(conf.ipc .. "panel-toggle launcher"))
hl.bind(conf.mainMod .. " + S", hl.dsp.exec_cmd(conf.ipc .. "panel-toggle control-center"))
hl.bind(conf.mainMod .. " + comma", hl.dsp.exec_cmd(conf.ipc .. "settings-toggle"))
hl.bind(conf.mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(conf.ipc .. "panel-toggle session"))

-- Window Switcher
hl.bind("ALT + Tab", hl.dsp.exec_cmd(conf.ipc .. "window-switcher hold"))

-- Screenshot
hl.bind(conf.mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(conf.ipc .. "screenshot-region"))

-- Lock / Logout
hl.bind(conf.mainMod .. " + M", hl.dsp.exec_cmd(conf.ipc .. "session lock"))

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(conf.ipc .. "volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(conf.ipc .. "volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(conf.ipc .. "volume-mute"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(conf.ipc .. "brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(conf.ipc .. "brightness-down"), { locked = true, repeating = true })


-- ### Hyprland
-- Open Default Programs
hl.bind(conf.mainMod .. " + T", hl.dsp.exec_cmd(conf.terminal))
hl.bind(conf.mainMod .. " + E", hl.dsp.exec_cmd(conf.fileManager))
hl.bind(conf.mainMod .. " + D", hl.dsp.exec_cmd(conf.discord))
hl.bind(conf.mainMod .. " + I", hl.dsp.exec_cmd(conf.editor))
hl.bind(conf.mainMod .. " + B", hl.dsp.exec_cmd(conf.browser))

-- Close Window
hl.bind(conf.mainMod .. " + Q", hl.dsp.window.close())

-- Window Properties
hl.bind(conf.mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(conf.mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(conf.mainMod .. " + G", hl.dsp.layout("togglesplit"))
hl.bind(conf.mainMod .. " + SHIFT + V", hl.dsp.window.pin())
hl.bind(conf.mainMod .. " + C", hl.dsp.window.center())

-- Move Window Focus
hl.bind(conf.mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(conf.mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(conf.mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(conf.mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Moves Active Window
hl.bind(conf.mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(conf.mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(conf.mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(conf.mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Swap Active Window
hl.bind(conf.mainMod .. " + CTRL + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(conf.mainMod .. " + CTRL + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind(conf.mainMod .. " + CTRL + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(conf.mainMod .. " + CTRL + J", hl.dsp.window.swap({ direction = "down" }))

-- Resize Active Window
hl.bind(conf.mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind(conf.mainMod .. " + ALT + L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
hl.bind(conf.mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind(conf.mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
hl.bind(conf.mainMod .. " + ALT + RETURN", hl.dsp.layout("splitratio 1.0 exact"))

-- Fullscreen
hl.bind(conf.mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(conf.mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- Workspaces 1-10
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    -- Switch workspaces with conf.mainMod + [0-9]
    hl.bind(conf.mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    -- Move Active Window
    hl.bind(conf.mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
    -- Move Active Window and follow it
    hl.bind(conf.mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Go Back to Previous Workspace
hl.bind(conf.mainMod .. " + Tab", hl.dsp.focus({ workspace = "previous" }))

-- Swap Workspaces
hl.bind(conf.mainMod .. " + CONTROL + ALT + H", hl.dsp.workspace.swap_monitors({ monitor1 = "current", monitor2 = "l" }))
hl.bind(conf.mainMod .. " + CONTROL + ALT + L", hl.dsp.workspace.swap_monitors({ monitor1 = "current", monitor2 = "r" }))

-- Move/resize windows with conf.mainMod + LMB/RMB and dragging
hl.bind(conf.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(conf.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
