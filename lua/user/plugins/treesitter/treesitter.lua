return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
			"python", "go", "javascript", "typescript", "json", "yaml", "html",
			"css", "scss", "rust", "bash", "dockerfile", "toml", "regex", "comment",
		})


		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("ts_treesitter", { clear = true }),
			callback = function(args)
				local win = vim.api.nvim_get_current_win()

				vim.wo[win].foldmethod = "expr"
				vim.wo[win].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[win].foldenable = false

				local lang = vim.treesitter.language.get_lang(args.match)
				-- start() errors if no parser is installed for this language
				if not lang or not pcall(vim.treesitter.start, args.buf, lang) then
					return
				end
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.wo[0][0].foldmethod = "expr"
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end,
		})
		vim.keymap.set("n", "zR", function()
			vim.wo.foldenable = true
			vim.cmd.normal({ "zR", bang = true })
		end, { desc = "Open all folds" })

		vim.keymap.set("n", "zM", function()
			vim.wo.foldenable = true
			vim.cmd.normal({ "zM", bang = true })
		end, { desc = "Close all folds" })
	end,
}
