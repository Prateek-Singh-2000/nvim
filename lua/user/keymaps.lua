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

-- Terminal mode keymaps
-- Enter terminal mode easily
local term_buf = nil

local function toggle_terminal()
  -- Check if terminal buffer exists and is valid
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    -- Switch to the terminal buffer
    vim.api.nvim_set_current_buf(term_buf)
    vim.cmd('startinsert')
  else
    -- Create new terminal
    vim.cmd('terminal')
    term_buf = vim.api.nvim_get_current_buf()
    vim.cmd('startinsert')
  end
end

vim.keymap.set('n', '<leader>t', toggle_terminal)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
