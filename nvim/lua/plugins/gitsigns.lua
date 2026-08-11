return {
	"lewis6991/gitsigns.nvim", 

	config = function()
		local gsigns = require("gitsigns")

		gsigns.setup({
			numhl 							= true,
			attach_to_untracked = true, 

			on_attach = function(bufnr)
				local function map(mode, keys, action, opts)
					opts = opts or {}
					opts.buffer = bufnr

					vim.keymap.set(mode, keys, action, opts)
				end

				map('n', ']c', function()
					if vim.wo.diff then
						vim.cmd.normal({']c', bang = true})
					else
						gitsigns.nav_hunk('next')
					end
				end)

				map('n', '[c', function()
					if vim.wo.diff then
						vim.cmd.normal({'[c', bang = true})
					else
						gitsigns.nav_hunk('prev')
					end
				end)

				map("n", "<leader>sh", gsigns.stage_hunk, { desc = "stage hunk under cursor" })
				map("n", "<leader>sb", gsigns.stage_buffer, { desc = "stage all buffer" })
				map("n", "<leader>sp", gsigns.preview_hunk_inline, { desc = "preview hunk" })
			end
		})
	end
}
