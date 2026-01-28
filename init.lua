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
