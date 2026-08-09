-- ██╗  ██╗██╗   ██╗██████╗ ██████╗ ██╗      █████╗ ███╗   ██╗██████╗
-- ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗
-- ███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ███████║██╔██╗ ██║██║  ██║
-- ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██║██║╚██╗██║██║  ██║
-- ██║  ██║   ██║   ██║     ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝
-- ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝
--
-- Symphony Hyprland config (Lua)
-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/

-- Add config directory to Lua package.path so require() finds sibling modules
local configDir = os.getenv("HOME") .. "/.config/hypr"
package.path = configDir .. "/?.lua;" .. package.path

-- Set cursor on startup
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
end)

-- Load all config modules (each is isolated in its own Lua scope)
require("monitors")
require("input")
require("envs")
require("looknfeel")
require("autostart")
require("animations")
require("windowrules")
require("tiling")
require("bindings")
require("media")
require("fullscreen")
