# Symphony Dotfiles — Keybindings Reference

## Window Management

| Keybind | Action |
|---|---|
| Super + Q | Close active window |
| Super + F | Toggle fullscreen |
| Super + Shift + V | Toggle floating mode |
| Super + V | Pseudo tile (dwindle) |
| Alt + J | Toggle split direction |
| Super + Shift + O | Pop window out (float & pin) |
| Super + LMB drag | Move window |
| Super + RMB drag | Resize window |

## Window Focus & Movement

| Keybind | Action |
|---|---|
| Super + Left/Right/Up/Down | Move focus in direction |
| Super + H / J / K / L | Move focus (vim-style) |
| Super + Shift + Left/Right/Up/Down | Swap window in direction |
| Alt + Tab | Cycle to next window |
| Super + Tab | Switch to previous workspace |

## Workspaces

| Keybind | Action |
|---|---|
| Super + 1-9, 0 | Switch to workspace 1-10 |
| Super + Shift + 1-9, 0 | Move window to workspace 1-10 |
| Super + Ctrl + Left | Previous workspace |
| Super + Ctrl + Right | Next workspace |
| Super + Scroll Up/Down | Cycle workspaces |
| 3-finger horizontal swipe | Switch workspace (touchpad) |

## Window Resizing

| Keybind | Action |
|---|---|
| Super + - (minus) | Expand window left |
| Super + = (equals) | Shrink window left |

## Applications

| Keybind | Action |
|---|---|
| Super + Return | Terminal (kitty) |
| Super + B | Browser (launch-browser script) |
| Super + E | File manager (dolphin) |
| Super + M | Music (spotify-launcher) |
| Super + D | Discord (vesktop) |
| Super + O | Obsidian |
| Super + / | Passwords (bitwarden-desktop) |
| Super + C | Zed editor (zeditor) |
| Super + Shift + D | Docker TUI (lazydocker) |
| Alt + / | Activity monitor (btop) |
| Alt + M | Music player TUI (rmpc) |
| Alt + Q | File manager TUI (yazi) |
| Alt + N | Neovim |
| Super + S | Audio mixer (wiremix) |
| Super + Alt + M | Easyeffects |

## Tmux

| Keybind | Action |
|---|---|
| Super + Shift + Return | Attach existing tmux session |
| Super + Alt + Return | Create new tmux session "main" |

## Web Apps

| Keybind | Action |
|---|---|
| Super + A | Perplexity |
| Super + Shift + A | ChatGPT |
| Super + Ctrl + A | Gemini |
| Alt + C | Google Calendar |
| Super + G | GitHub |
| Super + Shift + G | Gmail |
| Super + Y | YouTube |
| Super + W | WhatsApp |
| Super + X | X (Twitter) |
| Super + Z | LinkedIn |
| Super + T | Todoist |
| Super + \ | Devhints |
| Super + Shift + I | Install new web app |

## Rofi Launchers

| Keybind | Action |
|---|---|
| Super + Space | App launcher |
| Alt + Space | File/app search |
| Alt + , | Clipboard history |
| Alt + . | Emoji picker |
| Super + Shift + M | Rofibeats (music) |
| Super + Ctrl + B | Power profiles |
| Super + N | Notification center |
| Super + Shift + N | WiFi menu |

## Themes & Wallpapers

| Keybind | Action |
|---|---|
| Super + Ctrl + Space | Matugen theme from wallpaper |
| Super + Alt + Space | Wallpaper picker |
| Ctrl + Alt + Space | Change theme (swww/awww) |
| Super + Ctrl + Shift + Space | Theme switcher (symphony) |
| Super + Ctrl + Shift + Backspace | Random theme |
| Super + I | Symphony TUI |
| Super + Alt + I | Browse themes |
| Super + Alt + Up | Theme wallpapers |
| Super + Alt + Right | Next wallpaper |
| Super + Alt + Left | Previous wallpaper |

## Power & Lock

| Keybind | Action |
|---|---|
| Super + Shift + L | Lock screen (KDE Plasma) |
| Super + Ctrl + Up | Reboot |
| Super + Escape | Power menu (rofi) |
| Power button | Power menu (rofi) |
| Super + Shift + K | Force kill application |

## Screenshots & Recording

| Keybind | Action |
|---|---|
| Super + P | Screenshot with editing |
| Shift + Print | Screenshot to clipboard |
| Super + R | Record screen (with desktop audio) |
| Super + Shift + R | Record screen (with microphone) |
| Super + Alt + R | Record screen (mic + webcam) |
| Super + Shift + P | Color picker |

## Display & Monitor

| Keybind | Action |
|---|---|
| Super + F1 | Toggle monitor power |
| Super + Shift + Space | Toggle waybar |
| Super + Ctrl + N | Night light toggle |
| Super + Backspace | Terminal transparency toggle |
| Super + Ctrl + Backspace | Toggle focus & vibe mode |
| Super + Alt + Vol+ | Laptop brightness up |
| Super + Alt + Vol- | Laptop brightness down |
| Super + Vol+ | External monitor brightness up |
| Super + Vol- | External monitor brightness down |

## File Sharing (LocalSend)

| Keybind | Action |
|---|---|
| Super + Alt + S | Share file |
| Super + Ctrl + S | Share folder |
| Super + Shift + S | Share clipboard |

## Media Keys (from media.conf)

| Keybind | Action |
|---|---|
| Volume Up | Increase volume (with OSD) |
| Volume Down | Decrease volume (with OSD) |
| Mute | Toggle mute |
| Mic Mute | Toggle microphone mute |
| Brightness Up | Increase brightness (with OSD) |
| Brightness Down | Decrease brightness (with OSD) |
| Alt + Vol+/- | Precise 1% volume adjust |
| Alt + Brightness Up/Down | Precise 1% brightness adjust |
| Play/Pause | Media play-pause (playerctl) |
| Next/Prev | Media next/previous track (playerctl) |
| Super + Mute | Switch audio output |

## MPD Control

| Keybind | Action |
|---|---|
| Super + F9 | MPD pause |
| Super + F10 | MPD previous |
| Super + F11 | MPD play |
| Super + F12 | MPD next |

## Help

| Keybind | Action |
|---|---|
| Super + K | Show all keybindings (rofi) |

---

**Notes:**
- **Super** = Windows/Super key
- **LMB** = Left Mouse Button
- **RMB** = Right Mouse Button
- Lock screen uses `loginctl lock-session` (KDE Plasma lock screen)
- hypridle is disabled — KDE Plasma handles idle/lock
- Web apps launch via Firefox PWA (firefoxpwa) with Firefox fallback
