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

hl.monitor({
    output   = "DP-3",
    mode     = "highrr",
    position = "auto",
    scale    = "auto",
})

hl.monitor({
    output   = "DP-2",
    mode     = "preferred",
    position = "1920x-320",
    scale    = "auto",
    transform= 1
})