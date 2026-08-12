return {
  "ibhagwan/fzf-lua",

  dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local fzf = require("fzf-lua")

		local function set(mode, keys, action, desc)
			vim.keymap.set(mode, keys, action, { desc = desc })
		end
		
		fzf.setup({
			file_icon_padding = "5", 

			winopts = {
				width = 0.8, 
				height = 0.8, 
				border = "single", 

				preview = {
					border = "single"
				}
			}, 

			set("n", "<leader>ff", function() fzf.files() end, "find files"),
			set("n", "<leader>fb", function() fzf.buffers() end, "find buffers"),

			set("n", "<leader>g", function() fzf.grep() end, "find pattern with grep"), 
			set("n", "<leader>G", function() fzf.grep_cword() end, "find pattern under cursor with grep"), 
			
			set("n", "<leader>gc", function() fzf.git_commits() end, "find pattern with grep"),
			set("n", "<leader>gb", function() fzf.git_branches() end, "find pattern with grep")
		})
	end
}
