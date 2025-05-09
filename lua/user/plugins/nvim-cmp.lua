return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
			config = function()
				-- LuaSnip configuration
				local luasnip = require("luasnip")

				-- Configure luasnip
				luasnip.config.set_config({
					history = true,
					updateevents = "TextChanged,TextChangedI",
					enable_autosnippets = true,
				})

				-- Load friendly-snippets
				require("luasnip.loaders.from_vscode").lazy_load()

				-- Load custom snippets from separate files
				require("user.plugins.snippets.python_snippets")
			end,
		},
		"saadparwaiz1/cmp_luasnip",   -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim",       -- vs-code like pictograms
		"zbirenbaum/copilot-cmp",     -- Add copilot-cmp dependency
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		-- **Copilot setup**
		local copilot_cmp = require("copilot_cmp")
		copilot_cmp.setup({
			-- You can put your other options here
			formatters = {
				insert_text = require('copilot_cmp.format').remove_existing,
			}
		})

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(),    -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				-- Copilot mappings
				["<C-l>"] = cmp.mapping(function()
					if not copilot_cmp.is_visible() then
						return
					end
					copilot_cmp.accept()
				end, { "i", "c" }),
				["<C-]>"] = cmp.mapping(function()
					if not copilot_cmp.is_visible() then
						return
					end
					copilot_cmp.dismiss()
				end, { "i", "c" }),
				-- Add Tab and S-Tab mappings for LuaSnip
				["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.expandable() then
						luasnip.expand()
					elseif luasnip.jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),



			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },              -- snippets
				{ name = "buffer" },               -- text within current buffer
				{ name = "path" },                 -- file system paths
				{ name = "copilot", group_index = 2 }, -- Add copilot as a source
			}),

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
