------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- I hate this override, but i have to
hl.monitor({
    output   = "DP-3",
    mode     = "highrr",
    position = "auto",
    scale    = "auto",
})