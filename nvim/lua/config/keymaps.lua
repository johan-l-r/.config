vim.g.mapleader = " " 

set = function(mode, keys, action, desc) 
	mode = mode or "n"
	tdesc = desc or ""

	vim.keymap.set(mode, keys, action, { desc = desc })
end

set("n", "<leader>w", "<cmd>w<cr>")
set("n", "<leader>q", "<cmd>q<cr>")
set("n", "j", "jzz")
set("n", "k", "kzz")
set("n", "G", "Gzz")


