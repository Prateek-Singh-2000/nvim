return {
	'smithbm2316/centerpad.nvim',
	config = function()
		vim.keymap.set("n", "<leader>cc", function()
			require("centerpad").toggle { leftpad = 25, rightpad = 0 }
		end, { noremap = true, silent = true, desc = "Toggle Centerpad" })
		vim.keymap.set("n", "<leader>cv", function()
			require("centerpad").toggle { leftpad = 45, rightpad = 0 }
		end, { noremap = true, silent = true, desc = "Toggle Centerpad" })
	end,
}
