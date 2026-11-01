local max_size = 1024 * 1024 -- bytes; above this the file counts as big
local max_avg_line = 1000    -- bytes per line; above this it counts as long-lined

local group = vim.api.nvim_create_augroup("bigfile", { clear = true })

-- Phase 1: before the file is read. Only the on-disk size is known here.
vim.api.nvim_create_autocmd("BufReadPre", {
  group = group,
  callback = function(args)
    local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(args.buf))
    if stat and stat.size > max_size then
      vim.b[args.buf].bigfile = true
      -- These must be set before reading, or the I/O has already happened
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
      vim.opt_local.undolevels = -1
    end
  end,
})

-- Phase 2: after the file is read and 'filetype' is set. Buffer contents are known.
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  callback = function(args)
    local buf = args.buf

    -- Catch small-but-long-lined files (minified JS, single-line JSON)
    if not vim.b[buf].bigfile then
      local lines = vim.api.nvim_buf_line_count(buf)
      local bytes = vim.api.nvim_buf_get_offset(buf, lines) -- total byte size
      if bytes > 0 and bytes / lines > max_avg_line then
        vim.b[buf].bigfile = true
      end
    end
    if not vim.b[buf].bigfile then
      return
    end

    vim.opt_local.foldenable = false
    vim.opt_local.foldmethod = "manual"
    vim.opt_local.wrap = false
    vim.opt_local.cursorline = false
    vim.opt_local.relativenumber = false
    vim.opt_local.spell = false
    vim.opt_local.synmaxcol = 200

    -- Deferred so this runs after other FileType handlers (including the ones
    -- that start Treesitter highlighting), regardless of registration order
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(buf) then
        return
      end
      vim.api.nvim_buf_call(buf, function()
        vim.cmd("syntax clear")
      end)
      vim.bo[buf].syntax = "off"
      pcall(vim.treesitter.stop, buf)
    end)
  end,
})

-- matchparen is a global plugin, so toggle it as you enter and leave big buffers
vim.api.nvim_create_autocmd("BufEnter", {
  group = group,
  callback = function(args)
    if vim.b[args.buf].bigfile then
      pcall(vim.cmd, "NoMatchParen")
    end
  end,
})
vim.api.nvim_create_autocmd("BufLeave", {
  group = group,
  callback = function(args)
    if vim.b[args.buf].bigfile then
      pcall(vim.cmd, "DoMatchParen")
    end
  end,
})
