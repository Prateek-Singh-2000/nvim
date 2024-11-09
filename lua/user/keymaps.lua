-- This file contains all keymap settings
vim.keymap.set("n", "<Leader>h", ":nohlsearch<CR>", { noremap = true, silent = true })


-- Toggles nvim-tree to open and close
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
