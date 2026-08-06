-- Autostart
-- exec-once equivalents use the hyprland.start event

local home = os.getenv("HOME")
local scrDir = home .. "/.config/hypr/scripts"

hl.on("hyprland.start", function()
    -- Slow app launch fix
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f1)")

    -- Clipboard and daemons
    hl.exec_cmd("uwsm-app -- wl-clip-persist --clipboard regular &")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("/usr/bin/kwalletd6")
    hl.exec_cmd("uwsm-app -- wl-paste --watch cliphist store")
    hl.exec_cmd("uwsm-app -- awww-daemon")
    hl.exec_cmd("uwsm-app -- swayosd-server")
    hl.exec_cmd("uwsm-app -- " .. scrDir .. "/battery-notify")
    hl.exec_cmd("uwsm-app -- kdeconnect-indicator")
    hl.exec_cmd("/usr/bin/kdeconnectd")
    hl.exec_cmd("solaar --window=skip")

    -- Delay waybar to ensure Hyprland IPC is ready
    hl.exec_cmd("sleep 1 && uwsm app -- waybar")
    hl.exec_cmd(scrDir .. "/first-run")
    hl.exec_cmd(scrDir .. "/session-theme")
end)
