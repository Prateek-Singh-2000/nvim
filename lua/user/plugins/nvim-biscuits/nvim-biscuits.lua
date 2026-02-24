return {
  "code-biscuits/nvim-biscuits",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "BufReadPost",
  config = function()
    require("nvim-biscuits").setup({
      -- Show biscuits on cursor move (vs only on save)
      cursor_line_only = true,

      -- Default prefix before the hint text
      default_config = {
        max_length = 48,
        min_distance = 4,   -- only show if closing line is this far from opening
        prefix_string = " 󰆧 ", -- needs a nerd font icon; use "  " or "-- " if not
      },

      on_events = { "InsertLeave", "CursorHoldI", "CursorMoved", "CursorMovedI" },

      language_config = {
        -- disable for noisy filetypes
        html = { disabled = true },
        markdown = { disabled = true },
      },
    })

    vim.api.nvim_set_hl(0, "BiscuitColor", { fg = "#585858", italic = true })
  end,
}
