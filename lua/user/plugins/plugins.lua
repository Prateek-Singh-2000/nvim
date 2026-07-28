local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end
	},
	{
		'numToStr/Comment.nvim',
		opts = {
			padding = true,
			sticky = true,
			ignore = nil,
			toggler = {
				line = 'gcc',
				block = 'gbc',
			},
			mappings = {
				basic = true,
				extra = true,
			},
			pre_hook = nil,
			post_hook = nil,
		}
	},
	{
		"neovim/nvim-lspconfig"
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				opts = {
					ensure_installed = {
						"flake8",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			vim.lsp.config('lua_ls', {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						},
						diagnostics = {
							globals = {
								'vim',
								'require',
							},
						},
					},
				},
			})

			require("mason").setup()
			require("mason-lspconfig").setup {
				ensure_installed = { "lua_ls" }
			}
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("user.plugins.nvim-tree-config")
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = { char = "┊" },
		},
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require('nvim-ts-autotag').setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
				per_filetype = {
					["html"] = {
						enable_close = false
					}
				}
			})
		end
	},
	{
		"kshenoy/vim-signature",
	},
	{
		"ThePrimeagen/vim-be-good",
	},
	require("user.plugins.formatters.conform"),
	require("user.plugins.linters.lspconfig"),
	require("user.plugins.linters.nvim-lint"),
	require("user.plugins.file_manager.fzf-lua"),
	require("user.plugins.treesitter.treesitter"),
	require("user.plugins.treesitter.treesitter_text_objects"),
	require("user.plugins.nvim-cmp"),
	require("user.plugins.diagnostics.trouble"),


	-- Themes editor
	require("user.plugins.themes.system-mode-changer"),
	require("user.plugins.themes.tokyo-night"),
	require("user.plugins.themes.nightfox"),
	require("user.plugins.themes.rose-pine"),


	require("user.plugins.ai_completions.neocodium"),
	require("user.plugins.ai_completions.avante"),
	require("user.plugins.tabline.lua-line"),
	require("user.plugins.surrounds.tpope-vim-surround"),
	require("user.plugins.file_manager.yazi"),
	require("user.plugins.harpoon.2harpoon"),
	require("user.plugins.finder.flash"),
	require("user.plugins.git.git-signs"),
	require("user.plugins.vim-tmux-navigator.vim-tmux-navigator"),
	require("user.plugins.themes.hexokinase"),
	require("user.plugins.themes.better-cmd-line"),
	require("user.plugins.themes.dashboard"),
	require("user.plugins.editors.markdown"),
	require("user.plugins.beautify.centerpad"),
	require("user.plugins.beautify.dressing"),
	require("user.plugins.nvim-biscuits.nvim-biscuits"),
})
