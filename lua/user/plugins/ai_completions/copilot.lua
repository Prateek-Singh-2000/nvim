return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})

			vim.keymap.set(
				"n",    -- normal mode
				"<leader>cd", -- keybinding
				":Copilot disable<CR>",
				{ desc = "Disable GitHub Copilot" }
			)
			vim.keymap.set(
				"n",    -- normal mode
				"<leader>ce", -- keybinding
				":Copilot enable<CR>",
				{ desc = "Enable GitHub Copilot" }
			)
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = "copilot.lua",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
