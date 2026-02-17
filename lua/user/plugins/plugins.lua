-- Lazy Vim setup for plugins

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		-- Automatically pairs brackets, inverted commas, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end
	},
	{
		-- Plugin to autocomment in Neovim
		'numToStr/Comment.nvim',
		opts = {
			---Add a space b/w comment and the line
			padding = true,
			---Whether the cursor should stay at its position
			sticky = true,
			---Lines to be ignored while (un)comment
			ignore = nil,
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
				line = 'gcc',
				---Block-comment toggle keymap
				block = 'gbc',
			},
			---Enable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = true,
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = true,
			},
			---Function to call before (un)comment
			pre_hook = nil,
			---Function to call after (un)comment
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
						"flake8", -- Add this to your list
						-- your other tools...
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
			-- Note: `nvim-lspconfig` needs to be in 'runtimepath' by the time you set up mason-lspconfig.nvim
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
					-- Defaults
					enable_close = true,     -- Auto close tags
					enable_rename = true,    -- Auto rename pairs of tags
					enable_close_on_slash = false -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
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
	-- require("user.plugins.file_manager.telescope"),
	require("user.plugins.file_manager.fzf-lua"),
	require("user.plugins.treesitter.treesitter"),
	require("user.plugins.treesitter.treesitter_text_objects"),
	require("user.plugins.nvim-cmp"),


	-- Themes editor
	-- require("user.plugins.themes.nord"),
	require("user.plugins.themes.tokyo-night"),
	require("user.plugins.themes.catppucin"),
	-- require("user.plugins.themes.midnight"),
	-- require("user.plugins.themes.cyberpunk"),
	require("user.plugins.themes.awesome-colorscheme"),
	require("user.plugins.themes.kanagawa"),
	-- require("user.plugins.themes.github-nvim"),


	-- require("user.plugins.ai_completions.copilot"),
	require("user.plugins.ai_completions.gemini-autocomplete"),
	require("user.plugins.tabline.lua-line"),
	-- require("user.plugins.scrollers.neoscroll"),
	require("user.plugins.surrounds.tpope-vim-surround"),
	require("user.plugins.file_manager.yazi"),
	require("user.plugins.harpoon.2harpoon"),
	require("user.plugins.finder.flash"),
	require("user.plugins.git.git-signs"),
	require("user.plugins.vim-tmux-navigator.vim-tmux-navigator"),
	require("user.plugins.vim-tmux-navigator.tmux-vim-statusline"),
	require("user.plugins.themes.hexokinase"),
	require("user.plugins.themes.better-cmd-line"),
	require("user.plugins.themes.dashboard"),
	require("user.plugins.editors.markdown"),
	require("user.plugins.buffer_alignment.centerpad"),
	-- require("user.plugins.snacks.snacks")
})
