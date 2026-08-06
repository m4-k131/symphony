-- Environment variables
-- Note: You must relaunch Hyprland after changing envs

hl.env("MPD_HOST", "/run/user/1000/mpd/socket")
hl.env("EDITOR", "nvim")

-- Cursor size
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Force all apps to use Wayland
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- Allow better support for screen sharing (Google Meet, Discord, etc)
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_DATA_DIRS", os.getenv("HOME") .. "/.local/share:" .. os.getenv("XDG_DATA_DIRS"))
hl.env("KDE_FULL_SESSION", "true")

-- NVIDIA environment variables
hl.env("NVD_BACKEND", "direct")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")

-- Style Gum confirm to match terminal theme
hl.env("GUM_CONFIRM_PROMPT_FOREGROUND", "6")
hl.env("GUM_CONFIRM_SELECTED_FOREGROUND", "0")
hl.env("GUM_CONFIRM_SELECTED_BACKGROUND", "2")
hl.env("GUM_CONFIRM_UNSELECTED_FOREGROUND", "0")
hl.env("GUM_CONFIRM_UNSELECTED_BACKGROUND", "8")
