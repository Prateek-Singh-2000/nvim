require("user.options")

-- Get Options lua file
require("user.keymaps")

-- Get Plugins lua file
require("user.plugins.plugins")


M = {}

M.set_shada = function()
  local cwd = vim.fn.getcwd()
  local dir_name = vim.fn.fnamemodify(cwd, ":t")
  local hash = vim.fn.sha256(cwd):sub(1, 8)
  
  local project_dir = vim.fn.stdpath("data") .. "/myshada/" .. dir_name
  vim.fn.mkdir(project_dir, "p")  -- "p" flag already handles "directory exists" case
  
  local shadafile = project_dir .. "/" .. hash .. ".shada"
  vim.opt.shadafile = shadafile
end

M.set_shada()

-- Floating terminal toggle function
-- local float_term = {
--   buf = nil,
--   win = nil,
-- }
--
-- function ToggleFloatTerm()
--   -- If window exists, close it
--   if float_term.win and vim.api.nvim_win_is_valid(float_term.win) then
--     vim.api.nvim_win_close(float_term.win, true)
--     float_term.win = nil
--     return
--   end
--
--   -- Create buffer if it doesn't exist
--   if not float_term.buf or not vim.api.nvim_buf_is_valid(float_term.buf) then
--     float_term.buf = vim.api.nvim_create_buf(false, true)
--     vim.api.nvim_buf_set_option(float_term.buf, "bufhidden", "hide")
--   end
--
--   -- Window size & position
--   local width = math.floor(vim.o.columns * 0.8)
--   local height = math.floor(vim.o.lines * 0.9)
--   local row = math.floor((vim.o.lines - height) / 2)
--   local col = math.floor((vim.o.columns - width) / 2)
--
--   -- Open floating window
--   float_term.win = vim.api.nvim_open_win(float_term.buf, true, {
--     relative = "editor",
--     width = width,
--     height = height,
--     row = row,
--     col = col,
--     style = "minimal",
--     border = "rounded",
--   })
--
--   -- Start terminal if not already running
--   if vim.fn.bufexists(float_term.buf) == 1
--      and vim.bo[float_term.buf].buftype ~= "terminal" then
--     vim.fn.termopen(vim.o.shell)
--   end
--
--   vim.cmd("startinsert")
-- end
--
-- vim.keymap.set("n", "<leader>t", ToggleFloatTerm, { desc = "Toggle floating terminal" })
-- vim.keymap.set("t", "<C-q>", "<C-\\><C-n>:lua ToggleFloatTerm()<CR>")
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
