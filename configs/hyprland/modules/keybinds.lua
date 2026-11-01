local conf = require("modules.defaults")

hl.config({
    input = {
        kb_layout  = "se",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

--- Noctalia conf.ipc
hl.bind(conf.mainMod .. "+Space", hl.dsp.exec_cmd(conf.ipc .. "panel-toggle launcher"))
hl.bind(conf.mainMod .. "+S", hl.dsp.exec_cmd(conf.ipc .. "panel-toggle control-center"))
hl.bind(conf.mainMod .. "+comma", hl.dsp.exec_cmd(conf.ipc .. "settings-toggle"))
hl.bind("ALT + Tab", hl.dsp.exec_cmd(conf.ipc .. "window-switcher hold"))

hl.bind(conf.mainMod .. " + SHIFT + s", hl.dsp.exec_cmd(conf.ipc .. "screenshot-region"))

--- Open Default Programs
hl.bind(conf.mainMod .. " + T", hl.dsp.exec_cmd(conf.terminal))
hl.bind(conf.mainMod .. " + E", hl.dsp.exec_cmd(conf.fileManager))
hl.bind(conf.mainMod .. " + D", hl.dsp.exec_cmd(conf.discord))
hl.bind(conf.mainMod .. " + I", hl.dsp.exec_cmd(conf.editor))
hl.bind(conf.mainMod .. " + B", hl.dsp.exec_cmd(conf.browser))

hl.bind(conf.mainMod .. " + Q", hl.dsp.window.close())
hl.bind(conf.mainMod .. " + M", hl.dsp.exec_cmd("uwsm stop"))
hl.bind(conf.mainMod .. " + L", hl.dsp.exec_cmd(conf.ipc .. "session lock"))

--- Window Properties
hl.bind(conf.mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(conf.mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(conf.mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- hl.bind(conf.mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(conf.mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move the active window with conf.mainMod + SHIFT + arrow keys
hl.bind(conf.mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(conf.mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(conf.mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(conf.mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

hl.bind(conf.mainMod .. " + CTRL + left",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(conf.mainMod .. " + CTRL + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(conf.mainMod .. " + CTRL + up",    hl.dsp.window.swap({ direction = "up" }))
hl.bind(conf.mainMod .. " + CTRL + down",  hl.dsp.window.swap({ direction = "down" }))

hl.bind(conf.mainMod .. " + ALT + right", hl.dsp.window.resize({ x = 50,  y = 0,   relative = true }))
hl.bind(conf.mainMod .. " + ALT + left",  hl.dsp.window.resize({ x = -50, y = 0,   relative = true }))
hl.bind(conf.mainMod .. " + ALT + down",  hl.dsp.window.resize({ x = 0,   y = 50,  relative = true }))
hl.bind(conf.mainMod .. " + ALT + up",    hl.dsp.window.resize({ x = 0,   y = -50, relative = true }))

hl.bind(conf.mainMod .. " + ALT + RETURN", hl.dsp.layout("splitratio 1.0 exact"))

hl.bind(conf.mainMod .. " + CONTROL + ALT + left",  hl.dsp.workspace.swap_monitors({ monitor1 = "current", monitor2 = "l" }))
hl.bind(conf.mainMod .. " + CONTROL + ALT + right", hl.dsp.workspace.swap_monitors({ monitor1 = "current", monitor2 = "r" }))

hl.bind(conf.mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(conf.mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- Move focus with conf.mainMod + arrow keys
hl.bind(conf.mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(conf.mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(conf.mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(conf.mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with conf.mainMod + [0-9]
-- Move active window to a workspace with conf.mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(conf.mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(conf.mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with conf.mainMod + LMB/RMB and dragging
hl.bind(conf.mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(conf.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(conf.ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(conf.ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(conf.ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(conf.ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(conf.ipc .. "brightness-down"))

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
