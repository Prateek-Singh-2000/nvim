return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- Register the SonarLint config
		local lspconfig = require('lspconfig')
		lspconfig.cssls.setup {}
		-- lspconfig.pyright.setup {}
		-- lspconfig.lua_ls.setup {}
		lspconfig.html.setup {}
		-- lspconfig.ts_ls.setup {}
		-- lspconfig.eslint.setup {}
		lspconfig.rust_analyzer.setup {}


		-- Essential LSP keymaps
		local opts = { noremap = true, silent = true }

		-- Existing keymaps
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })

		-- Additional important keymaps
		vim.keymap.set('n', '<leader>i', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature help' })

		-- Configure diagnostic display
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = 'rounded',
				source = 'always',
				header = '',
				prefix = '',
			},
		})
	end,
}
