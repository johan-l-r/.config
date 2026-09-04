hl.window_rule({
	match = { class = "kitty" }, 
	opacity = "0.7"
})

hl.layer_rule({
  match        = { namespace = "rofi" },
  blur         = true,
  ignore_alpha = 0.5
})
