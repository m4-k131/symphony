-- Input configuration
-- See https://wiki.hypr.land/Configuring/Variables/#input

-- Cursor settings
hl.config({
    cursor = {
        inactive_timeout = 1,
        no_hardware_cursors = true,
    },
})

hl.config({
    input = {
        kb_layout = "de",
        kb_variant = "",
        kb_options = "",

        follow_mouse = 1,
        numlock_by_default = true,

        -- Increase sensitivity for mouse/trackpad (default: 0)
        sensitivity = 0.40,

        touchpad = {
            natural_scroll = false,
            scroll_factor = 0.4,
        },
    },
})

-- Gesture: 3-finger horizontal swipe to switch workspace
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.config({
    misc = {
        key_press_enables_dpms = true,
        mouse_move_enables_dpms = true,
    },
})
