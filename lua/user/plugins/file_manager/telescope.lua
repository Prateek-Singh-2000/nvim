return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },

	config = function()
		local builtin = require('telescope.builtin')
		require('telescope').setup({
			defaults = {
				initial_mode = 'insert',
				path_display = { truncate = 3 },
				layout_config = {
					height = 0.9,
					width = 0.9,
					preview_cutoff = 120,
					horizontal = { preview_width = 0.6 }
				},
				file_ignore_patterns = {
					"node_modules",
					"%.git/",
					"%.DS_Store$",
					"target/",
					"build/",
					"%.o$",
					"__pycache__/",
					"android/",
					"ios/",
				}
			},
		})

		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = 'Telescope jump list' })
		-- Search in current buffer
		vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, { desc = 'Search in current buffer' })

		-- Git related
		-- vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Search git commits' })
		-- vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Search git branches' })

		-- Search for word under cursor
		vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Search current word' })

		-- Recent files
		vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Search recent files' })
	end,
}
