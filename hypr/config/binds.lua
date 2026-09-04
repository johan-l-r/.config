-- apps
hl.bind("CTRL" .. " + grave",  hl.dsp.exec_cmd("kitty"))

-- actions
hl.bind("SUPER" .. " + Q", 	   hl.dsp.window.close())
hl.bind("SUPER" .. " + V", 		 hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER" .. " + SPACe", hl.dsp.exec_cmd("rofi -show drun -display-drun '>>'"))

hl.bind("SUPER + Tab", function()
	hl.dispatch(hl.dsp.window.cycle_next()) 
	hl.dispatch(hl.dsp.window.bring_to_top()) 
end)

-- there is no need for so many workspaces
for i = 1, 4 do
	local key = i 

	hl.bind("SUPER" .. " + " .. 				key,             hl.dsp.focus({ workspace = i}))
	hl.bind("SUPER" .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER" .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/screenshots/"))

-- Move/resize windows with "SUPER" + LMB/RMB and dragging
hl.bind("SUPER" .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER" .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

local MAX_ZOOM = 3
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 2

local function zoom(offset)
	local current = hl.get_config("cursor.zoom_factor")

	if offset ~= nil then
		current = current + offset
	elseif current ~= MIN_ZOOM then
		current = MIN_ZOOM
	else
		current = ZOOM_TOGGLE_FACTOR
	end
	current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))
	hl.config({ cursor = { zoom_factor = current } })
end

hl.bind("SUPER + I", zoom)
hl.bind("SUPER + KP_ADD", function()
	zoom(0.5)
end)
hl.bind("SUPER + KP_SUBTRACT", function()
	zoom(-0.5)
end)

