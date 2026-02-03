return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED - setup with global settings
		harpoon:setup()

		-- Basic keymaps
		vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
		vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		-- Quick navigation to harpooned files
		vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
		vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
		vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
		vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)

		-- Navigate through harpoon list
		vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)

		-- Clear all harpooned files
		vim.keymap.set("n", "<leader>hz", function() harpoon:list():clear() end)

	end,
}
