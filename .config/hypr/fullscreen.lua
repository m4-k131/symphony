-- Fullscreen mode: disable most keybinds when a window is fullscreen
-- Only fullscreen toggle, workspace switching, and close window remain active

-- Submap active during fullscreen — only essential binds
hl.define_submap("fullscreen", function()
    -- Exit fullscreen
    hl.bind("SUPER + F", hl.dsp.window.fullscreen(), { description = "Exit fullscreen" })

    -- Switch workspaces
    for i = 1, 10 do
        local key = i % 10
        hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }), { description = "Switch to workspace " .. i })
    end

    -- Workspace navigation (ctrl+arrow)
    hl.bind("SUPER + CTRL + left",  hl.dsp.focus({ workspace = "e-1" }))
    hl.bind("SUPER + CTRL + right", hl.dsp.focus({ workspace = "e+1" }))

    -- Scroll through workspaces
    hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll workspace forward" })
    hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll workspace backward" })

    -- Close window
    hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Close window" })

    -- Lock screen (in case you need to leave)
    hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("loginctl lock-session"), { description = "Lock screen" })
end)

-- Enter/exit fullscreen submap based on window fullscreen state
hl.on("window.fullscreen", function(win)
    if win.fullscreen ~= 0 then
        hl.dispatch(hl.dsp.submap("fullscreen"))
    else
        hl.dispatch(hl.dsp.submap("reset"))
    end
end)

-- Handle window focus changes — enter submap if new window is fullscreen, exit otherwise
hl.on("window.active", function(win)
    if win and win.fullscreen ~= 0 then
        hl.dispatch(hl.dsp.submap("fullscreen"))
    else
        local submap = hl.get_current_submap()
        if submap == "fullscreen" then
            hl.dispatch(hl.dsp.submap("reset"))
        end
    end
end)

-- Handle workspace switches — reset submap on empty/non-fullscreen workspaces
hl.on("workspace.active", function()
    local win = hl.get_active_window()
    if win and win.fullscreen ~= 0 then
        hl.dispatch(hl.dsp.submap("fullscreen"))
    else
        local submap = hl.get_current_submap()
        if submap == "fullscreen" then
            hl.dispatch(hl.dsp.submap("reset"))
        end
    end
end)
