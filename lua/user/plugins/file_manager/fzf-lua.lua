return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require('fzf-lua')

		fzf.setup({
			-- "default" | "max-perf" | "ivy" | "telescope"
			-- "telescope" profile makes it look like your current setup
			{ "telescope" },
			winopts = {
				height = 0.9,
				width = 0.9,
				preview = {
					layout = "horizontal",
					horizontal = "right:60%" -- matches your preview_width = 0.6
				}
			},
			files = {
				formatter = "path.filename_first",
			},
			grep = {
				rg_opts =
				"--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!node_modules' -g '!.git' -g '!target' -g '!build'",
			}
		})

		-- Your Mappings converted to Fzf-Lua
		vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Fzf files' })
		vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = 'Fzf live grep' })
		vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = 'Fzf buffers' })
		vim.keymap.set('n', '<leader>fh', fzf.help_tags, { desc = 'Fzf help tags' })
		vim.keymap.set('n', '<leader>fj', fzf.jumps, { desc = 'Fzf jumplist' })

		-- "Search in current buffer" -> lgrep_curbuf is more powerful than fuzzy_find
		vim.keymap.set('n', '<leader>fs', fzf.lgrep_curbuf, { desc = 'Search in current buffer' })

		-- vim.keymap.set('n', '<leader>gc', fzf.git_commits, { desc = 'Search git commits' })
		-- vim.keymap.set('n', '<leader>gb', fzf.git_branches, { desc = 'Search git branches' })
		vim.keymap.set('n', '<leader>fw', fzf.grep_cword, { desc = 'Search current word' })
		vim.keymap.set('n', '<leader>fr', fzf.oldfiles, { desc = 'Search recent files' })
	end
}
