return {
	'milanglacier/minuet-ai.nvim',
	config = function()
		-- Files whose contents should never be sent to the LLM.
		-- Lua patterns, matched against the lowercase file name.
		local sensitive_patterns = {
			'^%.env',
			'%.env$',
			'^secrets?%.',
			'^credentials',
			'^id_[%w_]+$',
			'%.pem$',
			'%.key$',
			'%.p12$',
			'%.pfx$',
			'%.tfvars$',
			'^%.netrc$',
			'^%.npmrc$',
			'^%.pgpass$',
			'^%.htpasswd$',
		}

		local function is_sensitive(bufnr)
			local path = vim.api.nvim_buf_get_name(bufnr)
			local name = vim.fn.fnamemodify(path, ':t'):lower()
			for _, pat in ipairs(sensitive_patterns) do
				if name:match(pat) then
					return true
				end
			end
			return path:match '/%.aws/' or path:match '/%.ssh/' or path:match '/%.gnupg/'
		end

		local enabled = true

		local function allowed()
			return enabled and not is_sensitive(0)
		end

		require('minuet').setup {
			provider = 'codestral',
			n_completions = 1,
			request_timeout = 5,
			throttle = 2500,
			debounce = 800,
			enable_predicates = { allowed },
			virtualtext = {
				auto_trigger_ft = { '*' },
				keymap = {},
			},
			provider_options = {
				codestral = {
					-- name of the environment variable, not the key itself
					api_key = 'CODESTRAL_API_KEY',
					optional = {
						max_tokens = 256,
						stop = { '\n\n' },
					},
				},
			},
		}

		local vt = require('minuet.virtualtext').action

		vim.keymap.set('n', '<leader>cd', function()
			enabled = false
			vt.dismiss()
			vim.notify 'Minuet disabled'
		end, { desc = 'Disable AI completion' })
		vim.keymap.set('n', '<leader>ce', function()
			enabled = true
			vim.notify 'Minuet enabled'
		end, { desc = 'Enable AI completion' })

		-- vim.keymap.set('i', '<C-l>', vt.accept, { desc = 'AI accept' })
		vim.keymap.set('i', '<C-l>', vt.accept_line, { desc = 'AI accept line' })
		vim.keymap.set('i', '<M-l>', vt.accept, { desc = 'AI accept' })
		vim.keymap.set('i', '<C-g>n', vt.accept_n_lines, { desc = 'AI accept n lines' })
		vim.keymap.set('i', '<C-g>c', vt.dismiss, { desc = 'AI clear' })

		local function guarded(fn)
			return function()
				if allowed() then
					fn()
				end
			end
		end
		vim.keymap.set('i', '<C-g>]', guarded(vt.next), { desc = 'AI next' })
		vim.keymap.set('i', '<C-g>[', guarded(vt.prev), { desc = 'AI prev' })
	end,
}
