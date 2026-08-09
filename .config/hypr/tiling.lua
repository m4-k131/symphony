-- Tiling, workspace navigation, and window management

-- Dwindle layout
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

-- Fullscreen
hl.bind("SUPER + F", hl.dsp.window.fullscreen())

-- Switch workspaces with SUPER + [0-9]
for i = 1, 10 do
    local key = i % 10  -- 10 maps to key 0
    hl.bind("SUPER + " .. key,         hl.dsp.focus({ workspace = i }),         { description = "Switch to workspace " .. i })
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }),   { description = "Move window to workspace " .. i })
end

-- Window cycling
hl.bind("ALT + TAB", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end, { description = "Cycle to next window" })
hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "previous" }))

-- Swap active window with arrow keys
hl.bind("SUPER + SHIFT + left",  hl.dsp.window.swap({ direction = "left" }),  { description = "Swap window to the left" })
hl.bind("SUPER + SHIFT + right", hl.dsp.window.swap({ direction = "right" }), { description = "Swap window to the right" })
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.swap({ direction = "up" }),    { description = "Swap window up" })
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.swap({ direction = "down" }),  { description = "Swap window down" })

-- Move focus with SUPER + arrow keys
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }),  { description = "Move window focus left" })
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }), { description = "Move window focus right" })
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }),    { description = "Move window focus up" })
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }),  { description = "Move window focus down" })

-- Move focus with SUPER + Vim keys
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }),  { description = "Move window focus left" })
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }), { description = "Move window focus right" })
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }),    { description = "Move window focus up" })
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }),  { description = "Move window focus down" })

-- Toggle split (dwindle)
hl.bind("ALT + J", hl.dsp.layout("togglesplit"), { description = "Toggle split" })

-- Pseudo window (dwindle)
hl.bind("SUPER + V", hl.dsp.window.pseudo(), { description = "Pseudo window" })

-- Toggle floating
hl.bind("SUPER + SHIFT + V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })

-- Workspace navigation
hl.bind("SUPER + CTRL + left",  hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + CTRL + right", hl.dsp.focus({ workspace = "e+1" }))

-- Resize active window
hl.bind("SUPER + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Expand window left" })
hl.bind("SUPER + code:21", hl.dsp.window.resize({ x = 100,  y = 0, relative = true }), { description = "Shrink window left" })

-- Scroll through existing workspaces with SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll active workspace forward" })
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll active workspace backward" })

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true, description = "Move window" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- Window snapping: float + position to half/quarter of screen
-- Uses SUPER + ALT + arrow keys
-- Reads reserved space (waybar etc.) dynamically from monitor object

local function get_monitor_geometry()
    local mon = hl.get_active_monitor()
    if not mon then return nil end
    local w = mon.width
    local h = mon.height
    local mx = (mon.position and mon.position.x) or mon.x or 0
    local my = (mon.position and mon.position.y) or mon.y or 0
    local r = mon.reserved or {}
    local top = r.top or 0
    local right = r.right or 0
    local bottom = r.bottom or 0
    local left = r.left or 0
    return w, h, mx, my, top, right, bottom, left
end

local function snap_to(position)
    return function()
        local w, h, mx, my, top, right, bottom, left = get_monitor_geometry()
        if not w then return end
        local usable_w = w - left - right
        local usable_h = h - top - bottom
        local half_w = math.floor(usable_w / 2)
        local half_h = math.floor(usable_h / 2)

        hl.dispatch(hl.dsp.window.float({ action = "set" }))

        local targets = {
            left             = { x = 0,        y = 0,        w = half_w, h = usable_h },
            right            = { x = half_w,   y = 0,        w = half_w, h = usable_h },
            top              = { x = 0,        y = 0,        w = usable_w, h = half_h },
            bottom           = { x = 0,        y = half_h,   w = usable_w, h = half_h },
            ["top-left"]     = { x = 0,        y = 0,        w = half_w, h = half_h },
            ["top-right"]    = { x = half_w,   y = 0,        w = half_w, h = half_h },
            ["bottom-left"]  = { x = 0,        y = half_h,   w = half_w, h = half_h },
            ["bottom-right"] = { x = half_w,   y = half_h,   w = half_w, h = half_h },
        }

        local t = targets[position]
        if not t then return end

        hl.dispatch(hl.dsp.window.resize({ x = t.w, y = t.h, relative = false }))
        hl.dispatch(hl.dsp.window.move({ x = t.x + mx + left, y = t.y + my + top, relative = false }))
    end
end

-- Half-screen snaps
hl.bind("SUPER + ALT + left",  snap_to("left"),   { description = "Snap window left" })
hl.bind("SUPER + ALT + right", snap_to("right"),  { description = "Snap window right" })
hl.bind("SUPER + ALT + up",    snap_to("top"),    { description = "Snap window top" })
hl.bind("SUPER + ALT + down",  snap_to("bottom"), { description = "Snap window bottom" })

-- Quarter-screen snaps (SUPER + ALT + numpad-style)
hl.bind("SUPER + ALT + 1", snap_to("bottom-left"),  { description = "Snap window bottom-left" })
hl.bind("SUPER + ALT + 2", snap_to("bottom-right"), { description = "Snap window bottom-right" })
hl.bind("SUPER + ALT + 7", snap_to("top-left"),     { description = "Snap window top-left" })
hl.bind("SUPER + ALT + 9", snap_to("top-right"),    { description = "Snap window top-right" })

-- Center window (good for ultrawide — resizes to 60% width, full usable height, centered)
hl.bind("SUPER + ALT + C", function()
    local w, h, mx, my, top, right, bottom, left = get_monitor_geometry()
    if not w then return end
    local usable_w = w - left - right
    local usable_h = h - top - bottom
    local target_w = math.floor(usable_w * 0.6)
    local pos_x = math.floor((usable_w - target_w) / 2)

    hl.dispatch(hl.dsp.window.float({ action = "set" }))
    hl.dispatch(hl.dsp.window.resize({ x = target_w, y = usable_h, relative = false }))
    hl.dispatch(hl.dsp.window.move({ x = pos_x + mx + left, y = my + top, relative = false }))
end, { description = "Center window (60% width)" })
