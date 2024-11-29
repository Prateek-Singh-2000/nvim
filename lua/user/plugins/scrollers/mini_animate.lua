return {
	-- scrolling animation plugin
	'echasnovski/mini.nvim',
	version = false,
	config = function()
		require('mini.animate').setup({
			-- Vertical scroll animation configuration
			scroll = {
				-- Enable scrolling animation
				enable = true,

				-- Customize animation timing
				timing = require('mini.animate').gen_timing.linear({ 
					duration = 100, 
					unit = 'total' 
				}),

				-- Customize scroll generator
				generator = function(total_scroll)
					local config = {
						unit = 'line',
						-- Limit the scroll amount to reduce visual noise
						total = math.min(total_scroll, 20)
					}
					return require('mini.animate').gen_scroll.line(config)
				end
			}
		})
	end
},
