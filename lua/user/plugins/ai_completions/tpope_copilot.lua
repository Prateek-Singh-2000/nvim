return {
	"github/copilot.vim",
	event = "InsertEnter",
	lazy = false,
	init = function()
		vim.g.copilot_enabled = false
		vim.g.copilot_no_tab_map = true

		vim.api.nvim_create_autocmd({ "BufEnter", "BufFilePost" }, {
			callback = function(args)
				local name = vim.api.nvim_buf_get_name(args.buf)

				if name:match("%.env") then
					vim.b[args.buf].copilot_enabled = false
				else
					vim.b[args.buf].copilot_enabled = nil
				end
			end,
		})
	end,
	config = function()
		-- Enable / disable Copilot globally.
		vim.keymap.set("n", "<leader>cd", "<cmd>Copilot disable<CR>", {
			desc = "Disable Copilot",
		})

		vim.keymap.set("n", "<leader>ce", "<cmd>Copilot enable<CR>", {
			desc = "Enable Copilot",
		})

		-- Accept entire suggestion.
		vim.keymap.set("i", "<C-l>", 'copilot#Accept("")', {
			expr = true,
			replace_keycodes = false,
			desc = "Copilot Accept",
		})

		-- Accept partial suggestions.
		vim.keymap.set("i", "<C-g>w", "<Plug>(copilot-accept-word)", {
			desc = "Copilot Accept Word",
		})

		vim.keymap.set("i", "<S-Tab>", "<Plug>(copilot-accept-line)", {
			desc = "Copilot Accept Line",
		})

		-- Cycle suggestions.
		vim.keymap.set("i", "<C-g>]", "<Plug>(copilot-next)", {
			desc = "Copilot Next",
		})

		vim.keymap.set("i", "<C-g>[", "<Plug>(copilot-previous)", {
			desc = "Copilot Previous",
		})

		-- Dismiss suggestion.
		vim.keymap.set("i", "<C-g>c", "<Plug>(copilot-dismiss)", {
			desc = "Copilot Dismiss",
		})
	end,
}
