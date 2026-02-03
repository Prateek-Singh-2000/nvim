local matrix_art = {
	"                                                                 ",
	"        ██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗         ",
	"        ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗        ",
	"        ███████║███████║██║     █████╔╝ █████╗  ██████╔╝        ",
	"        ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗        ",
	"        ██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║        ",
	"        ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝        ",
	"                                                                 ",
	"                    [ ENTER THE MATRIX OF CODE ]                 ",
	"                                                                 "
}

local named_art = {
	"                                                                 ",
	"     █████╗ ██╗      █████╗  ██████╗██████╗ ██╗████████╗██╗   ██╗",
	"    ██╔══██╗██║     ██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝",
	"    ███████║██║     ███████║██║     ██████╔╝██║   ██║    ╚████╔╝ ",
	"    ██╔══██║██║     ██╔══██║██║     ██╔══██╗██║   ██║     ╚██╔╝  ",
	"    ██║  ██║███████╗██║  ██║╚██████╗██║  ██║██║   ██║      ██║   ",
	"    ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝   ",
	"                                                                 ",
	"                           [AI CODER]                           ",
	"                                                                 "
}

local dashboard_config = {
	theme = 'doom',
	config = {
		header = matrix_art, -- Change this to any art above
		center = {
			-- { action = 'Telescope find_files', desc = ' Find file',    icon = ' ', key = 'f' },
			{ action = 'FzfLua files',     desc = ' Find file',    icon = ' ', key = 'f' },
			{ action = 'ene | startinsert', desc = ' New file', icon = ' ', key = 'n' },
			-- { action = 'Telescope oldfiles',   desc = ' Recent files', icon = ' ', key = 'r' },
			{ action = 'FzfLua oldfiles',  desc = ' Recent files', icon = ' ', key = 'r' },
			-- { action = 'Telescope live_grep',  desc = ' Find text',    icon = ' ', key = 'g' },
			{ action = 'FzfLua live_grep', desc = ' Find text',    icon = ' ', key = 'g' },
			{ action = 'e $MYVIMRC',       desc = ' Config',       icon = ' ', key = 'c' },
			{ action = 'qa',               desc = ' Quit',         icon = ' ', key = 'q' },
		},
		footer = function()
			return { "⚡ Neovim loaded " }
		end,
	},
	hide = {
		statusline = false, -- Keep statusline visible
		tabline = false,  -- Keep tabline visible
		winbar = false,   -- Keep winbar visible
	}
}

return {
	'glepnir/dashboard-nvim',
	event = 'VimEnter',
	config = function()
		require('dashboard').setup(dashboard_config)
	end,
}
