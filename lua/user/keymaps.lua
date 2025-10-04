-- This file contains all keymap settings
vim.keymap.set("n", "<Leader>x", ":nohlsearch<CR>", { noremap = true, silent = true })


-- Toggles nvim-tree to open and close
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Keymap to autoindent, is more convenient
vim.api.nvim_set_keymap("n", "==", "gg=G", { noremap = true })

-- half page up/down remapping to always make cursor centered
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })

vim.keymap.set('n', '<leader>dd', '"_dd', { desc = 'Delete line without yank (blackhole)', noremap = true, silent = true })
vim.keymap.set('v', '<leader>d', '"_d',
	{ desc = 'Delete visual lines without yank (blackhole)', noremap = true, silent = true })

-- Remap Ctrl-f to scroll half page up (like Ctrl-u)
vim.keymap.set("n", "<C-f>", "<C-u>", { desc = "Scroll half page up" })
vim.keymap.set("v", "<C-f>", "<C-u>", { desc = "Scroll half page up" })
