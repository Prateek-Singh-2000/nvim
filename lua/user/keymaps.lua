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

-- Keymap to delete all buffers except the current one
vim.keymap.set("n", "<leader>bd", function()
  local current = vim.fn.expand("%")
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_name(bufnr) ~= current then
      vim.api.nvim_buf_delete(bufnr, {})
    end
  end
end, { desc = "Delete all buffers except current" })
