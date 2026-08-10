return {
	"saghen/blink.cmp",
	
	dependencies = {
		"rafamadriz/friendly-snippets",
		"Kaiser-Yang/blink-cmp-dictionary",
	},

	version = "1.*",

	opts = {
		keymap = { 
			preset = "none", 

			["<C-k>"] = { "select_prev", "snippet_backward", "fallback" },
			["<C-j>"] = { "select_next", "snippet_forward", "fallback" },
			["<Tab>"] = { "accept", "fallback" },
			["<C-N>"] = { "scroll_documentation_up", "fallback" },
			["<C-n>"] = { "scroll_documentation_down", "fallback" },
		},
		completion = {
			ghost_text = { enabled = true },
			list = { selection = { auto_insert = false } },
			documentation = { auto_show = true },

			menu = {
				draw = {
					padding = 0,
					columns = { { "kind_icon", gap = 1 }, { gap = 1, "label" }, { "kind", gap = 2 } },

					components = {
						kind_icon = {
							text = function(ctx)
								return " " .. ctx.kind_icon .. " "
							end,

							highlight = function(ctx)
								return "BlinkCmpKindIcon" .. ctx.kind
							end,
						},
						kind = {
							text = function(ctx)
								return " " .. ctx.kind .. " "
							end,
						},
					},
				},
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "dictionary" },
			providers = {
				dictionary = {
					module = "blink-cmp-dictionary",
					min_keyword_length = 3,
				},
			}
		},
		fuzzy = { implementation = "prefer_rust" },
	},
	opts_extend = { "sources.default" },
}
