-- set the Leader of Neovim to space
vim.g.mapleader = " "


-- Set Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.mouse = "a"
vim.opt.swapfile = false

vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true

vim.opt.colorcolumn = "90"

-- Set case sensitivity to smart sensitivity
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 7

-- Add this line to ensure the eslint_d daemon stops when Neovim exits
vim.env.ESLINT_D_PPID = vim.fn.getpid()

local function augroup(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = { "help", "man", "qf", "checkhealth", "lspinfo", "notify", "startuptime", "query" },
	callback = function(args)
		vim.bo[args.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = args.buf, silent = true })
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("restore_cursor"),
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
