return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"vue",
						"css",
						"scss",
						"html",
						"json",
						"jsonc",
						"yaml",
						"markdown",
						"graphql",
						"handlebars"
					}
				})
			},
		})

		-- Create format keymap, fr is "format"
		vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Format file' })

		-- Optional: Format on save for Python and web files
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.py", "*.js", "*.jsx", "*.ts", "*.tsx", "*.html", "*.json" },
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end,
}
