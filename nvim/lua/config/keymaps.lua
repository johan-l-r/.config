vim.g.mapleader = " " 

function set(mode, keys, action, desc) 
	mode = mode or "n"
	desc = desc or ""

	vim.keymap.set(mode, keys, action, { desc = desc })
end

set("n", "<leader>w", "<cmd>w<cr>")
set("n", "<leader>q", "<cmd>q<cr>")
set("n", "j", "jzz")
set("i", "jj", "<Esc>")
set("n", "k", "kzz")
set("n", "G", "Gzz")


