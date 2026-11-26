require("modules.display")
require("modules.input")
require("modules.keybinds")
require("modules.looknfeel")
require("modules.windowing")

--- AUTOSTART
hl.on("hyprland.start", function () 
end)

hl.bind("CTRL + SHIFT + PAGE_UP", hl.dsp.send_shortcut({
  mods = "CTRL + SHIFT",
  key = "M",
  window = "class:^(vesktop)$",
}), { desc = "Vesktop mute" })

-- For Noctalia Color templates
require("noctalia").apply_theme()
