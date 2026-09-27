local program = require("config/program")

local mod = "SUPER" -- Sets "Windows" key as main modifier

-- ============================================================
--  Function
-- ============================================================

function bind(key, action)
    hl.bind(mod .. " + " .. key, action)
end

function bind_exec(key, cmd)
    bind(key, hl.dsp.exec_cmd(cmd))
end

function bind_special_workspace(key, name)
    bind(key, hl.dsp.workspace.toggle_special(name))
    bind("SHIFT + " .. key, hl.dsp.window.move({ workspace = "special:" .. name}))
end

-- ============================================================
--  Window Management
-- ============================================================

bind("F", hl.dsp.window.fullscreen_state({
             internal = 2,
             client = 0,
             action = "toggle"
}))

bind("SHIFT + F", hl.dsp.window.fullscreen({
             mode = "fullscreen",
             action = "toggle",
}))

bind("Q", hl.dsp.window.close())

bind("H", hl.dsp.focus({ direction = "left" }))
bind("J", hl.dsp.focus({ direction = "down" }))
bind("K", hl.dsp.focus({ direction = "up" }))
bind("L", hl.dsp.focus({ direction = "right" }))

bind("SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
bind("SHIFT + J", hl.dsp.window.swap({ direction = "down" }))
bind("SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
bind("SHIFT + L", hl.dsp.window.swap({ direction = "right" }))

-- Move/resize windows with mouse
bind("mouse:272", hl.dsp.window.drag(), { mouse = true })
bind("mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Toggle split
bind("T", hl.dsp.layout("togglesplit"))

-- Toggle float mode
bind("V", hl.dsp.window.float({ action = "toggle" }))

-- Toggle pseudo mode
bind("S", hl.dsp.window.pseudo())

-- ============================================================
--  Workspace Management
-- ============================================================
 
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    bind(key, hl.dsp.focus({ workspace = i}))
    bind("SHIFT + " .. key, hl.dsp.window.move({ workspace = i}))
end

-- Scroll through existing workspaces with mouse scroll
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

bind_special_workspace("Y", "sy")
bind_special_workspace("U", "su")
bind_special_workspace("I", "si")
bind_special_workspace("O", "so")
bind_special_workspace("M", "sm")
bind_special_workspace("N", "sn")

-- ============================================================
--  Dunst Control
-- ============================================================

hl.bind(mod .. " + period", hl.dsp.exec_cmd("dunstctl close"))
hl.bind(mod .. " + SHIFT + period", hl.dsp.exec_cmd("dunstctl close-all"))
hl.bind(mod .. " + comma", hl.dsp.exec_cmd("dunstctl history-pop"))
hl.bind(mod .. " + SHIFT + comma", hl.dsp.exec_cmd("dunstctl set-paused toggle"))

-- ============================================================
--  Multi Media
-- ============================================================

-- Volume control
bind("right", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true })

bind("up", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%+"), { locked = true, repeating = true })

bind("left", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%-"), { locked = true, repeating = true })

bind("down", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%-"), { locked = true, repeating = true })

-- ============================================================
--  Laptop Multi-Media Keys
-- ============================================================

-- Play control
-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Laptop multimedia keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })

hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })

hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })

hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- ============================================================
--  Program
-- ============================================================

bind_exec("return", program.shell)
bind_exec("P", program.menu)
bind_exec("E", program.file_manager)
hl.bind("print", hl.dsp.exec_cmd(program.screenshot))
