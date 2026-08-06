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
hl.bind("ALT + TAB", hl.dsp.window.cycle_next(), { description = "Cycle to next window" })
hl.bind("ALT + TAB", hl.dsp.window.alter_zorder({ mode = "top" }), { description = "Reveal active window on top" })
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
