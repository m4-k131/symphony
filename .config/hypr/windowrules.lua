-- Window and layer rules
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = false,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- Prevent apps from auto-maximizing themselves
hl.window_rule({
    name = "suppress-maximize",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Devin desktop - fix resize issue where internal panels collapse
hl.window_rule({
    name = "devin-desktop-tile",
    match = { class = "devin-desktop" },
    tile = true,
    opacity = "1 1",
})

-- 97% opacity when focused, 90% when unfocused
hl.window_rule({
    name = "global-opacity",
    match = { class = ".*" },
    opacity = "0.97 0.9",
})

-- Layer rule: no animation for selection
hl.layer_rule({ match = { namespace = "selection" }, animation = "none" })

-- Floating windows via tag
hl.window_rule({
    name = "floating-window-float",
    match = { tag = "floating-window" },
    float = true,
})
hl.window_rule({
    name = "floating-window-center",
    match = { tag = "floating-window" },
    center = true,
})
hl.window_rule({
    name = "floating-window-size",
    match = { tag = "floating-window" },
    size = { 610, 500 },
})

hl.window_rule({
    name = "tag-floating-blueman",
    match = { class = "(blueman-manager|localsend|Wiremix|nmgui)" },
    tag = "+floating-window",
})
hl.window_rule({
    name = "tag-floating-network",
    match = { title = "^(.*Network Manager.*)$" },
    tag = "+floating-window",
})
hl.window_rule({
    name = "tag-floating-share",
    match = { title = "(webapp-install|share)" },
    tag = "+floating-window",
})
hl.window_rule({
    name = "tag-floating-portal",
    match = {
        class = "(xdg-desktop-portal-gtk)",
        title = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)",
    },
    tag = "+floating-window",
})

-- Symphony TUI
hl.window_rule({ name = "symphony-tui-float",  match = { title = "symphony-tui" }, float = true })
hl.window_rule({ name = "symphony-tui-center", match = { title = "symphony-tui" }, center = true })
hl.window_rule({ name = "symphony-tui-size",   match = { title = "symphony-tui" }, size = { 720, 580 } })

-- Symphony Browse (larger for preview)
hl.window_rule({ name = "symphony-browse-float",  match = { title = "symphony-browse" }, float = true })
hl.window_rule({ name = "symphony-browse-center", match = { title = "symphony-browse" }, center = true })
hl.window_rule({ name = "symphony-browse-size",   match = { title = "symphony-browse" }, size = { 1200, 750 } })

-- Easyeffects (music equalizer)
hl.window_rule({ name = "easyeffects-float",  match = { class = "com.github.wwmm.easyeffects" }, float = true })
hl.window_rule({ name = "easyeffects-center", match = { class = "com.github.wwmm.easyeffects" }, center = true })
hl.window_rule({ name = "easyeffects-size",   match = { class = "com.github.wwmm.easyeffects" }, size = { 950, 850 } })

-- Steam - tile all windows, keep opacity and idle_inhibit
hl.window_rule({ name = "steam-opacity",      match = { class = "steam" }, opacity = "1 1" })
hl.window_rule({ name = "steam-idle-inhibit", match = { class = "steam" }, idle_inhibit = "fullscreen" })

-- Dominions 6 - open on a new workspace
hl.window_rule({ name = "dom6-workspace", match = { class = "dom6_amd64" }, workspace = "empty silent" })

-- Screensaver
hl.window_rule({ name = "screensaver-fs",     match = { class = "Screensaver" }, fullscreen = true })
hl.window_rule({ name = "screensaver-float",  match = { class = "Screensaver" }, float = true })
hl.window_rule({ name = "screensaver-center", match = { class = "Screensaver" }, center = true })

-- Hide Bitwarden from screen share
hl.window_rule({ name = "bitwarden-no-share", match = { class = "^(Bitwarden)$" }, no_screen_share = true })

-- Browser types
hl.window_rule({
    name = "tag-chromium-browser",
    match = { class = "((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)" },
    tag = "+chromium-based-browser",
})
hl.window_rule({
    name = "tag-firefox-browser",
    match = { class = "([fF]irefox|zen|librewolf)" },
    tag = "+firefox-based-browser",
})

-- Force chromium-based browsers into a tile to deal with --app bug
hl.window_rule({ name = "chromium-tile", match = { tag = "chromium-based-browser" }, tile = true })

-- Only a subtle opacity change, but not for video sites
hl.window_rule({ name = "chromium-opacity", match = { tag = "chromium-based-browser" }, opacity = "1 0.97" })
hl.window_rule({ name = "firefox-opacity",  match = { tag = "firefox-based-browser" },  opacity = "1 0.97" })

-- Some video sites should never have opacity applied
hl.window_rule({
    name = "video-no-opacity",
    match = { initial_title = "((?i)(?:[a-z0-9-]+\\.)*youtube\\.com_/|app\\.zoom\\.us_/wc/home)" },
    opacity = "1.0 1.0",
})

-- Webcam overlay for screen recording
hl.window_rule({ name = "webcam-float",       match = { title = "WebcamOverlay" }, float = true })
hl.window_rule({ name = "webcam-pin",         match = { title = "WebcamOverlay" }, pin = true })
hl.window_rule({ name = "webcam-no-focus",    match = { title = "WebcamOverlay" }, no_initial_focus = true })
hl.window_rule({ name = "webcam-no-dim",      match = { title = "WebcamOverlay" }, no_dim = true })
hl.window_rule({ name = "webcam-move",        match = { title = "WebcamOverlay" }, move = "100%-w-40 100%-w-40" })

-- Picture-in-picture overlays
hl.window_rule({
    name = "tag-pip",
    match = { title = "(Picture.?in.?[Pp]icture)" },
    tag = "+pip",
})
hl.window_rule({ name = "pip-float",    match = { tag = "pip" }, float = true })
hl.window_rule({ name = "pip-pin",      match = { tag = "pip" }, pin = true })
hl.window_rule({ name = "pip-size",     match = { tag = "pip" }, size = { 600, 338 } })
hl.window_rule({ name = "pip-aspect",   match = { tag = "pip" }, keep_aspect_ratio = true })
hl.window_rule({ name = "pip-border",   match = { tag = "pip" }, border_size = 0 })
hl.window_rule({ name = "pip-opacity",  match = { tag = "pip" }, opacity = "1 1" })
hl.window_rule({ name = "pip-move",     match = { tag = "pip" }, move = "100%-w-40 4%" })
