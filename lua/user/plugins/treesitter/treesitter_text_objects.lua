return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {

        -- 🎯 SELECT
        select = {
          enable = true,
          lookahead = true, -- auto-jump forward

          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",

            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",

            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",

            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",

            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",

            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
          },
        },

        -- 🚀 MOVE
        move = {
          enable = true,
          set_jumps = true, -- integrate with jump list

          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
        },

        -- 🔁 SWAP (parameters)
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
    })
  end,
}
