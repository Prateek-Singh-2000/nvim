return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	build = "make",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = { file_types = { "markdown", "Avante" } },
			ft = { "markdown", "Avante" },
		},
	},

	config = function(_, opts)
		require("avante").setup(opts)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "AvanteInput",
			callback = function()
				vim.schedule(function()
					vim.cmd("stopinsert")
				end)
			end,
		})
	end,

	opts = {
		provider = "xai",

		behaviour = {
			auto_suggestions = false,
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
		},


		providers = {
			xai = {
				model = "grok-4-1-fast-non-reasoning",
			},
			gemini = {
				model = "gemini-2.5-flash",
			},
		},
		windows = {
			position = "left",
			width = 40,
		},
	},
}
