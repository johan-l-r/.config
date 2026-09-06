local MAX_ZOOM = 3
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 1.5

-- #####################################
-- #########        APPS        ########
-- #####################################
hl.bind("CTRL" .. " + grave",  hl.dsp.exec_cmd("kitty"))

hl.bind("SUPER + Q", 	   hl.dsp.window.close())
hl.bind("SUPER + V", 		 hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("rofi -show drun -display-drun '>>' -normal-window"))

-- #####################################
-- #########     WORKSPACES     ########
-- #####################################
hl.bind("SUPER + SHIFT + S",    hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/screenshots/"))

hl.bind("SUPER + S", 					  hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + C", 				 		hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("SUPER + TAB", function() 
	hl.dispatch(hl.dsp.window.cycle_next())
	hl.dispatch(hl.dsp.window.bring_to_top())
end)

for i = 1, 4 do
	local key = i 

	hl.bind("SUPER + " .. 				key, hl.dsp.focus({ workspace = i}))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- #####################################
-- #########        MISC        ########
-- #####################################
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

-- #####################################
-- #########      SUBMAPS       ########
-- #####################################
hl.bind("ALT + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
	hl.bind("ALT + L", hl.dsp.window.resize({ x = 100, y = 0, relative = true}), { repeating = true })
	hl.bind("ALT + H", hl.dsp.window.resize({ x = -100, y = 0, relative = true}), { repeating = true })
	hl.bind("ALT + K", hl.dsp.window.resize({ x = 0, y = 50, relative = true}), { repeating = true })
	hl.bind("ALT + J", hl.dsp.window.resize({ x = 0, y = -50, relative = true}), { repeating = true })

	hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind("ALT + M", hl.dsp.submap("move"))

hl.define_submap("move", function()
	hl.bind("ALT + SHIFT + L", hl.dsp.window.move({ x = 100, y = 0, relative = true }), { repeating = true })
	hl.bind("ALT + SHIFT + H", hl.dsp.window.move({ x = -100, y = 0, relative = true}), { repeating = true })
	hl.bind("ALT + SHIFT + K", hl.dsp.window.move({ x = 0, y = -100, relative = true}), { repeating = true })
	hl.bind("ALT + SHIFT + J", hl.dsp.window.move({ x = 0, y = 100, relative = true}), { repeating = true })

	hl.bind("escape", hl.dsp.submap("reset"))
end)
