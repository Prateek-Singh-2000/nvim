return {
	"NStefan002/screenkey.nvim",
	lazy = false,
	version = "*", -- or branch = "main", to use the latest commit
	config = function()
		vim.keymap.set("n", "<leader>st", "<cmd>Screenkey toggle<cr>", { desc = "Find files" })
	end,
}
