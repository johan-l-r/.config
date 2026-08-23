vim.g.mapleader = " " 

function set(mode, keys, action, desc) 
	desc = desc or ""

	vim.keymap.set(mode, keys, action, { desc = desc })
end

set("n", "<leader>w", "<cmd>w<cr>")
set("n", "<leader>q", "<cmd>q<cr>")
set("n", "j", "jzz")
set("n", "k", "kzz")
set("i", "jj", "<Esc>")
set("n", "G", "Gzz")

set("n", "<S-l>", "<cmd>bnext<cr>", "go to next buffer")
set("n", "<S-h>", "<cmd>bprevious<cr>", "go to previous buffer")
