return {
	"Exafunction/windsurf.vim",
	event = "BufEnter",
	init = function()
		-- Don't let the plugin set its own <Tab>/<C-g> etc. bindings
		vim.g.codeium_disable_bindings = 1
	end,
	config = function()
		-- Skip .env files (replaces your neocodeium `filter`)
		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = { ".env", ".env.*", "*.env" },
			callback = function()
				vim.b.codeium_enabled = false
			end,
		})

		vim.keymap.set("n", "<leader>cd", "<cmd>Codeium Disable<CR>", { desc = "Disable Codeium" })
		vim.keymap.set("n", "<leader>ce", "<cmd>Codeium Enable<CR>", { desc = "Enable Codeium" })

		local opts = { expr = true, silent = true }
		vim.keymap.set("i", "<C-l>", function() return vim.fn["codeium#Accept"]() end,
			vim.tbl_extend("force", opts, { desc = "Codeium Accept" }))
		vim.keymap.set("i", "<C-g>w", function() return vim.fn["codeium#AcceptNextWord"]() end,
			vim.tbl_extend("force", opts, { desc = "Codeium Accept Word" }))
		vim.keymap.set("i", "<S-Tab>", function() return vim.fn["codeium#AcceptNextLine"]() end,
			vim.tbl_extend("force", opts, { desc = "Codeium Accept Line" }))
		vim.keymap.set("i", "<C-g>]", function() return vim.fn["codeium#CycleCompletions"](1) end,
			vim.tbl_extend("force", opts, { desc = "Codeium Next" }))
		vim.keymap.set("i", "<C-g>[", function() return vim.fn["codeium#CycleCompletions"](-1) end,
			vim.tbl_extend("force", opts, { desc = "Codeium Prev" }))
		vim.keymap.set("i", "<C-g>c", function() return vim.fn["codeium#Clear"]() end,
			vim.tbl_extend("force", opts, { desc = "Codeium Clear" }))
	end,
}
