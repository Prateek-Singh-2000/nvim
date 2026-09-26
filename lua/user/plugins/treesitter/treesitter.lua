return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		-- Set fold method to use treesitter
		-- Let nvim-ufo set fold method
		-- vim.opt.foldmethod = "expr"
		-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		-- vim.opt.foldmethod = "manual"
		-- vim.opt.foldexpr = ""
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "go", "javascript", "typescript", "json", "yaml", "html", "css", "scss", "rust", "bash", "dockerfile", "toml", "regex", "comment" },

			sync_install = false,

			auto_install = true,

			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},

			incremental_selection = {
				enable = false,
				keymaps = {
					init_selection = "<Leader>sa", -- set to `false` to disable one of the mappings
					node_incremental = "<Leader>si",
					scope_incremental = "<Leader>sc",
					node_decremental = "<Leader>sd",
				},
			}
		}
	end
}
