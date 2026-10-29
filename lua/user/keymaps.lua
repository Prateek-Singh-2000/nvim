-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<leader>xl", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "==", "mzgg=G`z", { desc = "Format whole file without moving cursor" })

local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", opts)
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", opts)
vim.keymap.set({ "n", "v" }, "<C-o>", "<C-o>zz", opts)
vim.keymap.set({ "n", "v" }, "<C-i>", "<C-i>zz", opts)
vim.keymap.set({ "n", "v" }, "<C-f>", "<C-u>zz", opts)

vim.keymap.set('n', 'x', '"_x',
	{ desc = 'Delete char without yank (blackhole)', noremap = true, silent = true })

vim.keymap.set({ 'n', 'v' }, 'd', '"_d',
	{ desc = 'Delete without yank (blackhole)', noremap = true, silent = true })

vim.keymap.set({ 'n', 'v' }, '<leader>d', 'd',
	{ desc = 'Delete with yank (default register)', noremap = true, silent = true })

vim.keymap.set({ 'n', 'v' }, 'c', '"_c',
	{ desc = 'Change without yank (blackhole)' })


vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Center line when jumping to mark
vim.keymap.set("n", "'", function()
	local mark = vim.fn.getcharstr()
	if mark == "\27" then return "" end -- Esc cancels
	return "'" .. mark .. "zz"
end, { expr = true, desc = "Jump to mark (line) and center" })

-- Center line when jumping to exact mark
vim.keymap.set("n", "`", function()
	local mark = vim.fn.getcharstr()
	if mark == "\27" then return "" end -- Esc cancels
	return "`" .. mark .. "zz"
end, { expr = true, desc = "Jump to mark (char) and center" })

-- Paste from the yank register using Ctrl+p in Normal and Visual mode
vim.keymap.set({ "n", "v" }, "<C-p>", '"0p', { noremap = true, desc = "Paste from yank register" })

-- Paste over selection without yanking
vim.keymap.set("x", "p", "P", { noremap = true, desc = "Paste over selection without yanking" })

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

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })


local function open_padding(width)
	local content_width = width or 100
	local pad = math.floor((vim.o.columns - content_width) / 2)

	if pad < 1 then
		vim.notify("Terminal is not wider than " .. content_width .. " columns", vim.log.levels.WARN)
		return
	end

	local main_win = vim.api.nvim_get_current_win()

	vim.cmd("only")
	vim.cmd("leftabove vnew")

	local pad_win = vim.api.nvim_get_current_win()
	local pad_buf = vim.api.nvim_win_get_buf(pad_win)

	vim.bo[pad_buf].buftype = "nofile"
	vim.bo[pad_buf].bufhidden = "wipe"
	vim.bo[pad_buf].buflisted = false
	vim.bo[pad_buf].swapfile = false
	vim.bo[pad_buf].modifiable = false

	local wo = vim.wo[pad_win]
	wo.number = false
	wo.relativenumber = false
	wo.signcolumn = "no"
	wo.foldcolumn = "0"
	wo.cursorline = false
	wo.statusline = " "
	wo.fillchars = "eob: "
	wo.winfixwidth = true

	vim.api.nvim_win_set_width(pad_win, pad)
	vim.api.nvim_set_current_win(main_win)

	-- Record the padding window so the next invocation can find and close it
	vim.t.center_pad_win = pad_win
end

local function close_padding(pad_win)
	-- Closing the last window in a tab raises E444, so only close if another exists
	if #vim.api.nvim_tabpage_list_wins(0) > 1 then
		vim.api.nvim_win_close(pad_win, true)
	end
	vim.t.center_pad_win = nil
end

vim.api.nvim_create_user_command("CenterBuffer", function(opts)
	local pad_win = vim.t.center_pad_win

	if pad_win and vim.api.nvim_win_is_valid(pad_win) then
		close_padding(pad_win)
	else
		open_padding(tonumber(opts.args))
	end
end, { nargs = "?", desc = "Toggle left padding to center the current buffer" })

vim.keymap.set("n", "<leader>cv", "<cmd>CenterBuffer 70<CR>", { desc = "Toggle centered buffer" })
vim.keymap.set("n", "<leader>cc", "<cmd>CenterBuffer 100<CR>", { desc = "Toggle centered buffer" })
vim.keymap.set("n", "<leader>ee", "<cmd>tab split<CR><cmd>CenterBuffer<CR>", {
	desc = "Open current buffer in new tab",
})

vim.keymap.set("n", "<leader>er", "<cmd>tabclose<CR>", {
	desc = "Close current tab",
})
