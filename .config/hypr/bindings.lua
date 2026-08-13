-- Keybindings
-- Organized layout: Apps, Terminal Apps, Tmux, Rofi, Themes, Capture, Monitors, Brightness, System, File Sharing

local home = os.getenv("HOME")
local terminal = "kitty"
local browser = home .. "/.config/hypr/scripts/launch-browser"
local rofiDir = home .. "/.config/rofi/scripts"
local scrDir = home .. "/.config/hypr/scripts"
local osdclient = 'swayosd-client --monitor "$(hyprctl monitors -j | jq -r \'.[] | select(.focused == true).name\')"'

-- ── Applications ──────────────────────────────────────────────────
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd('uwsm-app -- ' .. terminal .. ' --dir="$HOME"'), { description = "Terminal" })
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser), { description = "Browser" })
hl.bind("SUPER + E", hl.dsp.exec_cmd("uwsm app -- dolphin --new-window"), { description = "File manager" })
hl.bind("SUPER + D", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"), { description = "App Launcher" })
hl.bind("SUPER + M", hl.dsp.exec_cmd(terminal .. " -e rmpc"), { description = "Music (rmpc)" })
hl.bind("SUPER + S", hl.dsp.exec_cmd(terminal .. " --class=Wiremix -e wiremix"), { description = "Volume mixer (wiremix)" })
hl.bind("SUPER + O", hl.dsp.exec_cmd("~/apps/Devin/devin-desktop"), { description = "Devin" })
hl.bind("SUPER + I", hl.dsp.exec_cmd('kitty --title symphony-tui -e symphony-tui'), { description = "Symphony TUI" })
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"), { description = "Notification centre" })
hl.bind("SUPER + K", hl.dsp.exec_cmd(rofiDir .. "/keyhints"), { description = "Show all keybindings" })
hl.bind("SUPER + Q", hl.dsp.window.close())

-- ── Terminal Apps (ALT + key) ─────────────────────────────────────
hl.bind("ALT + slash", hl.dsp.exec_cmd(terminal .. " -e btop"), { description = "Activity monitor (btop)" })
hl.bind("ALT + Q", hl.dsp.exec_cmd(terminal .. " -e yazi"), { description = "yazi" })
hl.bind("ALT + N", hl.dsp.exec_cmd(terminal .. " -e nvim"), { description = "Neovim" })
hl.bind("ALT + M", hl.dsp.exec_cmd("easyeffects"), { description = "easyeffects" })

-- ── Tmux ──────────────────────────────────────────────────────────
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd(terminal .. " -e tmux a"))
hl.bind("SUPER + ALT + RETURN", hl.dsp.exec_cmd(terminal .. " -e tmux new -As main"))

-- ── Rofi Launchers ────────────────────────────────────────────────
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"), { description = "App launcher" })
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(rofiDir .. "/rofisearch"), { description = "Find" })
hl.bind("ALT + comma", hl.dsp.exec_cmd(rofiDir .. "/clipboard"), { description = "Clipboard" })
hl.bind("ALT + period", hl.dsp.exec_cmd(rofiDir .. "/emoji"), { description = "Emoji" })
hl.bind("SUPER + CTRL + B", hl.dsp.exec_cmd(rofiDir .. "/power-profiles"), { description = "Power profiles" })
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd(rofiDir .. "/wifi.sh"), { description = "Wifi menu" })

-- ── Themes & Wallpapers (SUPER + CTRL + key) ─────────────────────
hl.bind("SUPER + CTRL + T", hl.dsp.exec_cmd("symphony switch"), { description = "Theme switcher" })
hl.bind("SUPER + CTRL + SHIFT + T", hl.dsp.exec_cmd("symphony switch --random"), { description = "Random theme" })
hl.bind("SUPER + CTRL + W", hl.dsp.exec_cmd(rofiDir .. "/wallPicker"), { description = "Wallpaper picker" })
hl.bind("SUPER + CTRL + SHIFT + W", hl.dsp.exec_cmd(rofiDir .. "/selectWall"), { description = "Matugen themes apply" })
hl.bind("SUPER + CTRL + C", hl.dsp.exec_cmd(rofiDir .. "/schemePicker"), { description = "Color scheme picker" })
hl.bind("SUPER + CTRL + R", hl.dsp.exec_cmd(scrDir .. "/change-theme"), { description = "Regenerate theme" })
hl.bind("SUPER + SHIFT + I", hl.dsp.exec_cmd('kitty --title symphony-browse -e symphony browse'), { description = "Browse themes" })

-- Wallpaper cycling
hl.bind("SUPER + ALT + up",    hl.dsp.exec_cmd(scrDir .. "/cycle-wallpaper"), { description = "Theme wallpapers" })
hl.bind("SUPER + ALT + right", hl.dsp.exec_cmd(scrDir .. "/cycle-wallpaper next"), { description = "Next wallpaper" })
hl.bind("SUPER + ALT + left",  hl.dsp.exec_cmd(scrDir .. "/cycle-wallpaper prev"), { description = "Previous wallpaper" })

-- ── Capture ───────────────────────────────────────────────────────
hl.bind("SUPER + P", hl.dsp.exec_cmd(scrDir .. "/screenshot"), { description = "Screenshot with editing" })
hl.bind("PRINT", hl.dsp.exec_cmd(scrDir .. "/screenshot"), { description = "Screenshot with editing" })
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd(scrDir .. "/screenshot smart clipboard"), { description = "Screenshot to clipboard" })
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"), { description = "Color picker" })
hl.bind("SUPER + R", hl.dsp.exec_cmd(scrDir .. "/screenrecord --with-desktop-audio"), { description = "Record screen" })
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd(scrDir .. "/screenrecord --with-microphone-audio"), { description = "Record + mic" })
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd("~/Scripts/screenrecord --with-desktop-audio --with-microphone-audio --with-webcam"), { description = "Record + mic + webcam" })

-- ── Monitors (SUPER + SHIFT + F-key) ─────────────────────────────
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd(rofiDir .. "/monitor-switch"), { description = "Monitor switch menu" })
hl.bind("SUPER + SHIFT + F1", hl.dsp.exec_cmd(rofiDir .. "/monitor-switch both"), { description = "Both monitors" })
hl.bind("SUPER + SHIFT + F2", hl.dsp.exec_cmd(rofiDir .. "/monitor-switch only1"), { description = "Only monitor 1" })
hl.bind("SUPER + SHIFT + F3", hl.dsp.exec_cmd(rofiDir .. "/monitor-switch only2"), { description = "Only monitor 2" })
hl.bind("SUPER + CTRL + M", hl.dsp.exec_cmd(scrDir .. "/move-all-to-other-monitor"), { description = "Move all to other monitor" })
hl.bind("SUPER + F1", hl.dsp.exec_cmd(scrDir .. "/toggle-monitor"), { description = "Toggle monitor power" })

-- ── Brightness ────────────────────────────────────────────────────
hl.bind("SUPER + CTRL + up",   hl.dsp.exec_cmd(scrDir .. "/brightness up"),   { description = "Monitor brightness up" })
hl.bind("SUPER + CTRL + down", hl.dsp.exec_cmd(scrDir .. "/brightness down"), { description = "Monitor brightness down" })
hl.bind("SUPER + ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(osdclient .. " --brightness raise"), { description = "Laptop brightness up" })
hl.bind("SUPER + ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd(osdclient .. " --brightness lower"), { description = "Laptop brightness down" })
hl.bind("SUPER + XF86AudioRaiseVolume", hl.dsp.exec_cmd(scrDir .. "/brightness up"),   { description = "External monitor brightness up" })
hl.bind("SUPER + XF86AudioLowerVolume", hl.dsp.exec_cmd(scrDir .. "/brightness down"), { description = "External monitor brightness down" })

-- ── System & Power ────────────────────────────────────────────────
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd(rofiDir .. "/powermenu"), { description = "Power menu" })
hl.bind("XF86PowerOff", hl.dsp.exec_cmd(rofiDir .. "/powermenu"), { locked = true, description = "Power menu" })
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("loginctl lock-session"), { description = "Lock screen" })
hl.bind("SUPER + SHIFT + ESCAPE", hl.dsp.exec_cmd(scrDir .. "/graceful-logout"), { description = "Logout" })
hl.bind("SUPER + CTRL + ESCAPE", hl.dsp.exec_cmd(scrDir .. "/graceful-reboot"), { description = "Reboot" })
hl.bind("SUPER + SHIFT + K", hl.dsp.exec_cmd("hyprctl kill"), { description = "Kill application" })

-- ── System Toggles ────────────────────────────────────────────────
hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd(scrDir .. "/pop-window"), { description = "Pop window out (float & pin)" })
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.exec_cmd(scrDir .. "/toggle-waybar"))
hl.bind("SUPER + CTRL + N", hl.dsp.exec_cmd(scrDir .. "/nightlight"))
hl.bind("SUPER + BACKSPACE", hl.dsp.exec_cmd(scrDir .. "/toggle-terminal-transparency"), { description = "Terminal transparency" })
hl.bind("SUPER + CTRL + BACKSPACE", hl.dsp.exec_cmd(scrDir .. "/toggle-focus"), { description = "Toggle focus & vibe mode" })

-- ── File Sharing (LocalSend) ─────────────────────────────────────
hl.bind("SUPER + ALT + S", hl.dsp.exec_cmd('kitty --title share -e ' .. scrDir .. "/fileshare file"))
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd('kitty --title share -e ' .. scrDir .. "/fileshare folder"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd('kitty --title share -e ' .. scrDir .. "/fileshare clipboard"))
