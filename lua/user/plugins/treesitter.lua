return {
	-- Creates a tree for all formatted text
	"nvim-treesitter/nvim-treesitter",
	config = function()
		-- Set fold method to use treesitter
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		-- Start with all folds open (0 = all open, 99 = all closed)
		vim.opt.foldlevel = 99
		-- Disable folding at startup
		vim.opt.foldenable = false
		require 'nvim-treesitter.configs'.setup {
			-- A list of parser names, or "all" (the listed parsers MUST always be installed)
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "go" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			-- List of parsers to ignore installing (or "all")
			ignore_install = { "javascript" },

			-- Enables syntactical highlighting setting of treesitter for
			-- various language parsers
			highlight = {
				enable = true,
			},

			-- set indentation feature of treesitter to true
			indent = {
				enable = true,
			},

			-- enables folding
			fold = {
				enable = true
			},
			-- Set incremental Selection to true
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Leader>ss", -- set to `false` to disable one of the mappings
					node_incremental = "<Leader>si",
					scope_incremental = "<Leader>sc",
					node_decremental = "<Leader>sd",
				},
			}
		}
	end
}
