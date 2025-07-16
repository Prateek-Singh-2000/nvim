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
		lspconfig.lua_ls.setup {}
		lspconfig.html.setup {}
		-- lspconfig.ts_ls.setup {}
		-- lspconfig.eslint.setup {}
		lspconfig.rust_analyzer.setup {}

		-- Setup Sonarlint
		local configs = require('lspconfig.configs')
		-- if not configs.sonarlint then
			-- configs.sonarlint = {
			-- 	default_config = {
			-- 		cmd = { 'sonarlint-language-server', '-stdio' },
			-- 		filetypes = {
			-- 			'python',
			-- 		},
			-- 		root_dir = function()
			-- 			return vim.loop.cwd()
			-- 		end,
			-- 		settings = {
			-- 			sonarlint = {
			-- 				languages = {
			-- 					"Python",
			-- 				},
			-- 				rules = {
			-- 					-- Common Python rules
			-- 					["python:S1135"] = { level = "on" },                 -- Track TODO tags
			-- 					["python:S1481"] = { level = "on" },                 -- Unused local variables
			-- 					["python:S1066"] = { level = "on" },                 -- Mergeable if statements
			-- 					["python:S1542"] = { level = "on" },                 -- Format string issues
			-- 					["python:S1871"] = { level = "on" },                 -- Duplicate branches
			-- 					["python:S3776"] = { level = "on" },                 -- Cognitive complexity
			-- 				},
			-- 				pathToCompileCommands = "",
			-- 				analyzerProperties = {
			-- 					-- Add Python-specific analyzer properties
			-- 					["sonar.python.version"] = "3.8",
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- }
		-- end

		-- Setup with enhanced settings
		-- lspconfig.sonarlint.setup({
		-- 	settings = {
		-- 		sonarlint = {
		-- 			languages = {
		-- 				"Python",
		-- 			},
		-- 			-- Enable automatic analysis on file save
		-- 			analysisOnSave = true,
		-- 			-- Configure diagnostic display
		-- 			diagnostics = {
		-- 				enabled = true,
		-- 				showInline = true,
		-- 			},
		-- 			-- Configure output verbosity
		-- 			output = {
		-- 				showVerbose = true,
		-- 				showDebug = false,
		-- 			},
		-- 		},
		-- 	},
		-- 	-- Configure diagnostics signs
		-- 	signs = {
		-- 		Error = "",
		-- 		Warn = "",
		-- 		Hint = "",
		-- 		Info = "",
		-- 	},
		-- })

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
