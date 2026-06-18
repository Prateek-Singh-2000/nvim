vim.keymap.set("n", "<Leader>x", ":nohlsearch<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "==", "gg=G", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })

vim.keymap.set('n', '<leader>dd', '"_dd', { desc = 'Delete line without yank (blackhole)', noremap = true, silent = true })
vim.keymap.set('v', '<leader>d', '"_d',
	{ desc = 'Delete visual lines without yank (blackhole)', noremap = true, silent = true })
vim.keymap.set("n", "x", '"_x', { desc = 'Delete character without yank (blackhole)', noremap = true, silent = true })

vim.keymap.set("n", "<C-f>", "<C-u>", { desc = "Scroll half page up" })
vim.keymap.set("v", "<C-f>", "<C-u>", { desc = "Scroll half page up" })

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


-- Toggle current split to full screen (new tab) and back
local function toggle_maximize()
  if vim.fn.tabpagenr('$') == 1 and #vim.fn.tabpagebuflist() == 1 then
    return
  end

  local cur_win = vim.fn.winnr()
  if vim.fn.tabpagenr('$') > 1 then
    vim.cmd('tabclose')
    vim.cmd(cur_win .. 'wincmd w')
  else
    vim.cmd('tab split')
  end
end

vim.keymap.set('n', '<leader>m', toggle_maximize, { desc = "Toggle maximize split" })

