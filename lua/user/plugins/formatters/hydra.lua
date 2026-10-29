return {
	"nvimtools/hydra.nvim",
	event = "VeryLazy",
	config = function()
		local Hydra = require("hydra")
		local cmd = require("hydra.keymap-util").cmd

		local step = 5 -- change this to adjust every resize head at once

		local function resize(key)
			return { key, cmd(step .. "wincmd " .. key) }
		end

		Hydra({
			name = "Windows",
			mode = "n",
			body = "<C-w>",
			hint = [[
 ^^^^           Windows            ^^^^
          _H_ _J_ _K_ _L_  move
 _+_ _-_ _<_ _>_  resize    _=_ equalize
           _<Esc>_ exit
]],
			-- hint = { type = "window" },
			config = {
				color = "red",
				hint = {
					type = "window",
					position = "bottom",
					float_opts = { border = "rounded" },
				},
			},
			heads = {
				-- move windows
				{ "H", cmd("wincmd H") },
				{ "J", cmd("wincmd J") },
				{ "K", cmd("wincmd K") },
				{ "L", cmd("wincmd L") },

				-- resize
				resize("+"),
				resize("-"),
				resize("<"),
				resize(">"),
				{ "=",     cmd("wincmd =") },

				{ "<Esc>", nil,            { exit = true } },
			},
		})
	end,
}
