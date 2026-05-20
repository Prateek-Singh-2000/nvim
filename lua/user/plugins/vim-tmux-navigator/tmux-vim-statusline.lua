return {
	"vimpostor/vim-tpipeline",
	init = function()
		-- Tells tpipeline to make the native neovim statusline transparent
		vim.g.tpipeline_clearstl = 1
	end
}
