-- enabling servers
vim.lsp.enable("lua_ls")
vim.lsp.enable("basedpyright")
vim.lsp.enable("emmet_language_server")
vim.lsp.enable("vtsls")
vim.lsp.enable("cssls")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UsrLSPConfig", {}), 

	callback = function()
		-- binds 
		function map(mode, keys, action, opts)
			opts = opts or {}
			opts.buffer = bufnr

			vim.keymap.set(mode, keys, action, opts)
		end

		map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "open diagnostics with floating window" })
	end
})

-- diagnostics
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",

		}, 
		linehl = {
			[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = 'WarningMsg',
		},
	} 
})
