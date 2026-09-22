return {
  "ibhagwan/fzf-lua",

  dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local fzf = require("fzf-lua")
		local map = vim.keymap
		
		fzf.setup({
			file_icon_padding = "5", 

			winopts = {
				width = 0.8, 
				height = 0.8, 
				border = "single", 

				preview = {
					layout = "horizontal", 
					border = "single"
				}
			}, 

			map.set("n", "<leader>ff", function() fzf.files() end, { desc = "find files" }),
			map.set("n", "<leader>fb", function() fzf.buffers() end, { desc = "find buffers" }),

			map.set("n", "<leader>fg", function() fzf.grep() end, { desc = "find pattern with grep" }), 
			map.set("n", "<leader>fc", function() fzf.grep_cword() end, { desc = "find pattern under cursor with grep" }), 
			
			map.set("n", "<leader>fgc", function() fzf.git_commits() end, { desc = "find pattern with grep" }),
			map.set("n", "<leader>fgb", function() fzf.git_branches() end, { desc = "find pattern with grep" })
		})
	end
}
