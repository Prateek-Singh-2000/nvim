return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- start tracking once a real file is opened
	opts = {
		-- dir = vim.fn.stdpath("state") .. "/sessions/",
		-- need = 1,
		-- branch = true,
	},
	init = function()
		-- sessionoptions is read at :mksession time, so setting it early is enough
		vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,help,globals,skiprtp,folds"
	end,
	keys = {
		{ "<leader>qs", function() require("persistence").load() end,                desc = "Restore session (cwd)" },
		{ "<leader>qS", function() require("persistence").select() end,              desc = "Select session" },
		{ "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore last session" },
		{ "<leader>qd", function() require("persistence").stop() end,                desc = "Don't save current session" },
	},
	-- no `config` function: lazy.nvim calls require("persistence").setup(opts) for you
}
