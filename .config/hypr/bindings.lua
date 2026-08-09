-- Keybindings
-- Apps, web apps, themes, power, screenshots, etc.

local home = os.getenv("HOME")
local terminal = "kitty"
local browser = home .. "/.config/hypr/scripts/launch-browser"
local webapp = home .. "/.config/hypr/scripts/launch-webapp"
local rofiDir = home .. "/.config/rofi/scripts"
local scrDir = home .. "/.config/hypr/scripts"
local osdclient = 'swayosd-client --monitor "$(hyprctl monitors -j | jq -r \'.[] | select(.focused == true).name\')"'

-- Apps
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd('uwsm-app -- ' .. terminal .. ' --dir="$HOME"'), { description = "Terminal" })
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser), { description = "Browser" })
hl.bind("SUPER + E", hl.dsp.exec_cmd("uwsm app -- dolphin --new-window"), { description = "File manager" })
hl.bind("ALT + slash", hl.dsp.exec_cmd(terminal .. " -e btop"), { description = "Activity" })
hl.bind("SUPER + D", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"), { description = "App Launcher" })
hl.bind("SUPER + O", hl.dsp.exec_cmd("~/apps/Devin/devin-desktop"), { description = "Devin" })
hl.bind("ALT + M", hl.dsp.exec_cmd(terminal .. " -e rmpc"), { description = "Music" })
hl.bind("ALT + Q", hl.dsp.exec_cmd(terminal .. " -e yazi"), { description = "yazi" })
hl.bind("ALT + N", hl.dsp.exec_cmd(terminal .. " -e nvim"), { description = "Neovim" })
hl.bind("SUPER + S", hl.dsp.exec_cmd(terminal .. " --class=Wiremix -e wiremix"), { description = "Wiremix" })
hl.bind("SUPER + ALT + M", hl.dsp.exec_cmd("easyeffects"), { description = "easyeffects" })

-- WebApps
hl.bind("SUPER + A", hl.dsp.exec_cmd(webapp .. ' "https://perplexity.ai"'), { description = "Perplexity" })
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd(webapp .. ' "https://chatgpt.com"'), { description = "ChatGPT" })
hl.bind("SUPER + CTRL + A", hl.dsp.exec_cmd(webapp .. ' "https://gemini.google.com"'), { description = "Gemini" })
hl.bind("ALT + C", hl.dsp.exec_cmd(webapp .. ' "https://calendar.google.com"'), { description = "Calendar" })
hl.bind("SUPER + G", hl.dsp.exec_cmd(webapp .. ' "https://github.com/vyrx-dev"'), { description = "Github" })
hl.bind("SUPER + SHIFT + G", hl.dsp.exec_cmd(webapp .. ' "https://mail.google.com/mail/u/1/"'), { description = "Gmail" })
hl.bind("SUPER + Y", hl.dsp.exec_cmd(webapp .. ' "https://youtube.com/"'), { description = "YouTube" })
hl.bind("SUPER + W", hl.dsp.exec_cmd(webapp .. ' "https://web.whatsapp.com/"'), { description = "WhatsApp" })
hl.bind("SUPER + X", hl.dsp.exec_cmd(webapp .. ' "https://x.com/"'), { description = "X" })
hl.bind("SUPER + Z", hl.dsp.exec_cmd(webapp .. ' "https://www.linkedin.com/feed/"'), { description = "Linkedin" })
hl.bind("SUPER + T", hl.dsp.exec_cmd(webapp .. ' "https://app.todoist.com"'), { description = "Todoist" })
hl.bind("SUPER + BACKSLASH", hl.dsp.exec_cmd(webapp .. ' "https://devhints.io/"'), { description = "Learn" })

-- Tmux
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd(terminal .. " -e tmux a"))
hl.bind("SUPER + ALT + RETURN", hl.dsp.exec_cmd(terminal .. " -e tmux new -As main"))

hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd(rofiDir .. "/wifi.sh"), { description = "Wifi Menu" })
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"), { description = "Notification Centre" })
hl.bind("SUPER + SHIFT + I", hl.dsp.exec_cmd('kitty --title webapp-install -e ' .. scrDir .. "/webapp-install"), { description = "Web App Install" })

-- Close Windows
hl.bind("SUPER + Q", hl.dsp.window.close())

-- Rofi
hl.bind("ALT + comma", hl.dsp.exec_cmd(rofiDir .. "/clipboard"), { description = "clipboard" })
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd(rofiDir .. "/rofibeats"), { description = "rofibeats" })
hl.bind("ALT + period", hl.dsp.exec_cmd(rofiDir .. "/emoji"), { description = "emoji" })
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(rofiDir .. "/rofisearch"), { description = "Find" })
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"), { description = "app-launcher" })
hl.bind("SUPER + CTRL + B", hl.dsp.exec_cmd(rofiDir .. "/power-profiles"), { description = "Power Profiles" })

-- Monitor configuration
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd(rofiDir .. "/monitor-switch"), { description = "Monitor Switch Menu" })
hl.bind("SUPER + SHIFT + F1", hl.dsp.exec_cmd(rofiDir .. "/monitor-switch both"), { description = "Both monitors" })
hl.bind("SUPER + SHIFT + F2", hl.dsp.exec_cmd(rofiDir .. "/monitor-switch only1"), { description = "Only monitor 1" })
hl.bind("SUPER + SHIFT + F3", hl.dsp.exec_cmd(rofiDir .. "/monitor-switch only2"), { description = "Only monitor 2" })
hl.bind("SUPER + CTRL + M", hl.dsp.exec_cmd(scrDir .. "/move-all-to-other-monitor"), { description = "Move all windows to other monitor" })

hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd(scrDir .. "/pop-window"), { description = "Pop window out (float & pin)" })
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.exec_cmd(scrDir .. "/toggle-waybar"))
hl.bind("SUPER + CTRL + N", hl.dsp.exec_cmd(scrDir .. "/nightlight"))

-- Local send
hl.bind("SUPER + ALT + S", hl.dsp.exec_cmd('kitty --title share -e ' .. scrDir .. "/fileshare file"))
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd('kitty --title share -e ' .. scrDir .. "/fileshare folder"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd('kitty --title share -e ' .. scrDir .. "/fileshare clipboard"))

-- Themes
hl.bind("SUPER + CTRL + SPACE", hl.dsp.exec_cmd(rofiDir .. "/selectWall"), { description = "Matugen Themes Apply" })
hl.bind("SUPER + ALT + SPACE", hl.dsp.exec_cmd(rofiDir .. "/wallPicker"), { description = "Wallpaper Picker" })
hl.bind("CTRL + ALT + SPACE", hl.dsp.exec_cmd(scrDir .. "/change-theme"), { description = "select swww wall" })
hl.bind("SUPER + CTRL + SHIFT + SPACE", hl.dsp.exec_cmd("symphony switch"), { description = "Theme Switcher" })
hl.bind("SUPER + CTRL + SHIFT + BACKSPACE", hl.dsp.exec_cmd("symphony switch --random"), { description = "Theme Switcher" })
hl.bind("SUPER + I", hl.dsp.exec_cmd('kitty --title symphony-tui -e symphony-tui'), { description = "Symphony TUI" })
hl.bind("SUPER + ALT + I", hl.dsp.exec_cmd('kitty --title symphony-browse -e symphony browse'), { description = "Browse Themes" })

-- Power
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd(scrDir .. "/lock-screen"), { description = "lock screen" })
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(scrDir .. "/graceful-logout"), { description = "Switch session" })
hl.bind("SUPER + CTRL + up", hl.dsp.exec_cmd(scrDir .. "/graceful-reboot"), { description = "reboot" })
hl.bind("SUPER + BACKSPACE", hl.dsp.exec_cmd(scrDir .. "/toggle-terminal-transparency"), { description = "Terminal Transparency" })
hl.bind("SUPER + CTRL + BACKSPACE", hl.dsp.exec_cmd(scrDir .. "/toggle-focus"), { description = "Toggle focus & vibe mode" })
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd(rofiDir .. "/powermenu"), { description = "powermenu" })
hl.bind("XF86PowerOff", hl.dsp.exec_cmd(rofiDir .. "/powermenu"), { locked = true, description = "Power menu" })

-- Kill
hl.bind("SUPER + SHIFT + K", hl.dsp.exec_cmd("hyprctl kill"), { description = "kill application" })
hl.bind("SUPER + K", hl.dsp.exec_cmd(rofiDir .. "/keyhints"), { description = "Show all keybindings" })

-- Screenshots
hl.bind("SUPER + P", hl.dsp.exec_cmd(scrDir .. "/screenshot"), { description = "Screenshot with editing" })
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd(scrDir .. "/screenshot smart clipboard"), { description = "Screenshot to clipboard" })

-- Screen recordings
hl.bind("SUPER + R", hl.dsp.exec_cmd(scrDir .. "/screenrecord --with-desktop-audio"), { description = "Record Screen" })
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd(scrDir .. "/screenrecord --with-microphone-audio"), { description = "Record + Mic" })
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd("~/Scripts/screenrecord --with-desktop-audio --with-microphone-audio --with-webcam"), { description = "Record + Mic + Webcam" })

-- Color picker
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"), { description = "Color picker" })

-- Laptop Brightness adjusts (very useful for keyboard knob)
hl.bind("SUPER + ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(osdclient .. " --brightness raise"), { description = "Brightness up" })
hl.bind("SUPER + ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd(osdclient .. " --brightness lower"), { description = "Brightness up" })

-- External Monitor brightness (controls both monitors via DDC/CI)
hl.bind("SUPER + XF86AudioRaiseVolume", hl.dsp.exec_cmd(scrDir .. "/brightness up"), { description = "Monitor Brightness up" })
hl.bind("SUPER + XF86AudioLowerVolume", hl.dsp.exec_cmd(scrDir .. "/brightness down"), { description = "Monitor Brightness down" })
hl.bind("SUPER + SHIFT + up",   hl.dsp.exec_cmd(scrDir .. "/brightness up"),   { description = "Monitor Brightness up" })
hl.bind("SUPER + SHIFT + down", hl.dsp.exec_cmd(scrDir .. "/brightness down"), { description = "Monitor Brightness down" })
hl.bind("SUPER + F1", hl.dsp.exec_cmd(scrDir .. "/toggle-monitor"), { description = "Toggle Monitor Power" })
