return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
				"python", "go", "javascript", "typescript", "json", "yaml", "html",
				"css", "scss", "rust", "bash", "dockerfile", "toml", "regex", "comment",
			},

			sync_install = false,

			auto_install = true,

			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},

			incremental_selection = {
				enable = false,
				keymaps = {
					init_selection = "<Leader>sa",
					node_incremental = "<Leader>si",
					scope_incremental = "<Leader>sc",
					node_decremental = "<Leader>sd",
				},
			},
		})

		-- Folding: native Neovim treesitter folding (requires Neovim 0.10+)
		vim.o.foldenable = true
		vim.o.foldlevel = 99    -- current window: nothing starts folded
		vim.o.foldlevelstart = 99 -- buffers entered later: nothing starts folded
		vim.o.foldtext = ""     -- render the folded line with syntax highlighting

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("ts_folding", { clear = true }),
			callback = function(args)
				-- Only enable expr folding if a parser exists for this buffer's filetype
				local ok = pcall(vim.treesitter.get_parser, args.buf)
				if ok then
					vim.wo[0][0].foldmethod = "expr"
					vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				end
			end,
		})
	end,
}
