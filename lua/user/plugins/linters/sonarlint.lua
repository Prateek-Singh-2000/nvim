return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- First, register the SonarLint config
		local lspconfig = require('lspconfig')
		local configs = require('lspconfig.configs')

		if not configs.sonarlint then
			configs.sonarlint = {
				default_config = {
					cmd = { 'sonarlint-language-server', '-stdio' },
					filetypes = {
						'python',
					},
					root_dir = function()
						return vim.loop.cwd()
					end,
					settings = {
						sonarlint = {
							languages = {
								"Python",
							},
							rules = {
								["python:S1135"] = { level = "on" },
							},
						},
					},
				},
			}
		end

		-- Then set it up
		lspconfig.sonarlint.setup({
			-- Any custom settings can go here to override defaults
			settings = {
				sonarlint = {
					languages = {
						"Python",
					},
				},
			},
		})

		-- LSP keymaps
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
	end,
}
