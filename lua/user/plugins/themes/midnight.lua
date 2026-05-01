return {
	"dasupradyumna/midnight.nvim",
	init = function()
		vim.g.tpipeline_clearstl = 1  -- set before plugin loads
	end,
	config = function()
		vim.cmd.colorscheme("midnight")
		vim.opt.laststatus = 0
		vim.opt.statusline = " "
		vim.api.nvim_set_hl(0, "StatusLine",   { bg = "NONE", fg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "NONE" })
	end
}
