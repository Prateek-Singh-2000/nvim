return { {
	'christopher-francisco/tmux-status.nvim',
	opts = {}
}, {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local L = vim.fn.nr2char(0xe0b6) -- left round cap
		local R = vim.fn.nr2char(0xe0b4) -- right round cap
		local pill = { left = L, right = R }

		-- Transparent bar: only the pills have a background
		local theme = vim.deepcopy(require("lualine.themes.auto"))
		for _, mode in pairs(theme) do
			for _, section in pairs(mode) do
				section.bg = "NONE"
			end
		end


		local function hl_color(group, attr)
			local hl = vim.api.nvim_get_hl(0, { name = group, link = true })
			local color = hl[attr]

			return color and string.format("#%06x", color) or nil
		end

		local normal_bg = hl_color("Normal", "bg") or theme.normal.c.bg

		local c = {
			dark  = normal_bg,
			grey  = hl_color("Comment", "fg"),
			warn  = hl_color("DiagnosticWarn", "fg"),
			hint  = hl_color("DiagnosticHint", "fg"),
			err   = hl_color("DiagnosticError", "fg"),
			info  = hl_color("DiagnosticInfo", "fg"),
			light = hl_color("Directory", "fg"),
		}

		local c_diagnostics = {
			dark  = "#1a2233", -- text color on pills
			grey  = "#5c6370", -- mode / progress pill
			warn  = "#fbd9a5", -- warning pill
			hint  = "#7fb4f0", -- hint pill
			err   = "#f07f8f",
			info  = "#7fd4e0",
			light = "#e8eef8", -- harpoon / filename pill
		}

		local lualine_bg = theme.normal.c.bg

		local function gap()
			return {
				function() return vim.fn.nr2char(0x2009) end,
				padding = { left = 0, right = 0 },
				color = {
					fg = lualine_bg,
					bg = lualine_bg,
				},
				separator = { left = "", right = "" },
			}
		end


		-- Helper: a pill component with a given bg
		local thin_space = vim.fn.nr2char(0x2009)

		local function pill_component(component, bg, fg, with_gap)
			if type(component) == "string" or type(component) == "function" then
				component = { component }
			end

			component.padding = component.padding or { left = 0, right = 0 }

			component.separator = {
				left = (with_gap and thin_space or "") .. L,
				right = R .. (with_gap and thin_space or ""),
			}

			if bg ~= nil then
				component.color = function()
					return {
						bg = bg,
						fg = fg or normal_bg,
						gui = "bold",
					}
				end
			end

			return component
		end

		-- Diagnostics count pills ("⚠ 12", "💡 1")
		local function diag_count(severity, icon)
			return function()
				local n = #vim.diagnostic.get(0, { severity = severity })
				return n > 0 and (" " .. icon .. " " .. n .. " ") or ""
			end
		end

		local function diag_cond(severity)
			return function() return #vim.diagnostic.get(0, { severity = severity }) > 0 end
		end
		local S = vim.diagnostic.severity

		-- "≡ 7% / 229"
		local function progress()
			local line, total = vim.fn.line("."), vim.fn.line("$")
			return string.format(" %s %d%% / %d ", vim.fn.nr2char(0xf0c9), math.floor(line / total * 100), total)
		end

		require('lualine').setup({

			options = {
				theme = 'auto',
				component_separators = '',
				section_separators = { left = '', right = '' },
			},

			sections = {
				lualine_a = {
					pill_component('mode')
				},

				lualine_b = {
					pill_component({
						diag_count(S.ERROR, ""),
						cond = diag_cond(S.ERROR),
					}, c_diagnostics.err, nil, true),

					pill_component({
						diag_count(S.WARN, ""),
						cond = diag_cond(S.WARN),
					}, c_diagnostics.warn, nil, true),

					pill_component({
						diag_count(S.INFO, ""),
						cond = diag_cond(S.INFO),
					}, c_diagnostics.info, nil, true),

					pill_component({
						diag_count(S.HINT, ""),
						cond = diag_cond(S.HINT),
					}, c_diagnostics.hint, nil, true),
				},

				lualine_c = { 'filename' },
				lualine_x = {},
				lualine_y = {
					pill_component(progress(), c.grey)
				},

				lualine_z = {
					pill_component("location")
				},
			},
			-- Add tabline to show harpoon files
			tabline = {
				lualine_a = {
					pill_component(function()
						local list = require("harpoon"):list()
						local current = vim.fn.expand("%:t")
						local tabs = {}
						for i = 1, list:length() do
							local item = list:get(i)
							if item then
								local name = vim.fn.fnamemodify(item.value, ":t")
								tabs[#tabs + 1] = (name == current) and ("[" .. i .. ":" .. name .. "]") or (i .. ":" .. name)
							end
						end
						return #tabs > 0 and (" " .. table.concat(tabs, "  ") .. " ") or " No harpoon files "
					end),
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { pill_component({ "tabs", padding = { left = 1, right = 1 } }) },
				lualine_z = {
					gap(),
					pill_component({
						require("tmux-status").tmux_session,
						cond = require("tmux-status").show,
					}),
				},
			}
		})
	end
} }
