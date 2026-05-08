return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	init = function()
		vim.g.tpipeline_clearstl = 1
	end,

	config = function()
		-- vim.cmd.colorscheme("tokyonight-night")
		-- vim.cmd.colorscheme("tokyonight-day")
		vim.opt.laststatus = 0
		vim.opt.statusline = " "
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "NONE" })
	end
}
