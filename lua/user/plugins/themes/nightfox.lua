return {
	"EdenEast/nightfox.nvim",
	init = function()
		vim.g.tpipeline_clearstl = 1
	end,
	config = function()
		vim.cmd.colorscheme("nightfox")
		vim.opt.laststatus = 0
		vim.opt.statusline = " "
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "NONE" })
	end
}
