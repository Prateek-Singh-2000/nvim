return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black,
			},
		})

		-- Create format keymap, fr is "format"
		vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Format file' })

		-- Optional: Format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.py",
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end,
}
