return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true, -- jump forward to the next match on/after the cursor
			},
			move = {
				set_jumps = true, -- add to jumplist
			},
		})

		local select = require("nvim-treesitter-textobjects.select").select_textobject
		local move = require("nvim-treesitter-textobjects.move")
		local swap = require("nvim-treesitter-textobjects.swap")

		-- Select: operator-pending (o) and visual (x) modes
		local selects = {
			af = "@function.outer",
			["if"] = "@function.inner",
			ac = "@class.outer",
			ic = "@class.inner",
			aa = "@parameter.outer",
			ia = "@parameter.inner",
			ak = "@block.outer",
			ik = "@block.inner",
			ai = "@conditional.outer",
			ii = "@conditional.inner",
			al = "@loop.outer",
			il = "@loop.inner",
			aq = "@string.outer",
			iq = "@string.inner",
		}
		for lhs, capture in pairs(selects) do
			vim.keymap.set({ "x", "o" }, lhs, function()
				select(capture, "textobjects")
			end, { desc = "TS select " .. capture })
		end

		-- Move: normal, visual, operator-pending
		local moves = {
			{ "]f", move.goto_next_start,     "@function.outer" },
			{ "]c", move.goto_next_start,     "@class.outer" },
			{ "]F", move.goto_next_end,       "@function.outer" },
			{ "]C", move.goto_next_end,       "@class.outer" },
			{ "[f", move.goto_previous_start, "@function.outer" },
			{ "[c", move.goto_previous_start, "@class.outer" },
			{ "[F", move.goto_previous_end,   "@function.outer" },
			{ "[C", move.goto_previous_end,   "@class.outer" },
		}
		for _, m in ipairs(moves) do
			vim.keymap.set({ "n", "x", "o" }, m[1], function()
				m[2](m[3], "textobjects")
			end, { desc = "TS move " .. m[3] })
		end

		-- Swap
		vim.keymap.set("n", "<leader>a", function()
			swap.swap_next("@parameter.inner")
		end, { desc = "Swap parameter with next" })
		vim.keymap.set("n", "<leader>A", function()
			swap.swap_previous("@parameter.inner")
		end, { desc = "Swap parameter with previous" })
	end,
}
