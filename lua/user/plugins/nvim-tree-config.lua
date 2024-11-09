-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


--- Setup with custom keymaps and settings
return require("nvim-tree").setup({
	view = {
		width = 25,
	},
	-- Key mappings
	tab = {
		sync = {
			close = true,
		},
	},
	on_attach = function(bufnr)
		local api = require('nvim-tree.api')

		local function opts(desc)
			return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		-- Essential mappings
		vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))                    -- Open file/folder
		vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))                       -- Alternative to open
		vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))          -- Change directory to selected folder
		vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))    -- Open in vertical split
		vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split')) -- Open in horizontal split
		vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))          -- Open in new tab
		vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))-- Close parent directory
		vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))                      -- Open directory/file

		-- File operations
		vim.keymap.set('n', 'a', api.fs.create, opts('Create'))                         -- Create new file/directory
		vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))                         -- Delete file/directory
		vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))                         -- Rename file/directory
		vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))                              -- Cut file/directory
		vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))                       -- Copy file/directory
		vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))                          -- Paste file/directory

		-- Tree navigation/manipulation
		vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))                     -- Refresh tree
		vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))                   -- Toggle help
		vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Hidden')) -- Toggle hidden files
		vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore')) -- Toggle .gitignore files
		vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles')) -- Toggle dot files

		-- Switch between nvim-tree and opened file
		-- vim.keymap.set('n', '<C-h>', ':NvimTreeFocus<CR>', { silent = true })
		vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
		vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })
	end,
})
