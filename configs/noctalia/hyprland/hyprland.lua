require("modules.display")
require("modules.keybinds")
require("modules.looknfeel")
require("modules.windowing")

--- AUTOSTART
hl.on("hyprland.start", function () 
end)


-- For Noctalia Color templates
require("noctalia").apply_theme()
