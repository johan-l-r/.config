return {
  "stevearc/oil.nvim",

  dependencies = "nvim-tree/nvim-web-devicons", 

  lazy = false,

	config = function()
		require("oil").setup({
			default_file_explorer = true, 

			columns = {
				"icon", 
				"permissions"
			}, 
			view_options = {
				show_hidden = true
			}, 
			keymaps = {
				[ "o" ] = "actions.select" 
			}
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end
}
