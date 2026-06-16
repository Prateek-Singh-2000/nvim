return {
	"monkoose/neocodeium",
	event = "VeryLazy",
	config = function()
		local neocodeium = require("neocodeium")
		neocodeium.setup({
		})

		vim.keymap.set("n", "<leader>cd", "<cmd>NeoCodeium disable<CR>", { desc = "Disable Codeium" })

		vim.keymap.set("n", "<leader>ce", "<cmd>NeoCodeium enable<CR>", { desc = "Enable Codeium" })

		vim.keymap.set("i", "<C-l>", function() neocodeium.accept() end, { desc = "Codeium Accept" })
		vim.keymap.set("i", "<C-g>w", function() neocodeium.accept_word() end, { desc = "Codeium Accept Word" })
		vim.keymap.set("i", "<S-Tab>", function() neocodeium.accept_line() end, { desc = "Codeium Accept Line" })
		vim.keymap.set("i", "<C-g>]", function() neocodeium.cycle_or_complete() end, { desc = "Codeium Next" })
		vim.keymap.set("i", "<C-g>[", function() neocodeium.cycle_or_complete(-1) end, { desc = "Codeium Prev" })
		vim.keymap.set("i", "<C-g>c", function() neocodeium.clear() end, { desc = "Codeium Clear" })
	end,
}
