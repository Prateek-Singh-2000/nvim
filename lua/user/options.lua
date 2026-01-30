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

-- Set case sensitivity to smart sensitivity
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 7

-- Add this line to ensure the eslint_d daemon stops when Neovim exits
vim.env.ESLINT_D_PPID = vim.fn.getpid()
