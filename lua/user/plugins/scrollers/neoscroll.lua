return {
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup({
      -- Disable in these modes
      stop_eof = true,       -- Stop at the end of the file
      use_local_scrolloff = true, -- Use local scrolloff value
      respect_scrolloff = true, -- Stop scrolling when cursor reaches scrolloff margin
      easing_function = "quadratic", -- Smooth quadratic easing
      pre_hook = nil,        -- Function to run before scrolling
      post_hook = nil,       -- Function to run after scrolling
      performance_mode = false, -- Disable for better performance on older machines
    })

    -- Optional: Set up mappings for smoother scrolling
    -- local t = {}
    -- -- Syntax: t[keys] = {function, {mode, optional args}}
    -- t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '50'}}
    -- t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '50'}}
    -- t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '50'}}
    -- t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '50'}}
    -- t['<C-y>'] = {'scroll', {'-0.10', 'false', '50'}}
    -- t['<C-e>'] = {'scroll', { '0.10', 'false', '50'}}
    -- 
    -- require('neoscroll.config').set_mappings(t)
  end
}
