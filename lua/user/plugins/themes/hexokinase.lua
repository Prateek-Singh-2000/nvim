return {
	'RRethy/vim-hexokinase',
	build = 'make hexokinase',
	config = function()
		-- Enable hexokinase
		vim.g.Hexokinase_refreshEvents = { 'TextChanged', 'InsertLeave' }

		-- Choose your highlighter method (pick one)
		vim.g.Hexokinase_highlighters = { 'backgroundfull' }
		-- Other options: 'virtual', 'sign_column', 'background', 'foreground', 'foregroundfull'

		-- Optional: specify filetypes to enable
		vim.g.Hexokinase_ftEnabled = { 'css', 'html', 'javascript', 'typescript', 'vim', 'lua' }
		vim.keymap.set('n', '<leader>kt', ':HexokinaseToggle<CR>', { desc = 'Toggle Hexokinase' })
	end,
	cmd = 'HexokinaseToggle',                                        -- Lazy load on command
	ft = { 'css', 'html', 'javascript', 'typescript', 'vim', 'lua' }, -- Or lazy load on filetype
}
