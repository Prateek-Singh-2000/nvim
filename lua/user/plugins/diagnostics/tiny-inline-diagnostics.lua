return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "simple", -- arrow + dot + pill style
			options = {
				add_messages = {
					messages = false,    -- hide the text...
					display_count = true, -- ...show only the count
				},
			},
		})
		vim.diagnostic.config({
			virtual_text = false, -- the plugin replaces native virtual text
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN]  = "",
					[vim.diagnostic.severity.INFO]  = "",
					[vim.diagnostic.severity.HINT]  = "",
				},
			},
		})
	end,
}
