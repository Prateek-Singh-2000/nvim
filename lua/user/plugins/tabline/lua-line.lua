return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require('lualine').setup({
			options = {
				theme = 'auto',
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'filename' },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
			},
			-- Add tabline to show harpoon files
			tabline = {
				lualine_a = {
					{
						-- Harpoon files in tabline
						function()
							local harpoon = require("harpoon")
							local list = harpoon:list()
							local tabs = {}

							for i = 1, list:length() do
								local item = list:get(i)
								if item then
									local filename = vim.fn.fnamemodify(item.value, ":t")
									local current_file = vim.fn.expand("%:t")

									if filename == current_file then
										table.insert(tabs, "[" .. i .. ":" .. filename .. "]")
									else
										table.insert(tabs, i .. ":" .. filename)
									end
								end
							end

							if #tabs > 0 then
								return table.concat(tabs, "  ")
							else
								return "No harpoon files"
							end
						end,
					}
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { 'tabs' }
			}
		})
	end
}
